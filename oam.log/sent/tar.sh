#!/bin/bash
DATE=`date +%Y%m`

BASE_PATH=$(cd `dirname $0`; pwd)

#FILE_PATH="/home/iEQPftp/app/edi/out/sent"
#TAR_PATH="/home/iEQPftp/app/edi/out/successful"
FILE_PATH="/home/niuben/cmd-for-rollover/oam.log/sent"
TAR_PATH="/home/niuben/cmd-for-rollover/oam.log/target"
#echo "TAR_PATH is $TAR_PATH"
for dir in `ls $FILE_PATH --file-type -1`;
do
    #子目录为文件夹
	echo "TAR_PATH is $TAR_PATH"
	echo "dir is $dir"
     if [ `echo $dir | grep "/$"` ]; then
           #去除dir后的‘/’
           dir=${dir%%/*};
           #文件夹下txt文本个数大于0
		   echo "dir is $dir"
           total=$(ls $FILE_PATH/${dir} -1 | grep -E "txt$" | wc -w)
		   echo "tatal is $tatal"
           if [ $total -gt 0 ]; then
              for file in  `ls $FILE_PATH/${dir} -1 | grep -E "txt$" | sort -u`
                   do
                   if [ ! -d "${TAR_PATH}/${dir}" ]; then
                        mkdir ${TAR_PATH}/${dir}
                   fi
                   #拷贝文件
                   cp ${FILE_PATH}/${dir}/$file ${TAR_PATH}/${dir}
              done
              #压缩打包
              cd ${TAR_PATH}/${dir}
              tar czvf `date +"%Y_%m%d_%H%M%S"`.tar *.txt
              #清除拷贝文件
              rm ${TAR_PATH}/${dir}/*.txt
         fi
    fi
done
