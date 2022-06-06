#!/usr/bin/python.exe


########################################
# flask/db setup
########################################

from flask import Flask, render_template, request, make_response, redirect, url_for
app = Flask(__name__)

# sqlite3 is built in python3, no need to pip3 install
import random
import sqlite3
import copy
# process command line arguments


@app.route('/',methods = ['GET','POST'])     
def root():
    con = sqlite3.connect('sql_ex.db')
    cur = con.cursor()
    nodes = []
    links = []
    sql = '''
    SELECT node_id FROM node ORDER BY node_id ASC;
    '''
    cur.execute(sql)
    for row in cur.fetchall():
        nodes.append(row[0])
    sql = '''
    SELECT link_pairs FROM link;
    '''
    cur.execute(sql)
    for row in cur.fetchall():
        split = row[0].split('-')
        temp = [copy.deepcopy(split[0]),copy.deepcopy(split[1])]
        links.append(temp)

    
    return render_template('index.html',raw_nodes = nodes, raw_links = links)
########################################
# boilerplate
########################################

if __name__=='__main__':
    app.run()
