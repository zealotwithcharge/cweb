#!/usr/bin/python.exe


########################################
# flask/db setup
########################################

from flask import Flask, render_template, request, make_response, redirect, url_for
app = Flask(__name__)

# sqlite3 is built in python3, no need to pip3 install
import random
import json
import bleach.sanitizer
from bleach.sanitizer import ALLOWED_ATTRIBUTES, Cleaner
import sqlite3
import requests
import copy
# process command line arguments
import argparse
parser = argparse.ArgumentParser(description='Create a database for the twitter project')
parser.add_argument('--db_file', default='twitter_clone.db')
args = parser.parse_args()

allowed_tags = bleach.sanitizer.ALLOWED_TAGS
allowed_tags.append('del')
allowed_tags.append('img')
allowed_tags.append('pre')
allowed_tags.append('code')
allowed_attributes = bleach.sanitizer.ALLOWED_ATTRIBUTES
allowed_attributes['img'] = ['src','alt']
cleaner = Cleaner(tags = allowed_tags,attributes=allowed_attributes)

domains = ['.com','.org','.gov','.edu','.net']


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

    
    return render_template('force_index.html',raw_nodes = nodes, raw_links = links)
########################################
# boilerplate
########################################

if __name__=='__main__':
    app.run()
