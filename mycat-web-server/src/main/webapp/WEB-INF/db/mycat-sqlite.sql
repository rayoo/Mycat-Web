/***********/
/*         */
/* sql.sql */
/*         */
/***********/

/* Disable Foreign Keys */
pragma foreign_keys = off;
/* Database [mycat-web(1)] */
pragma auto_vacuum=0;
pragma encoding='UTF-8';
pragma page_size=1024;

/* Drop table [main].[T_OC_DATAHOST] */
drop table if exists [main].[T_OC_DATAHOST];

/* Table structure [main].[T_OC_DATAHOST] */
CREATE TABLE [main].[T_OC_DATAHOST] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [NAME] VARCHAR2(50), 
  [MIN_CON] VARCHAR2(10), 
  [MAX_CON] VARCHAR2(10), 
  [BALANCE] VARCHAR2(10), 
  [HEARBEAT] VARCHAR2(200), 
  [CREATE_TIME] datetime, 
  [CREATE_USER] VARCHAR2(20), 
  [DBDRIVER] VARCHAR2(20), 
  [DBTYPE] VARCHAR2(10));

/* Data [main].[T_OC_DATAHOST] */
insert into [main].[T_OC_DATAHOST] values('7bb8c8443eb1419db233aff8a261c05c', 'localhost1', '100', '500', '1', 'select user()', '1899-12-30 00:00:00.000', '系统管理员', 'native', 'mysql');


/* Drop table [main].[T_OC_DATAHOSTMAP] */
drop table if exists [main].[T_OC_DATAHOSTMAP];

/* Table structure [main].[T_OC_DATAHOSTMAP] */
CREATE TABLE [main].[T_OC_DATAHOSTMAP] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [DATAHOST] VARCHAR2(20), 
  [HOST] VARCHAR2(20));

/* Data [main].[T_OC_DATAHOSTMAP] */
insert into [main].[T_OC_DATAHOSTMAP] values('80db4ab918d8477ca1ab5e821502a333', 'dataHost1', 'hostM1');
insert into [main].[T_OC_DATAHOSTMAP] values('d90cba1e2a2a4aeab8594aafe0918767', 'dataHost1', 'hostM2');
insert into [main].[T_OC_DATAHOSTMAP] values('3a18c2f8cd2a4f338e45a7f9af0fc7e0', 'localhost1', 'hostM1');


/* Drop table [main].[T_OC_DATANODE] */
drop table if exists [main].[T_OC_DATANODE];

/* Table structure [main].[T_OC_DATANODE] */
CREATE TABLE [main].[T_OC_DATANODE] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [NAME] VARCHAR2(50) NOT NULL, 
  [DATAHOST] VARCHAR2(20) NOT NULL, 
  [DATABASE] VARCHAR2(20) NOT NULL, 
  [CREATE_TIME] datetime, 
  [CREATE_USER] VARCHAR2(20));
CREATE INDEX [main].[OC_DATAHOST_INDEX] ON [T_OC_DATANODE] ([NAME]);

/* Data [main].[T_OC_DATANODE] */
insert into [main].[T_OC_DATANODE] values('5f5c4e8f9ded4afa98c22f34633a41d4', 'dn1', 'localhost1', 'db1', '1899-12-30 00:00:00.000', '系统管理员');
insert into [main].[T_OC_DATANODE] values('8ec3bdd3d4a644b7be077ff7d1734b24', 'dn2', 'localhost1', 'db2', '1899-12-30 00:00:00.000', '系统管理员');
insert into [main].[T_OC_DATANODE] values('6b8d141a1de24341a0e98a7c275300c4', 'dn3', 'localhost1', 'db3', '1899-12-30 00:00:00.000', '系统管理员');


/* Drop table [main].[T_OC_FUNCTION] */
drop table if exists [main].[T_OC_FUNCTION];

/* Table structure [main].[T_OC_FUNCTION] */
CREATE TABLE [main].[T_OC_FUNCTION] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [NAME] VARCHAR2(20), 
  [CLASS] VARCHAR2(200), 
  [MAP_FILE] VARCHAR2(100), 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20));

/* Data [main].[T_OC_FUNCTION] */
insert into [main].[T_OC_FUNCTION] values('c89597a00d4c4d679fa2e27f637555df', 'hash-int', 'org.opencloudb.route.function.PartitionByFileMap', null, '1899-12-30', '系统管理员');
insert into [main].[T_OC_FUNCTION] values('868f73d7ad3945c49a09622dbdedcf99', 'rang-long', 'org.opencloudb.route.function.AutoPartitionByLong', null, '1899-12-30', '系统管理员');
insert into [main].[T_OC_FUNCTION] values('50e9789e24e34828ae6dc9a54ba1e317', 'mod-long', 'org.opencloudb.route.function.PartionByMod', null, '1899-12-30', '系统管理员');


/* Drop table [main].[T_OC_FUNCTION_PARAM] */
drop table if exists [main].[T_OC_FUNCTION_PARAM];

/* Table structure [main].[T_OC_FUNCTION_PARAM] */
CREATE TABLE [main].[T_OC_FUNCTION_PARAM] (
  [PARAM_VALUE] Varchar(200) NOT NULL, 
  [PARAM_KEY] Varchar(20) NOT NULL, 
  [FUNCTION_NAME] Varchar(20) NOT NULL, 
  [guid] varchar(32));
CREATE INDEX [main].[oc_function_param] ON [T_OC_FUNCTION_PARAM] ([FUNCTION_NAME] COLLATE NOCASE ASC);

/* Data [main].[T_OC_FUNCTION_PARAM] */
insert into [main].[T_OC_FUNCTION_PARAM] values('3', 'count', 'mod-long', null);
insert into [main].[T_OC_FUNCTION_PARAM] values('autopartition-long.txt', 'mapFile', 'rang-long', null);
insert into [main].[T_OC_FUNCTION_PARAM] values('partition-hash-int.txt', 'mapFile', 'hash-int', null);


/* Drop table [main].[T_OC_HOST] */
drop table if exists [main].[T_OC_HOST];

/* Table structure [main].[T_OC_HOST] */
CREATE TABLE [main].[T_OC_HOST] (
  [GUID] VARCHAR2(32) NOT NULL UNIQUE, 
  [HOST] VARCHAR2(30), 
  [URL] VARCHAR2(50), 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20), 
  [D_USER] VARCHAR2(20), 
  [PASSWORD] VARCHAR2(50), 
  [PARENT_HOST] VARCHAR2(30), 
  [STATE] VARCHAR2(10));

/* Data [main].[T_OC_HOST] */
insert into [main].[T_OC_HOST] values('b0bd524980c94dbf88c7e7bec3d7ebbe', 'hostM1', 'localhost:3306', '1899-12-30', '系统管理员', 'root', '123456', '', 'closed');
insert into [main].[T_OC_HOST] values('ea4453f10193441ab3b4e980970d362f', 'hostS1', 'localhost:3306', '1899-12-30', '系统管理员', 'root', '123456', 'b0bd524980c94dbf88c7e7bec3d7ebbe', 'open');
insert into [main].[T_OC_HOST] values('d7981ba75b9d4f9daccb8d62fc75901c', 'hostM2', '192.168.1.4:3306', '1899-12-30', '系统管理员', 'root', '123456', '', 'closed');
insert into [main].[T_OC_HOST] values('9c8e92f1cca94d198bfc824a9e4d838c', 'hostS2', '192.168.1.5:3306', '1899-12-30', '系统管理员', 'root', '123456', 'd7981ba75b9d4f9daccb8d62fc75901c', 'open');


/* Drop table [main].[T_OC_MYCAT] */
drop table if exists [main].[T_OC_MYCAT];

/* Table structure [main].[T_OC_MYCAT] */
CREATE TABLE [main].[T_OC_MYCAT] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [PARAM_NAME] VARCHAR2(20), 
  [PARAM_VALUE] VARCHAR2(50), 
  [RAMARK] VARCHAR2(1000), 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20));

/* Data [main].[T_OC_MYCAT] */
insert into [main].[T_OC_MYCAT] values('fd5b4523904f436fb2bddf3c38261760', 'dataNodeHeartbeatPeriod', '5000', '分片节点心跳检测时间(毫秒)', '1899-12-30', '系统管理员');
insert into [main].[T_OC_MYCAT] values('8d0e4c3fb8c64e28be6e02584837fd8f', 'processorExecutor', '10', '线程池大小', '1899-12-30', '系统管理员');
insert into [main].[T_OC_MYCAT] values('67d9f6b56a344d7b92c234cf29840445', 'processors', '1', 'CPU核心数', '1899-12-30', '系统管理员');
insert into [main].[T_OC_MYCAT] values('bbb21a6ff5a04326b661ce7b35708ef2', 'serverPort', '8066', '服务端口', '1899-12-30', '系统管理员');
insert into [main].[T_OC_MYCAT] values('c8457d9d25714bb3b95541dfb45e4e83', 'managerPort', '9066', '管理端口', '1899-12-30', '系统管理员');


/* Drop table [main].[T_OC_SCHEMA] */
drop table if exists [main].[T_OC_SCHEMA];

/* Table structure [main].[T_OC_SCHEMA] */
CREATE TABLE [main].[T_OC_SCHEMA] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [NAME] VARCHAR2(20), 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20));

/* Data [main].[T_OC_SCHEMA] */
insert into [main].[T_OC_SCHEMA] values('2194454b38704d4b900da0f8dbb5a139', 'TESTDB', '1899-12-30', '系统管理员');


/* Drop table [main].[T_OC_SCHEMA_MAP] */
drop table if exists [main].[T_OC_SCHEMA_MAP];

/* Table structure [main].[T_OC_SCHEMA_MAP] */
CREATE TABLE [main].[T_OC_SCHEMA_MAP] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [SCHEMA_NAME] VARCHAR2(20), 
  [TABLE_NAME] VARCHAR2(20));

/* Data [main].[T_OC_SCHEMA_MAP] */
insert into [main].[T_OC_SCHEMA_MAP] values('edb00cf516394347995b88963973d8b5', 'TESTDB', 'company');
insert into [main].[T_OC_SCHEMA_MAP] values('b353930b55014c388d0afbf5f6c74153', 'TESTDB', 'goods');
insert into [main].[T_OC_SCHEMA_MAP] values('562a22f1d30b48bd9854af681227f82a', 'TESTDB', 'customer');
insert into [main].[T_OC_SCHEMA_MAP] values('a5b27841c73945a49020c2fe5460f382', 'TESTDB', 'hotnews');
insert into [main].[T_OC_SCHEMA_MAP] values('ecedfba87ea043cc84152699957fa7eb', 'TESTDB', 'travelrecord');


/* Drop table [main].[T_OC_TABLE] */
drop table if exists [main].[T_OC_TABLE];

/* Table structure [main].[T_OC_TABLE] */
CREATE TABLE [main].[T_OC_TABLE] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [NAME] VARCHAR2(20) NOT NULL, 
  [TYPE] VARCHAR2(10) NOT NULL, 
  [DATANODE] VARCHAR2(100), 
  [RULE] VARCHAR2(100), 
  [PARENT_NAME] VARCHAR2(32), 
  [JOINKEY] VARCHAR2(20), 
  [PARENTKEY] VARCHAR2(30), 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20), 
  [state] varchar(10));

/* Data [main].[T_OC_TABLE] */
insert into [main].[T_OC_TABLE] values('2025cd39cde244a6b064e87733a019a7', 'company', 'global', 'dn2,dn1', null, null, '', '', '1899-12-30', '系统管理员', 'closed');
insert into [main].[T_OC_TABLE] values('c983d442ebbf4ecd916e3d37d2ac6d72', 'goods', 'global', 'dn1,dn2', null, null, '', '', '1899-12-30', '系统管理员', 'closed');
insert into [main].[T_OC_TABLE] values('1cddf437da0540759bb389419a8651e6', 'customer', 'default', 'dn1,dn2', 'sharding-by-intfile', null, '', '', '1899-12-30', '系统管理员', 'closed');
insert into [main].[T_OC_TABLE] values('e81c3146a3f9488fb3e51e8647ff6581', 'orders', 'default', null, '', '1cddf437da0540759bb389419a8651e6', 'customer_id', 'id', '1899-12-30', '系统管理员', 'closed');
insert into [main].[T_OC_TABLE] values('52c3958486e74bc297964f55932ec83a', 'order_items', 'default', null, '', 'e81c3146a3f9488fb3e51e8647ff6581', 'order_id', 'id', '1899-12-30', '系统管理员', 'open');
insert into [main].[T_OC_TABLE] values('9587567cdee54459854758d91377491c', 'customer_addr', 'default', null, '', 'e81c3146a3f9488fb3e51e8647ff6581', 'customer_id', 'id', '1899-12-30', '系统管理员', 'open');
insert into [main].[T_OC_TABLE] values('a3541bd28a5c46cc98143c4a3ae62e59', 'hotnews', 'global', 'dn1,dn2,dn3', null, null, '', '', '1899-12-30', '系统管理员', 'closed');
insert into [main].[T_OC_TABLE] values('180d91fdb8dc4c2593bf301143b75aab', 'travelrecord', 'global', 'dn1,dn2,dn3', null, null, '', '', '1899-12-30', '系统管理员', 'closed');


/* Drop table [main].[T_OC_TABLERULE] */
drop table if exists [main].[T_OC_TABLERULE];

/* Table structure [main].[T_OC_TABLERULE] */
CREATE TABLE [main].[T_OC_TABLERULE] (
  [GUID] VARCHAR2(32), 
  [NAME] VARCHAR2(20), 
  [COLUMNS] VARCHAR2(100), 
  [ALGORITHM] VARCHAR2(20), 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20));

/* Data [main].[T_OC_TABLERULE] */
insert into [main].[T_OC_TABLERULE] values('10f70b80079f44e2913740b775d425fd', 'sharding-by-intfile', 'sharding_id', 'hash-int', '1899-12-30', '系统管理员');
insert into [main].[T_OC_TABLERULE] values('32777975858e44a69fa51a82861b7313', 'auto-sharding-long', 'id', 'rang-long', '1899-12-30', '系统管理员');
insert into [main].[T_OC_TABLERULE] values('155b10c3e588431a81575cca1dd1bc23', 'mod-long', 'id', 'mod-long', '1899-12-30', '系统管理员');


/* Drop table [main].[T_OC_USER] */
drop table if exists [main].[T_OC_USER];

/* Table structure [main].[T_OC_USER] */
CREATE TABLE [main].[T_OC_USER] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [NAME] VARCHAR2(20), 
  [PASSWORD] VARCHAR2(20), 
  [APP_NAME] VARCHAR2(50), 
  [APP_CODE] VARCHAR2(20), 
  [CREATE_USER] VARCHAR2(20), 
  [CREATE_TIME] TIMESTAMP(6), 
  [SCHEMAS] VARCHAR2(100));

/* Data [main].[T_OC_USER] */
insert into [main].[T_OC_USER] values('e7e65d043ac343c0a50c8ae1a7747eff', 'root', 'root', '', '', '系统管理员', '1899-12-30 00:00:00.000', 'test');


/* Drop table [main].[T_SYS_AUTHBUTTON] */
drop table if exists [main].[T_SYS_AUTHBUTTON];

/* Table structure [main].[T_SYS_AUTHBUTTON] */
CREATE TABLE [main].[T_SYS_AUTHBUTTON] (
  [GUID] VARCHAR2(36) NOT NULL, 
  [BUTTON_GUID] VARCHAR2(36), 
  [BUTTON_CODE] VARCHAR2(20), 
  [ROLE_GUID] VARCHAR2(36), 
  [ROLE_CODE] VARCHAR2(20), 
  [CREATE_TIME] DATE NOT NULL DEFAULT SYSDATE, 
  [CREATE_USER] VARCHAR2(20), 
  [REMARK] VARCHAR2(200), 
  [MODIFY_TIME] DATE, 
  [MODIFY_USER] VARCHAR2(20), 
  [BUTTON_NAME] VARCHAR2(100));

/* Data [main].[T_SYS_AUTHBUTTON] */


/* Drop table [main].[T_SYS_AUTHRESOUCE] */
drop table if exists [main].[T_SYS_AUTHRESOUCE];

/* Table structure [main].[T_SYS_AUTHRESOUCE] */
CREATE TABLE [main].[T_SYS_AUTHRESOUCE] (
  [GUID] VARCHAR2(36) NOT NULL, 
  [RESOURCE_GUID] VARCHAR2(100), 
  [RESOURCE_CODE] VARCHAR2(20), 
  [ROLE_GUID] VARCHAR2(36), 
  [ROLE_CODE] VARCHAR2(50), 
  [CREATE_TIME] DATE NOT NULL DEFAULT SYSDATE, 
  [CREATE_USER] VARCHAR2(20), 
  [REMARK] VARCHAR2(200), 
  [MODIFY_TIME] DATE, 
  [MODIFY_USER] VARCHAR2(20));

/* Data [main].[T_SYS_AUTHRESOUCE] */


/* Drop table [main].[T_SYS_AUTHUSER] */
drop table if exists [main].[T_SYS_AUTHUSER];

/* Table structure [main].[T_SYS_AUTHUSER] */
CREATE TABLE [main].[T_SYS_AUTHUSER] (
  [USER_GUID] VARCHAR2(36) NOT NULL, 
  [ROLE_GUID] VARCHAR2(36) NOT NULL, 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20), 
  [MODIFY_TIME] DATE, 
  [MODIFY_USER] VARCHAR2(20), 
  [USER_CODE] VARCHAR2(20), 
  [ROLE_CODE] VARCHAR2(40), 
  [GUID] VARCHAR2(36));

/* Data [main].[T_SYS_AUTHUSER] */


/* Drop table [main].[T_SYS_CODE] */
drop table if exists [main].[T_SYS_CODE];

/* Table structure [main].[T_SYS_CODE] */
CREATE TABLE [main].[T_SYS_CODE] (
  [GUID] VARCHAR2(36) NOT NULL, 
  [VALUE] VARCHAR2(30) NOT NULL, 
  [TEXT] VARCHAR2(50) NOT NULL, 
  [CODE] VARCHAR2(30) NOT NULL, 
  [PARENT] VARCHAR2(30), 
  [REMARK] VARCHAR2(200), 
  [CREATETIME] DATE NOT NULL DEFAULT SYSDATE, 
  [CREATEUSER] VARCHAR2(20));

/* Data [main].[T_SYS_CODE] */
insert into [main].[T_SYS_CODE] values('e55d0b38e07f46218cbc29e7b42292b5', 'closed', '根节点', 'IS_LEAF', '', '菜单节点类型', '1899-12-30', null);
insert into [main].[T_SYS_CODE] values('e33934f5cbb94a8d80ca522e95bb1c7f', 'open', '叶子节点', 'IS_LEAF', '', '菜单节点类型', '1899-12-30', null);
insert into [main].[T_SYS_CODE] values('c93a594acd7142c4839b2f994c2defe0', 'closed', '主服务', 'IS_MASTER', '', '主-从物理机', '1899-12-30', null);
insert into [main].[T_SYS_CODE] values('9b45f5c8260a4e8c90f0fe8a50d8681e', 'open', '从服务', 'IS_MASTER', '', '主-从物理机', '1899-12-30', null);
insert into [main].[T_SYS_CODE] values('335016ae45bd404b8a617effb577bbf1', 'default', '普通表', 'OC_TABLE_TYPLE', '', 'oc表类型', '1899-12-30', null);
insert into [main].[T_SYS_CODE] values('a56dbad54df34bcf9f3d6320df7360e4', 'global', '全局表', 'OC_TABLE_TYPLE', '', 'oc表类型', '1899-12-30', null);
insert into [main].[T_SYS_CODE] values('87370685533943389b1b220683307534', 'closed', '是', 'IS_MASTER_TABLE', '', '主-子表', '1899-12-30', null);
insert into [main].[T_SYS_CODE] values('e218e99d676f40a99cd0aa7df23a5a95', 'open', '否', 'IS_MASTER_TABLE', '', '主-子表', '1899-12-30', null);


/* Drop table [main].[T_SYS_FAVORITES] */
drop table if exists [main].[T_SYS_FAVORITES];

/* Table structure [main].[T_SYS_FAVORITES] */
CREATE TABLE [main].[T_SYS_FAVORITES] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [LOGIN_ID] VARCHAR2(20), 
  [PAGE_CODE] VARCHAR2(20), 
  [CREATE_TIME] DATE);

/* Data [main].[T_SYS_FAVORITES] */


/* Drop table [main].[T_SYS_GLOBALVARIABLE] */
drop table if exists [main].[T_SYS_GLOBALVARIABLE];

/* Table structure [main].[T_SYS_GLOBALVARIABLE] */
CREATE TABLE [main].[T_SYS_GLOBALVARIABLE] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [CODE] VARCHAR2(20), 
  [STATE] VARCHAR2(2), 
  [TYPE] VARCHAR2(10), 
  [REMARK] VARCHAR2(200), 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20), 
  [MODIFY_USER] VARCHAR2(20), 
  [MODIFY_TIME] DATE);

/* Data [main].[T_SYS_GLOBALVARIABLE] */


/* Drop table [main].[T_SYS_MENU] */
drop table if exists [main].[T_SYS_MENU];

/* Table structure [main].[T_SYS_MENU] */
CREATE TABLE [main].[T_SYS_MENU] (
  [GUID] VARCHAR2(36) NOT NULL, 
  [CODE] VARCHAR2(20), 
  [PARENT_CODE] VARCHAR2(20), 
  [PAGE_CODE] VARCHAR2(200), 
  [REMARK] VARCHAR2(100), 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20), 
  [STATUS] VARCHAR2(10), 
  [SORT_INDEX] NUMBER(10), 
  [NAME] VARCHAR2(50), 
  [STATE] VARCHAR2(10));

/* Data [main].[T_SYS_MENU] */
insert into [main].[T_SYS_MENU] values('4ef90b0879aa4475bc61164ed88ca933', 'SERVICE', 'RESOURCE', 'SERVICE', null, null, '钟良', null, 3, '服务管理', 'open');
insert into [main].[T_SYS_MENU] values('8d69f70d59374a2b8b162d083e45781b', 'WHEREEX', 'RESOURCE', 'WHEREEX', null, null, '朱骏', null, 5, '查询条件管理', 'open');
insert into [main].[T_SYS_MENU] values('0745887ee7bd4bb0a99937bde201f27d', 'AUTHBUTTON', 'SYS_POWER', 'AUTHBUTTON', null, null, '钟良', null, 2, '按钮授权', 'open');
insert into [main].[T_SYS_MENU] values('8e8ed316d332490f9f00cabc246fa116', 'AUTHSERVICE', 'SYS_POWER', 'AUTHSERVICE', null, null, '钟良', null, 3, '服务授权', 'open');
insert into [main].[T_SYS_MENU] values('08cf5e3ac8de48918daf47344c2b3db3', 'MYBATIS', 'RESOURCE', 'MYBATIS', null, null, '钟良', null, 4, 'mybatis配置管理', 'open');
insert into [main].[T_SYS_MENU] values('1a364972-fbba-4165-8336-089c1a520c98', 'BUTTON', 'RESOURCE', 'BUTTON', null, null, 'admin', null, 2, '按钮管理', 'open');
insert into [main].[T_SYS_MENU] values('219ccc49-9ce6-423c-b8e6-c1ac568a239e', 'RSA', 'POWER', 'RSA', null, null, null, null, 3, '密钥管理', 'open');
insert into [main].[T_SYS_MENU] values('35bef9fa-4fb9-4c5c-ad2e-2d372e3c14b7', 'ROLE_TYPE', 'SYSTEM', 'ROLE_TYPE', null, null, 'admin', null, 2, '角色类型管理', 'open');
insert into [main].[T_SYS_MENU] values('4917e899-cfe3-49bc-990f-2f0134b13068', 'AUTHUSER', 'SYS_POWER', 'AUTHUSER', null, null, 'admin', null, 0, '用户授权', 'open');
insert into [main].[T_SYS_MENU] values('4fa18327-2aeb-4481-bf16-01af62bb58e8', 'CODE', 'SYSTEM', 'CODE', null, null, 'admin', null, 6, '代码管理', 'open');
insert into [main].[T_SYS_MENU] values('54539f08-3ea3-41cb-a116-618702b6432a', 'USER', 'SYSTEM', 'USER', null, null, 'admin', null, 0, '用户管理', 'open');
insert into [main].[T_SYS_MENU] values('55b9846c-b0ed-46d3-8451-949a43f75cc4', 'PRODUCT', 'POWER', 'PRODUCT', null, null, 'admin', null, 1, '产品管理', 'open');
insert into [main].[T_SYS_MENU] values('5a9c41b4-3a4b-45ce-a904-024c5053796b', 'PAGE', 'RESOURCE', 'PAGE', null, null, 'admin', null, 1, '页面管理', 'open');
insert into [main].[T_SYS_MENU] values('6919cce1-e46f-4649-922f-944fec30c5f7', 'SYS_POWER', 'SYSTEM', null, null, null, 'admin', null, 4, '系统授权管理', 'closed');
insert into [main].[T_SYS_MENU] values('6b364cb9-3bd9-4048-88a7-476090bed535', 'RESOURCE', 'SYSTEM', null, null, null, 'admin', null, 5, '资源管理', 'closed');
insert into [main].[T_SYS_MENU] values('b2c0773e-bd64-4d3d-90b5-053e0076f0fe', 'ROLE', 'SYSTEM', 'ROLE', null, null, 'admin', null, 3, '角色管理', 'open');
insert into [main].[T_SYS_MENU] values('c51afb8c-4d2c-4e7e-ae7d-a3b78bd71938', 'LICENSES', 'POWER', 'LICENSES', null, null, null, null, 2, '证书管理', 'open');
insert into [main].[T_SYS_MENU] values('c619e6d6-490a-4af7-8362-f4fa37254d90', 'SYSTEM', null, null, null, null, 'admin1', null, 0, '系统元数据管理', 'closed');
insert into [main].[T_SYS_MENU] values('dbe62fce-8aee-46e4-b58d-78f8f05710a0', 'MENU', 'RESOURCE', 'MENU', null, null, 'admin', null, 0, '菜单维护', 'open');
insert into [main].[T_SYS_MENU] values('e48b9093-5c60-4cbc-87b2-4223fa3bacc7', 'AUTHRESOUCE', 'SYS_POWER', 'AUTHRESOUCE', null, null, 'admin', null, 1, '资源授权', 'open');
insert into [main].[T_SYS_MENU] values('e5677ce2-0188-4acb-9352-205b8b35c088', 'ORG', 'SYSTEM', 'ORG', null, null, 'admin', null, 1, '机构管理', 'open');
insert into [main].[T_SYS_MENU] values('fc22391f-64f3-4cb0-9a4e-de1a5afb162b', 'CUSTOMER', 'POWER', 'CUSTOMER', null, null, 'admin', null, 0, '客户管理', 'open');
insert into [main].[T_SYS_MENU] values('e80084ef009743418e5156931dbb4fdc', 'SETUP', 'SYSTEM', 'SETUP', null, null, '钟良', null, 8, '系统参数设置', 'open');
insert into [main].[T_SYS_MENU] values('261e73f508db466dafa658b6879b8cd9', 'OPENCLOUD', '', '', null, '1899-12-30', '系统管理员', null, 1, 'MyCat基本配置', 'closed');
insert into [main].[T_SYS_MENU] values('2533d5cee6904852b29986e32c4f94ea', 'HOST', 'SCHMEAL_M', 'HOST', null, '1899-12-30', '系统管理员', null, 0, '物理机管理', 'open');
insert into [main].[T_SYS_MENU] values('17497a2a4b224ce082dd745b2e146498', 'DATAHOST', 'SCHMEAL_M', 'DATAHOST', null, '1899-12-30', '系统管理员', null, 1, '物理节点管理', 'open');
insert into [main].[T_SYS_MENU] values('6f8cdb0f027247f198c4a7e48c83205d', 'DATANODE', 'SCHMEAL_M', 'DATANODE', null, '1899-12-30', '系统管理员', null, 3, '分片节点管理', 'open');
insert into [main].[T_SYS_MENU] values('75a9a58dcc95452180a1d7ae79058ec1', 'OC_TABLE', 'SCHMEAL_M', 'OC_TABLE', null, '1899-12-30', '系统管理员', null, 6, '表管理', 'open');
insert into [main].[T_SYS_MENU] values('e749a99338594699a52822c56de8f39a', 'DATAHOSTMAP', 'SCHMEAL_M', 'DATAHOSTMAP', null, '1899-12-30', '系统管理员', null, 2, '物理节点绑定物理机', 'open');
insert into [main].[T_SYS_MENU] values('609e8ba30d4b4bdb94e2198ac4ee59ff', 'OC_SCHEMA', 'SCHMEAL_M', 'OC_SCHEMA', null, '1899-12-30', '系统管理员', null, 8, '逻辑库管理', 'open');
insert into [main].[T_SYS_MENU] values('bee8f00edd534e9dbfc23aaacec5d89a', 'OC_TABLERULE', 'TABLERULE_M', 'OC_TABLERULE', null, '1899-12-30', '系统管理员', null, 5, '分片规则管理', 'open');
insert into [main].[T_SYS_MENU] values('270222e94bd842fe92bd8b79b73c4bc5', 'OC_FUNCTION', 'TABLERULE_M', 'OC_FUNCTION', null, '1899-12-30', '系统管理员', null, 4, '分片函数管理', 'open');
insert into [main].[T_SYS_MENU] values('b102b6ebff7d4fb6ab74ddf977b0e99c', 'OC_USER', 'MYCAT_M', 'OC_USER', null, '1899-12-30', '系统管理员', null, 9, 'MyCat用户管理', 'open');
insert into [main].[T_SYS_MENU] values('68e858cee45f42798baf3669c04355c6', 'OC_SYSTEM', 'MYCAT_M', 'OC_SYSTEM', null, '1899-12-30', '系统管理员', null, 10, 'MyCat系统参数配置', 'open');
insert into [main].[T_SYS_MENU] values('b6e92c1ffd694264899e21fcf99b9e04', 'OC_SCHEMAMAP', 'SCHMEAL_M', 'OC_SCHEMAMAP', null, '1899-12-30', '系统管理员', null, 7, '逻辑库添加表', 'open');
insert into [main].[T_SYS_MENU] values('d91ef1033837427082ded0257d04b2a2', 'SCHMEAL_M', 'OPENCLOUD', '', null, '1899-12-30', '系统管理员', null, 2, '逻辑库管理', 'closed');
insert into [main].[T_SYS_MENU] values('9a27a4ff7da9464198a6cb3125672acc', 'TABLERULE_M', 'OPENCLOUD', '', null, '1899-12-30', '系统管理员', null, 1, '分片规则管理', 'closed');
insert into [main].[T_SYS_MENU] values('56bb8d4a33e04008918f45b1314eb228', 'MYCAT_M', 'OPENCLOUD', '', null, '1899-12-30', '系统管理员', null, 0, 'MyCat服务管理', 'closed');
insert into [main].[T_SYS_MENU] values('da890a77998846d3855647575300473d', 'MONITOR', '', '', null, '1899-12-30', '系统管理员', null, 2, 'Mycat性能监控', 'closed');
insert into [main].[T_SYS_MENU] values('7d8aacc3e894427f8b39de56749ca1db', 'BACKEND', 'MONITOR', 'BACKEND', null, '1899-12-30', '系统管理员', null, 0, '物理连接信息', 'open');
insert into [main].[T_SYS_MENU] values('738de4c260c04592943766b51df58b41', 'CONNECTION', 'MONITOR', 'CONNECTION', null, '1899-12-30', '系统管理员', null, 1, '客户端连接信息', 'open');
insert into [main].[T_SYS_MENU] values('056319de967d431f98a79f3355b5b678', 'THREADPOOL', 'MONITOR', 'THREADPOOL', null, '1899-12-30', '系统管理员', null, 2, '线程池信息', 'open');
insert into [main].[T_SYS_MENU] values('15890e52fe924ee1aedf7f6c82add965', 'HEARTBEAT', 'MONITOR', 'HEARTBEAT', null, '1899-12-30', '系统管理员', null, 3, '物理库心跳检测', 'open');
insert into [main].[T_SYS_MENU] values('c3f2ed3090c8441591a603523b91d178', 'MO_DATANODE', 'MONITOR', 'MO_DATANODE', null, '1899-12-30', '系统管理员', null, 4, '数据节点的访问情况', 'open');
insert into [main].[T_SYS_MENU] values('af27164b5d744dbdae5197de968494c7', 'DATASOURCE', 'MONITOR', 'DATASOURCE', null, '1899-12-30', '系统管理员', null, 5, '数据源信息', 'open');


/* Drop table [main].[T_SYS_MYBATIS] */
drop table if exists [main].[T_SYS_MYBATIS];

/* Table structure [main].[T_SYS_MYBATIS] */
CREATE TABLE [main].[T_SYS_MYBATIS] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [NS_CODE] VARCHAR2(20), 
  [NS_NAME] VARCHAR2(200), 
  [ST_CODE] VARCHAR2(20), 
  [ST_NAME] VARCHAR2(200), 
  [REMARK] VARCHAR2(200), 
  [CREATE_TIME] DATE NOT NULL DEFAULT SYSDATE, 
  [CREATE_USER] VARCHAR2(20));

/* Data [main].[T_SYS_MYBATIS] */


/* Drop table [main].[T_SYS_MYCAT] */
drop table if exists [main].[T_SYS_MYCAT];

/* Table structure [main].[T_SYS_MYCAT] */
CREATE TABLE [main].[T_SYS_MYCAT] (
  [GUID] [VARCHAR2 ] NOT NULL, 
  [MYCAT_NAME] VARCHAR2, 
  [IP] [VARCHAR2 ], 
  [PORT] [VARCHAR2 ], 
  [USERNAME] [VARCHAR2 ], 
  [PASSWORD] [VARCHAR2 ], 
  [DESCRIPTION] [VARCHAR2 ], 
  [DRIVER_CLASS] [VARCHAR2 ], 
  [CREATE_TIME] DATE, 
  [DB_NAME] [VARCHAR ] NOT NULL, 
  [jrdsfile] VARCHAR(500));

/* Data [main].[T_SYS_MYCAT] */
insert into [main].[T_SYS_MYCAT] values('2cb249569a954aa9bc6743956ec1e1af', 'mysql', '127.0.0.1', '3306', 'hx', 'huangxin', null, null, '1899-12-30', 'test', 'D:/mycat-web-git/mycat-web-server/src/main/webapp/WEB-INF/jrdsconf/hosts/D_127.0.0.1_3306_test.xml');


/* Drop table [main].[T_SYS_MYCAT_JMX] */
drop table if exists [main].[T_SYS_MYCAT_JMX];

/* Table structure [main].[T_SYS_MYCAT_JMX] */
CREATE TABLE [main].[T_SYS_MYCAT_JMX] (
  [GUID] [VARCHAR ](32) NOT NULL UNIQUE, 
  [JMXNAME] [VARCHAR ](50) NOT NULL, 
  [IP] [VARCHAR ](20) NOT NULL, 
  [PORT] INT, 
  [USERNAME] , 
  [PASSWORD] , 
  [FILE_NAME] [VARCHAR ](100), 
  CONSTRAINT [sqlite_autoindex_T_SYS_MYCAT_JMX_1] PRIMARY KEY ([GUID]));

/* Data [main].[T_SYS_MYCAT_JMX] */
insert into [main].[T_SYS_MYCAT_JMX] values('f3e339f8e2024d2b9e2462b17d92aa17', 'mycat', '127.0.0.1', 8999, '', '', 'D:/mycat-web-git/mycat-web-server/src/main/webapp/WEB-INF/jrdsconf/hosts/JMX_mycat_127.0.0.1_8999.xml');


/* Drop table [main].[T_SYS_MYCAT_SNMP] */
drop table if exists [main].[T_SYS_MYCAT_SNMP];

/* Table structure [main].[T_SYS_MYCAT_SNMP] */
CREATE TABLE [main].[T_SYS_MYCAT_SNMP] (
  [GUID] [VARCHAR ] NOT NULL UNIQUE, 
  [SNMPNAME] [VARCHAR ] NOT NULL, 
  [IP] [VARCHAR ] NOT NULL, 
  [PORT] INT, 
  [FILE_NAME] [VARCHAR ], 
  [community] VARCHAR(50), 
  CONSTRAINT [sqlite_autoindex_T_SYS_MYCAT_SNMP_1] PRIMARY KEY ([GUID]));

/* Data [main].[T_SYS_MYCAT_SNMP] */
insert into [main].[T_SYS_MYCAT_SNMP] values('f88ec80b31d24cd082f95acae892abe9', 'snmp', '173.1.3.147', 161, 'D:/mycat-web/mycat-web-server/src/main/webapp/WEB-INF/jrdsconf/hosts/SNMP_173.1.3.147_161.xml', 'public');
insert into [main].[T_SYS_MYCAT_SNMP] values('bd465c534d604b9d97dfcd8d8166d161', '123213', '123213', 161, 'D:/mycat-web/mycat-web-server/src/main/webapp/WEB-INF/jrdsconf/hosts/SNMP_123213_161.xml', 'public');


/* Drop table [main].[T_SYS_ORG] */
drop table if exists [main].[T_SYS_ORG];

/* Table structure [main].[T_SYS_ORG] */
CREATE TABLE [main].[T_SYS_ORG] (
  [GUID] VARCHAR2(36) NOT NULL, 
  [ORG_CODE] VARCHAR2(20) NOT NULL, 
  [ORG_NAME] VARCHAR2(200) NOT NULL, 
  [PARENT_CODE] VARCHAR2(20), 
  [LEVELS] NUMBER(10), 
  [ALIVE_FLAG] NUMBER(10), 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20), 
  [STATE] VARCHAR2(10));

/* Data [main].[T_SYS_ORG] */


/* Drop table [main].[T_SYS_PAGE] */
drop table if exists [main].[T_SYS_PAGE];

/* Table structure [main].[T_SYS_PAGE] */
CREATE TABLE [main].[T_SYS_PAGE] (
  [GUID] VARCHAR2(36) NOT NULL, 
  [CODE] VARCHAR2(20) NOT NULL, 
  [URL] VARCHAR2(200) NOT NULL, 
  [NAME] VARCHAR2(50) NOT NULL, 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20), 
  [IS_CACHE] VARCHAR2(10));

/* Data [main].[T_SYS_PAGE] */
insert into [main].[T_SYS_PAGE] values('db62945680c04f4da32658a203cf0277', 'SERVICE', '/page/system/jsp/service.jsp', '服务管理', null, '钟良', '1');
insert into [main].[T_SYS_PAGE] values('25a8cee28e4042f78a3d9c451ad2834d', 'AUTHBUTTON', '/page/system/jsp/authbutton.jsp', '按钮授权', null, '钟良', '1');
insert into [main].[T_SYS_PAGE] values('75ae063dcdad49679e262cf49e3446f4', 'WHEREEX', '/page/system/jsp/whereex.jsp', '查询条件管理', null, '朱骏', '1');
insert into [main].[T_SYS_PAGE] values('dfe96a879d374d839859605ad07c1144', 'AUTHSERVICE', '/page/system/jsp/authservice.jsp', '服务授权', null, '钟良', '1');
insert into [main].[T_SYS_PAGE] values('84b7062f63f842cd8ed14d9616f0314a', 'OWNER', '/page/system/jsp/ownermapdb.jsp', '数据源分库管理', null, '钟良', '1');
insert into [main].[T_SYS_PAGE] values('73389995efd14c69b5f0494bcf5350ed', 'MYBATIS', '/page/system/jsp/mybatis.jsp', 'mybatis配置管理', null, '钟良', '1');
insert into [main].[T_SYS_PAGE] values('81fad78058324e49919e94a6d0da4876', 'SUGGESTION', '/page/system/jsp/suggestion.jsp', '用户意见反馈', null, '钟良', '1');
insert into [main].[T_SYS_PAGE] values('ca792324d8da4de09da167b3e49cd724', 'CUSTOMER', '/page/sa/jsp/customer.jsp', '客户管理', null, null, '1');
insert into [main].[T_SYS_PAGE] values('14b53ac7-55f1-48f1-8203-7fe1ef8d85b7', 'MENU', '/page/system/jsp/menu.jsp', '菜单维护', null, 'admin', '1');
insert into [main].[T_SYS_PAGE] values('2d7cd4ac-20f4-4278-853d-9901127df1fe', 'AUTHUSER', '/page/system/jsp/authuser.jsp', '用户授权', null, 'admin', '1');
insert into [main].[T_SYS_PAGE] values('37fd09dd-66c4-440e-a268-fa15768579e6', 'PAGE', '/page/system/jsp/page.jsp', '页面管理', null, 'admin', '1');
insert into [main].[T_SYS_PAGE] values('68bfd79b-9ce8-4d67-9e09-ff856c096ff5', 'ORG', '/page/system/jsp/org.jsp', '机构管理', null, 'admin', '1');
insert into [main].[T_SYS_PAGE] values('918eb82e-90a0-4a45-814e-0614f89d3ea3', 'CODE', '/page/system/jsp/code.jsp', '代码管理', null, 'admin', '1');
insert into [main].[T_SYS_PAGE] values('9226052e-37df-4c0f-81e4-2c1b17672794', 'USER', '/page/system/jsp/user.jsp', '用户管理', null, 'admin', '1');
insert into [main].[T_SYS_PAGE] values('a918c935-dbc5-448b-8e4c-375d0c636f5f', 'BUTTON', '/page/system/jsp/button.jsp', '按钮管理', null, 'admin', '1');
insert into [main].[T_SYS_PAGE] values('aba9840e-83cf-4b40-8d8f-35bcf73dcf81', 'AUTHRESOUCE', '/page/system/jsp/authresouce.jsp', '资源授权', null, 'admin', '1');
insert into [main].[T_SYS_PAGE] values('bd6a7e1c-5d5d-456a-817d-c2beec456324', 'ROLE', '/page/system/jsp/role.jsp', '角色管理', null, 'admin', '1');
insert into [main].[T_SYS_PAGE] values('bed0b9a7-2834-4034-a693-b8390e14415a', 'ROLE_TYPE', '/page/system/jsp/roletype.jsp', '角色类型管理', null, 'admin', '1');
insert into [main].[T_SYS_PAGE] values('c005eef2-b2f2-4f3c-93f0-56a52e61364c', 'LICENSES', '/page/sa/jsp/licenses.jsp', '证书管理', null, null, '1');
insert into [main].[T_SYS_PAGE] values('e2ed2eba-08d6-4c5f-8b4d-844e2b46fc8d', 'PRODUCT', '/page/sa/jsp/product.jsp', '产品管理', null, null, '1');
insert into [main].[T_SYS_PAGE] values('f68fed18-0b90-4054-80ff-7d427effb4ce', 'RSA', '/page/sa/jsp/rsa.jsp', '密钥管理', null, 'admin', '1');
insert into [main].[T_SYS_PAGE] values('e72bc2a3e9b34bfbaa544017981d05f4', 'SETUP', '/page/system/jsp/setup.jsp', '系统参数设置', null, '钟良', '1');
insert into [main].[T_SYS_PAGE] values('7753a138d77b40b396d61155a15c82a4', 'DATAHOST', '/page/oc/manager/jsp/datahost.jsp', '物理节点管理', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('802f0c37203944348acd176b05556b1a', 'HOST', '/page/oc/manager/jsp/host.jsp', '物理机管理', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('fa4eda40ade240669351b331a9b09de2', 'DATANODE', '/page/oc/manager/jsp/datanode.jsp', '分片节点管理', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('f039c10860f144478fdd694dcc1dfcfe', 'OC_TABLE', '/page/oc/manager/jsp/table.jsp', '表管理', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('8c95a47d75eb4fbbb89e7905f7571d93', 'DATAHOSTMAP', '/page/oc/manager/jsp/datahostmap.jsp', '物理节点绑定物理机', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('be3fb4fd996649d1b5124e536b3d68c3', 'OC_TABLERULE', '/page/oc/manager/jsp/tablerule.jsp', '分片规则管理', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('bd2acc8ba3864638aed4642e181d5f08', 'OC_FUNCTION', '/page/oc/manager/jsp/function.jsp', '分片函数管理', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('844eb3352a0644cc9f3a6ec6455fee00', 'OC_SCHEMA', '/page/oc/manager/jsp/schema.jsp', '逻辑库管理', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('d4751070f5514d02ae626e36ffdb708f', 'OC_USER', '/page/oc/manager/jsp/user.jsp', 'MyCat用户管理', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('7fd086c90cd84d759e45010aea47eae1', 'OC_SYSTEM', '/page/oc/manager/jsp/mycat.jsp', 'MyCat系统参数配置', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('b271474df1e1455199133a548c615e83', 'OC_SCHEMAMAP', '/page/oc/manager/jsp/schemaMap.jsp', '逻辑库添加表', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('21d2e2268b4a4fc88ed24348b165de93', 'BACKEND', '/page/oc/monitor/jsp/backend.jsp', '物理连接信息', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('ce07a19cc1bd4cc1a85d6bc25527d396', 'CONNECTION', '/page/oc/monitor/jsp/connection.jsp', '客户端连接信息', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('223d805152b34c688f4370aeeffeb41e', 'THREADPOOL', '/page/oc/monitor/jsp/threadpool.jsp', '线程池信息', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('cb3cb3181c2747188a28dc14c8b57e4c', 'HEARTBEAT', '/page/oc/monitor/jsp/heartbeat.jsp', '物理库心跳检测', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('7aad1e774f274cdfa5ad785696a7fe0f', 'MO_DATANODE', '/page/oc/monitor/jsp/datanode.jsp', '数据节点的访问情况', '1899-12-30', '系统管理员', '1');
insert into [main].[T_SYS_PAGE] values('fb7dbccbe9454b61a05660da3b7cef31', 'DATASOURCE', '/page/oc/monitor/jsp/datasource.jsp', '数据源信息', '1899-12-30', '系统管理员', '1');


/* Drop table [main].[T_SYS_PARAM] */
drop table if exists [main].[T_SYS_PARAM];

/* Table structure [main].[T_SYS_PARAM] */
CREATE TABLE [main].[T_SYS_PARAM] (
  [CODE] VARCHAR2(50), 
  [NAME] VARCHAR2(50), 
  [TYPE] VARCHAR2(20), 
  [FLAG] VARCHAR2(50), 
  [LENGTHS] VARCHAR2(20), 
  [ISNOT] VARCHAR2(20));

/* Data [main].[T_SYS_PARAM] */


/* Drop table [main].[T_SYS_ROLE] */
drop table if exists [main].[T_SYS_ROLE];

/* Table structure [main].[T_SYS_ROLE] */
CREATE TABLE [main].[T_SYS_ROLE] (
  [GUID] VARCHAR2(36) NOT NULL, 
  [ROLE_CODE] VARCHAR2(40) NOT NULL, 
  [ROLE_NAME] VARCHAR2(100), 
  [ROLE_TYPE_CODE] VARCHAR2(20) NOT NULL, 
  [ORG_CODE] VARCHAR2(20) NOT NULL, 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20));

/* Data [main].[T_SYS_ROLE] */


/* Drop table [main].[T_SYS_ROLETYPE] */
drop table if exists [main].[T_SYS_ROLETYPE];

/* Table structure [main].[T_SYS_ROLETYPE] */
CREATE TABLE [main].[T_SYS_ROLETYPE] (
  [GUID] VARCHAR2(36) NOT NULL, 
  [ROLE_TYPE_CODE] VARCHAR2(20) NOT NULL, 
  [ROLE_TYPE_NAME] VARCHAR2(100) NOT NULL, 
  [STATUS] NUMBER(10), 
  [REMARK] VARCHAR2(200), 
  [SORT_INDEX] NUMBER(10), 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20), 
  [ROLE_TYPE_GROUP] VARCHAR2(20));

/* Data [main].[T_SYS_ROLETYPE] */


/* Drop table [main].[T_SYS_SERVICE] */
drop table if exists [main].[T_SYS_SERVICE];

/* Table structure [main].[T_SYS_SERVICE] */
CREATE TABLE [main].[T_SYS_SERVICE] (
  [GUID] VARCHAR2(36) NOT NULL, 
  [SERVICE_CODE] VARCHAR2(20) NOT NULL, 
  [METHOD_CODE] VARCHAR2(20) NOT NULL, 
  [PACKAGE] VARCHAR2(50) NOT NULL, 
  [REMARK] VARCHAR2(200), 
  [CREATE_TIME] DATE NOT NULL DEFAULT sysdate, 
  [CREATE_USER] VARCHAR2(20), 
  [SERVICE_NAME] VARCHAR2(20) NOT NULL, 
  [METHOD_NAME] VARCHAR2(20) NOT NULL);

/* Data [main].[T_SYS_SERVICE] */


/* Drop table [main].[T_SYS_SETUP] */
drop table if exists [main].[T_SYS_SETUP];

/* Table structure [main].[T_SYS_SETUP] */
CREATE TABLE [main].[T_SYS_SETUP] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [FUN_NAME] VARCHAR2(200), 
  [FUN_CODE] VARCHAR2(30), 
  [FUN_DESC] VARCHAR2(200), 
  [REMARK] VARCHAR2(200), 
  [CREATE_USER] VARCHAR2(20), 
  [CREATE_TIME] DATE, 
  [IS_DISPLAY] VARCHAR2(10));

/* Data [main].[T_SYS_SETUP] */
insert into [main].[T_SYS_SETUP] values('538ad0fb66e649f0b2f241adb26e7d5c', '显示页面路径', 'showMenu', '在网站右下角显示菜单对应的页面的路径', 'test', 'zhongliang', null, '1');


/* Drop table [main].[T_SYS_USER] */
drop table if exists [main].[T_SYS_USER];

/* Table structure [main].[T_SYS_USER] */
CREATE TABLE [main].[T_SYS_USER] (
  [GUID] VARCHAR2(36) NOT NULL, 
  [LOGIN_ID] VARCHAR2(20) NOT NULL, 
  [NAME] VARCHAR2(20) NOT NULL, 
  [PASSWORD] VARCHAR2(32) NOT NULL, 
  [ALIVE_FLAG] VARCHAR2(10), 
  [CREATE_TIME] DATE, 
  [CREATE_USER] VARCHAR2(20), 
  [MOBILE_PHONE] VARCHAR2(15), 
  [ADDRESS] VARCHAR2(200), 
  [AGE] NUMBER(10) DEFAULT '0', 
  [SEX] NUMBER(10) DEFAULT '0', 
  [SORT_INDEX] NUMBER(10), 
  [ORG_CODE] VARCHAR2(20), 
  [IN_JOIN_TIME] DATE, 
  [WORK_STATUS] NUMBER(10), 
  [E_MAIL] VARCHAR2(50), 
  [IS_ONLINE] VARCHAR2(10) DEFAULT '0', 
  [IS_VERIFY] VARCHAR2(10) DEFAULT '1');

/* Data [main].[T_SYS_USER] */
insert into [main].[T_SYS_USER] values('49c4f8a6-d192-4557-b650-1f1f8795cf46', 'admin', '系统管理员', '21232f297a57a5a743894a0e4a801fc3', '0', null, 'admin', '13764178983', null, 100, 0, 1, 'jiefangbu', null, 0, 'accp_huangxin@163.com', '0', '0');


/* Drop table [main].[T_SYS_WHEREEX] */
drop table if exists [main].[T_SYS_WHEREEX];

/* Table structure [main].[T_SYS_WHEREEX] */
CREATE TABLE [main].[T_SYS_WHEREEX] (
  [GUID] VARCHAR2(32) NOT NULL, 
  [WHERE_NAME] VARCHAR2(50), 
  [CODE] VARCHAR2(30), 
  [DESCRIBE] VARCHAR2(50), 
  [REMARK] VARCHAR2(200), 
  [CREATE_TIME] DATE NOT NULL DEFAULT sysdate, 
  [CREATE_USER] VARCHAR2(20), 
  [VALUE_TYPE] VARCHAR2(30), 
  [VALUE_CODE] VARCHAR2(30), 
  [VALUE_SERVICE] VARCHAR2(30), 
  [VALUE_METHOD] VARCHAR2(100), 
  [BIZ_COMBOX_ID] VARCHAR2(30), 
  [BIZ_COMBOX_TEXT] VARCHAR2(30), 
  [EXTEND3] VARCHAR2(50), 
  [EXTEND4] VARCHAR2(50), 
  [EXTEND5] VARCHAR2(50), 
  [BIZ_COLUMNS] VARCHAR2(1000), 
  [SORT_INDEX] NUMBER(10), 
  [WHERE_CODE] VARCHAR2(30));

/* Data [main].[T_SYS_WHEREEX] */


/* Enable Foreign Keys */
pragma foreign_keys = on;
