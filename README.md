# docker-mysql
该repository为mysql-5.6.26的docker  image制作相关文件。

1、 mysql-5.6.26-1.el6.x86_64.rpm 为rpmbuild制作之后的rpm包；
安装方法：rpm -ivh mysql-5.6.26-1.el6.x86_64.rpm --nodeps

PS：不知道为啥制作出来的rpm包安装时候需要一些perl相关的包，我本身是没有定义依赖perl相关东西了，所以安装时候加--nodeps忽略了

2、mysql-5.6.26.tar.gz 不用说了，为mysql的源码包，打包rpm时候用的源文件；

3、mysql.spec，制作rpm包的必须文件喽，里面写了怎么封包的一个过程，想实现啥就自行修改吧，我是为了build docker镜像用的，没写那么复杂详细的；

4、mysql_default.cnf为提前修改好基础配置的my.cnf文件，安装到/usr/local/mysql/ 下，rpmbuild的时候使用；

5、mysqld_init.sh为mysqld启动脚本，service mysqld [ start|stop|restart|reload ]等，rpmbuild的时候使用，打包到rpm包中；

6、supervisor_mysql.conf为supervisor管理进程配置文件。

7、docker image使用方法：

docker  pull xinghen/mysql-5.6.26:centos6

基础镜像下载： docker  pull  xinghen/centos:6

下载下来之后输入  docker  run  -d -p 3306:3306 --name mysql xinghen/mysql-5.6.26：centos6 就可以跑起来了，当然你也可以在run的时候加-v挂载宿主机的目录到container中。

注：以上都是为了制作最终的docker  mysql镜像，所有操作都是基于centos6系统。

为啥我整个docker镜像这么麻烦呢，因为我直接通过Dockerfile编写，在里面编译安装mysql之后发现mysql的image有1.4G的大小，由于我对docker还不太熟悉，也不知道为啥变的镜像那么大。其实docker镜像最重要的就是轻量化，如果过大的话就失去了本身轻量化的意义了，于是我就琢磨着是不是大小跟docker build时候的层数有关系呢，然后就打包了一个rpm包，通过rpm安装，把Dockerfile中的操作层数尽量的控制在最小，结果最终的image变成了900M，还是比较满意的，因为不知道docker image大小和什么有关系，所以不知道怎么瘦身，只能先保持现在这样了。
