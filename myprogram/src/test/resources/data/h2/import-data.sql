delete from users;
delete from departments;
delete from roles;
delete from user_role;
delete from modules;
delete from functions;
delete from role_function;
delete from category;
delete from medias;
delete from questions;
delete from papers;
delete from paper_questions;

insert into modules(module_id, pid, name, description, path) values('M1','','方案管理系统','方案管理系统','');
insert into modules(module_id, pid, name, description, path) values('M1-1','M1','类别管理','类别管理','');
insert into modules(module_id, pid, name, description, path) values('M1-2','M1','人员管理','人员管理','');
insert into modules(module_id, pid, name, description, path) values('M1-3','M1','角色管理','角色管理','');
insert into modules(module_id, pid, name, description, path) values('M1-4','M1','多媒体资源管理','多媒体资源管理','');
insert into modules(module_id, pid, name, description, path) values('M1-5','M1','产品管理','产品管理','');
insert into modules(module_id, pid, name, description, path) values('M1-6','M1','场地管理','场地管理','');
insert into modules(module_id, pid, name, description, path) values('M1-7','M1','问题管理','问题管理','');
insert into modules(module_id, pid, name, description, path) values('M1-8','M1','问卷管理','问卷管理','');
insert into modules(module_id, pid, name, description, path) values('M1-9','M1','协同作业','协同作业','');
insert into modules(module_id, pid, name, description, path) values('M1-10','M1','客户到访类别','客户到访类别','');
insert into modules(module_id, pid, name, description, path) values('M1-11','M1','案例类型','案例类型','');

insert into functions(function_id, module_id, name, description, path) values('F0','M1','主界面','查看主界面','/index.jsp');
insert into functions(function_id, module_id, name, description, path) values('F1-1','M1-1','类别：查看','有权限查看','/category/list,/category/api/search,/category/api/getAll');
insert into functions(function_id, module_id, name, description, path) values('F1-2','M1-1','类别：增加','有权限增加','/category/api/save,/category/api/subId');
insert into functions(function_id, module_id, name, description, path) values('F1-3','M1-1','类别：修改','有权限修改','/category/api/save');
insert into functions(function_id, module_id, name, description, path) values('F1-4','M1-1','类别：删除','有权限删除','/category/api/delete');


insert into functions(function_id, module_id, name, description, path) values('F2-1','M1-2','人员：列表','菜单导航','/account/list');
insert into functions(function_id, module_id, name, description, path) values('F2-2','M1-2','人员：查询','有权限查询','/account/list,/account/api/search');
insert into functions(function_id, module_id, name, description, path) values('F2-3','M1-2','人员：查看详细','有权限查看','/account/show/userInfo');
insert into functions(function_id, module_id, name, description, path) values('F2-4','M1-2','人员：增加','有权限增加','account/add');
insert into functions(function_id, module_id, name, description, path) values('F2-5','M1-2','人员：修改他人信息','有权限修改','/account/show,/account/update');
insert into functions(function_id, module_id, name, description, path) values('F2-6','M1-2','人员：修改自己的信息','有权限修改','/account/edit/profile,/account/save/profile');

insert into functions(function_id, module_id, name, description, path) values('F3-1','M1-3','角色：列表','菜单导航','/role/list');
insert into functions(function_id, module_id, name, description, path) values('F3-2','M1-3','角色：查询','有权限查询','/role/list');
insert into functions(function_id, module_id, name, description, path) values('F3-3','M1-3','角色：创建','有权限创建角色','/role/add,/role/doAdd');
insert into functions(function_id, module_id, name, description, path) values('F3-4','M1-3','角色：修改','有权限修改角色','/role/update,/role/save');
insert into functions(function_id, module_id, name, description, path) values('F3-5','M1-3','角色：删除','有权限删除角色','/role/delete');

insert into functions(function_id, module_id, name, description, path) values('F4-1','M1-4','多媒体：列表','菜单导航','/media/list,/media/api/search,/category/api/getAll');
insert into functions(function_id, module_id, name, description, path) values('F4-2','M1-4','多媒体：增加','有权限增加','/media/upload,/media/add,/category/api/getAll,/media/save');
insert into functions(function_id, module_id, name, description, path) values('F4-3','M1-4','多媒体：修改','有权限修改','/media/edit,/category/api/getAll,/media/update');
insert into functions(function_id, module_id, name, description, path) values('F4-4','M1-4','多媒体：删除','有权限删除','/media/delete');
insert into functions(function_id, module_id, name, description, path) values('F4-5','M1-4','多媒体：查询','有权限查询','/media/list');

insert into functions(function_id, module_id, name, description, path) values('F5-1','M1-5','产品：列表','菜单导航','/product/list,/category/api/getAll,/product/api/search');
insert into functions(function_id, module_id, name, description, path) values('F5-2','M1-5','产品：增加','有权限增加','/product/add,/category/api/getAll,/media/api/search,/product/doAdd');
insert into functions(function_id, module_id, name, description, path) values('F5-3','M1-5','产品：修改','有权限修改','/product/update,/category/api/getAll,/media/api/search,/product/updateProduct');
insert into functions(function_id, module_id, name, description, path) values('F5-4','M1-5','产品：删除','有权限删除','/product/delete');
insert into functions(function_id, module_id, name, description, path) values('F5-5','M1-5','产品：查看','有权限查看','/product/view');

insert into functions(function_id, module_id, name, description, path) values('F6-1','M1-6','场地：列表','菜单导航','/holder/list,/category/api/getAll,/holder/api/search');
insert into functions(function_id, module_id, name, description, path) values('F6-2','M1-6','场地：增加','有权限增加','/holder/add,/category/api/getAll,/media/api/search,/holder/doAdd');
insert into functions(function_id, module_id, name, description, path) values('F6-3','M1-6','场地：修改','有权限修改','/holder/update,/category/api/getAll,/media/api/search,/holder/updateHolder');
insert into functions(function_id, module_id, name, description, path) values('F6-4','M1-6','场地品：删除','有权限删除','/holder/delete');
insert into functions(function_id, module_id, name, description, path) values('F6-5','M1-6','场地：查看','有权限查看','/holder/view');

insert into users(id, name, password, email, register_date, department_id) values('admin','admin','admin','myloginname@sina.com','2012-06-04 01:00:00','D1-1');
insert into users(id, name, password, email, register_date, department_id) values('zhang3','user','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','z2@gmail.com','2012-06-04 02:00:00','D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid1','乔布斯1','userid1','userid1@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid2','乔布斯2','userid2','userid2@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid3','乔布斯3','userid3','userid3@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid4','乔布斯4','userid4','userid4@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid5','乔布斯5','userid5','userid5@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid6','乔布斯6','userid6','userid6@gmail.com', now(),'D1-2-1');
insert into users(id, name, password, email, register_date, department_id) values('userid7','乔布斯7','userid7','userid7@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, register_date, department_id) values('userid8','乔布斯8','userid8','userid8@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, register_date, department_id) values('userid9','乔布斯9','userid9','userid9@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, register_date, department_id) values('userid99','乔布斯99','userid99','userid10@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, sex, register_date, department_id) values('ydq','ydq','ydq','ydq@gmail.com','男','2012-06-04 02:00:00','D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid10','小丽','userid10','userid11@gmail.com', now(),'D1-3');
insert into users(id, name, password, email, register_date, department_id) values('userid11','李经理','userid11','userid12@gmail.com', now(),'D1-3');


insert into departments(department_id, name, pid, description) values('D1','EastTeam','','EastTeam公司');
insert into departments(department_id, name, pid, description) values('D1-1','研发部','D1','EastTeam公司');
insert into departments(department_id, name, pid, description) values('D1-2','销售部','D1','EastTeam公司');
insert into departments(department_id, name, pid, description) values('D1-2-1','渠道销售部','D1-2','EastTeam公司');
insert into departments(department_id, name, pid, description) values('D1-3','客服部','D1','EastTeam公司');

insert into roles(role_id, name, description) values('R0', '管理员','超级用户');
insert into roles(role_id, name, description) values('R1', '管理员1','超级用户1');
insert into roles(role_id, name, description) values('R2', '总经理','角色：总经理');
insert into roles(role_id, name, description) values('R3', '研发部经理','角色：研发经理');
insert into roles(role_id, name, description) values('R4', '研发部员工','角色：员工');
insert into roles(role_id, name, description) values('R5', '销售部经理','角色：销售经理');
insert into roles(role_id, name, description) values('R6', '销售部员工','角色：员工');

insert into user_role(user_id, role_id) values('userid1','R1');
insert into user_role(user_id, role_id) values('userid1','R2');
insert into user_role(user_id, role_id) values('userid1','R3');
insert into user_role(user_id, role_id) values('userid2','R3');
insert into user_role(user_id, role_id) values('ydq','R3');
insert into user_role(user_id, role_id) values('admin','R0');


insert into role_function(role_id, function_id, description) values('R0','F0','');
insert into role_function(role_id, function_id, description) values('R0','F1-1','');
insert into role_function(role_id, function_id, description) values('R0','F1-2','');
insert into role_function(role_id, function_id, description) values('R0','F1-3','');
insert into role_function(role_id, function_id, description) values('R0','F1-4','');
insert into role_function(role_id, function_id, description) values('R0','F1-5','');
insert into role_function(role_id, function_id, description) values('R0','F1-6','');
insert into role_function(role_id, function_id, description) values('R0','F1-7','');
insert into role_function(role_id, function_id, description) values('R0','F1-8','');
insert into role_function(role_id, function_id, description) values('R0','F2-1','');
insert into role_function(role_id, function_id, description) values('R0','F2-2','');
insert into role_function(role_id, function_id, description) values('R0','F2-3','');
insert into role_function(role_id, function_id, description) values('R0','F2-4','');
insert into role_function(role_id, function_id, description) values('R0','F2-5','');
insert into role_function(role_id, function_id, description) values('R0','F2-6','');
insert into role_function(role_id, function_id, description) values('R0','F3-1','');
insert into role_function(role_id, function_id, description) values('R0','F3-2','');
insert into role_function(role_id, function_id, description) values('R0','F3-3','');
insert into role_function(role_id, function_id, description) values('R0','F3-4','');
insert into role_function(role_id, function_id, description) values('R0','F3-5','');
insert into role_function(role_id, function_id, description) values('R0','F3-6','');
insert into role_function(role_id, function_id, description) values('R0','F4-1','');
insert into role_function(role_id, function_id, description) values('R0','F4-2','');
insert into role_function(role_id, function_id, description) values('R0','F4-3','');
insert into role_function(role_id, function_id, description) values('R0','F4-4','');
insert into role_function(role_id, function_id, description) values('R0','F4-5','');
insert into role_function(role_id, function_id, description) values('R0','F4-6','');
insert into role_function(role_id, function_id, description) values('R0','F5-1','');
insert into role_function(role_id, function_id, description) values('R0','F5-2','');
insert into role_function(role_id, function_id, description) values('R0','F5-3','');
insert into role_function(role_id, function_id, description) values('R0','F5-4','');
insert into role_function(role_id, function_id, description) values('R0','F5-5','');
insert into role_function(role_id, function_id, description) values('R1','F0','');
insert into role_function(role_id, function_id, description) values('R1','F1-1','');
insert into role_function(role_id, function_id, description) values('R1','F1-2','');
insert into role_function(role_id, function_id, description) values('R1','F1-3','');
insert into role_function(role_id, function_id, description) values('R2','F0','');
insert into role_function(role_id, function_id, description) values('R2','F2-1','');
insert into role_function(role_id, function_id, description) values('R2','F2-2','');
insert into role_function(role_id, function_id, description) values('R2','F2-3','');
insert into role_function(role_id, function_id, description) values('R2','F2-4','');
insert into role_function(role_id, function_id, description) values('R3','F0','');
insert into role_function(role_id, function_id, description) values('R3','F3-1','');
insert into role_function(role_id, function_id, description) values('R3','F3-2','');
insert into role_function(role_id, function_id, description) values('R3','F3-3','');
insert into role_function(role_id, function_id, description) values('R3','F3-4','');
insert into role_function(role_id, function_id, description) values('R4','F0','');
insert into role_function(role_id, function_id, description) values('R4','F4-1','');
insert into role_function(role_id, function_id, description) values('R4','F4-2','');
insert into role_function(role_id, function_id, description) values('R4','F4-3','');
insert into role_function(role_id, function_id, description) values('R4','F4-4','');
insert into role_function(role_id, function_id, description) values('R4','F4-5','');
insert into role_function(role_id, function_id, description) values('R4','F4-6','');

-- category数据：
insert into category(id, pid, name, created_date, trashed, comment) values('1','','类别','2012-06-04 02:00:00','F','分类根节点');
-- 系统参数 start
insert into category(id, pid, name, created_date, trashed, comment) values('1-0','1','系统参数','2013-12-28 02:00:00','F','系统参数');
-- 会场管理模块：场地特色
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0','1-0','场地特色','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-0','1-0-0','观景房','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-1','1-0-0','千人会场','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-2','1-0-0','欧式风格','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-3','1-0-0','中式风格','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-4','1-0-0','优美怡人','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-5','1-0-0','高层会场','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-6','1-0-0','无柱会场','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-7','1-0-0','自然采光','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-8','1-0-0','草坪','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-9','1-0-0','婚礼场地','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-10','1-0-0','户外广场','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-11','1-0-0','山庄','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-12','1-0-0','核心商圈','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-13','1-0-0','景区周边','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-14','1-0-0','市中心','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-15','1-0-0','免费WIFI','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-16','1-0-0','高尔夫球场','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-17','1-0-0','温泉','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-18','1-0-0','特色酒吧','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-19','1-0-0','游泳池','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-20','1-0-0','特色餐饮','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-21','1-0-0','民族风格','2013-12-28 02:00:00','F','会场管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-0-22','1-0-0','皇家风范','2013-12-28 02:00:00','F','会场管理');

-- 问卷管理：问卷状态
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-1','1-0','问卷状态','2013-12-28 02:00:00','F','问卷管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-1-0','1-0-1','草稿','2013-12-28 02:00:00','F','问卷管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-1-1','1-0-1','发布','2013-12-28 02:00:00','F','问卷管理');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-1-2','1-0-1','废弃','2013-12-28 02:00:00','F','问卷管理');

-- 庆典类别(策划类别)
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-2','1-0','策划类别','2013-12-28 02:00:00','F','通用系统参数');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-2-0','1-0-2','婚庆','2013-12-28 02:00:00','F','通用系统参数');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-2-1','1-0-2','生日','2013-12-28 02:00:00','F','通用系统参数');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-2-2','1-0-2','公司年会','2013-12-28 02:00:00','F','通用系统参数');

-- 客户身份
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-3','1-0','客户身份','2013-12-28 02:00:00','F','通用系统参数');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-3-0','1-0-3','新娘','2013-12-28 02:00:00','F','通用系统参数');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-3-1','1-0-3','新郎','2013-12-28 02:00:00','F','通用系统参数');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-3-2','1-0-3','宝宝','2013-12-28 02:00:00','F','通用系统参数');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-3-3','1-0-3','单位领导','2013-12-28 02:00:00','F','通用系统参数');

-- 访问类别
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-4','1-0','到访类别','2014-01-10 00:00:00','F','到访类别');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-4-0','1-0-4','到访','2014-01-10 00:00:00','F','到访类别');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-4-1','1-0-4','回访','2014-01-10 00:00:00','F','到访类别');

-- task 优先级
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-5','1-0','作业优先级','2012-06-04 02:00:00','F','作业优先级');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-5-1','1-0-5','低优先级','2012-06-04 02:00:00','F','作业优先级低');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-5-2','1-0-5','中优先级','2012-06-04 02:00:00','F','作业优先级中');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-5-3','1-0-5','高优先级','2012-06-04 02:00:00','F','作业优先高');

-- task 类别
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-6','1-0','作业类型','2012-06-04 02:00:00','F','作业类型');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-6-1','1-0-6','设计','2012-06-04 02:00:00','F','设计');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-6-2','1-0-6','工程','2012-06-04 02:00:00','F','工程');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-6-3','1-0-6','会议','2012-06-04 02:00:00','F','会议');

-- task 状态
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-7','1-0','作业状态','2012-06-04 02:00:00','F','作业状态');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-7-1','1-0-7','新建','2012-06-04 02:00:00','F','新建作业');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-7-2','1-0-7','进行中','2012-06-04 02:00:00','F','作业进行中');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-7-3','1-0-7','完成','2012-06-04 02:00:00','F','作业已完成');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-7-4','1-0-7','废弃','2012-06-04 02:00:00','F','作业被废弃');

-- Case 状态
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-8','1-0','需求状态','2012-06-04 02:00:00','F','需求状态');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-8-1','1-0-8','新建','2012-06-04 02:00:00','F','新建');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-8-2','1-0-8','进行中','2012-06-04 02:00:00','F','进行中');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-8-3','1-0-8','完成','2012-06-04 02:00:00','F','已完成');
insert into category(id, pid, name, created_date, trashed, comment) values('1-0-8-4','1-0-8','废弃','2012-06-04 02:00:00','F','被废弃');

-- 系统参数 end
insert into category(id, pid, name, created_date, trashed, comment) values('1-1','1','婚庆','2012-06-04 02:00:00','F','婚庆根节点');
insert into category(id, pid, name, created_date, trashed, comment) values('1-1-1','1-1','婚庆:搞笑','2012-06-04 02:00:00','F','搞笑的媒体资源');
insert into category(id, pid, name, created_date, trashed, comment) values('1-1-2','1-1','婚庆：浪漫','2012-06-04 02:00:00','F','温馨的媒体资源');
insert into category(id, pid, name, created_date, trashed, comment) values('1-2','1','庆祝生日','2012-06-04 02:00:00','F','生日根节点');
insert into category(id, pid, name, created_date, trashed, comment) values('1-2-1','1-2','生日：搞笑','2012-06-04 02:00:00','F','搞笑的媒体资源');
insert into category(id, pid, name, created_date, trashed, comment) values('1-2-2','1-2','生日：浪漫','2012-06-04 02:00:00','F','温馨的媒体资源');
insert into category(id, pid, name, created_date, trashed, comment) values('1-3','1','图片','2012-06-04 02:00:00','F','图片根节点');
insert into category(id, pid, name, created_date, trashed, comment) values('1-3-1','1-3','桌花','2012-06-04 02:00:00','F','桌花');
insert into category(id, pid, name, created_date, trashed, comment) values('1-3-2','1-3','舞台','2012-06-04 02:00:00','F','舞台');
insert into category(id, pid, name, created_date, trashed, comment) values('1-5','1','颜色','2012-06-04 02:00:00','F','产品颜色');
insert into category(id, pid, name, created_date, trashed, comment) values('1-5-1','1-5','白色','2012-06-04 02:00:00','F','白色');
insert into category(id, pid, name, created_date, trashed, comment) values('1-5-2','1-5','黑色','2012-06-04 02:00:00','F','黑色');
insert into category(id, pid, name, created_date, trashed, comment) values('1-6','1','尺寸','2012-06-04 02:00:00','F','产品尺寸');
insert into category(id, pid, name, created_date, trashed, comment) values('1-6-1','1-6','40','2012-06-04 02:00:00','F','40');
insert into category(id, pid, name, created_date, trashed, comment) values('1-6-2','1-6','42','2012-06-04 02:00:00','F','42');
insert into category(id, pid, name, created_date, trashed, comment) values('1-6-3','1-6','4','2012-06-04 02:00:00','F','45');

insert into function_category(function_id,category_id) values('M1-4','1-1');
insert into function_category(function_id,category_id) values('M1-4','1-2');
insert into function_category(function_id,category_id) values('M1-5','1-5');
insert into function_category(function_id,category_id) values('M1-5','1-6');
insert into function_category(function_id,category_id) values('getBusinessType','1-0-2');
insert into function_category(function_id,category_id) values('getCaseStatus', '1-0-8');
insert into function_category(function_id,category_id) values('M1-8','1-0-1');
insert into function_category(function_id,category_id) values('M1-6','1-0-0');
insert into function_category(function_id,category_id) values('M1-9','1-0-7');
insert into function_category(function_id,category_id) values('M1-9-1','1-0-6');
insert into function_category(function_id,category_id) values('M1-9-2','1-0-5');
insert into function_category(function_id,category_id) values('M1-10','1-0-4');



insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(1,'title1','description 1','picture','bp1.jpg','可用','admin',now(),'');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(2,'title2','description 2','picture','bp2.jpg','可用','admin',now(),'');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(3,'title3','description 3','picture','bp3.jpg','可用','admin',now(),'');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(4,'title4','description 4','picture','bp4.jpg','可用','admin',now(),'');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(5,'title5','description 5','picture','bp5.jpg','可用','admin',now(),'');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(6,'title6','description 6','picture','bp6.jpg','可用','admin',now(),'');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(7,'title7','description 7','picture','bp7.jpg','可用','admin',now(),'');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(8,'title8','description 8','picture','bp8.jpg','可用','admin',now(),'');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(9,'title9','description 9','picture','bp9.jpg','可用','admin',now(),'');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(10,'title10','description 10','picture','bp10.jpg','可用','userid1',now(),'');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(11,'title11','description 11','picture','bp11.jpg','可用','userid1',now(),'');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(12,'title12','description 12','picture','bp12.jpg','可用','userid1',now(),'');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(13,'title13','description 13','video','bp13.jpg','可用','userid1',now(),'');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(14,'心愿','四个女生主唱','audio','xinyuan.mp3','可用','admin',now(),'四个女生');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(15,'素颜','许嵩主唱','audio','suyan.mp3','可用','admin',now(),'许嵩');
insert into medias (media_id,title,description,media_type,path,status,user_id,upload_timestamp,author) values(16,'我很快乐','刘惜君主唱','audio','I am very happy.mp3','可用','admin',now(),'刘惜君');

insert into media_category (media_id,category_id) values(1,'1-1-1');
insert into media_category (media_id,category_id) values(1,'1-1-2');
insert into media_category (media_id,category_id) values(2,'1-1-1');
insert into media_category (media_id,category_id) values(3,'1-1-1');
insert into media_category (media_id,category_id) values(4,'1-1-2');
insert into media_category (media_id,category_id) values(5,'1-1-2');
insert into media_category (media_id,category_id) values(6,'1-1-2');
insert into media_category (media_id,category_id) values(7,'1-2-1');
insert into media_category (media_id,category_id) values(8,'1-2-1');
insert into media_category (media_id,category_id) values(9,'1-2-2');
insert into media_category (media_id,category_id) values(10,'1-1-1');
insert into media_category (media_id,category_id) values(11,'1-2-1');
insert into media_category (media_id,category_id) values(12,'1-1-2');
insert into media_category (media_id,category_id) values(13,'1-2-2');

insert into products (product_id,title,status,description,default_picture_id,price) values(1,'产品1','1','description1',1,1.11);
insert into products (product_id,title,status,description,default_picture_id,price) values(2,'产品2','2','description2',2,2.22);
insert into products (product_id,title,status,description,default_picture_id,price) values(3,'产品3','3','description3',3,3.33);
insert into products (product_id,title,status,description,default_picture_id,price) values(4,'产品4','4','description4',4,4.44);
insert into products (product_id,title,status,description,default_picture_id,price) values(5,'产品5','5','description5',5,5.55);
insert into products (product_id,title,status,description,default_picture_id,price) values(6,'产品6','6','description6',6,6.55);
insert into products (product_id,title,status,description,default_picture_id,price) values(7,'产品7','7','description7',7,7.55);
insert into products (product_id,title,status,description,default_picture_id,price) values(8,'产品8','8','description8',8,8.55);
insert into products (product_id,title,status,description,default_picture_id,price) values(9,'产品9','9','description9',5,9.55);


insert into product_category(product_id,category_id,picture_id) values(1,'1-5-1',1);
insert into product_category(product_id,category_id,picture_id) values(2,'1-5-1',2);
insert into product_category(product_id,category_id,picture_id) values(3,'1-5-1',3);
insert into product_category(product_id,category_id,picture_id) values(4,'1-5-1',4);
insert into product_category(product_id,category_id,picture_id) values(5,'1-5-2',5);
insert into product_category(product_id,category_id,picture_id) values(6,'1-5-2',6);
insert into product_category(product_id,category_id,picture_id) values(7,'1-5-1',5);
insert into product_category(product_id,category_id,picture_id) values(7,'1-5-2',6);
insert into product_category(product_id,category_id,picture_id) values(7,'1-6-1',7);
insert into product_category(product_id,category_id,picture_id) values(8,'1-5-1',1);
insert into product_category(product_id,category_id,picture_id) values(8,'1-5-2',2);
insert into product_category(product_id,category_id,picture_id) values(8,'1-6-1',3);
insert into product_category(product_id,category_id,picture_id) values(8,'1-6-2',4);
insert into product_category(product_id,category_id,picture_id) values(8,'1-6-3',5);
insert into product_category(product_id,category_id,picture_id) values(9,'1-5-1',2);
insert into product_category(product_id,category_id,picture_id) values(9,'1-5-2',9);
insert into product_category(product_id,category_id,picture_id) values(9,'1-6-1',1);
insert into product_category(product_id,category_id,picture_id) values(9,'1-6-2',3);
insert into product_category(product_id,category_id,picture_id) values(9,'1-6-3',4);

insert into Holders (holder_id,holder_name,address,level,contact,phone,description)
		values(3,'劳动人民文化宫','北京东城1号线天安门东',4,'张三','15211111111','北京市劳动人民文化宫位于北京天安门东侧，为始建于明永乐十八年1420年的明清太庙。经周恩来总理提议，第一次政务院会议批准，将太庙移交北京市总工会管理，辟为职工群众的文化活动场所，“北京市劳动人民文化宫”匾额由毛泽东主席命名并亲笔题写，于1950年4月30日揭幕，5月1日正式对外开放。北京市劳动人民文化宫自成立以来，成为首都乃至全国职工文化活动的中心，开展了丰富多彩的文化活动，培养了大批各方面人才。同时，作为党和国家重大活动的重要场所，经历了许多重大的历史事件。');
insert into Holders (holder_id,holder_name,address,level,contact,phone,description)
		values(2,'魅力中国剧场','北京 丰台9号线 科怡路',3,'李四','152111111','魅力中国剧场位于北京市丰台区南四环西路128号丰台科技园区内，紧邻北京汽车博物馆和总部基地，交通便利，距地铁九号线丰台科技园站仅百米之遥。总面积2100平方米，场内深63米，宽33.5米，高12米，能容纳上千名观众，配有贵宾室、化妆间、导播间、同声传译室等配套设施。剧场设施完备，配套高端，具备多功能的场所转换特质，是集大型节目录制、经典剧目演出、晚会直播、高端会议、新闻发布会等大型活动功能于一体');
insert into Holders (holder_id,holder_name,address,level,contact,phone,description)
		values(1,'秀剧场','北京朝阳',3,'王五','15511111111','秀剧场（Showhouse）是北京国际版权交易中心紧跟国家大力推进社会主义文化建设的步伐、积极响应国家“十二五规划”促进文化创意产业大发展大繁荣的号召，大手笔打造的国际化文创产业高端展示交流平台');
insert into Holders (holder_id,holder_name,address,level,contact,phone,description)
		values(4,'北京万达索菲特大酒店','北京朝阳1号线大望路',5,'张飞','15311111111','北京万达索菲特大饭店地处于交通便利的北京中央商务区，可轻松到达中国国际展览中心、地铁站及天安门广场、故宫等主要名胜古迹。以白金五星级标准打造的北京万达索菲特大饭店，拥有417间客房，其中包括43间套房；4个餐厅，包括：Le Pré Lenôtre法餐厅、VIC国际美食餐厅, 烧肉笼屋八兵卫日本餐厅以及农圃饭店粤餐厅；2个酒吧，包括：法式风情的M吧和Vous大堂酒吧；集中在一个楼层（七层）的10个会议厅，其中大宴会厅面积达1368平方米；健身中心及拥有兰蔻水疗室的LeSpa水疗中心。');
insert into Holders (holder_id,holder_name,address,level,contact,phone,description)
		values(5,'北京皇冠假日酒店','北京朝阳2号线外环朝阳门',5,'赵云','1541111111','北京朝阳悠唐皇冠假日酒店地理位置优越，位于北京的中央商务区，毗邻北京优城。酒店处于繁华的中心地段，却又不失宁静，是喧闹的都市中安置心灵的净地。酒店距离天安门广场有5公里，北京知名景点如紫禁城近在咫尺。');

insert into Spaces (space_id,holder_id,space_name,floor,volume,hall_height,stage_length,stage_width,stage_height,description)
		values(1,1,'大厅',1,1000,5,1500,1000,5,'1');
insert into Spaces (space_id,holder_id,space_name,floor,volume,hall_height,stage_length,stage_width,stage_height,description)
		values(2,1,'前院',1,1500,0,2000,2000,0,'2');
insert into Spaces (space_id,holder_id,space_name,floor,volume,hall_height,stage_length,stage_width,stage_height,description)
		values(3,1,'后院',1,1000,0,1000,1000,0,'2');
insert into Spaces (space_id,holder_id,space_name,floor,volume,hall_height,stage_length,stage_width,stage_height,description)
		values(4,2,'剧场',1,4000,10,3000,2000,10,'2');
insert into Spaces (space_id,holder_id,space_name,floor,volume,hall_height,stage_length,stage_width,stage_height,description)
		values(5,3,'剧场',1,500,10,10000,600,8,'2');
insert into Spaces (space_id,holder_id,space_name,floor,volume,hall_height,stage_length,stage_width,stage_height,description)
		values(6,4,'大宴会厅',2,800,10,500,700,7,'3');
insert into Spaces (space_id,holder_id,space_name,floor,volume,hall_height,stage_length,stage_width,stage_height,description)
		values(7,4,'凯旋门',3,500,4,400,400,0,'3');
insert into Spaces (space_id,holder_id,space_name,floor,volume,hall_height,stage_length,stage_width,stage_height,description)
		values(8,4,'卢浮宫',4,600,4,500,500,0,'4');
insert into Spaces (space_id,holder_id,space_name,floor,volume,hall_height,stage_length,stage_width,stage_height,description)
		values(9,5,'大厅',1,1200,5,1000,800,5,'5');
insert into Spaces (space_id,holder_id,space_name,floor,volume,hall_height,stage_length,stage_width,stage_height,description)
		values(10,5,'舞厅',3,100,5,300,300,5,'5');
insert into Spaces (space_id,holder_id,space_name,floor,volume,hall_height,stage_length,stage_width,stage_height,description)
		values(11,5,'剧场'，4,200,5,400,400,5,'5');
insert into Spaces (space_id,holder_id,space_name,floor,volume,hall_height,stage_length,stage_width,stage_height,description)
		values(12,5,'后院',1,1000,0,1500,100,0,'5');

insert into space_attribute(space_id,attribute_id) values(1,'1-0-0-0');
insert into space_attribute(space_id,attribute_id) values(1,'1-0-0-1');
insert into space_attribute(space_id,attribute_id) values(2,'1-0-0-2');
insert into space_attribute(space_id,attribute_id) values(2,'1-0-0-3');
insert into space_attribute(space_id,attribute_id) values(3,'1-0-0-10');
insert into space_attribute(space_id,attribute_id) values(3,'1-0-0-14');
		
insert into questions (question_id,question, question_type, question_options, business_type, trashed) values(1,'你是通过什么途径知道我们的产品的1？','1','网上搜索^朋友分享^无意间了解','1-0-2-0','F');
insert into questions (question_id,question, question_type, question_options, business_type, trashed) values(2,'你喜欢的灯具材质是2？','2','木质^金属^水晶^其他','1-0-2-0','F');
insert into questions (question_id,question, question_type, question_options, business_type, trashed) values(3,'你对本产品有什么建议3？','3','','1-0-2-0','F');
insert into questions (question_id,question, question_type, question_options, business_type, trashed) values(4,'你是通过什么途径知道我们的产品的4？','1','网上搜索^朋友分享^无意间了解','1-0-2-1','F');
insert into questions (question_id,question, question_type, question_options, business_type, trashed) values(5,'你喜欢的灯具材质是5？','2','木质^金属^水晶^其他','1-0-2-0','F');
insert into questions (question_id,question, question_type, question_options, business_type, trashed) values(6,'你是通过什么途径知道我们的产品的6？','1','网上搜索^朋友分享^无意间了解','1-0-2-0','F');
insert into questions (question_id,question, question_type, question_options, business_type, trashed) values(7,'你喜欢的灯具材质是7？','2','木质^金属^水晶^其他','1-0-2-0','F');
insert into questions (question_id,question, question_type, question_options, business_type, trashed) values(8,'你是通过什么途径知道我们的产品的8？','1','网上搜索^朋友分享^无意间了解','1-0-2-2','F');
insert into questions (question_id,question, question_type, question_options, business_type, trashed) values(9,'你喜欢的灯具材质是9？','2','木质^金属^水晶^其他','1-0-2-0','F');

insert into papers (paper_id, paper_name, business_type, creat_timestamp, status) values (1, '婚礼问卷1', '1-0-2-0', now(), '1-0-1-1');
insert into papers (paper_id, paper_name, business_type, creat_timestamp, status) values (2, '婚礼问卷2', '1-0-2-0', now(), '1-0-1-1');
insert into papers (paper_id, paper_name, business_type, creat_timestamp, status) values (3, '婚礼问卷3', '1-0-2-0', now(), '1-0-1-0');
insert into papers (paper_id, paper_name, business_type, creat_timestamp, status) values (4, '年会问卷4', '1-0-2-2', now(), '1-0-1-2');
insert into papers (paper_id, paper_name, business_type, creat_timestamp, status) values (5, '年会问卷5', '1-0-2-2', now(), '1-0-1-1');
insert into papers (paper_id, paper_name, business_type, creat_timestamp, status) values (6, '年会问卷6', '1-0-2-2', now(), '1-0-1-1');

insert into paper_questions (paper_id, question_id, position) values (1, 9, 10);
insert into paper_questions (paper_id, question_id, position) values (1, 8, 20);
insert into paper_questions (paper_id, question_id, position) values (1, 7, 30);
insert into paper_questions (paper_id, question_id, position) values (1, 6, 40);
insert into paper_questions (paper_id, question_id, position) values (1, 5, 50);
insert into paper_questions (paper_id, question_id, position) values (1, 4, 60);
insert into paper_questions (paper_id, question_id, position) values (2, 1, 10);
insert into paper_questions (paper_id, question_id, position) values (2, 2, 20);
insert into paper_questions (paper_id, question_id, position) values (2, 3, 30);
insert into paper_questions (paper_id, question_id, position) values (2, 4, 40);
insert into paper_questions (paper_id, question_id, position) values (2, 5, 50);
insert into paper_questions (paper_id, question_id, position) values (2, 6, 60);
insert into paper_questions (paper_id, question_id, position) values (3, 9, 10);
insert into paper_questions (paper_id, question_id, position) values (3, 8, 20);
insert into paper_questions (paper_id, question_id, position) values (3, 7, 30);
insert into paper_questions (paper_id, question_id, position) values (3, 6, 40);
insert into paper_questions (paper_id, question_id, position) values (3, 5, 50);
insert into paper_questions (paper_id, question_id, position) values (3, 4, 60);
insert into paper_questions (paper_id, question_id, position) values (4, 1, 10);
insert into paper_questions (paper_id, question_id, position) values (4, 2, 20);
insert into paper_questions (paper_id, question_id, position) values (4, 3, 30);
insert into paper_questions (paper_id, question_id, position) values (4, 4, 40);
insert into paper_questions (paper_id, question_id, position) values (4, 5, 50);
insert into paper_questions (paper_id, question_id, position) values (4, 6, 60);
insert into paper_questions (paper_id, question_id, position) values (5, 9, 10);
insert into paper_questions (paper_id, question_id, position) values (5, 8, 20);
insert into paper_questions (paper_id, question_id, position) values (5, 7, 30);
insert into paper_questions (paper_id, question_id, position) values (5, 6, 40);
insert into paper_questions (paper_id, question_id, position) values (5, 5, 50);
insert into paper_questions (paper_id, question_id, position) values (5, 4, 60);
insert into paper_questions (paper_id, question_id, position) values (6, 1, 10);
insert into paper_questions (paper_id, question_id, position) values (6, 2, 20);
insert into paper_questions (paper_id, question_id, position) values (6, 3, 30);
insert into paper_questions (paper_id, question_id, position) values (6, 4, 40);
insert into paper_questions (paper_id, question_id, position) values (6, 5, 50);
insert into paper_questions (paper_id, question_id, position) values (6, 6, 60);

insert into paper_answers(business_id, paper_id, question_id, answer) values('C1',1,4,'1');
insert into paper_answers(business_id, paper_id, question_id, answer) values('C1',1,5,'2');
insert into paper_answers(business_id, paper_id, question_id, answer) values('C1',1,6,'3');
insert into paper_answers(business_id, paper_id, question_id, answer) values('C1',1,7,'2');
insert into paper_answers(business_id, paper_id, question_id, answer) values('C1',1,8,'2');
insert into paper_answers(business_id, paper_id, question_id, answer) values('C1',1,9,'2,3');

insert into task (task_id,parent_id,summary,description,task_type,status,department_id,owner,progress,priority,due_date,time_remaining,created_timestamp,created_by)
		values(1,0,'年会','举行年会','1-0-6-3','1-0-7-1','D1-1','admin',40,'1-0-5-3',now(),1,now(),'admin');
insert into task (task_id,parent_id,summary,description,task_type,status,department_id,owner,progress,priority,due_date,time_remaining,created_timestamp,created_by)
		values(2,1,'会场布置','年会会场布置','1-0-6-2','1-0-7-2','D1-2','userid9',40,'1-0-5-1',now(),1,now(),'userid9');
insert into task (task_id,parent_id,summary,description,task_type,status,department_id,owner,progress,priority,due_date,time_remaining,created_timestamp,created_by)
		values(3,1,'人员安排','年会人员安排','1-0-6-3','1-0-7-3','D1-2','userid8',40,'1-0-5-2',now(),1,now(),'userid9');
		

insert into customer (customer_id, customer_name, customer_phone, customer_sex, job, weixin, weibo, qq, birthday, favorite, description)
	values (1, '张三', '13000000000', '12345678', 'IT', 'zhangsan', '100000', '1983-12-28', '玩游戏看电视', '此人性格孤僻');
insert into customer (customer_id, customer_name, customer_phone, customer_sex, job, weixin, weibo, qq, birthday, favorite, description)
	values (2, '李四', '13011111111', '11223344', '厨师', 'lisi', '200000', '1983-12-28', '睡觉', '此人倾向于吃喝玩乐');
insert into customer (customer_id, customer_name, customer_phone, customer_sex, job, weixin, weibo, qq, birthday, favorite, description)
	values (3, '王五', '13022222222', '22114433', '财务', 'wangwu', '300000', '1983-12-28', '理财', '此人善于沟通');
		
insert into visit_activities (visit_id, customer_id, visit_type, visit_stime, visitor_num, assigned_department_id, recipient, operator, business_type, case_id, is_visited, comment, paper_id )
	values (1, 1, '1-0-4-0', '2013-06-04 02:00:00', 100, 'D1-2-1', 'userid10', 'userid11', '1-0-2-0', 1, 'F', '此人婚礼喜欢极尽奢华', 1);
insert into visit_activities (visit_id, customer_id, visit_type, visit_stime, visitor_num, assigned_department_id, recipient, operator, business_type, case_id, is_visited, comment, paper_id )
	values (2, 2, '1-0-4-0', '2013-10-05 02:00:00', 50, 'D1-2-1', 'userid10', 'userid11', '1-0-2-1', 2, 'F', '此人生日宴会非常简单', 2);
insert into visit_activities (visit_id, customer_id, visit_type, visit_stime, visitor_num, assigned_department_id, recipient, operator, business_type, case_id, is_visited, comment, paper_id )
	values (3, 3, '1-0-4-0', '2013-08-06 02:00:00', 500, 'D1-2-1', 'userid10', 'userid11', '1-0-2-2', 3, 'F', '此人婚礼喜欢极尽奢华', 3);
insert into visit_activities (visit_id, customer_id, visit_type, visit_stime, visitor_num, assigned_department_id, recipient, operator, business_type, case_id, is_visited, comment, paper_id )
	values (4, 1, '1-0-4-0', '2013-07-05 10:00:00', 100, 'D1-2-1', 'userid10', 'userid11', '1-0-2-0', 1, 'T', '此人婚礼喜欢极尽奢华', 1);
insert into visit_activities (visit_id, customer_id, visit_type, visit_stime, visitor_num, assigned_department_id, recipient, operator, business_type, case_id, is_visited, comment, paper_id )
	values (5, 2, '1-0-4-0', '2013-11-06 02:00:00', 50, 'D1-2-1', 'userid10', 'userid11', '1-0-2-1', 2, 'T', '此人生日宴会喜欢非常简单', 2);
insert into visit_activities (visit_id, customer_id, visit_type, visit_stime, visitor_num, assigned_department_id, recipient, operator, business_type, case_id, is_visited, comment, paper_id )
	values (6, 3, '1-0-4-0', '2013-09-08 02:00:00', 500, 'D1-2-1', 'userid10', 'userid11', '1-0-2-2', 3, 'T', '此人婚礼喜欢极尽奢华', 3);


insert into cases (case_id, case_title, created_time, assigned_department_id, case_owner, business_type, event_time, guest_num, space_id, space_tip, description, paper_id, status, business_code)
	values (1, '张三的婚礼', '2013-06-05 02:00:00', 'D1-1', 'userid1', '1-0-2-0', '2013-06-04 02:00:00', 100, 1, '场地足够大', '场面极尽奢华', 1, '1-0-8-1', 'C');
insert into cases (case_id, case_title, created_time, assigned_department_id, case_owner, business_type, event_time, guest_num, space_id, space_tip, description, paper_id, status, business_code)
	values (2, '李四的生日', '2013-10-06 02:00:00', 'D1-2-1', 'userid6', '1-0-2-2', '2013-06-04 02:00:00', 50, 2, '场地很小', '场面简单', 2, '1-0-8-2', 'C');
insert into cases (case_id, case_title, created_time, assigned_department_id, case_owner, business_type, event_time, guest_num, space_id, space_tip, description, paper_id, status, business_code)
	values (3, '王五的公司年会', '2013-08-07 02:00:00', 'D1-2', 'userid9', '1-0-2-1', '2013-06-04 02:00:00', 500, 3, '场地足够大3', '人员很多', 3, '1-0-8-3', 'C');

insert into task_comments (comment_id,task_id) values (1,1);
insert into task_comments (comment_id,task_id) values (2,2);
insert into task_comments (comment_id,task_id) values (3,3);

insert into comments (comment_id,user_id,comment,created_timestamp) values (1,'userid1','需要更多修改',now());
insert into comments (comment_id,user_id,comment,created_timestamp) values (2,'userid1','需要更多修改',now());
insert into comments (comment_id,user_id,comment,created_timestamp) values (3,'userid1','需要更多修改',now());
