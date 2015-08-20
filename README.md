# docker-mysql
该repository为mysql-5.6.26的docker  image制作相关文件。

1、 mysql-5.6.26-1.el6.x86_64.rpm 为rpmbuild制作之后的rpm包，安装方法：
rpm -ivh mysql-5.6.26-1.el6.x86_64.rpm --nodeps
不知道为啥制作出来的rpm包安装时候需要一些perl相关的包，我本身是没有定义依赖perl相关东西了，所以安装时候加--nodeps忽略了

2、mysql-5.6.26.tar.gz 不用说了，为mysql的源码包，打包rpm时候用的源文件；

3、mysql.spec，制作rpm包的必须文件喽，里面写了怎么封包的一个过程，想实现啥就自行修改吧，我是为了build docker镜像用的，没写那么复杂详细的；

4、mysql_default.cnf为提前修改好基础配置的my.cnf文件，安装到/usr/local/mysql/ 下，rpmbuild的时候使用；

5、mysqld_init.sh为mysqld启动脚本，service mysqld [ start|stop|restart|reload ]等，rpmbuild的时候使用，打包到rpm包中；

6、supervisor_mysql.conf为supervisor管理进程配置文件。
