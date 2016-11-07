#!/bin/bash

DB_FILE=data.db
OUT_PATH=sql
#export OUTPATH
sqlite3 $DB_FILE ".schema"  | grep "CREATE TABLE" | awk -F \" '{print $2}'  > alltable.txt
rm -rf ${OUT_PATH}/*.sql
cat alltable.txt |   awk   '{
	cmd="sqlite3 data.db  \".headers ON .dump "$1" \" > sql/"$1".sql" ;
	#print(cmd);
	system(cmd)
}' 
