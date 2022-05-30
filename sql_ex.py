#!/usr/bin/python.exe


import sqlite3
import random


con = sqlite3.connect('sql_ex.db')
cur = con.cursor()
sql = '''
DELETE FROM node;
'''
cur.execute(sql)
con.commit()
sql = '''
INSERT INTO node (node_id) values (?);
'''
for i in range (1,1000):
    cur.execute(sql,[i])
    con.commit()
sql = '''
DELETE FROM link;
'''
cur.execute(sql)
con.commit()

sql = '''
INSERT INTO link (link_pairs,link_from,link_to) values (?,?,?);
'''
for i in range (1,1000):
    if i <= 10:
        cur.execute(sql,[f'{i}-{i+1}',i,i+1])
        con.commit()
    elif i > 10:
        div = i//10
        cur.execute(sql,[f'{div}-{i}',div,i])
        con.commit()
   
# for k in range(0,9):
#     cur.execute(sql,[f'{k*10+1}-{k*10+11}',k*10+1,k*10+11])
#     con.commit()


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
