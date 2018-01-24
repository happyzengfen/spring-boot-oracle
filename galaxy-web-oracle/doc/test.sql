----------------------------------------------------
-- Export file for user ZF                        --
-- Created by Administrator on 2018/1/24, 9:54:31 --
----------------------------------------------------

set define off
spool test.log

prompt
prompt Creating table SYS_DEPT
prompt =======================
prompt
create table SYS_DEPT
(
  dept_id   NUMBER(10) not null,
  parent_id NUMBER(20),
  name      NVARCHAR2(50),
  order_num NUMBER(11),
  del_flag  NUMBER(4)
)
tablespace ZF_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SYS_DEPT
  is '部门管理';
comment on column SYS_DEPT.dept_id
  is '主键ID';
comment on column SYS_DEPT.parent_id
  is '上级部门ID，一级部门为0';
comment on column SYS_DEPT.name
  is '部门名称';
comment on column SYS_DEPT.order_num
  is '排序';
comment on column SYS_DEPT.del_flag
  is '是否删除  -1：已删除  1：正常';
alter table SYS_DEPT
  add constraint PK_DEPT_ID primary key (DEPT_ID)
  using index 
  tablespace ZF_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_DICT
prompt =======================
prompt
create table SYS_DICT
(
  id          VARCHAR2(255) not null,
  name        NVARCHAR2(100),
  value       NVARCHAR2(100),
  type        NVARCHAR2(100),
  description NVARCHAR2(100),
  sort        NUMBER,
  parent_id   NUMBER(20),
  create_by   NUMBER(11),
  create_date DATE,
  update_by   NUMBER(20),
  update_date DATE,
  remarks     NVARCHAR2(255),
  del_flag    NCHAR(1)
)
tablespace ZF_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SYS_DICT
  is '字典表';
comment on column SYS_DICT.id
  is '编号';
comment on column SYS_DICT.name
  is '标签名';
comment on column SYS_DICT.value
  is '数据值';
comment on column SYS_DICT.type
  is '类型';
comment on column SYS_DICT.description
  is '描述';
comment on column SYS_DICT.sort
  is '排序（升序）';
comment on column SYS_DICT.parent_id
  is '父级编号';
comment on column SYS_DICT.create_by
  is '创建者';
comment on column SYS_DICT.create_date
  is '创建时间';
comment on column SYS_DICT.update_by
  is '更新者';
comment on column SYS_DICT.update_date
  is '更新时间';
comment on column SYS_DICT.remarks
  is '备注信息';
comment on column SYS_DICT.del_flag
  is '删除标记';

prompt
prompt Creating table SYS_FILE
prompt =======================
prompt
create table SYS_FILE
(
  id          VARCHAR2(255) not null,
  type        NUMBER(11),
  url         NVARCHAR2(200),
  create_date DATE
)
tablespace ZF_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SYS_FILE
  is '文件上传';
comment on column SYS_FILE.id
  is '主键id';
comment on column SYS_FILE.type
  is '文件类型';
comment on column SYS_FILE.url
  is 'URL地址';
comment on column SYS_FILE.create_date
  is '创建时间';

prompt
prompt Creating table SYS_LOG
prompt ======================
prompt
create table SYS_LOG
(
  id         NUMBER(18) not null,
  user_id    NUMBER(20),
  username   VARCHAR2(50),
  operation  VARCHAR2(50),
  time       NUMBER(11),
  method     VARCHAR2(500),
  params     NCLOB,
  ip         VARCHAR2(64),
  gmt_create DATE
)
tablespace ZF_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table SYS_LOG
  is '系统日志';
comment on column SYS_LOG.id
  is 'id';
comment on column SYS_LOG.user_id
  is '用户id';
comment on column SYS_LOG.username
  is '用户名';
comment on column SYS_LOG.operation
  is '用户操作';
comment on column SYS_LOG.time
  is '响应时间';
comment on column SYS_LOG.method
  is '请求方法';
comment on column SYS_LOG.params
  is '请求参数';
comment on column SYS_LOG.ip
  is 'IP地址';
comment on column SYS_LOG.gmt_create
  is '创建时间';
alter table SYS_LOG
  add constraint PK_SYS_LOG primary key (ID)
  using index 
  tablespace ZF_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_MENU
prompt =======================
prompt
create table SYS_MENU
(
  menu_id      NUMBER(18) not null,
  parent_id    NVARCHAR2(255),
  name         NVARCHAR2(50),
  url          NVARCHAR2(200),
  perms        NVARCHAR2(500),
  type         NUMBER(11),
  icon         NVARCHAR2(50),
  order_num    NUMBER(11),
  gmt_create   DATE,
  gmt_modified DATE default sysdate
)
tablespace ZF_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SYS_MENU
  is '菜单管理';
comment on column SYS_MENU.menu_id
  is '主键id';
comment on column SYS_MENU.parent_id
  is '父菜单ID，一级菜单为0';
comment on column SYS_MENU.name
  is '菜单名称';
comment on column SYS_MENU.url
  is '菜单URL';
comment on column SYS_MENU.perms
  is '授权(多个用逗号分隔，如：user:list,user:create)';
comment on column SYS_MENU.type
  is '类型   0：目录   1：菜单   2：按钮';
comment on column SYS_MENU.icon
  is '菜单图标';
comment on column SYS_MENU.order_num
  is '排序';
comment on column SYS_MENU.gmt_create
  is '创建时间';
comment on column SYS_MENU.gmt_modified
  is '修改时间';
alter table SYS_MENU
  add constraint PK_MENU_ID primary key (MENU_ID)
  using index 
  tablespace ZF_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_ROLE
prompt =======================
prompt
create table SYS_ROLE
(
  role_id        VARCHAR2(255) not null,
  role_name      VARCHAR2(100),
  role_sign      VARCHAR2(100),
  remark         VARCHAR2(100),
  user_id_create VARCHAR2(255),
  gmt_create     DATE,
  gmt_modified   DATE
)
tablespace ZF_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SYS_ROLE
  is '角色';
comment on column SYS_ROLE.role_name
  is '角色名称';
comment on column SYS_ROLE.role_sign
  is '角色标识';
comment on column SYS_ROLE.remark
  is '备注';
comment on column SYS_ROLE.user_id_create
  is '创建用户id';
comment on column SYS_ROLE.gmt_create
  is '创建时间';
comment on column SYS_ROLE.gmt_modified
  is '创建时间';

prompt
prompt Creating table SYS_ROLE_MENU
prompt ============================
prompt
create table SYS_ROLE_MENU
(
  id      NUMBER not null,
  role_id NUMBER,
  menu_id NUMBER
)
tablespace ZF_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SYS_ROLE_MENU
  is '角色与菜单对应关系';
comment on column SYS_ROLE_MENU.id
  is 'id';
comment on column SYS_ROLE_MENU.role_id
  is '角色ID';
comment on column SYS_ROLE_MENU.menu_id
  is '菜单ID';
alter table SYS_ROLE_MENU
  add constraint PK_ID primary key (ID)
  using index 
  tablespace ZF_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_USER
prompt =======================
prompt
create table SYS_USER
(
  user_id        NUMBER(18) not null,
  username       VARCHAR2(50),
  name           VARCHAR2(100),
  password       VARCHAR2(50),
  dept_id        NUMBER(20),
  email          VARCHAR2(100),
  mobile         VARCHAR2(100),
  status         NUMBER(4),
  user_id_create NUMBER(20),
  gmt_create     DATE,
  gmt_modified   DATE default sysdate,
  sex            NUMBER(20),
  birth          DATE,
  pic_id         NUMBER(20),
  live_address   VARCHAR2(500),
  hobby          VARCHAR2(255),
  province       VARCHAR2(255),
  city           VARCHAR2(255),
  district       VARCHAR2(255)
)
tablespace ZF_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column SYS_USER.username
  is '用户名';
comment on column SYS_USER.password
  is '密码';
comment on column SYS_USER.email
  is '邮箱';
comment on column SYS_USER.mobile
  is '手机号';
comment on column SYS_USER.status
  is '状态 0:禁用，1:正常';
comment on column SYS_USER.user_id_create
  is '创建用户id';
comment on column SYS_USER.gmt_create
  is '创建时间';
comment on column SYS_USER.gmt_modified
  is '修改时间';
comment on column SYS_USER.sex
  is '性别';
comment on column SYS_USER.birth
  is '出身日期';
comment on column SYS_USER.live_address
  is '现居住地';
comment on column SYS_USER.hobby
  is '爱好';
comment on column SYS_USER.province
  is '省份';
comment on column SYS_USER.city
  is '所在城市';
comment on column SYS_USER.district
  is '所在地区';
alter table SYS_USER
  add constraint PK_USER_ID primary key (USER_ID)
  using index 
  tablespace ZF_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_USER_ROLE
prompt ============================
prompt
create table SYS_USER_ROLE
(
  id      NUMBER not null,
  user_id NUMBER,
  role_id NUMBER
)
tablespace ZF_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SYS_USER_ROLE
  is '用户与角色对应关系';
comment on column SYS_USER_ROLE.id
  is 'id';
comment on column SYS_USER_ROLE.user_id
  is '用户ID';
comment on column SYS_USER_ROLE.role_id
  is '角色ID';
alter table SYS_USER_ROLE
  add constraint PK_USER_ROLE_ID primary key (ID)
  using index 
  tablespace ZF_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );



prompt
prompt Creating sequence SEQ_SYS_DEPT
prompt ==============================
prompt
create sequence SEQ_SYS_DEPT
minvalue 1
maxvalue 9999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_DICT
prompt ==============================
prompt
create sequence SEQ_SYS_DICT
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_LOG
prompt =============================
prompt
create sequence SEQ_SYS_LOG
minvalue 1
maxvalue 9999999999999999999999999999
start with 1641
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_MENU
prompt ==============================
prompt
create sequence SEQ_SYS_MENU
minvalue 1
maxvalue 9999999999999999999999999999
start with 101
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_ROLE
prompt ==============================
prompt
create sequence SEQ_SYS_ROLE
minvalue 1
maxvalue 9999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_ROLE_MENU
prompt ===================================
prompt
create sequence SEQ_SYS_ROLE_MENU
minvalue 1
maxvalue 9999999999999999999999999999
start with 401
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_USER
prompt ==============================
prompt
create sequence SEQ_SYS_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 41
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_USER_ROLE
prompt ===================================
prompt
create sequence SEQ_SYS_USER_ROLE
minvalue 1
maxvalue 9999999999999999999999999999
start with 41
increment by 1
cache 20;


spool off
