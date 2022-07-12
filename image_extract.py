#!/usr/bin/python3


import json
from pathlib import Path
import os

json_dict = {"nodes":[],"links":[]}

print(json_dict.keys())
with open('pinterest.html','r',encoding='utf-8') as f:
    raw_file = f.read()
    body_split = raw_file.split('<body>')
    pin_split = body_split[1].split('Yl- MIw Hb7')
    for pin in pin_split:
        print(pin)
        img_split = pin.split('hCL kVc L4E MIw')
        src_split = img_split[1].split('src="')
        quote_split = src_split[1].split('\"')
        json_dict["nodes"].append({"id":f"{len(json_dict['nodes'])+1}","name":"","val":10,"text":quote_split[0]})


with open('pinterest.json','w') as f1:
        json.dump(json_dict,f1)
