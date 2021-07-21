#!/bin/bash
#:auth:Wang
#time:2019-12-31
#Notice: Ansible keyless interaction
IP=`cat /etc/ansible/hosts | grep -Ev "#|$^" | grep -vE "[a-z]"`
#输入服务器密码
password="pd"

yum nstall sshpass ansible -y

ssh-keygen -t dsa   -f ~/.ssh/id_dsa -P ''

successed_list=( )
failed_list=( )
n=0
#fenfa
for i in ${IP[@]}
do
	/usr/bin/sshpass -p${password} ssh-copy-id -oStrictHostKeyChecking=no ${i} > /dev/null
	let n++
	if [ $? -eq 0 ];then
		successed_list[$n]=$i
	else
		failed_list[$n]=$i
	fi
done

/usr/bin/ansible "*" -m ping

for success in ${successed_list[@]};
do
	echo 免密成功主机: ${success};
done

echo 免密失败主机个数: ${#failed_list[*]}
