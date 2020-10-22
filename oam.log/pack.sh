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

cd $CU_DIR
./batch-5g-cu.sh
cd $DU_DIR
./batch-5g-du.sh

echo 'project dir is: '$BASE_PATH

if [ ! -d $SRC_DIR ];then
    mkdir -p $SRC_DIR
else
    echo "file already exist"
fi

rm -f zips/*

echo -e "---------- init finished -------------------"

cp -rp compress/* $SRC_DIR

zip -r oam.zip ./*.txt
zip -r oam.zip ./*.txt


for file in $SRC_DIR/*
do
     arr=(${arr[*]}$file)
done

