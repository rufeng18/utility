#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import random
from string import *
tempStr = open("code.template").read()
tempTemplate = Template(tempStr)

codes=list(ascii_lowercase+ascii_uppercase)

names={}
for i in range(0,5000):
	random.shuffle(codes)
	clsname = ''.join(codes[:6])
	if clsname in names:
		continue
	names[clsname] = 1
	random.shuffle(codes)
	id = ''.join(codes[:3])
	random.shuffle(codes)
	age = ''.join(codes[:4])
	random.shuffle(codes)
	score = ''.join(codes[:5])
	random.shuffle(codes)
	hp = ''.join(codes[:5]) 
 
 	fp = open(clsname+'.cpp',"w+")
	v=tempTemplate.substitute(CLSNAME=clsname,Id=id,Age=age,Score=score,HP=hp)
	fp.write(v)
	fp.close()
