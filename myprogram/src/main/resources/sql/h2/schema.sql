drop table if exists users;
drop table if exists category;
drop table if exists modules;
drop table if exists functions;
drop table if exists role_function;
drop table if exists departments;
drop table if exists user_department;

create table users (
	id varchar(64) not null unique,
	name varchar(32) not null,
	password varchar(255) not null,
	sex varchar(2),
	department_id varchar(64),
	email varchar(64),
	phone_num varchar(20),
	address varchar(64),
	hometown varchar(64),
	birthday date,
	register_date timestamp,
	status varchar(20),
	comment varchar(128),
	primary key (id)
);

create table category (
	id varchar(64) not null unique,
	pid varchar(64),
	name varchar(64) not null,
	created_date timestamp not null,
	trashed varchar(1) not null,
	comment varchar(128),
	primary key (id)
);

create table modules (
	module_id varchar(64) not null unique,
	pid varchar(64),
	name varchar(64) not null,
	description varchar(128),
	path varchar(128),
	primary key (module_id)
);

create table functions (
	function_id varchar(64) not null unique,
	module_id varchar(64),
	name varchar(64) not null,
	description varchar(128),
	path varchar(128),
	primary key (function_id)
);

create table roles (
	role_id varchar(64) not null unique,
	name varchar(64) not null,
	description varchar(128),
	primary key (role_id)
);

create table role_function (
	role_id varchar(64) not null,
	function_id varchar(64) not null,
	description varchar(128),
	primary key (role_id,function_id)
);

create table departments (
	department_id varchar(64) not null unique,
	name varchar(64) not null,
	pid varchar(64),
	description varchar(128),
	primary key (department_id)
);

create table user_role (
	user_id varchar(64) not null,
	role_id varchar(64) not null,
	primary key (user_id,role_id)
);

create table medias (
	media_id bigint generated by default as identity,
	media_type varchar(10),
	path varchar(128),
	status varchar(64),
	user_id varchar(64),
	upload_timestamp timestamp,
	description varchar(128),
	title varchar(64),
	author varchar(32),
	primary key (media_id)
);

create table media_category (
	media_id bigint,
	category_id varchar(64),
	primary key (media_id,category_id)
);

create table products (
	product_id bigint generated by default as identity,
	title varchar(64),
	status varchar(64),
	description varchar(128),
	default_picture_id bigint,
	price decimal(10,2),
	primary key (product_id)
);

create table product_category (
	product_id bigint,
	category_id varchar(64),
	picture_id bigint,
	primary key (product_id,category_id)
);

create table function_category (
	function_id varchar(64),
	category_id varchar(64),
	primary key (function_id,category_id)
);

create table holders (
	holder_id bigint generated by default as identity,
	holder_name varchar(32),
	address varchar(64),
	level int,
	contact varchar(24),
	phone varchar(20),
	description varchar(256),	
	primary key (holder_id)
);

create table spaces (
	space_id bigint generated by default as identity,
	holder_id bigint,
	space_name varchar(32),
	floor int,
	volume int,
	hall_height int,
	stage_length int,
	stage_width int,
	stage_height int,
	description varchar(256),	
	primary key (space_id)
);

create table space_attribute (
	space_id bigint,
	attribute_id varchar(64),
	primary key (space_id,attribute_id)
);

-- 到访,回访流水， 由于一个case可能导致多次到访，所以此表与cases table是多对一的关系
create table visit_activities (
	visit_id bigint generated by default as identity,
	customer_id bigint,
	visit_type varchar(64), -- 访问类别： 到访，回访，在category table配置
	visit_stime timestamp,  -- 默认是系统时间，可以修改
	visitor_num int,	-- 到访，回访人数
	assigned_department_id varchar(64), -- assigned 给哪个部门
	recipient varchar(64),  -- 接待者（前台接待）
	operator varchar(64), -- 经办人（跟单者）
	business_type varchar(64), -- 庆典种类：婚庆，生日，公司年会等，可以在category table配置
	case_id bigint,   -- 这次到访是为了哪个case
	is_visited varchar(1), -- 是否初次到访： Ture/False
	comment varchar(256), -- 备注
	paper_id bigint, -- 回访单id
	-- 以下4个字段改由动态表单完成，更加灵活
	-- appeal_point varchar(1024), -- 客户信息（诉求）要点
	-- focus_on varchar(1024), -- 客户重点关心
	-- remaining_issues varchar(1024), -- 需要进一步确认的问题
	-- result varchar(1024), -- 洽谈结果
	primary key (visit_id)
);

create table cases (
	case_id bigint generated by default as identity,
	case_title varchar(32), -- case的title，比如： 张三的婚庆，李四公司的年会庆典等
	created_time timestamp, -- case创建时间戳
	assigned_department_id varchar(64), -- assigned 给哪个部门
	case_owner varchar(64), -- 这个case的跟单人
	business_type varchar(64),   -- 庆典种类：婚庆，生日，公司年会等，可以在category table配置
	event_time timestamp,    -- 庆典时间
	guest_num int,     -- 客人人数
	space_id bigint,    -- 庆典地点,关联space table
	space_tip varchar(64), -- 庆典地点信息，由前台文字输入。后续跟单者可以根据这个信息完成space_id字段的填写。
	description varchar(1024),
	paper_id bigint,
	status varchar(64), -- case的状态（new, in progress, finished, trashed）,配置在category table的系统参数节点下
	business_code varchar(6),-- 默认为C, 与case_id 联合组成business_id,与paper_answers table相关联
	primary key (case_id)
);

-- case的subscribers
create table case_subscribers (
	case_id bigint not null,
	user_id varchar(64) not null,
	primary key (case_id, user_id)
);

create table papers (
	paper_id bigint generated by default as identity,
	paper_name varchar(32) not null,
	creat_timestamp timestamp,
	status varchar(64) not null, -- 调查问卷的状态： draft, publish, trashed,只有publish状态的才能使用。此status在category的系统参数节点下配置，此处保存的是category id.
	business_type varchar(64) not null, -- 庆典种类：婚庆，生日，公司年会,年终员工调查等，可以在category table配置
	primary key (paper_id)	
);

-- 调查表
create table questions (
	question_id bigint generated by default as identity,
	question varchar(256) not null,
	question_type varchar(64) not null, -- 问题种类：单选，多选，开放式问题等 ,不用在category table里面配置
	question_options varchar(512), -- 问题答案选项，用特殊字符^分隔， 如果是开放式问题， 此字段为空
	business_type varchar(64), -- 庆典种类：婚庆，生日，公司年会,年终员工调查等，可以在category table配置
	trashed varchar(1),
	primary key (question_id)
);

create table paper_questions (
	paper_id bigint not null,
	question_id bigint not null,
	position int not null, -- 问题在调查问卷中的位置
	primary key (paper_id, question_id)	
);

-- 系统表，存储问题类别：单选，多选，开放式问题
create table question_type (
	question_type varchar(1) not null,
	question_name varchar(16) not null,
	primary key(question_type, question_name)
);

create table paper_answers (
	business_id varchar(64), -- 由business_code与具体业务表的sequence构成
	paper_id bigint not null,
	question_id bigint not null,
	answer varchar(256), -- 多选项的答案应该是用逗号隔开的所选答案的index
	primary key (business_id,paper_id,question_id)
);

-- case与customer的映射表，存储某一个case中的主角及相关人员
create table case_customers (
	case_id bigint,
	character_id varchar(64) not null,   -- 角色id(角色：新娘，新郎，宝宝...)， 保存在category表
	customer_id bigint,
	description varchar(256),
	primary key (case_id,character_id,customer_id)
);


-- category 里面相关的信息如果变动，此表也要相应维护。此表的目的是定义某种case中默认的主角，比如婚庆类别的主角默认就是新郎，新娘。
-- 系统参数
----   策划类别
------  婚宴
------  生日宴

----   客户身份
------  新娘
------  新郎
------  宝宝
create table business_type_character (
	business_type varchar(64) not null, -- value为配置在category table里面的category_id
	character_id varchar(64) not null, -- value为配置在category table里面的category_id
	primary key (business_type, character_id)
);

-- 所有外部人员信息（不一定只有case的主角才记录在此表）。积累下来将是潜在机会，所以单独建表
create table customer (
	customer_id bigint generated by default as identity,
	customer_name varchar(32), -- 遇到不愿意提供姓名的客户，可以只存储姓
	customer_phone varchar(20),
	customer_sex varchar(2),
	job varchar(32), -- 工作
	weixin varchar(16),
	weibo varchar(16),
	qq varchar(16),
	birthday date,
	favorite varchar(128), -- 爱好
	description varchar(256), -- 备注
	primary key (customer_id)
);


-- task table, 用于协作办公模块
create table task (
	task_id bigint generated by default as identity,
	parent_id bigint, -- 父task,为空就是没有父task，就是US
	summary varchar(128) not null, -- 类似于RTC中的summary，用作title
	description varchar(1024), -- 描述
	task_type varchar(64),  -- US的type，可在category table配置
	status varchar(64), -- US的状态： new， in progress, completed etc.在category table配置
	department_id varchar(64),-- task所属的部门id
	owner varchar(64),	
	progress int, -- 百分比 * 100后的value，eg: value为36，表示进度为36%.此value应根据:子task的花费的总时间/子task的总时间 *100后四舍五入自动得到
	priority varchar(64), -- 优先级，在category的系统参数节点配置
	due_date timestamp, -- 计划完成时间
	time_remaining int, -- 剩下多少小时
	created_timestamp timestamp, -- 创建时间
	created_by varchar(64), -- 创建人
	primary key (task_id)
);

-- task的subscribers
create table task_subscribers (
	task_id bigint not null,
	user_id varchar(64) not null,
	primary key (task_id, user_id)
);

-- 记录task下面的comments
create table task_comments (
	comment_id bigint not null,
	task_id bigint not null,
	primary key (comment_id,task_id)
);

-- comments通用表，实际存储comment的地方
create table comments (
	comment_id bigint generated by default as identity,
	user_id varchar(64) not null, -- 加comment的人
	comment varchar(1024) not null,
	created_timestamp timestamp,
	primary key (comment_id)
);

create table task_attachments (
	attachment_id bigint not null,
	task_id bigint not null,
	primary key (attachment_id,task_id)
);

create table attachments (
	attachment_id bigint generated by default as identity,
	user_id varchar(64) not null, -- 加comment的人
	uploaded_timestamp timestamp,	
	path varchar(128) not null, -- 文件路径 + 文件名
	file_size int, -- 文件大小,单位：M
	primary key (attachment_id)
);

create table task_status_history (
	history_id bigint generated by default as identity,
	task_id bigint not null,
	status varchar(64) not null, -- status的category id
	modified_timestamp timestamp, -- 修改时间
	editor varchar(64) not null, -- 修改人
	primary key (history_id)
);


-- case与US的映射表
create table case_task (
	case_id bigint not null,
	task_id bigint not null,
	primary key (case_id, task_id)
);

-- 环节
create table procedures (
	procedure_id bigint generated by default as identity,
	procedure_name varchar(32) not null,
	business_type varchar(64)   -- 庆典种类：婚庆，生日，公司年会等，可以在category table配置
);
-- 方案
create table schemes (
	scheme_id bigint generated by default as identity,
	case_id bigint,
	scheme_name varchar(32) not null,
	created_by varchar(64), -- 由谁创建
	modified_timestamp timestamp, -- 修改时间
	status varchar(64), -- 方案的状态（new, in progress, finished, trashed）,配置在category table的系统参数节点下
	comment varchar(128)
);

-- 方案在不同的维度上有多个分类，一对多
create table scheme_category (
	scheme_id bigint,
	scheme_type varchar(64) not null, -- 方案种类(浪漫，搞笑等)，在category table配置
);


-- 方案包含的环节：
create table scheme_procedures (
	scheme_procedure_id bigint generated by default as identity,
	scheme_id bigint not null,
	procedure_id bigint not null,
	description varchar(1024), -- 备注
	position int not null, -- 环节的先后顺序	
	effect_id bigint -- 动画效果
);

-- 环节与图片等资源的映射表
create table scheme_procedure_resource (
	scheme_procedure_id bigint not null,
	media_id bigint, -- 如果选择了product,就保存product的默认图片default_picture_id，否则，直接保存media_id
	product_id bigint, 
	product_count int, -- 需要的product的数量
	position int not null -- 在动画中的先后顺序	
);

create table effect (
	effect_id bigint generated by default as identity,
	effect_name varchar(32) not null	
);



