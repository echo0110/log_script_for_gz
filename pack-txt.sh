#!/bin/bash
 
 
#echo `ls | grep txt$`
echo `ls | grep "**.txt$"`
 
for file in `ls | grep "**.txt$"`
do
     echo ${file}
     tar -zcf  $file-`date +%F-%H-%M`.tar.gz  $file
done
