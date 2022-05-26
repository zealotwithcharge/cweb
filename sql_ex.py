#!/usr/bin/python.exe


import sqlite3
import random


con = sqlite3.connect('sql_ex.db')
cur = con.cursor()


sql = '''
SELECT link_pairs FROM link;
'''
cur.execute(sql)
for row in cur.fetchall():
    print(row[0])

#     print(str(row[0])+': '+row[1])

# CREATE TABLE node (
#     node_id INTEGER PRIMARY KEY,
#     node_content TEXT,
#     node_neg_content TEXT)
# ;
# CREATE TABLE link (
#     link_id INTEGER PRIMARY KEY,
#     link_pairs TEXT,
#     link_from INTEGER,
#     link_to INTEGER,
#     link_type TEXT);
# '''
