#!/usr/bin/env python
#coding: utf-8

import MySQLdb as mdb
from settings import MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_DB, \
    MYSQL_CHARSET, TABLE_PREFIX

# ==============================================================================
#  Globals
# ==============================================================================

CURSORS = {
    'dict': 0,
    'normal': 1
}

# ==============================================================================
#  Help functions
# ==============================================================================
to_timestamp = lambda dt: str(float(dt.strftime('%s.%f'))*1000)


# ==============================================================================
#  Functions
# ==============================================================================
#### SELECT ####
def load(SQL, args, fetch_one=True, cursor_type=CURSORS['dict']):
    # print SQL, args
    conn = mdb.connect(host=MYSQL_HOST,
                       user=MYSQL_USER, passwd=MYSQL_PASS,
                       db=MYSQL_DB, charset=MYSQL_CHARSET)
    cursor_class = mdb.cursors.DictCursor if cursor_type == CURSORS['dict'] else None
    cursor = conn.cursor(cursor_class)
    cursor.execute(SQL, args)
    ret = cursor.fetchone() if fetch_one else cursor.fetchall()
    cursor.close()
    conn.close()
    
    return ret


def execute(SQL, args):
    conn = mdb.connect(host=MYSQL_HOST,
                       user=MYSQL_USER, passwd=MYSQL_PASS,
                       db=MYSQL_DB, charset=MYSQL_CHARSET)
    cursor = conn.cursor()
    cursor.execute(SQL, args)
    cursor.close()
    conn.close()

    
#### INSERT INTO #####    
def insert(table_name, columns, values):
    if len(columns) != len(values):
        raise ValueError('insert() ==> len(columns) != len(values)')
        
    SQL = 'INSERT INTO {0}{1}({2}) VALUES({3})'.format(TABLE_PREFIX, table_name,
                                                       ', '.join(['`{0}`'.format(col) for col in columns]), # column names
                                                       ', '.join(['%s']*len(values))) # values
    print 'insert() ==> SQL, values:', SQL, values
    execute(SQL, values)
    

#### UPDATE ####
def update(table_name, column_sets, value_sets, column_ids, value_ids):
    SQL = 'UPDATE {0}{1} SET {2} WHERE {3}'.format(TABLE_PREFIX, table_name,
                                                        ', '.join(['`{0}`=%s'.format(col) for col in column_sets]),
                                                        ' AND '.join(['`{0}`=%s'.format(col) for col in column_ids]))
    args = value_sets + value_ids
    print 'update() ==> SQL, args:', SQL, args
    execute(SQL, args)

    
#### DELETE ####
def delete(table_name, columns, values):
    SQL = 'DELETE FROM {0}{1} WHERE {2}'.format(TABLE_PREFIX, table_name,
                                             ' AND '.join(['`{0}`=%s'.format(col) for col in columns]))
    execute(SQL, values)
    pass
    
#### Transcation ####
def transaction(SQL_args_lst):
    conn = mdb.connect(host=MYSQL_HOST,
                       user=MYSQL_USER, passwd=MYSQL_PASS,
                       db=MYSQL_DB, charset=MYSQL_CHARSET)
    cursor = conn.cursor()
    
    for SQL, args in SQL_args_lst:
        cursor.execute(SQL, args)
    conn.commit()
    ret = cursor.fetchone()
    
    cursor.close()
    conn.close()

    return ret

############################################################

    
def load_record(table, column, value):
    SQL = 'SELECT * FROM shop_webim_{0} WHERE `{1}`=%s'.format(table, column)
    print 'load_record.SQL&column&value: ', SQL, column, value
    return load(SQL, value, fetch_one=True)

def load_user(uid):
    return load_record('users', 'login', uid)

def load_visitor(name):
    return load_record('visitors', 'name', name)
    
    
def check_user(username, password):
    SQL = 'SELECT id FROM shop_webim_users WHERE `login`=%s AND `password`=%s'
    return load(SQL, (username, password), fetch_one=True) is not None

    
def load_buddies(uid=None):
    SQL = 'SELECT * FROM shop_webim_users'
    records = load(SQL, None, fetch_one=False, cursor_type=CURSORS['dict'])
    return records

    
def load_groups(uid=None):
    return []

    
def load_histories(msgtype, me, other):
    SQL = '''SELECT * FROM shop_webim_histories
    WHERE `type`=%s AND ((`from`=%s AND `to`=%s AND `fromdel`=0) OR (`from`=%s AND `to`=%s AND `todel`=0))
    ORDER BY `timestamp` DESC
    LIMIT 20'''
    
    return load(SQL, (msgtype, me, other, other, me), fetch_one=False)


def clear_histories(me, other):
    update('histories',
           ['fromdel'], ['1'],
           ['from', 'to'], [me, other])
    update('histories',
           ['todel'], ['1'],
           ['to', 'from'], [me, other])
    

## Insert ##
def add_visitor(nick, ipaddr, signat, referer, url, location):
    
    SQL1 = 'SELECT @A:=Auto_increment FROM information_schema.tables WHERE table_name=\'shop_webim_visitors\''
    args1 = None
    SQL2 = '''INSERT INTO shop_webim_visitors(`eid`, `name`, `nick`, `ipaddr`, `signat`,  `referer`, `url`, `location`)
    VALUES(%s, @A, concat(%s, @A), %s, %s,  %s, %s, %s)'''
    args2 = (10000, nick, ipaddr, signat, referer, url, location)
    SQL3 = 'SELECT @A'
    
    ret = transaction([(SQL1, args1),
                       (SQL2, args2),
                       (SQL3, None)])
    print 'db.vid::', ret[0]
    
    return ret[0]
    
    
def add_message(msgtype,
                visitor_id, user_id,
                frm, frm_nick, to, to_nick,
                body, style, timestamp):
    SQL = '''INSERT INTO shop_webim_histories(
    `visitor_id`, `user_id`, `type`, `to`, `to_nick`,
    `from`, `nick`, `body`, `style`, `timestamp`)
    VALUES(%s, %s, %s, %s, %s,  %s, %s, %s, %s, %s)''' # 10 fields

    insert('histories',
           ('visitor_id', 'user_id', 'type', 'to', 'to_nick',
            'from', 'nick', 'body', 'style', 'timestamp'),
           (visitor_id, user_id, msgtype, to, to_nick,
            frm, frm_nick, body, style, timestamp))

    
    
# ==============================================================================
#  Tests
# ==============================================================================
def test_select():
    print 'test_select'
    conn = mdb.connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_DB)
    cursor = conn.cursor(mdb.cursors.DictCursor)
    cursor.execute('select * from shop_webim_users where login=%s', 'admin')
    for row in cursor.fetchall():
        print row

    cursor.close()
    conn.close()


def test_load_record():
    print 'test_load_record'
    print load_record('users', 'login', 'admin')


def test_load_histories():
    print 'test_load_histories'
    import json
    print json.dumps(load_histories('chat', 'admin', '52050b0b1848c'))

    
def test_add_visotor():
    print 'test_add_visotor'
    add_visitor('name-2', 'GUEST-2', '127.0.0.1', '2013-10-2 23:22', '', 'http://next.im', u'ShangHai')

    
if __name__ == '__main__':
    # test_select()
    # test_load_record()
    # test_load_histories()
    # print check_user()
    # load_buddies(None)
    test_add_visotor()
