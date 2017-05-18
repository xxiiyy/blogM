/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50550
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2017-05-18 11:07:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `sys_article_tag`;
CREATE TABLE `sys_article_tag` (
  `id` varchar(32) NOT NULL COMMENT '标签文章id',
  `tagId` varchar(32) NOT NULL COMMENT '标签id',
  `articleId` varchar(32) NOT NULL COMMENT '文章id',
  PRIMARY KEY (`tagId`,`articleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_article_tag
-- ----------------------------
INSERT INTO `sys_article_tag` VALUES ('614be6e667cf45eda17f83995f273541', '2a90f91c67b94e22ad2618f1684908bb', 'c53e236b258b47aaa3efe7f991ea864b');
INSERT INTO `sys_article_tag` VALUES ('360180f0e1194cd89b915a839772c4de', '656297677a2d4399aac9eb668665473e', '629c015a01e94b4b91ab9ff1b9934c2e');
INSERT INTO `sys_article_tag` VALUES ('db59f49fd7644d5eb85d373273b87f43', 'edbbdb7b33634962924189bf2e75810a', '2e7265ef9eee455fa5e378abb93ecbcd');
INSERT INTO `sys_article_tag` VALUES ('614be6e667cf45eda17f83995f27354a', 'edbbdb7b33634962924189bf2e75810a', 'b8d6cb51e1ca4e6aac509f86a360612e');
INSERT INTO `sys_article_tag` VALUES ('614be6e667cf45eda17f83995f273542', 'edbbdb7b33634962924189bf2e75810a', 'd38d4a395a2241058b60771b6cbe48d0');
INSERT INTO `sys_article_tag` VALUES ('614be6e667cf45eda17f83995f273543', 'fd9d69d01b43442ba240ab68048195b3', 'd38d4a395a2241058b60771b6cbe48d1');

-- ----------------------------
-- Table structure for sys_blog
-- ----------------------------
DROP TABLE IF EXISTS `sys_blog`;
CREATE TABLE `sys_blog` (
  `id` varchar(32) NOT NULL COMMENT '文章主键',
  `title` varchar(20) NOT NULL COMMENT '文章标题',
  `content` varchar(20000) NOT NULL COMMENT '文章内容',
  `subtitle` varchar(50) NOT NULL COMMENT '文章子标题',
  `author` varchar(20) NOT NULL COMMENT '作者',
  `tagId` varchar(20) NOT NULL COMMENT '标签',
  `classifyId` varchar(32) NOT NULL COMMENT '分类',
  `click` int(11) NOT NULL COMMENT '点击量',
  `updateTime` datetime NOT NULL COMMENT '更新时间',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateBy` varchar(255) DEFAULT NULL COMMENT '更新者',
  `createBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_blog
-- ----------------------------
INSERT INTO `sys_blog` VALUES ('2e7265ef9eee455fa5e378abb93ecbcd', 'maven环境配置', 'maven环境配置\r\n\r\nmaven是一个项目管理插件，一般开发中会使用很多jar包，使用maven不用你手动去下载jar包，所有jar包仓库统一管理，只要配置一下pom文件即可。这可以提高开发效率，可以方便管理项目。\r\n1.maven下载\r\n\r\n可以访问官方网址：http://maven.apache.org/download.cgi\r\n\r\n\r\n这里可以根据情况选择自己需要下载的maven，一般选择下载最新版本的。\r\n2.maven的系统环境变量配置\r\n\r\n\r\n这里根据自己maven存放位子配置\r\n\r\n将自己配置好的MAVEN_HOME添加到path路径下\r\n3.maven测试是否配置成功\r\n\r\n\r\n这里使用mvn -v来判断是否安装成功。如果出现类似上图中的情况说明配置成功。\r\n4.maven仓库的配置\r\n\r\n\r\n找到maven存放地址，修改conf文件夹里面的settings.xml文件\r\n<localRepository>F:\\Repositories\\Maven</localRepository>\r\n这个可以看作本地仓库，如果不配置，maven下载的jar默认会存放在用户目录下的.m2文件里，如果配置了jar将会存放自己设定的地方，这样可以方便管理。\r\n5.maven镜像配置\r\n\r\n还是在conf文件夹里的settings.xml文件\r\n<mirrors>\r\n    <mirror>\r\n      <id>alimaven</id>\r\n      <name>aliyun maven</name>\r\n      <url>http://maven.aliyun.com/nexus/content/groups/public/</url>\r\n      <mirrorOf>central</mirrorOf>        \r\n    </mirror>\r\n  </mirrors>\r\n这个可以看作远程仓库或者中央仓库，由于maven中的jar下载是从网络中下载所以有时候网不好的时候就会出现下载速度过慢带来的不便利。镜像的配置作用就是选择jar下载的来源，我们一开始默认是使用国外的镜像，所以难免会出现网络不好的情况，访问外网本身就可能不快，这里配置的是国内阿里的镜像仓库，这个仓库是比较好的，下载jar速度还是很快的。如果有觉得更好远程仓库的可以换成更好的，其实仓库的选择有很多，看自己了。\r\n使用网页打开上面镜像地址http://maven.aliyun.com/nexus/content/groups/public/就可以看到里面存放的jar，里面存放了基本上所有的jar。\r\n当然在settings.xml文件中还有很多可以配置的，比如包含了本地仓库位置，远程仓库服务器以及认证信息等，不过一般项目开发配置到这里就足够用了。\r\n6.maven配置eclipse\r\n\r\nwindow->preferences->maven->installations,点击add找到对应maven路径即可。\r\n\r\n这里也配置一下路径：第一个表示全部的workspace工作空间都是用这个maven，第二个表示当前workspace工作空间使用这个maven，后面那个表示是存放jar包的路径。\r\n\r\n这样就差不多配置完成了。\r\n7.创建一个maven项目\r\n\r\n由于maven项目一般是不可以直接创建的，当然创建maven项目很多种，\r\n点击Maven Project\r\n\r\n使用默认配置\r\n\r\n这是选择maven-archetype-webapp\r\n\r\n填写一些基本信息\r\n\r\n此时项目还是有错误的\r\n修改build path中的配置，点击select  all完成\r\n\r\n\r\n然后载点击add library，选择server runtime就这样就完成配置了', 'maven环境配置', 'lhd', 'web', '1930d5688f8c4eb09a31e44166d52f14', '0', '2017-05-18 11:01:59', '2017-05-17 22:57:31', 'admin', 'admin', '/images/random/bg1.jpg');
INSERT INTO `sys_blog` VALUES ('629c015a01e94b4b91ab9ff1b9934c2e', 'oracle数据库基本操作', '首先介绍一下主流的数据库有：\r\n\r\n大型数据库：oracle，db2\r\n中型数据库：MySql Sql Server\r\n小型数据库：Sqlite，Access\r\n我们使用oracle介绍\r\n\r\n\r\n使用软件 ：OracleXEUniv 这里使用精简版\r\n路径配置：一般安装自己会配置好，如果没有自动配置好，可以使用手动配置\r\nC:\\oraclexe\\app\\oracle\\product\\10.2.0\\server\\bin\r\n\r\n安装过程中一般需要设置口令（密码）：我这里设置为root，账号是默认的system\r\n如果以上都完成了就可以打开命令行\r\n\r\n登录方式sqlplus回车输入账号密码，还有就是直接sqlplus system/root\r\n\r\n创建一个新的用户：user1账号，pwd密码\r\ncreate user user1 identified by pwd;\r\n注意这样创建的用户是没有登录权限的，接下来赋予权限\r\ngrant connect,resource to user1;\r\n权限赋予完成后，就可以登录，这里可以选择exit;推出之后在登录，但是有一种直接切换的方式,这里的user1为账号，pwd为密码\r\n\r\n\r\n切换到新建用户user1\r\nconn user1/pwd\r\n那完成了创建用户，权限的赋予后我们就可以操作数据库了，首先要明白这里有一个默认数据库XE，所以我们可以直接创建表，不需要像mysql那样先选择数据库才可以创建表\r\n创建表的语句格式为：create table 表明(字段名 数据类型 约束名);\r\n    create table tbl_salary(id number(10) primary key,  \r\n        name varchar(20) not null,dept_id number(10) not null,  \r\n        salary number(6) not null);  \r\ncreate table tbl_user(id number(8) primary key,  \r\n    dept_id number(8) references tbl_salary(id),  \r\n    username varchar(20) not null);\r\n\r\n表中的一些关键字什么意思暂时不解释了，反正要明白就是创建了一个名字为tbl_user的表和一个名字为tbl_salary的表\r\n这里在创建好的表，我们将会使用上面两个表作为我测试的实例\r\n在这里我说一下创建表需要规范命名，这是一个良好的习惯\r\n\r\nsql关键字\r\n\r\n数据类型\r\nnumber：整型\r\nchar：字符型\r\nvarchar：字符串型\r\nvarchar2：字符串型（只有oracle可用。使用oracle数据可以推荐使用）\r\ndate：时间类型\r\ndatetime：跟精确的时间（两个使用以情况而定）\r\n常用的就这些，后面带的数据代表可以许可多少位，这里举个特例number(5,2)这里代表5位，有3位整数，2位小数\r\n\r\n约束名\r\nprimary key：主键声明，主键是唯一的，且非空\r\nreferences（foreign key）：外键的声明，连接其他表的数据\r\nnot null：字段值非空\r\nunique：字段值唯一\r\n常用的就这些把，其它的这里就不讲了\r\n\r\n查询表结构：\r\ndesc tbl_user;\r\n删除表：\r\ndrop table tbl_user;\r\n接下来介绍增删改查：\r\n\r\n增加：使用insert语句\r\ninsert   \r\ninto tbl_user   \r\nvalues(1,2,\'system\');\r\ninsert   \r\ninto tbl_user(id,emp_id,username)   \r\nvalues(2,3,\'root\');\r\n这里注意使用单引号，双引号代表转义\r\n\r\n修改：使用update语句\r\nupdate tbl_user   \r\nset name = \'bbb\';\r\n将tbl_user表中的name全部修改成bbb\r\nupdate tbl_user   \r\nset name = \'bbb\'   \r\nwhere id = 2;\r\n修改tbl_user表中id=2的数据修改为bbb\r\n\r\n删除：使用delete语句\r\ndelete   \r\nfrom tbl_user;\r\n删除表中的所有数据\r\ndelete   \r\nfrom tbl_user   \r\nwhere id = 2;\r\n删除表中id=2的数据\r\n\r\n查询：使用select语句\r\n\r\n这里简单的将select语句分为：\r\n简单查询，条件查询，分组查询，多表查询，子查询\r\n\r\n简单查询：\r\nselect *   \r\nfrom tbl_user;\r\n\r\n条件查询：\r\nselect *   \r\nfrom tbl_user   \r\nwhere id = 1;  \r\n排序查询：\r\nselect id,username   \r\nfrom tbl_user   \r\norder by id asc;\r\n这里asc代表升序，对应的desc代表降序\r\n\r\n分组查询：\r\nselect avg(salary)   \r\nfrom tbl_salary  \r\ngroup by dept_id;\r\nselect avg(salary)   \r\nfrom tbl_salary  \r\ngroup by dept_id  \r\nhaving avg(salary) > 100  \r\norder by avg(salary) asc;\r\n\r\n一般使用于运用场景avg max min sum\r\n这里说说having和where的区别：\r\n首先where这里不能使用在分组集合里面，其他场景都是用where\r\nhaving只能对分组后的数据进行操作，后面跟上的是聚合函数（avg max min sum）\r\n\r\n多表查询：\r\nselect u.id,s.name  \r\nfrom tbl_user u,tbl_salary s  \r\nwhere u.dept_id = s.id;\r\n这里u为tbl_user的别名，s为tbl_salary的别名\r\n首先多表连接很容易照成数据冗余\r\n比如两个集合为a{1,2,3},b{1,2,3}，形成笛卡儿积就是两个集合相乘这样就有9条数据\r\n这里使用u.dept = s.id;可以消除笛卡儿积，减少数据冗余\r\n\r\n最后在谈一谈commit语句的作用：刚刚学的时候因为这个语句使得我花费很多时间：\r\ncommit只针对DML\r\nDML（data manipulation language）：需要提交的，比如执行insert，update，delete\r\nDDL（data definition langage）：不需要提交，比如执行create，select，alter\r\n当你使用insert，update，delete的时候你立马查询是可以查询到数据的改变的，但是你使用其他方式在登录这个账号进行查询的时候其实是不能查询到的，所以但执行这些操作的时候需要commit操作就可以查询到了。\r\n\r\n\r\n', 'oracle数据库基本操作,创建数据库，增删改查', 'lhd', '数据库', '1930d5688f8c4eb09a31e44166d52f14', '0', '2017-05-17 22:56:19', '2017-05-17 22:56:19', 'admin', 'admin', '/images/random/bg2.jpg');
INSERT INTO `sys_blog` VALUES ('b8d6cb51e1ca4e6aac509f86a360612e', 'shiro基本配置', 'shiro：web配置\r\n\r\n<context-param>\r\n	<param-name>contextConfigLocation</param-name>\r\n	<param-value>\r\n		classpath:spring-shiro.xml\r\n	</param-value>\r\n</context-param>\r\n加载shiro配置文件\r\n<!-- shiro filter的名字是shiroFilter,那么在spring的配置文件中要有一个名字为shiroFilter的bean -->\r\n	<filter>\r\n		<!-- 这里的filter-name 要和spring 的applicationContext-shiro.xml 里的\r\n			org.apache.shiro.spring.web.ShiroFilterFactoryBean 的bean name 相同 -->\r\n		<filter-name>shiroFilter</filter-name>\r\n		<filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>\r\n		<init-param>\r\n			<param-name>targetFilterLifecycle</param-name>\r\n			<param-value>true</param-value>\r\n		</init-param>\r\n		<init-param>\r\n			<param-name>targetBeanName</param-name>\r\n			<param-value>shiroFilter</param-value>\r\n		</init-param>\r\n	</filter>\r\n	<filter-mapping>\r\n		<filter-name>shiroFilter</filter-name>\r\n		<url-pattern>/*</url-pattern>\r\n	</filter-mapping>\r\n	\r\n\r\n这里的shiroFilter对应着spring-shiro配置文件中的shiroFilter，/*表示shiro将过滤全部路径\r\nspring-shiro.xml配置\r\n\r\n<!-- wbe.xml中shirofilter对应的bean -->\r\n	<bean id=\"shiroFilter\" class=\"org.apache.shiro.spring.web.ShiroFilterFactoryBean\">\r\n		<property name=\"securityManager\" ref=\"securityManager\" />\r\n		<property name=\"loginUrl\" value=\"/login.action\" />\r\n		<property name=\"successUrl\" value=\"/query.action\" />\r\n		<!-- 制定拒绝访问页面 -->\r\n		<property name=\"unauthorizedUrl\" value=\"/error.jsp\" />\r\n		<!-- 自定义filter配置 -->\r\n		<property name=\"filters\">\r\n			<map>\r\n				<!-- 将自定义 的FormAuthenticationFilter注入shiroFilter中 -->\r\n				<entry key=\"authc\" value-ref=\"formAuthenticationFilter\" />\r\n			</map>\r\n		</property>\r\n		<property name=\"filterChainDefinitions\">\r\n			<value>\r\n				<!-- 请求这个地址自动退出 -->\r\n				/logout.action = logout\r\n\r\n				<!-- 所有url可以匿名访问 -->\r\n				/login.jsp = anon\r\n				<!-- 查询权限 -->\r\n				<!-- /query.action = perms[user:query] /add.action = perms[user:add] \r\n					/update.action = perms[user:update] -->\r\n				<!-- 所有url都需要认证才可以访问 -->\r\n				/** = authc\r\n\r\n			</value>\r\n		</property>\r\n	</bean>\r\n\r\nsecurityManager：安全管理器\r\nloginUrl这个value就是shiro所指定的登录界面，successUrl指定登录成功界面，如果不配置登录成功将默认跳转到上次请求路径，unauthorizedUrl这个是一个没有权限路径，当没有权限就会到这个界面，\r\nfilters：这个是一个自定义的filter，也就是自定义的过滤方式，上面写的是一个表单过滤器，表单过滤器一般载登录的时候使用\r\nfilterChainDefinitions：shiro过滤器链。这个链是从上向下走的基本的有login，logout，anon，authc\r\n安全管理器securityManager\r\n\r\n<!-- securityManager安全管理器 -->\r\n	<bean id=\"securityManager\" class=\"org.apache.shiro.web.mgt.DefaultWebSecurityManager\">\r\n		<property name=\"realm\" ref=\"userRealm\"></property>\r\n		<!-- 缓存管理器 -->\r\n		<property name=\"cacheManager\" ref=\"cacheManager\"></property>\r\n		<!-- session会话管理器 -->\r\n		<property name=\"sessionManager\" ref=\"sessionManager\"></property>\r\n		<!-- 记住我 -->\r\n		<property name=\"rememberMeManager\" ref=\"rememberMeManager\"></property>\r\n	</bean>\r\n\r\nrealm域：realm添加到securityManager，realm相当于数据源，从数据库获取数据，交给securtyManager来认证，授权\r\ncacheManager缓存管理器：每当系统需要访问需要权限的资源的时候，都需要securityMananger从新去获取，这个大大降低的效率，所以可以配置缓存管理器，降低资源消耗。\r\nsessionManager会话管理器：一次登录就是一次会话，如果一个用户一直登录账号，而忘记退出了，这个账户就会一直存在（如果不关闭浏览器），这里我们就需要会话管理器，可以设置生命周期。\r\nrememberManager：从字面上理解就是记住密码\r\nrealm\r\n\r\n<!-- realm -->\r\n	<bean id=\"userRealm\" class=\"com.my.shiro.realm.userRealm\">\r\n		<!-- 将凭证匹配器设置到realm中，realm按照凭证匹配器的要求进行散列 -->\r\n		<property name=\"credentialsMatcher\" ref=\"credentialsMatcher\" />\r\n	</bean>\r\nrealm：需要自己写一个类，继承AuthorizingRealm\r\ncredentialsMatcher：认证的方式，一般数据库存密码不会存明文，一般都是加密的，所以认证的时候也需要加密认证，这个就是一种认证方式\r\n\r\npackage com.my.shiro.realm;\r\n\r\nimport java.util.ArrayList;\r\nimport java.util.List;\r\n\r\nimport org.apache.shiro.SecurityUtils;\r\nimport org.apache.shiro.authc.AuthenticationException;\r\nimport org.apache.shiro.authc.AuthenticationInfo;\r\nimport org.apache.shiro.authc.AuthenticationToken;\r\nimport org.apache.shiro.authc.SimpleAuthenticationInfo;\r\nimport org.apache.shiro.authz.AuthorizationInfo;\r\nimport org.apache.shiro.authz.SimpleAuthorizationInfo;\r\nimport org.apache.shiro.realm.AuthorizingRealm;\r\nimport org.apache.shiro.subject.PrincipalCollection;\r\nimport org.apache.shiro.util.ByteSource;\r\nimport org.springframework.beans.factory.annotation.Autowired;\r\n\r\nimport com.my.shiro.Entity.User;\r\nimport com.my.shiro.Service.Impl.userServiceImpl;;\r\npublic class userRealm extends AuthorizingRealm{\r\n	\r\n	\r\n	@Autowired \r\n	private userServiceImpl userService;\r\n	//授权\r\n	@Override\r\n	protected AuthorizationInfo doGetAuthorizationInfo(\r\n			PrincipalCollection principals) {\r\n		//从principals获取主身份信息\r\n		User user = (User) principals.getPrimaryPrincipal();\r\n		//根据身份信息获取权限信息\r\n		//模拟链接数据库\r\n		//System.out.println(\"11111\"+user);\r\n		List<String> permissions = new ArrayList<String>();\r\n		String permission = \"\";\r\n		permission = userService.findpermission(user.getUsername());\r\n		if(permission != null&&!permission.equals(\"\")){\r\n			String a[] = permission.split(\",\");\r\n			for(int i = 0; i < a.length; i++){\r\n				permissions.add(a[i]);\r\n			}\r\n		}\r\n		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();\r\n		simpleAuthorizationInfo.addStringPermissions(permissions);\r\n		\r\n		return simpleAuthorizationInfo;\r\n	}\r\n	\r\n	//设置realm名称\r\n	@Override\r\n	public void setName(String name) {\r\n		super.setName(\"testrealm\");\r\n	}\r\n	\r\n	//认证\r\n	@Override\r\n	protected AuthenticationInfo doGetAuthenticationInfo(\r\n			AuthenticationToken token) throws AuthenticationException {\r\n		//first从token(用户输入)中获取用户信息\r\n		String usercode = (String) token.getPrincipal();\r\n		//根据usercode从数据看中查询\r\n		//模拟数据库\r\n		\r\n		String password = userService.findpassword(usercode);\r\n		//盐\r\n		String salt = \"aa\"; \r\n		User u1 = new User();\r\n		u1.setPassword(password);\r\n		u1.setUsername(usercode);\r\n		SimpleAuthenticationInfo simpleAuthenticationInfo = new \r\n				SimpleAuthenticationInfo(u1, password, ByteSource.Util.bytes(salt), this.getName());\r\n		\r\n		return simpleAuthenticationInfo;\r\n	}\r\n	\r\n	public void clearCached(){\r\n		PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();\r\n		super.clearCache(principals);\r\n	}\r\n}\r\n\r\n这里面有三个继承父类方法，doGetAuthorizationInfo，doGetAuthenticationInfo，setName\r\ndoGetAuthorizationInfo：授权，将已经认证过的人用户分配权限，返回一个授权信息\r\ndoGetAuthenticationInfo：认证，用户登录的时候需要认证，返回一个凭证信息\r\nsetName：realm名字\r\n\r\ncredentialsMatcher凭证匹配器\r\n\r\n<!-- 凭证匹配器 -->\r\n	<bean id=\"credentialsMatcher\"\r\n		class=\"org.apache.shiro.authc.credential.HashedCredentialsMatcher\">\r\n		<property name=\"hashAlgorithmName\" value=\"md5\" />\r\n		<property name=\"hashIterations\" value=\"1\" />\r\n	</bean>\r\n\r\nhashAlgorithmName：这个使用的匹配方式就md5，就是加密之后在和数据库数据进行比较\r\nhashIterations：加密迭代次数，1代码加密迭代1次\r\n\r\ncacheManager缓存管理器\r\n\r\n<!-- 缓存管理器 -->\r\n	<bean id=\"cacheManager\" class=\"org.apache.shiro.cache.ehcache.EhCacheManager\">\r\n		<property name=\"cacheManagerConfigFile\" value=\"classpath:shiro-ehcache.xml\" />\r\n	</bean>\r\n\r\n这里需要加载一个配置文件shiro-ehcache.xml\r\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<ehcache xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n  xsi:noNamespaceSchemaLocation=\"http://ehcache.org/ehcache.xsd\"\r\n  updateCheck=\"false\">\r\n	<!--diskStore：缓存数据持久化的目录 地址  -->\r\n	<diskStore path=\"java.io.tmpdir\"/>\r\n	<defaultCache \r\n		maxElementsInMemory=\"1000\" \r\n		maxElementsOnDisk=\"10000000\" \r\n		eternal=\"false\" \r\n		overflowToDisk=\"false\" \r\n		diskPersistent=\"false\" \r\n		timeToIdleSeconds=\"120\" \r\n		timeToLiveSeconds=\"120\" \r\n		diskExpiryThreadIntervalSeconds=\"120\" \r\n		memoryStoreEvictionPolicy=\"LRU\">\r\n	</defaultCache>\r\n</ehcache>\r\n\r\nsessionManager会话管理器\r\n\r\n<!-- 会话管理器 -->\r\n	<bean id=\"sessionManager\"\r\n		class=\"org.apache.shiro.web.session.mgt.DefaultWebSessionManager\">\r\n		<!-- session的失效时长，单位毫秒 -->\r\n		<property name=\"globalSessionTimeout\" value=\"600000\" />\r\n		<!-- 删除失效的session -->\r\n		<property name=\"deleteInvalidSessions\" value=\"true\" />\r\n	</bean>\r\n\r\nglobalSessionTimeout：session保存时间\r\ndeleteInvalidSessions：失效的session是否删除\r\n\r\nformAuthenticationFilter表单过滤器\r\n\r\n<bean id=\"formAuthenticationFilter\" class=\"com.my.shiro.realm.FormAuthentication\">\r\n		<!-- 表单中账号的input名称 -->\r\n		<property name=\"usernameParam\" value=\"username\" />\r\n		<!-- 表单中密码的input名称 -->\r\n		<property name=\"passwordParam\" value=\"password\" />\r\n		<!-- 记住我input的名称 -->\r\n		<property name=\"rememberMeParam\" value=\"rememberMe\" />\r\n	</bean>\r\nusernameParam，passwordParam，rememberMeParam对应的就是html表单提交input标签的name属性\r\n<form action=\"/shiro/login.action\"  method=\"post\"><br>\r\n		账号:<input type=\"text\" name=\"username\"><br>\r\n		密码:<input type=\"password\" name=\"password\"><br>\r\n		<input type=\"checkbox\" name=\"rememberMe\">自动登录<br>\r\n		<input type=\"submit\" value=\"提交\">\r\n	</form>\r\n登录的时候一般会自动进行表单验证，但是shiro提供的表单验证不能验证验证码之类的，所以需要自己实现FormAuthenticationFilter重写onAccessDenied，在里面可以进行验证码的验证\r\n\r\npackage com.my.shiro.realm;\r\n\r\nimport javax.servlet.ServletRequest;\r\nimport javax.servlet.ServletResponse;\r\n\r\nimport org.apache.shiro.web.filter.authc.FormAuthenticationFilter;\r\n\r\npublic class FormAuthentication extends FormAuthenticationFilter{\r\n	\r\n	//认证方法\r\n	//可以进行验证码校验\r\n	@Override\r\n	protected boolean onAccessDenied(ServletRequest request,\r\n			ServletResponse response) throws Exception {\r\n		System.out.println(111);\r\n		return super.onAccessDenied(request, response);\r\n	}\r\n}\r\n\r\nrememberMeManager记住我\r\n\r\n<bean id=\"rememberMeManager\" class=\"org.apache.shiro.web.mgt.CookieRememberMeManager\">\r\n		<property name=\"cookie\" ref=\"rememberMeCookie\"></property>\r\n	</bean>\r\n\r\n	<bean id=\"rememberMeCookie\" class=\"org.apache.shiro.web.servlet.SimpleCookie\">\r\n		<!-- cookie的名字 -->\r\n		<constructor-arg value=\"rememberMe\" />\r\n		<property name=\"httpOnly\" value=\"true\" />\r\n		<property name=\"maxAge\" value=\"2592000\" /><!-- 30天 -->\r\n	</bean>\r\n\r\n这里主要配置cookie名字，和cookie存活时间，可以就密码可以保存多久不登陆。\r\nshiro生命周期\r\n\r\n<!-- 保证实现了Shiro内部lifecycle函数的bean执行 -->\r\n	<bean id=\"lifecycleBeanPostProcessor\" class=\"org.apache.shiro.spring.LifecycleBeanPostProcessor\" />\r\n把shrio生命周期交给spring管理\r\n\r\nshiro注解支持\r\n\r\n<!-- 开启aop，对类代理 -->\r\n	<aop:config proxy-target-class=\"true\"/>\r\n	<!-- 开启shiro注解支持 -->\r\n	<bean class=\" org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor\">\r\n		<property name=\"securityManager\" ref=\"securityManager\"/>\r\n	</bean>\r\n\r\n由于shiro是基于aop的所以首先要开启aop支持，在使用org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor开启注解支持\r\n注意这个是写在springmvc.xml中的。\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'shiro基本配置', 'lhd', '框架', '61a2375dbcb046fbabbxx4bd98033fca', '0', '2017-05-17 22:58:21', '2017-05-17 22:58:21', 'admin', 'admin', '/images/random/bg3.jpg');
INSERT INTO `sys_blog` VALUES ('c53e236b258b47aaa3efe7f991ea864b', 'java修饰符final', 'final修饰符\r\n1.final修饰变量\r\n\r\nfinal修饰的变量指向是不可变的，比如string类型的数据，初始化就不可以改变了\r\n例如：\r\npublic class FinalTest{\r\n	public static void main(String[] args) {\r\n		final String a = \"str1\";\r\n		a = \"str2\";\r\n	}\r\n}\r\n因为final修饰字符串所以a字符串是不可变的，所以上面代码编译是会报错的，原因是当a改变成str2的时候，引用变量指向会发生改变，注意为什么会在编译时候就会报错，因为JVM分配内存的时候将final视为不可变常量，既然是不可变常量，所以就会出现编译是报错，而不是运行时报错。\r\n在分析一段代码：\r\npublic class FinalTest{\r\n	public static void main(String[] args) {\r\n		final String a = aaa();\r\n		final String b = \"str\";\r\n		String a1 = a +\"2\";\r\n		String a2 = a +\"2\";\r\n		String b1 = b +\"2\";\r\n		String b2 = b +\"2\";\r\n		System.out.println(b1 == b2);//结果true\r\n		System.out.println(a1 == a2);//结果false\r\n	}\r\n	\r\n	static String aaa(){\r\n		return \"str\";\r\n	}\r\n}\r\n此时a，b同为final而且都是str为什么一个结果是true，一个是false，因为a并不是编译时就确定的变量，而是编译之后就确定的常量，而b编译时就确定常量，b1b2 string的生成是由两个常量生成的，所以引用变量指向一定是一样的（相当于a1=\"str\"+\"2\"，a2=\"str\"+\"2\"），而a1a2是由运行时常量生成所以两个地址是不一样的。但是如果将常量b的final去掉，那它的结果将会变成false，因为不是编译时就确定的常量，所以他们他的指向就不一样。\r\n如果修饰对象：\r\npublic class FinalTest{\r\n	public static void main(String[] args) {\r\n		final StringBuffer buffer = new StringBuffer(\"str\");\r\n		buffer.append(\"a\");\r\n                //buffer = new StringBuffer(\"str\");//这句会报错\r\n       }\r\n}\r\n这段代码是正确的，虽然进行了值的修改，但是他的引用变量指向没有发生改变，因为buffer是一个对象，只要对象指向没有发生改变就不会有错误，\r\n如果在后面加上语句buffer = new StringBuffer(\"str\");就会报错，这样会改便buffer的指向。\r\n2.final修饰方法\r\n\r\n这个没有特别好讲的，就是被final修饰的方法不能被子类重写。如果你想设定一个方法不能被子类继承就加上一个final。使用final就是为了不让子类继承。\r\n注意：类的private方法会隐式地被指定为final方法。\r\n3.final修饰的类\r\n\r\n被final修饰的类不能被继承。\r\npublic class FinalTest extends Test{\r\n	public static void main(String[] args) {\r\n		\r\n	}\r\n}\r\n\r\nfinal class Test{\r\n	\r\n}\r\n编译时候就会报错，Test类是不能继承的。\r\n4.final使用在方法内部类\r\n\r\npublic class FinalTest {\r\n	public static void main(String[] args) {\r\n		\r\n	}\r\n	\r\n	static void aaa(){\r\n		final int x = 1;//这里必须时final\r\n		class bbb{\r\n                       void display(){\r\n				System.out.println(x);\r\n			}\r\n		}\r\n	}\r\n}\r\nx变量必须声明成final，当内部类使用方法中的变量x的时候会有一个复制品产生，就是说会有一个private int x = 1;的变量在bbb内部类中，这样就会出现一定得问题，问题就是局部变量的生命周期与局部内部类的生命周期的不一致性，也就是说，bbb类要使用x变量，如果aaa()方法调用结束，x可能被视为没有的数据就会被回收掉，一旦被回收掉，方法内部类不一定会被销毁，可能被其他引用没有被立刻销毁，又需要使用x，这时候就是出现内部类要访问一个不存在的局部变量。如果不是final，就不能在内部类种使用，就无法保证复制品与原始变量保持一致了。因为，在方法中改的是原始变量，而局部内部类中改的是复制品。其实这些做法的根本原因都是为了维护复制品与原始变量的一致性。\r\n\r\n总结来说，方法内部类使用final就是为了实现一致性。\r\n\r\n\r\n\r\n', 'java修饰符final', 'lhd', 'java', '1930d5688f8c4eb09a31e44166d52f14', '0', '2017-05-17 22:54:49', '2017-05-15 08:56:31', 'admin', 'admin', '/images/random/bg4.jpg');
INSERT INTO `sys_blog` VALUES ('d38d4a395a2241058b60771b6cbe48d0', 'mybatis延迟加载', '问题出现\r\n\r\n由于多表查询相对于单表查询是非常消耗时间的，所以就出现了延迟加载的方法，首先延迟加载，先从单表开始查询，在查询对应多表的数据，单表查询速度比多表查询块，所以延迟加载是可以提升数据查询速度。\r\n\r\n延迟加载的实现\r\n\r\n使用resultMap实现高级映射，也就是使用association或者collection\r\n实现延迟加载需要开启mybatis延迟加载的开关，和关闭积极加载（也就是按需加载）\r\nlazyLoadingEnable：延迟加载开关，默认关闭，所以想要延迟加载必须开启。\r\naggressiveLazyLoading：积极加载，默认开启，所以需要关闭，关闭后就是按需求来进行加载。\r\nMybatis配置文件加入\r\n<settings>\r\n	<!-- 打开延迟加载开关 -->\r\n	<setting name=\"lazyLoadingEnabled\" value=\"true\"/>\r\n	<!-- 关闭积极加载，就是按需加载 -->\r\n	<setting name=\"aggressiveLazyLoading\" value=\"false\"/>\r\n</settings>\r\n\r\n\r\n代码实例\r\n\r\nUserVo.java就是我们需要获取的user信息和food信息，直接查询必然会出现多表查询\r\n这里我们具体实现就是先加载user信息，而food信息进行延迟加载\r\npackage com.my.shiro.Entity;\r\n\r\npublic class UserVo {\r\n	\r\n	private static final long serialVersionUID = 1L;\r\n	private String username;\r\n	private String password;\r\n	private String permission;\r\n	\r\n	private Food food;\r\n\r\n	public String getUsername() {\r\n		return username;\r\n	}\r\n\r\n	public void setUsername(String username) {\r\n		this.username = username;\r\n	}\r\n\r\n	public String getPassword() {\r\n		return password;\r\n	}\r\n\r\n	public void setPassword(String password) {\r\n		this.password = password;\r\n	}\r\n\r\n	public String getPermission() {\r\n		return permission;\r\n	}\r\n\r\n	public void setPermission(String permission) {\r\n		this.permission = permission;\r\n	}\r\n\r\n	public Food getFood() {\r\n		return food;\r\n	}\r\n\r\n	public void setFood(Food food) {\r\n		this.food = food;\r\n	}\r\n\r\n	public static long getSerialversionuid() {\r\n		return serialVersionUID;\r\n	}\r\n	\r\n}\r\n\r\nUserMapper.xml   resultMap实现延迟加载需要的配置\r\n<resultMap id=\"LazyLoading\" type=\"com.my.shiro.Entity.UserVo\" >\r\n	    <id column=\"username\" property=\"username\" jdbcType=\"VARCHAR\" />\r\n	    <result column=\"password\" property=\"password\" jdbcType=\"VARCHAR\" />\r\n		<result column=\"permission\" property=\"permission\" jdbcType=\"VARCHAR\" />\r\n		\r\n		<!-- 用于延迟加载 \r\n			select中的statement的id：比如findpassword，如果不在同一个mapper中就应该加上全限定名\r\n			colum关联信息 -->\r\n		<association property=\"food\" javaType=\"com.my.shiro.Entity.Food\" \r\n			select=\"com.my.shiro.Dao.FoodMapper.findFoodByUsername\" \r\n			column=\"username\">\r\n		</association>\r\n		<!-- <collection property=\"\"></collection> -->\r\n	</resultMap>\r\n  \r\n这里使用association实现延迟加载\r\n这里主要有4的属性\r\nproperty：这里的这个属性对应的是UserVo中的food\r\njavaType：延迟加载数据类型\r\nselect：延迟加载需要使用的方法对应的statement的id也就一个sql方法对应的id，这里需要注意的是如果这个sql不再该mapper.xml中那么需要加上这个sql的namespace\r\ncolum：关联信息，也就是我们通常多表关联的信息\r\nresultMap的使用\r\n<select id=\"findUserAndFood\" resultMap=\"LazyLoading\">\r\n		select * from user;\r\n	</select>\r\n这里先会执行select * from user 查询到信息，再通过resultMap中配置的association来执行findFoodByUsername对应的sql，从而实现延迟加载\r\nfindFoodByUsername\r\n<select id=\"findFoodByUsername\" parameterType=\"java.lang.String\" resultType=\"com.my.shiro.Entity.Food\">\r\n		select * \r\n		from food \r\n		where username = #{username}\r\n	</select>\r\n这里的parameter可以看做resultMap中的association中的colum对应的值，也就是关联属性\r\n在这里我遇到一个问题就是当parametreType为sting的时候不可以写成下面的格式\r\n<where>\r\n	 <if test=\"username != null and username != \'\'\">\r\n	    	and username = #{username}\r\n	 </if>\r\n</where>\r\n\r\n\r\n其实上面sql可以看作，这里避免了多表之间的查询\r\nselect username,password,\r\n(select price from food where username = user.username)price,\r\n(select name from food where username = user.username)name\r\nfrom user\r\n至于collection使用法大体上是相似的', 'mybatis延迟加载', 'lhd', '框架', '61a2375dbcb046fbabbxx4bd98033fca', '0', '2017-05-17 22:53:45', '2017-05-17 22:34:53', 'admin', 'admin', '/images/random/bg6.jpg');
INSERT INTO `sys_blog` VALUES ('d38d4a395a2241058b60771b6cbe48d1', 'markdown栗子', '[TOC]\r\n\r\n#### Disabled options\r\n\r\n- TeX (Based on KaTeX);\r\n- Emoji;\r\n- Task lists;\r\n- HTML tags decode;\r\n- Flowchart and Sequence Diagram;\r\n\r\n#### Editor.md directory\r\n\r\n    editor.md/\r\n            lib/\r\n            css/\r\n            scss/\r\n            tests/\r\n            fonts/\r\n            images/\r\n            plugins/\r\n            examples/\r\n            languages/     \r\n            editormd.js\r\n            ...\r\n\r\n```html\r\n<!-- English -->\r\n<script src=\"../dist/js/languages/en.js\"></script>\r\n\r\n<!-- 繁體中文 -->\r\n<script src=\"../dist/js/languages/zh-tw.js\"></script>\r\n```\r\n[TOC]\r\n\r\n#### Disabled options\r\n\r\n- TeX (Based on KaTeX);\r\n- Emoji;\r\n- Task lists;\r\n- HTML tags decode;\r\n- Flowchart and Sequence Diagram;\r\n\r\n#### Editor.md directory\r\n\r\n    editor.md/\r\n            lib/\r\n            css/\r\n            scss/\r\n            tests/\r\n            fonts/\r\n            images/\r\n            plugins/\r\n            examples/\r\n            languages/     \r\n            editormd.js\r\n            ...\r\n\r\n```html\r\n<!-- English -->\r\n<script src=\"../dist/js/languages/en.js\"></script>\r\n\r\n<!-- 繁體中文 -->\r\n<script src=\"../dist/js/languages/zh-tw.js\"></script>\r\n```\r\n', 'markdown简单教程', 'lhd', '编辑器', '1930d5688f8c4eb09a31e44166d52f14', '0', '2017-05-17 23:36:16', '2017-05-17 23:36:18', 'admin', 'admin', '/images/random/bg6.jpg');

-- ----------------------------
-- Table structure for sys_classify
-- ----------------------------
DROP TABLE IF EXISTS `sys_classify`;
CREATE TABLE `sys_classify` (
  `id` varchar(32) NOT NULL COMMENT '分类id',
  `classify` varchar(20) NOT NULL COMMENT '分类名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_classify
-- ----------------------------
INSERT INTO `sys_classify` VALUES ('1930d5688f8c4eb09a31e44166d52f14', 'java');
INSERT INTO `sys_classify` VALUES ('61a2375dbcb046fbabb084bd98033f12', '喜欢');
INSERT INTO `sys_classify` VALUES ('61a2375dbcb046fbabbxx4bd98033fca', 'web');

-- ----------------------------
-- Table structure for sys_friend
-- ----------------------------
DROP TABLE IF EXISTS `sys_friend`;
CREATE TABLE `sys_friend` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `friend` varchar(50) DEFAULT NULL COMMENT '朋友链接',
  `slogan` varchar(50) DEFAULT NULL COMMENT '朋友标语',
  `link` varchar(50) DEFAULT NULL COMMENT '朋友链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_friend
-- ----------------------------
INSERT INTO `sys_friend` VALUES ('0395cc4ac2c74caab7d035c82652da2f', '312', '3213', '312');
INSERT INTO `sys_friend` VALUES ('2560943013ac4a47b0f03036bd56499a', '452', '245', 'www.baidu.com');
INSERT INTO `sys_friend` VALUES ('30bea30609684d4488b73b4fd41ad63f', '5234', '52345', '54235');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(32) NOT NULL COMMENT '菜单唯一标识',
  `pid` varchar(32) NOT NULL COMMENT '父菜单',
  `menuName` varchar(255) NOT NULL COMMENT '菜单名字',
  `href` varchar(255) NOT NULL COMMENT '菜单对应链接',
  `icon` varchar(255) NOT NULL COMMENT '菜单图标',
  `permission` varchar(255) DEFAULT NULL COMMENT '访问该菜单需要具有的权限',
  `useable` tinyint(1) NOT NULL COMMENT '是否开启使用·',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `createBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  `updateBy` varchar(255) DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('100fce5cabc84687b25368291e410fdc', '0', '标签管理', '/tag/tag-list', 'fa fa-list-ol', null, '1', '2017-05-16 23:24:17', '2017-05-16 23:24:17', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('22cc064e2d0e4431bb5192fe56564fc1', '9c95d73235d54eab8a0d85bf70f8ae9e', '菜单列表', '/menu/menu-list', 'fa fa-th', null, '1', '2017-05-17 16:02:51', '2017-05-17 16:02:51', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('3e39a34b91c847649fd6ea9be46afe82', '9c95d73235d54eab8a0d85bf70f8ae9e', '菜单添加', '/menu/menu-add', 'fa fa-indent', null, '1', '2017-05-17 16:02:21', '2017-05-17 16:02:21', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('4278fff33c3741178545e91a7b8d07bc', 'fd433354452b4d10b8e4eb6544dc59dd', '用户添加', '/user/user-add', 'fa fa-user', null, '1', '2017-05-15 18:20:10', '2017-05-15 18:20:10', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('4a45e553ec96427388b1a656057dc10e', '32111111', '321', '321', '321', null, '0', '2017-05-17 16:45:23', '2017-05-17 16:45:23', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('58e21637c0d04ffebe63dc9069be39d7', '0', '图标选择', '/icon', 'fa fa-adjust', null, '1', '2017-05-17 16:13:46', '2017-05-17 16:13:46', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('650626ffb10e451bbb02d717697905ef', 'fd433354452b4d10b8e4eb6544dc59dd', '用户列表', '/user/user-list', 'fa fa-user', null, '1', '2017-05-15 17:09:04', '2017-05-15 17:09:04', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('76e89fc3178744ac84f6dc5b70afa5f8', '0', '分组管理', '/classify/classify-list', 'fa fa-sort', null, '1', '2017-05-14 22:21:44', '2017-05-14 22:21:44', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('86e25c498bc642c084ee51bfd9544c2e', '0', '友链管理', '/friend/friend-list', 'fa fa-chain', null, '1', '2017-05-17 14:43:10', '2017-05-17 14:43:10', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('920e18c2c6e8465a89333b66c495d14f', 'fc65bb5abe5748c5a473db87760f231d', '文章列表', '/article/article-list', 'fa fa-th-list', null, '1', '2017-05-13 18:38:44', '2017-05-13 18:38:44', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('9c95d73235d54eab8a0d85bf70f8ae9e', '0', '菜单管理', '#', 'fa fa-suitcase', null, '1', '2017-05-17 15:27:44', '2017-05-17 15:27:44', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('c5dd65ea4c9042e6bc34fb5babff4d9a', 'fc65bb5abe5748c5a473db87760f231d', '文章添加', '/article/article-add', 'fa fa-plus', null, '1', '2017-05-13 18:38:57', '2017-05-13 18:38:57', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('d5f9cd9626c74de88237d0ec5ac39c67', '0', '权限管理', '/role/role-list', 'fa fa-plus-square-o', null, '1', '2017-05-13 17:43:14', '2017-05-13 17:43:14', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('fc65bb5abe5748c5a473db87760f231d', '0', '文章管理', '#', 'fa fa-file', null, '1', '2017-05-13 17:44:37', '2017-05-13 17:44:37', 'admin', 'admin');
INSERT INTO `sys_menu` VALUES ('fd433354452b4d10b8e4eb6544dc59dd', '0', '用户管理', '#', 'fa fa-user', null, '1', '2017-05-13 17:42:51', '2017-05-13 17:42:51', 'admin', 'admin');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL COMMENT '角色唯一标识',
  `roleName` varchar(255) NOT NULL COMMENT '角色名字',
  `roleType` varchar(255) NOT NULL COMMENT '角色类别',
  `useable` tinyint(1) NOT NULL COMMENT '是否使用',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `createBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  `updateBy` varchar(255) DEFAULT NULL COMMENT '更行者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('4c3e861acaba449fa0103a7bad3c4ebw', '系统管理员', 'admin', '1', '2017-05-09 13:09:36', '2017-05-09 13:09:40', 'admin', 'admin');
INSERT INTO `sys_role` VALUES ('4d993aa0dba746beb357b030a9fc016b', '32', '32', '1', '2017-05-16 09:39:06', '2017-05-16 09:39:06', 'admin', 'admin');
INSERT INTO `sys_role` VALUES ('fbac9e745f514eedba531a64a39a0fe7', '12', '12', '0', '2017-05-15 22:26:41', '2017-05-15 22:26:41', 'admin', 'admin');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` varchar(32) NOT NULL COMMENT '菜单角色唯一标识',
  `roleId` varchar(32) NOT NULL COMMENT '角色id',
  `menuId` varchar(32) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`menuId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('0361032101b946408873d9c84b84d856', '4c3e861acaba449fa0103a7bad3c4ebw', '100fce5cabc84687b25368291e410fdc');
INSERT INTO `sys_role_menu` VALUES ('', '', '22cc064e2d0e4431bb5192fe56564fc1');
INSERT INTO `sys_role_menu` VALUES ('4c5d1b1b5f244f88b7e1120d1e28ab17', '4c3e861acaba449fa0103a7bad3c4ebw', '22cc064e2d0e4431bb5192fe56564fc1');
INSERT INTO `sys_role_menu` VALUES ('3893db95b5f1451aa9be96917cd23f68', '4c3e861acaba449fa0103a7bad3c4ebw', '3e39a34b91c847649fd6ea9be46afe82');
INSERT INTO `sys_role_menu` VALUES ('7a32d1e4dc9549e987da05cad9a470bf', '4c3e861acaba449fa0103a7bad3c4ebw', '4278fff33c3741178545e91a7b8d07bc');
INSERT INTO `sys_role_menu` VALUES ('62896e39360143ec85773111f05f4ecb', '4c3e861acaba449fa0103a7bad3c4ebw', '58e21637c0d04ffebe63dc9069be39d7');
INSERT INTO `sys_role_menu` VALUES ('ab7c38b47e4142ed9a258f925f3254e0', '4c3e861acaba449fa0103a7bad3c4ebw', '650626ffb10e451bbb02d717697905ef');
INSERT INTO `sys_role_menu` VALUES ('904cf8cddc844bb29b1f5301d4e58813', '4c3e861acaba449fa0103a7bad3c4ebw', '76e89fc3178744ac84f6dc5b70afa5f8');
INSERT INTO `sys_role_menu` VALUES ('6969674194d94814ab07631628148582', '4d993aa0dba746beb357b030a9fc016b', '76e89fc3178744ac84f6dc5b70afa5f8');
INSERT INTO `sys_role_menu` VALUES ('7d0cf9e31ee24378b07eb2cc605780a5', 'fbac9e745f514eedba531a64a39a0fe7', '76e89fc3178744ac84f6dc5b70afa5f8');
INSERT INTO `sys_role_menu` VALUES ('6eefe2d1c0524aac90db73bf9184226b', '4c3e861acaba449fa0103a7bad3c4ebw', '86e25c498bc642c084ee51bfd9544c2e');
INSERT INTO `sys_role_menu` VALUES ('aa1410fc1b284aa88e20ab4b94271e09', '4c3e861acaba449fa0103a7bad3c4ebw', '920e18c2c6e8465a89333b66c495d14f');
INSERT INTO `sys_role_menu` VALUES ('a502aa09e7d14cb59ee2c574c6afe4f9', '4c3e861acaba449fa0103a7bad3c4ebw', '9c95d73235d54eab8a0d85bf70f8ae9e');
INSERT INTO `sys_role_menu` VALUES ('7803685a84fb4970919ef48e710b5ec9', '4c3e861acaba449fa0103a7bad3c4ebw', 'c5dd65ea4c9042e6bc34fb5babff4d9a');
INSERT INTO `sys_role_menu` VALUES ('c47d1437efef4ff3a82cd2e6b6a73ec2', '4c3e861acaba449fa0103a7bad3c4ebw', 'd5f9cd9626c74de88237d0ec5ac39c67');
INSERT INTO `sys_role_menu` VALUES ('1c99fdf903cb4db48ef3778789360f59', '4d993aa0dba746beb357b030a9fc016b', 'd5f9cd9626c74de88237d0ec5ac39c67');
INSERT INTO `sys_role_menu` VALUES ('558f461db4824dfcbe83432f3100f675', 'fbac9e745f514eedba531a64a39a0fe7', 'd5f9cd9626c74de88237d0ec5ac39c67');
INSERT INTO `sys_role_menu` VALUES ('135956cf209d4c2c9f85a58218c314e1', '4c3e861acaba449fa0103a7bad3c4ebw', 'fc65bb5abe5748c5a473db87760f231d');
INSERT INTO `sys_role_menu` VALUES ('cd08b32419b44a5c99e2901a6cec2e91', '4c3e861acaba449fa0103a7bad3c4ebw', 'fd433354452b4d10b8e4eb6544dc59dd');

-- ----------------------------
-- Table structure for sys_tag
-- ----------------------------
DROP TABLE IF EXISTS `sys_tag`;
CREATE TABLE `sys_tag` (
  `id` varchar(32) NOT NULL COMMENT '标签id',
  `tagName` varchar(20) DEFAULT NULL COMMENT '标签名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_tag
-- ----------------------------
INSERT INTO `sys_tag` VALUES ('2a90f91c67b94e22ad2618f1684908bb', 'java');
INSERT INTO `sys_tag` VALUES ('656297677a2d4399aac9eb668665473e', '数据库');
INSERT INTO `sys_tag` VALUES ('8242ffbfcc114ec69f9bea885aacb568', '4');
INSERT INTO `sys_tag` VALUES ('a4f0291e62f74f24ab585671058e0d25', '2');
INSERT INTO `sys_tag` VALUES ('b0b2a7789ca44f46808cf1fa1cdf625d', 'web1');
INSERT INTO `sys_tag` VALUES ('edbbdb7b33634962924189bf2e75810a', 'web');
INSERT INTO `sys_tag` VALUES ('f3d7536535264b26a09f7b01dc76f53f', '框架');
INSERT INTO `sys_tag` VALUES ('fd9d69d01b43442ba240ab68048195b3', '编辑器');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL COMMENT '系统用户主键',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(20) NOT NULL COMMENT '登录密码',
  `description` varchar(200) NOT NULL COMMENT '用户描述',
  `email` varchar(20) NOT NULL COMMENT '用户邮箱',
  `icon` varchar(20) NOT NULL COMMENT '头像',
  `address` varchar(50) NOT NULL COMMENT '用户地址',
  `introduce` varchar(500) NOT NULL COMMENT '简介',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateBy` varchar(255) DEFAULT NULL COMMENT '更新者',
  `createBy` varchar(255) DEFAULT NULL COMMENT '创建者',
  `salt` varchar(255) DEFAULT NULL COMMENT '盐',
  `roleId` varchar(32) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('31ec9796a4914404a50fb64b4f62edbe', 'lhd', '321', '212', '4133123000@qq.com', '', '中国-江西-赣州-xx路-341000', '413', '2017-05-15 23:41:21', '2017-05-15 19:33:48', 'admin', 'admin', null, '4c3e861acaba449fa0103a7bad3c4ebw');
INSERT INTO `sys_user` VALUES ('4c3e861acaba449fa0103a7bad3c4ebq', 'admin', 'admin', '111', '444', '', '11-1-1-1-1', '321', '2017-05-15 23:42:25', '2017-05-09 13:08:07', 'admin', 'admin', null, '4c3e861acaba449fa0103a7bad3c4ebw');
INSERT INTO `sys_user` VALUES ('d25e8644e27642b7a292fa0d3c25b94a', '321', '321', '321', '321', '', '321-321-321-312-321', '312', '2017-05-16 00:11:01', '2017-05-16 00:05:29', 'admin', 'admin', null, '4c3e861acaba449fa0103a7bad3c4ebw');
