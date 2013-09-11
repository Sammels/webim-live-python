#!/usr/bin/env python
#coding: utf-8

from flask import Flask

app = Flask(__name__)

@app.route("/custom.js")
def init():
    pass

@app.route("/online")    
def online():
    pass

@app.route("/offline")
def offline():
    pass

@app.route("/message")
def message():
    pass

@app.route("/logmsg")
def logmsg():
    pass

@app.route("/presence")
def presence():
    pass

@app.route("/history")
def history():
    pass

@app.route("/status")
def status():
    pass

@app.route("/members")
def members():
    pass

@app.route("/join")
def join():
    pass

@app.route("/leave")
def leave():
    pass

@app.route("/buddies")
def buddies():
    pass

@app.route("/rooms")
def rooms():
    pass

@app.route("/refresh")
def refresh():
    pass

@app.route("/clear_history")
def clear_history():
    pass
    
'''
@app.route("/download_history")
def download_history():
    pass
'''

@app.route("/settings")
def settings():
    pass

@app.route("/notifications")
def notifications():
    pass
