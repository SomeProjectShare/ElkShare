#!/bin/bash
#Filename:es-index-delete-30days-ago
#Description: 通过任务计划自动删除es中30天以前的索引，以释放空间
##############################################
source /etc/profile
#定义删除30天以前的函数
delete_indices(){
    check_day=`date -d '-15 days' '+%F'`
    index_day=$1
    #将日期转换为时间戳
    check_day_timestamp=`date -d "$check_day" +%s`
    index_day_timestamp=`date -d "$index_day" +%s`
    #当索引的时间戳值小于当前日期30天前的时间戳时，删除此索引
    if [ ${index_day_timestamp} -lt ${check_day_timestamp} ];then
        #转换日期格式
        format_date=`echo $1 | sed 's/-/\./g'`
        curl -XDELETE http://ip:port/*$format_date
    fi
}

curl -XGET http://ip:port/_cat/indices | awk -F" " '{print $3}' | awk -F"-" '{print $NF}' | egrep "[0-9]*\.[0-9]*\.[0-9]*" | sort | uniq  | sed 's/\./-/g' | while read LINE
do
    #调用索引删除函数
    delete_indices $LINE
done

