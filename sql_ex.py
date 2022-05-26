#!/usr/bin/python.exe


import sqlite3
import random


con = sqlite3.connect('sql_ex.db')
cur = con.cursor()
sql = '''
DELETE FROM link;
'''
cur.execute(sql)
con.commit()

sql = '''
INSERT INTO link (link_pairs,link_from,link_to) values (?,?,?);
'''
for i in range (1,4):
    for j in range (9):
        cur.execute(sql,[f'{i}-{i*10+j}',i,i*10+j])
        con.commit()
for k in range (10,1,-1):
    cur.execute(sql,[f'{k}-{k-1}',k,k-1])
    con.commit()
    


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
