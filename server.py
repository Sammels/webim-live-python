#!/usr/bin/env python
#coding: utf-8

import uuid
import urllib2
import json
from datetime import datetime
from werkzeug.contrib.securecookie import SecureCookie
from flask import Flask, request, Response, session, url_for, \
    abort, redirect, g, render_template

from webim import Client
import db

app = Flask(__name__)
app.secret_key = 'public'
app.debug = True

# ==============================================================================
#  Configurations
# ==============================================================================
CONFIG = {
    'version' : '1.1',
    'domain'  : 'localhost',
    'apikey'  : 'public',
    'host'    : 'next.im',      # IM server host
    'port'    : 8000,           # IM server port
    'title'   : '在线支持',    
    'theme'   : 'redmond',
    'local'   : 'zh-CN',
}
LOCATION_API_URL = 'http://ip.taobao.com/service/getIpInfo.php?ip=%s'
VISOTOR_NICK_PREFX = 'Guest-'
VISITOR_COOKIE_AGE = 3600 * 24 * 7 # A week
USER_COOKIE_AGE = 3600 * 24        # One day
LOGIN_REQUIRED_ENDPOINTS = ('init', 'online', 'offline',
                            'message', 'presence', 'status',
                            'history', 'members', 'join', 'leave',
                            'buddies', 'rooms', 'refresh',
                            'clear_history', 'download_history',
                            'settings', 'notifications')

# ==============================================================================
#  Help functions
# ==============================================================================


# ==============================================================================
#  Endpoints
# ==============================================================================
@app.before_request
def prepare():

    data = request.cookies.get('auth', None)

    # For guest user
    if request.endpoint == 'index':
        if not data:
            g.uid = uuid.uuid1().get_hex()
            g.is_login = False
        else:
            cookie = SecureCookie.unserialize(data, app.secret_key)
            g.uid = cookie.get('uid', None)
            g.is_login = True
        
    elif request.endpoint in LOGIN_REQUIRED_ENDPOINTS:
        if data:
            # Get uid & ticket from cookie then new Client
            cookie = SecureCookie.unserialize(data, app.secret_key)
            g.cookie = cookie
            g.uid = cookie.get('uid', None)
            g.is_login = True
            g.is_guest = cookie.get('is_guest', None)
            show = cookie.get('show', 'available')
            status = cookie.get('status', '')

            record = db.load_visitor(g.uid) if g.is_guest else db.load_user(g.uid)
            print 'request.endpoint != "login" ==> user_record: ', record
            
            user = {
                'id' : g.uid,
                'nick': record['nick'].encode('utf8'),
                'show': show,
                'status' : status
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
    
    resp = Response(render_template('index.html'))
    
    # Login for guest user
    if not g.is_login:
        # Save visotor to database
        env = request.environ
        ipaddr = env['REMOTE_ADDR']
        signat = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
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

    
@app.route('/custom.js')
def init():
    ''' For guest user '''
    domain = request.args.get('domain', CONFIG['domain'])
    title  = request.args.get('title', CONFIG['title'])
    theme  = request.args.get('theme', CONFIG['theme'])
    local  = request.args.get('local', CONFIG['local'])

    is_login = ''
    user = '{}'
    if hasattr(g, 'uid'):
        is_login = '1'
        record = db.load_visitor(g.uid)
        user = {
            'id' : g.uid,
            'nick': record['nick'],
            'show': 'available',
            'status' : ''
        }
        user = json.dumps(user)
        
    path = '/'

    js = '''var _IMC = {
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
        jsonp: '',
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
    return Response(js, content_type='text/javascript')
    

@app.route('/login', methods=('POST', 'GET'))
def login():
    username = request.values.get('username', '')
    password = request.values.get('password', '')

    print '[ %s <--> %s ]' % (str(request.args), str(request.values))

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

    buddies = db.load_buddies() if g.is_guest else []
    groups = db.load_groups() if g.is_guest else []

    ret = g.client.online(buddies, groups, show)
    resp = Response(ret)
    
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
    style     = ''

    print 'message.timestamp:', type(timestamp), timestamp
    visitor_id, user_id = (g.uid, to) if g.is_guest else (to, g.uid)
        
    db.add_message(msgtype,
                   visitor_id, user_id,
                   g.uid, frm_nick, to, to_nick,
                   body, style, timestamp)
    
    body = body.encode('utf8')
    return g.client.message(to, body, style, timestamp, msgtype=msgtype)
    
    
@app.route('/presence', methods=('POST', 'GET'))
def presence():
    show   = request.values.get('show')
    status = request.values.get('status')

    resp = Response(g.client.presence(show, status=status))
    g.cookie['show'] = show
    g.cookie['status'] = status
    g.cookie.save_cookie(resp, key='auth')
    
    return resp


#LATER:
@app.route('/status', methods=('POST', 'GET'))
def status():
    return 'ok'

#LATER:    
@app.route('/logmsg', methods=('POST', 'GET'))
def logmsg():
    return 'ok'


@app.route('/history')
def history():
    _id = request.values.get('id', None)
    _type = request.values.get('type', None)

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
    
    return json.dumps(histories)


@app.route('/members')
def members():
    room_id = request.values.get('id')
    return g.client.members(room_id)


@app.route('/join', methods=('POST', 'GET'))
def join():
    room_id = request.values.get('id')
    return g.client.join(room_id)

    
@app.route('/leave', methods=('POST', 'GET'))
def leave():
    room_id = request.values.get('id')
    return g.client.leave(room_id)

    
@app.route('/buddies')
def buddies():
    ids = request.values.get('ids')
    buddies = []
    # LATER:
    for _id in ids.split(','):
        record = db.load_user(_id) if g.is_guest else db.load_visitor(_id)
        buddies.append({'id': _id, 'nick': record['nick']})
    return json.dumps(buddies)

    
@app.route('/rooms')
def rooms():
    return 'ok'

    
@app.route('/refresh', methods=('POST', 'GET'))
def refresh():
    return 'ok'

@app.route('/clear_history', methods=('POST', 'GET'))
def clear_history():
    other = request.values.get('id', None)
    db.clear_histories(g.uid, other)
    return 'ok'

    
'''
@app.route('/download_history')
def download_history():
    return 'ok'
'''

@app.route('/settings', methods=('POST', 'GET'))
def settings():
    return 'ok'

    
@app.route('/notifications')
def notifications():
    return 'ok'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8888)
