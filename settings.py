#coding: utf-8

LOCATION_API_URL = 'http://ip.taobao.com/service/getIpInfo.php?ip=%s'
VISOTOR_NICK_PREFX = 'v'
VISITOR_COOKIE_AGE = 3600 * 24 * 7 # A week
USER_COOKIE_AGE = 3600 * 24        # One day
TIME_FORMAT = '%Y-%m-%d %H:%M:%S'
DATE_FORMAT = '%Y-%m-%d'


MYSQL_CHARSET = 'utf8'
TABLE_PREFIX = 'shop_webim_'


try:
    from local_settings import *
except ImportError:
    pass
