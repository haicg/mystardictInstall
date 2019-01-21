#!/bin/bash
#词典的下载链接：http://pan.baidu.com/s/138Hx8
#请用浏览器下载，里面主要有三个常用的字典：金山、牛津双解、Etymonline
#其他的下载网站有：http://abloz.com/huzheng/stardict-dic/dict.org/
#和http://abloz.com/huzheng/stardict-dic/
#将下载好的离线安装包解压到本程序生成的dict文件夹下，
#也可以自己手动创建dict
#然后再运行本脚本，本脚本会讲dict目录下所有的词典文件都复制到/usr/share/stardict/dic目录下

ppath=`which stardict`

if [ -z $ppath ]; then
    echo "Install stardict"
    sudo apt-get install stardict
fi

if [ ! -d dict ]
then
    mkdir dict
fi

for file in ./*.tar.*
do
	if [ -f $file ];
	then
		echo $file
		tar -xf $file -C dict
	fi
done

stardict_path=/usr/share/stardict/dic

for file in `ls dict`
do
    echo "file:"$file
    if [ -d "./dict/$file" ]
    then
        sudo cp  ./dict/$file/*.* $stardict_path
        #ls "./dict/$file/"
    else
        #sudo cp -rf dict/$file /usr/share/stardict/dic
        sudo cp -rf dict/$file $stardict_path
    fi
done
