#!/bin/bash            
set -e
# project location
BASE_PATH=$(cd `dirname $0`; pwd)
# pack location 
TARGET_DIR=$BASE_PATH'/zips'
echo $TARGET_DIR
# resource location
SRC_DIR=$BASE_PATH'/resources'
echo $SRC_DIR

echo 'project dir is: '$BASE_PATH

if [ ! -d $SRC_DIR ];then
    mkdir -p $SRC_DIR
else
    echo "file already exist"
fi

rm -f zips/*

echo -e "---------- init finished -------------------"

cp -rp compress/* $SRC_DIR

for file in $SRC_DIR/*
do
     arr=(${arr[*]}$file)
done

for file_path in ${arr[@]}
do
    echo "---------- $file_path ---------------"
    file_name=`echo $file_path | sed s!$SRC_DIR!!`
    echo "--------- file_name -----------------"
    echo $file_name
    echo "--------- file_name -----------------"
    src_filename=$file_path
    echo "--------- src_filename -----------------"
    echo $src_filename
    echo "--------- src_filename -----------------"
    dest_filename=$TARGET_DIR$file_name'.zip'
    echo "--------- dest_filename -----------------"    
    echo $dest_filename
    echo "--------- dest_filename -----------------"    
    zip -r $dest_filename $src_filename
done

echo -e "------------ zip compress finished ----------------------"

