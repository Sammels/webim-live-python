#!/usr/bin/env python
#coding: utf-8

from flask import Flask, request, Response, session, url_for, make_response, \
    abort, redirect, g
from werkzeug.contrib.securecookie import SecureCookie
from webim import User, Client, json

app = Flask(__name__)
app.secret_key = 'public'
app.debug = True

# ==============================================================================
#  Configurations
# ==============================================================================
DOMAIN = 'localhost'
APIKEY = 'public'
HOST = '192.168.1.111'
PORT = 8000


# ==============================================================================
#  Help functions
# ==============================================================================
def load_user(uid):
    return {
        'id': uid,
        'nick': uid,
        'status': 'available'
    }


# ==============================================================================
#  Test Data
# ==============================================================================
BUDDIES = {
    'demo' : ['admin'],
    'admin' : ['weet', 'demo'],
}

HISTORIES = {
    # from ==> to : body
    ('demo', 'admin') : [{"to":"admin","nick":"demo","from":"demo","style":"","body":"TEST-MSG","type":"unicast","timestamp":"1378721088952.9"}]
}


# ==============================================================================
#  Endpoints
# ==============================================================================
@app.before_request
def prepare():
    if request.endpoint != 'login':
        data = request.cookies.get('auth', None)
        if data:
            # Get uid & ticket from cookie then new Client
            cookie = SecureCookie.unserialize(data, app.secret_key)
            g.cookie = cookie
            g.uid = cookie.get('uid', None)
            
            user = load_user(g.uid)
            ticket = request.values.get('ticket', None)
            g.client = Client(user, DOMAIN, APIKEY,
                              ticket=ticket, host=HOST, port=PORT)
        else:
            print '403.request.endpoint:', request.endpoint
            abort(403)
            

@app.route('/')
def index():
    return 'ok'

@app.route('/custom.js')
def init():
    path = '/'
    ui_path = ''

    js = '''var _IMC = {{
                production_name: 'dotnet',
                version: '1.0',
                path: '%s',
                uiPath: '%s',
                is_login: true,
                user: '',
                setting: '',
                menu: '',
                disable_chatlink: '',
                enable_shortcut: '',
                disable_menu: 'true',
                theme: 'base',
                local: 'zh-CN',
                aspx: false,
                min: """" //window.location.href.indexOf(""webim_debug"") != -1 ? """" : "".min""
            }};
            
            _IMC.script = window.webim ? '' : ('<link href=""' + _IMC.uiPath + 'static/webim.'+ _IMC.production_name + _IMC.min + '.css?' + _IMC.version + '"" media=""all"" type=""text/css"" rel=""stylesheet""/><link href=""' + _IMC.uiPath + 'static/themes/' + _IMC.theme + '/jquery.ui.theme.css?' + _IMC.version + '"" media=""all"" type=""text/css"" rel=""stylesheet""/><script src=""' + _IMC.uiPath + 'static/webim.' + _IMC.production_name + _IMC.min + '.js?' + _IMC.version + '"" type=""text/javascript""></script><script src=""' + _IMC.uiPath + 'static/i18n/webim-' + _IMC.local + '.js?' + _IMC.version + '"" type=""text/javascript""></script>');
            _IMC.script += '<script src=""' + _IMC.uiPath + 'webim.js?' + _IMC.version + '"" type=""text/javascript""></script>';
            document.write( _IMC.script ); ''' % (path, ui_path)
    return Response(js, content_type='text/javascript')
    

@app.route('/login', methods=('POST', 'GET'))
def login():
    username = request.values.get('username', '')
    password = request.values.get('password', '')

    print 'username, password: ', username, password
    uid = username
    resp = Response(json.dumps({'status': 'ok'}))
    
    # New and save `uid` to cookie
    cookie = SecureCookie(secret_key=app.secret_key)
    cookie['uid'] = uid
    cookie.save_cookie(resp, key='auth', max_age=3600*24)
    
    return resp
    

@app.route('/online', methods=('POST', 'GET'))
def online():
    buddy_ids = request.values.get('buddy_ids', '')
    room_ids  = request.values.get('room_ids', '')
    show      = request.values.get('show', 'available')
    buddies = BUDDIES[g.uid]
    groups = []

    return g.client.online(buddies, groups, show)
    
    
@app.route('/offline', methods=('POST', 'GET'))
def offline():
    return g.client.offline()
    

@app.route('/message', methods=('POST', 'GET'))
def message():
    msgtype   = request.values.get('type')
    to        = request.values.get('to')
    body      = request.values.get('body')
    timestamp = request.values.get('timestamp')
    style     = ''

    value = {
        'to': to,
        'nick': g.uid,
        'from': g.uid,
        'body': body,
        'type': msgtype,
        'timestamp': timestamp,
        'style': style
    }
    key = (g.uid, to) if g.uid < to else (to, g.uid)
    if HISTORIES.has_key(key):
        HISTORIES[key].append(value)
    else:
        HISTORIES[key] = [value]
        
    return g.client.message(to, body, style, timestamp, msgtype=msgtype)
    
    
@app.route('/presence', methods=('POST', 'GET'))
def presence():
    show   = request.values.get('show')
    status = request.values.get('status')
    
    return g.client.presence(show, status=status)


#LATER:
@app.route('/status', methods=('POST', 'GET'))
def status():
    return 'ok'

#LATER:    
@app.route('/logmsg')
def logmsg():
    return 'ok'


@app.route('/history')
def history():
    _id = request.values.get('id', None)
    _type = request.values.get('type', None)
    
    key = (g.uid, _id) if g.uid < _id else (_id, g.uid)
    histories = HISTORIES.get(key, [])
    #LATER: from DB
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
        buddies.append({'id': _id, 'nick': _id.upper()})
    return json.dumps(buddies)

    
@app.route('/rooms')
def rooms():
    return 'ok'

    
@app.route('/refresh', methods=('POST', 'GET'))
def refresh():
    return 'ok'

@app.route('/clear_history')
def clear_history():
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
    app.run(host='0.0.0.0', port=6789)
