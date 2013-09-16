#!/usr/bin/env python

import gevent.monkey
gevent.monkey.patch_all()

import multiprocessing

# {{ }}
bind = 'unix:/home/weet/GitHub/webim-python/var/run/webim.sock'

workers = multiprocessing.cpu_count() * 2 + 1
worker_class = 'egg:gunicorn#gevent'

# {{ }} you should change this
user = 'www-data'

# maybe you like error
loglevel = 'info'
errorlog = '-'

secure_scheme_headers = {
    'X-SCHEME': 'https',
}
x_forwarded_for_header = 'X-FORWARDED-FOR'
