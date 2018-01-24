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
  is '���Ź���';
comment on column SYS_DEPT.dept_id
  is '����ID';
comment on column SYS_DEPT.parent_id
  is '�ϼ�����ID��һ������Ϊ0';
comment on column SYS_DEPT.name
  is '��������';
comment on column SYS_DEPT.order_num
  is '����';
comment on column SYS_DEPT.del_flag
  is '�Ƿ�ɾ��  -1����ɾ��  1������';
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
  is '�ֵ��';
comment on column SYS_DICT.id
  is '���';
comment on column SYS_DICT.name
  is '��ǩ��';
comment on column SYS_DICT.value
  is '����ֵ';
comment on column SYS_DICT.type
  is '����';
comment on column SYS_DICT.description
  is '����';
comment on column SYS_DICT.sort
  is '��������';
comment on column SYS_DICT.parent_id
  is '�������';
comment on column SYS_DICT.create_by
  is '������';
comment on column SYS_DICT.create_date
  is '����ʱ��';
comment on column SYS_DICT.update_by
  is '������';
comment on column SYS_DICT.update_date
  is '����ʱ��';
comment on column SYS_DICT.remarks
  is '��ע��Ϣ';
comment on column SYS_DICT.del_flag
  is 'ɾ�����';

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
  is '�ļ��ϴ�';
comment on column SYS_FILE.id
  is '����id';
comment on column SYS_FILE.type
  is '�ļ�����';
comment on column SYS_FILE.url
  is 'URL��ַ';
comment on column SYS_FILE.create_date
  is '����ʱ��';

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
  is 'ϵͳ��־';
comment on column SYS_LOG.id
  is 'id';
comment on column SYS_LOG.user_id
  is '�û�id';
comment on column SYS_LOG.username
  is '�û���';
comment on column SYS_LOG.operation
  is '�û�����';
comment on column SYS_LOG.time
  is '��Ӧʱ��';
comment on column SYS_LOG.method
  is '���󷽷�';
comment on column SYS_LOG.params
  is '�������';
comment on column SYS_LOG.ip
  is 'IP��ַ';
comment on column SYS_LOG.gmt_create
  is '����ʱ��';
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
  is '�˵�����';
comment on column SYS_MENU.menu_id
  is '����id';
comment on column SYS_MENU.parent_id
  is '���˵�ID��һ���˵�Ϊ0';
comment on column SYS_MENU.name
  is '�˵�����';
comment on column SYS_MENU.url
  is '�˵�URL';
comment on column SYS_MENU.perms
  is '��Ȩ(����ö��ŷָ����磺user:list,user:create)';
comment on column SYS_MENU.type
  is '����   0��Ŀ¼   1���˵�   2����ť';
comment on column SYS_MENU.icon
  is '�˵�ͼ��';
comment on column SYS_MENU.order_num
  is '����';
comment on column SYS_MENU.gmt_create
  is '����ʱ��';
comment on column SYS_MENU.gmt_modified
  is '�޸�ʱ��';
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
  is '��ɫ';
comment on column SYS_ROLE.role_name
  is '��ɫ����';
comment on column SYS_ROLE.role_sign
  is '��ɫ��ʶ';
comment on column SYS_ROLE.remark
  is '��ע';
comment on column SYS_ROLE.user_id_create
  is '�����û�id';
comment on column SYS_ROLE.gmt_create
  is '����ʱ��';
comment on column SYS_ROLE.gmt_modified
  is '����ʱ��';

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
  is '��ɫ��˵���Ӧ��ϵ';
comment on column SYS_ROLE_MENU.id
  is 'id';
comment on column SYS_ROLE_MENU.role_id
  is '��ɫID';
comment on column SYS_ROLE_MENU.menu_id
  is '�˵�ID';
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
  is '�û���';
comment on column SYS_USER.password
  is '����';
comment on column SYS_USER.email
  is '����';
comment on column SYS_USER.mobile
  is '�ֻ���';
comment on column SYS_USER.status
  is '״̬ 0:���ã�1:����';
comment on column SYS_USER.user_id_create
  is '�����û�id';
comment on column SYS_USER.gmt_create
  is '����ʱ��';
comment on column SYS_USER.gmt_modified
  is '�޸�ʱ��';
comment on column SYS_USER.sex
  is '�Ա�';
comment on column SYS_USER.birth
  is '��������';
comment on column SYS_USER.live_address
  is '�־�ס��';
comment on column SYS_USER.hobby
  is '����';
comment on column SYS_USER.province
  is 'ʡ��';
comment on column SYS_USER.city
  is '���ڳ���';
comment on column SYS_USER.district
  is '���ڵ���';
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
  is '�û����ɫ��Ӧ��ϵ';
comment on column SYS_USER_ROLE.id
  is 'id';
comment on column SYS_USER_ROLE.user_id
  is '�û�ID';
comment on column SYS_USER_ROLE.role_id
  is '��ɫID';
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
