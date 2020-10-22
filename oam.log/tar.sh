#!/bin/bash
DATE=`date +%Y%m`

BASE_PATH=$(cd `dirname $0`; pwd)

#FILE_PATH="/home/iEQPftp/app/edi/out/sent"
#TAR_PATH="/home/iEQPftp/app/edi/out/successful"
FILE_PATH="/home/niuben/cmd-for-rollover/oam.log/sent"
TAR_PATH="/home/niuben/cmd-for-rollover/oam.log/target"
all=""
for i in `find $PWD -name "*.txt"`
do
	file=${i##*/}
	echo "file  is $file"
	all="$all $file"
done
tar -czf all.tgz $all
#echo "bash_path is $BASE_PATH"
#tar -czf all22.tgz $BASE_PATH *.txt
#cd ${BSE_PATH}
#tar -czf all333.tgz *.txt
#tar -czf `date +"%Y_%m%d_%H%M%S"`.tar *.txt
