#!/usr/bin/env python
#coding: utf-8

import uuid
import urllib2
import json
from datetime import datetime

from werkzeug.contrib.securecookie import SecureCookie
from flask import Flask, request, Response, abort, g, render_template

from webim import Client
from settings import SECRET_KEY, DEBUG, \
    CONFIG, LOCATION_API_URL, VISOTOR_NICK_PREFX, VISITOR_COOKIE_AGE, USER_COOKIE_AGE, \
    TIME_FORMAT, DATE_FORMAT
import db

app = Flask(__name__)
app.secret_key = SECRET_KEY
app.debug = DEBUG

# ==============================================================================
#  Configurations
# ==============================================================================

UNSUPPORTED_ENDPOINTS = ('download_history', 'settings') # Forbidden visitor user
LOGIN_REQUIRED_ENDPOINTS = ('online', 'offline',
                            'message', 'presence', 'status',
                            'history', 'members', 'join', 'leave',
                            'buddies', 'rooms', 'refresh',
                            'clear_history', 'download_history',
                            'settings', 'notifications')




# ==============================================================================
#  Endpoints
# ==============================================================================
@app.before_request
def prepare():

    if request.endpoint in UNSUPPORTED_ENDPOINTS:
        abort(403)
    
    data = request.cookies.get('auth', None)
    
    print '========================================'
    print '<<< %s >>>' % request.endpoint
    print '[ %s <--> %s ]' % (str(request.args), str(request.values))
    print 'cookie_data:', SecureCookie.unserialize(data, app.secret_key) if data is not None else 'None'
    print '--------------------'

    # For guest user
    if request.endpoint == 'init':
        if not data:
            g.uid = uuid.uuid1().get_hex()
            g.is_login = False
        else:
            cookie = SecureCookie.unserialize(data, app.secret_key)
            print 'index.cookie: ', cookie
            g.uid = cookie.get('uid', None)
            
            if g.uid is None:
                g.uid = uuid.uuid1().get_hex()
                g.is_login = False
            else:
                g.is_login = True
        
    elif request.endpoint in LOGIN_REQUIRED_ENDPOINTS:
        if data:
            # Get uid & ticket from cookie then new Client
            cookie = SecureCookie.unserialize(data, app.secret_key)
            print '[...].cookie: ', cookie
            g.cookie = cookie
            g.uid = cookie.get('uid', None)
            g.is_login = True
            g.is_guest = cookie.get('is_guest', None)
            show = cookie.get('show', 'available')

            g.record = db.load_visitor(g.uid) if g.is_guest else db.load_user(g.uid)
            print 'request.endpoint != "login" ==> user_record: ', g.record

            user = {
                'id' : g.uid,
                'nick': g.record['nick'].encode('utf8'),
                'show': show,
                'status' : '',
                'pic_url': 'http://www.gravatar.com/avatar/?s=50',
                'default_pic_url': 'http://www.gravatar.com/avatar/?s=50'
            }
            ticket = request.values.get('ticket', None)
            g.client = Client(user, CONFIG['domain'], CONFIG['apikey'],
                              ticket=ticket, host=CONFIG['host'], port=CONFIG['port'])
        else:
            print '403.request.endpoint:', request.endpoint
            abort(403)
            

@app.route('/')
def index():
    ''' For guest user '''
    return render_template('index.html')
    
    
@app.route('/run.js')
def init():
    ''' For guest user '''
    domain = request.args.get('domain', CONFIG['domain'])
    title  = request.args.get('title', CONFIG['title'])
    theme  = request.args.get('theme', CONFIG['theme'])
    local  = request.args.get('local', CONFIG['local'])
        
    is_login = ''
    user = '{}'
    if g.is_login:
        is_login = '1'
        record = db.load_visitor(g.uid)
        user = {
            'id' : g.uid,
            'nick': record['nick'],
            'show': 'available',
            'status' : ''
        }
        user = json.dumps(user)
        
    path = 'http://%s/' % CONFIG['domain']

    js = u'''var _IMC = {
        production_name: 'service',
        version: '%(version)s',
        domain: '%(domain)s',
        path: '%(path)s',
        is_login: '%(is_login)s',
        user: %(user)s,
        setting:{
            play_sound: true,
            minimize_layout: true,
            buddy_sticky: true
        },
        disable_chatlink: '',
        title: '%(title)s',
        theme: '%(theme)s',
        local: '%(local)s',
        jsonp: '1',
        min: window.location.href.indexOf("webim_debug") != -1 ? "" : ".min"
    };
    
    _IMC.script = window.webim ? '' : ('<link href="' + _IMC.path + 'static/webim.' + _IMC.production_name + _IMC.min + '.css?' + _IMC.version + '" media="all" type="text/css" rel="stylesheet"/><link href="' + _IMC.path + 'static/themes/' + _IMC.theme + '/jquery.ui.theme.css?' + _IMC.version + '" media="all" type="text/css" rel="stylesheet"/><script src="' + _IMC.path + 'static/webim.' + _IMC.production_name + _IMC.min + '.js?' + _IMC.version + '" type="text/javascript"></script><script src="' + _IMC.path + 'static/i18n/webim-' + _IMC.local + '.js?' + _IMC.version + '" type="text/javascript"></script>');
    _IMC.script += '<script src="' + _IMC.path + 'static/webim.js?' + _IMC.version + '" type="text/javascript"></script>';
    document.write( _IMC.script );''' % {
        'version'  : CONFIG['version'],
        'domain'   : domain,
        'path'     : path,
        'is_login' : is_login,
        'user'     : user,
        'title'    : title,
        'theme'    : theme,
        'local'    : local,
    }
    resp = Response(js, content_type='text/javascript')

    # Login for guest user
    if not g.is_login:
        # Save visotor to database
        env = request.environ
        ipaddr = env['REMOTE_ADDR']
        signat = datetime.now().strftime(TIME_FORMAT)
        referer = env.get('HTTP_REFERER', '')
        url = 'http://%(host)s%(path)s' % {'host': env['HTTP_HOST'],
                                            'path': env['PATH_INFO']}
        loc_str = urllib2.urlopen(LOCATION_API_URL % ipaddr).read()
        loc_json = json.loads(loc_str)
        loc_data = loc_json['data']
        location = '%s%s%s' % (loc_data['country'], loc_data['region'], loc_data['city'])
        db.add_visitor(g.uid, VISOTOR_NICK_PREFX , ipaddr, signat, referer, url, location)

        # Save uid to cookie
        cookie = SecureCookie(secret_key=app.secret_key)
        cookie['uid'] = g.uid
        cookie['is_guest'] = True
        cookie.save_cookie(resp, key='auth', max_age=VISITOR_COOKIE_AGE)
    
    return resp
    

@app.route('/login', methods=('POST', 'GET'))
def login():
    username = request.values.get('username', '')
    password = request.values.get('password', '')

    ret_data = {}
    is_login = db.check_user(username, password)
    if is_login:
        ret_data['status'] = 'ok'
    else:
        ret_data['status'] = 'error'
        ret_data['message'] = 'Username or password is wrong!'
        
    resp = Response(json.dumps(ret_data))
    
    if is_login:
        # New and save `uid` to cookie
        cookie = SecureCookie(secret_key=app.secret_key)
        cookie['uid'] = username
        cookie['is_guest'] = False
        cookie.save_cookie(resp, key='auth', max_age=USER_COOKIE_AGE)
        
    return resp
    

@app.route('/online', methods=('POST', 'GET'))
def online():
    buddy_ids = request.values.get('buddy_ids', '')
    room_ids  = request.values.get('room_ids', '')
    show      = request.values.get('show', 'available')
    callback  = request.values.get('callback', None)
    visitorstatus = request.values.get('visitorstatus', '')
    
    buddies = db.load_buddies() if g.is_guest else []
    groups = db.load_groups() if g.is_guest else []

    ret = g.client.online(buddies, groups, show)
    if callback is not None: ret = '%s(%s);' % (callback, ret)
    resp = Response(ret)

    status = visitorstatus if g.is_guest else g.record['status']
    g.client.presence(status=status)
    
    return resp
    
    
@app.route('/offline', methods=('POST', 'GET'))
def offline():
    return g.client.offline()
    

@app.route('/message', methods=('POST', 'GET'))
def message():
    msgtype   = request.values.get('type')
    frm_nick  = request.values.get('nick')
    to        = request.values.get('to')
    to_nick   = request.values.get('to_nick')
    body      = request.values.get('body')
    timestamp = request.values.get('timestamp')
    callback  = request.values.get('callback', None)
    style     = ''

    print 'message.timestamp:', type(timestamp), timestamp
    visitor_id, user_id = (g.uid, to) if g.is_guest else (to, g.uid)
        
    db.add_message(msgtype,
                   visitor_id, user_id,
                   g.uid, frm_nick, to, to_nick,
                   body, style, timestamp)
    
    body = body.encode('utf8')

    ret = g.client.message(to, body, style, timestamp, msgtype=msgtype)
    if callback is not None: ret = '%s(%s);' % (callback, ret)
    return ret
    
@app.route('/presence', methods=('POST', 'GET'))
def presence():
    show   = request.values.get('show')
    status = request.values.get('status')
    callback  = request.values.get('callback', None)

    ret = g.client.presence(show, status=status)
    if callback is not None: ret = '%s(%s);' % (callback, ret)
    resp = Response(ret)
    g.cookie['show'] = show
    g.cookie['status'] = status
    g.cookie.save_cookie(resp, key='auth')
    
    return resp


#LATER:
@app.route('/status', methods=('POST', 'GET'))
def status():
    to = request.values.get('to', None)
    show = request.values.get('show', None)
    callback  = request.values.get('callback', None)

    ret = json.dumps(g.client.status(to, show))
    if callback is not None: ret = '%s(%s);' % (callback, ret)
    return ret

    
#LATER:    
@app.route('/logmsg', methods=('POST', 'GET'))
def logmsg():
    callback  = request.values.get('callback', None)
    
    ret = json.dumps({'status': 'ok'})
    if callback is not None: ret = '%s(%s);' % (callback, ret)
    return ret



@app.route('/history')
def history():
    _id = request.values.get('id', None)
    _type = request.values.get('type', None)
    callback  = request.values.get('callback', None)

    records = db.load_histories(_type, g.uid, _id)
    # {to:36, nick:admin, from:admin,
    #  style:, body:s, type:multicast, timestamp:1378721089104}
    #                                            1379157005.473486
    #                                            1379168616106.0
    histories = [{'to': record['to'],
                  'nick': record['nick'],
                  'from':record['from'],
                  'style': record['style'],
                  'type': record['type'],
                  'body': record['body'],
                  'timestamp': str(record['timestamp'])}
                 for record in records]
    histories.reverse()

    ret = json.dumps(histories)
    if callback is not None: ret = '%s(%s);' % (callback, ret)
    return ret

@app.route('/members')
def members():
    room_id = request.values.get('id')
    callback  = request.values.get('callback', None)

    ret = g.client.members(room_id)
    if callback is not None: ret = '%s(%s);' % (callback, ret)
    return ret


@app.route('/join', methods=('POST', 'GET'))
def join():
    room_id = request.values.get('id')
    callback  = request.values.get('callback', None)

    ret = g.client.join(room_id)
    if callback is not None: ret = '%s(%s);' % (callback, ret)
    return ret
    
@app.route('/leave', methods=('POST', 'GET'))
def leave():
    room_id = request.values.get('id')
    callback  = request.values.get('callback', None)

    ret = g.client.leave(room_id)
    if callback is not None: ret = '%s(%s);' % (callback, ret)
    return ret

    
@app.route('/buddies')
def buddies():
    ids = request.values.get('ids')
    callback  = request.values.get('callback', None)
    buddies = []

    
    # LATER:
    for _id in ids.split(','):
        record = db.load_user(_id) if g.is_guest else db.load_visitor(_id)
        buddies.append({'id': _id,
                        'nick': record['nick']})

    ret = json.dumps(buddies)
    if callback is not None: ret = '%s(%s);' % (callback, ret)
    return ret

    
@app.route('/rooms')
def rooms():
    return 'ok'

    
@app.route('/refresh', methods=('POST', 'GET'))
def refresh():
    return 'ok'

@app.route('/clear_history', methods=('POST', 'GET'))
def clear_history():
    other = request.values.get('id', None)
    callback  = request.values.get('callback', None)
    db.clear_histories(g.uid, other)
    return 'ok'


@app.route('/download_history')
def download_history():
    _id = request.values.get('id', None)
    _type = request.values.get('type', 'chat')
    callback  = request.values.get('callback', None)
    
    now = datetime.now()
    today = now.strftime(DATE_FORMAT)
    records  = db.load_histories(_type, g.uid, _id)
    messages = [ ( record['nick'], record['body'],
                   datetime.fromtimestamp(float(record['timestamp'])/1000).strftime(TIME_FORMAT) )
                 for record in records]
    
    resp = Response(render_template('histories.html', date=today, messages=messages))
    resp.headers['Content-Disposition'] = 'attachment; filename="histories-%s.html"' % today
    return resp


@app.route('/settings', methods=('POST', 'GET'))
def settings():
    return 'ok'

    
@app.route('/notifications')
def notifications():
    return 'ok'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8788)
