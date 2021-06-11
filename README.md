# kubeadm-cluster-playbook
# 
#           本文架构 
#
#
##### 1、使用nginx负载均衡作为 API的外接入地址
##### 2、首先安装nginx、docker、k8s组件
##### 3、生成第一台kubeadm master节点
##### 4、复制配置文件到其他俩台节点
##### 5、保存token信息到其他控制节点和计算节点
##### 6、从节点加入集群
##### 7、统一化配置文件
