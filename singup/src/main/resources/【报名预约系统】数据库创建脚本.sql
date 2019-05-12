-- 一、删除数据库
DROP DATABASE IF EXISTS bedb ;
-- 二、创建数据库
CREATE DATABASE bedb CHARACTER SET UTF8 ;
-- 三、使用数据库
USE bedb ;
-- 四、创建数据表
-- 1、用户数据表
CREATE TABLE member (
	mid					VARCHAR(50),
	password			VARCHAR(32),
	name				VARCHAR(20),
	sflag				INT,
	regdate				DATETIME ,
	locked				INT 	DEFAULT 0,
	CONSTRAINT pk_mid PRIMARY KEY (mid)
) type = innodb;
-- 2、角色数据表
CREATE TABLE role (
	rid					INT 	AUTO_INCREMENT ,
	title				VARCHAR(50),
	flag				VARCHAR(50),
	CONSTRAINT pk_rid PRIMARY KEY (rid)
) type = innodb;
-- 3、用户-角色关系表
CREATE TABLE member_role (
	mid					VARCHAR(50),
	rid 				INT ,
	CONSTRAINT fk_mid1 FOREIGN KEY(mid) REFERENCES member(mid) ,
	CONSTRAINT fk_rid1 FOREIGN KEY(rid) REFERENCES role(rid)
) type = innodb;
-- 4、权限表
CREATE TABLE action (
	actid 				INT 	AUTO_INCREMENT ,
	title 				VARCHAR(50),
	flag 				VARCHAR(50),
	CONSTRAINT pk_actid PRIMARY KEY (actid) 
) type = innodb;
-- 5、角色-权限关系表
CREATE TABLE role_action (
	rid 				INT,
	actid 				INT,
	CONSTRAINT fk_rid6 FOREIGN KEY(rid) REFERENCES role(rid) ,
	CONSTRAINT fk_actid6 FOREIGN KEY(actid) REFERENCES action(actid)
) type = innodb;

-- 6、数据字典表
CREATE TABLE dictionary (
	dtid				INT AUTO_INCREMENT NOT NULL,
	item				VARCHAR(50),
	title				VARCHAR(50),
	value				VARCHAR(50),
	CONSTRAINT pk_dtid PRIMARY KEY (dtid)
) type = innodb;

-- 7、公告信息表
CREATE TABLE news (
	nid					INT AUTO_INCREMENT NOT NULL,
	dtid 				INT,
	mid 				VARCHAR(50),
	title 				VARCHAR(50),
	abs 				VARCHAR(50),
	content 			VARCHAR(50),
	photo				VARCHAR(200),
	pubdate 			DATETIME,
	flag 				INT,
	CONSTRAINT pk_nid PRIMARY KEY (nid) ,
	CONSTRAINT fk_dtid7 FOREIGN KEY(dtid) REFERENCES dictionary(dtid)
) type = innodb;

-- 8、报名预约表
CREATE TABLE bespeak (
	beid			INT AUTO_INCREMENT NOT NULL,
	typeid			INT,
	eduid			INT,
	srcid			INT,
	name			VARCHAR(50),
	phone			VARCHAR(50),
	school			VARCHAR(50),
	edu				VARCHAR(50),
	bedate			DATETIME,
	indate			DATETIME,
	status			INT,
	benote			TEXT,
	note			TEXT,
	type			VARCHAR(50),
	src				VARCHAR(50),
	CONSTRAINT pk_beid PRIMARY KEY (beid) ,
	CONSTRAINT fk_typeid FOREIGN KEY(typeid) REFERENCES dictionary(dtid) ,
	CONSTRAINT fk_eduid FOREIGN KEY(eduid) REFERENCES dictionary(dtid) ,
	CONSTRAINT fk_srcid FOREIGN KEY(srcid) REFERENCES dictionary(dtid) 
) type = innodb;

-- 五、测试数据
-- 1、增加角色信息
INSERT INTO role(title,flag) VALUES ('系统用户管理','member') ;
INSERT INTO role(title,flag) VALUES ('公告管理','news') ;
INSERT INTO role(title,flag) VALUES ('报名预约管理','bespeak') ;
-- 2、增加权限信息
INSERT INTO action(title,flag) VALUES ('增加管理员','member:add') ;
INSERT INTO action(title,flag) VALUES ('管理员列表','member:list') ;
INSERT INTO action(title,flag) VALUES ('修改管理员密码','member:edit') ;
INSERT INTO action(title,flag) VALUES ('公告增加','news:add') ;
INSERT INTO action(title,flag) VALUES ('公告列表','news:list') ;
INSERT INTO action(title,flag) VALUES ('公告编辑','news:edit') ;
INSERT INTO action(title,flag) VALUES ('报名信息列表','bespeak:list') ;
INSERT INTO action(title,flag) VALUES ('报名信息处理','bespeak:edit') ;
-- 3、增加角色与权限关系
INSERT INTO role_action(rid,actid) VALUES (1,1) ;
INSERT INTO role_action(rid,actid) VALUES (1,2) ;
INSERT INTO role_action(rid,actid) VALUES (1,3) ;
INSERT INTO role_action(rid,actid) VALUES (2,4) ;
INSERT INTO role_action(rid,actid) VALUES (2,5) ;
INSERT INTO role_action(rid,actid) VALUES (2,6) ;
INSERT INTO role_action(rid,actid) VALUES (3,7) ;
INSERT INTO role_action(rid,actid) VALUES (3,8) ;

-- 4、增加管理员信息
-- salt : mldnjava,Base64 : “bWxkbmphdmE=”，格式：密码password({salt})
-- admin / hello
INSERT INTO member(mid,password,name,sflag,regdate) VALUES ('admin','3E585791E7C446317AF238314843DDEB','管理员',1,'1997-08-15') ;
-- mermard / hello
INSERT INTO member(mid,password,name,sflag,regdate) VALUES ('mermaid','3E585791E7C446317AF238314843DDEB','老李',0,'1997-08-15') ;
-- mldn / java
INSERT INTO member(mid,password,name,sflag,regdate) VALUES ('mldn','08FD48BA8B67F026CE01E4DD15BF717A','隔壁老王',0,'1997-08-15') ;

-- 5、管理员与角色权限
INSERT INTO member_role(mid,rid) VALUES ('admin',1) ;
INSERT INTO member_role(mid,rid) VALUES ('admin',2) ;
INSERT INTO member_role(mid,rid) VALUES ('admin',3) ;
INSERT INTO member_role(mid,rid) VALUES ('mermaid',2) ;
INSERT INTO member_role(mid,rid) VALUES ('mldn',2) ;
INSERT INTO member_role(mid,rid) VALUES ('mldn',3) ;

-- 数据字典数据
INSERT INTO dictionary(item,title,value) VALUES ('edu','硕士','1') ;
INSERT INTO dictionary(item,title,value) VALUES ('edu','本科','2') ;
INSERT INTO dictionary(item,title,value) VALUES ('edu','专科','3') ;
INSERT INTO dictionary(item,title,value) VALUES ('edu','高中及以下','4') ;

INSERT INTO dictionary(item,title,value) VALUES ('betype','上门咨询','1') ;
INSERT INTO dictionary(item,title,value) VALUES ('betype','在线学习','2') ;
INSERT INTO dictionary(item,title,value) VALUES ('betype','实体面授','3') ;

INSERT INTO dictionary(item,title,value) VALUES ('source','在线视频','1') ;
INSERT INTO dictionary(item,title,value) VALUES ('source','图书出版物','2') ;
INSERT INTO dictionary(item,title,value) VALUES ('source','朋友推荐','3') ;

INSERT INTO dictionary(item,title,value) VALUES ('news','成功案例','1') ;
INSERT INTO dictionary(item,title,value) VALUES ('news','行业动态','2') ;
INSERT INTO dictionary(item,title,value) VALUES ('news','公司要闻','3') ;
