
#!/bin/bash
for file in `ls `
do
   if [[ $file =~ \.txt$ ]];then            # [[ $file =~ \.txt$ ]] 匹配以.txt结尾的文件
     tar -zcf  $file-`date +%F-%H-%M`.tar.gz  $file    # 找出以.txt结尾的文件进行打包
   fi
done
