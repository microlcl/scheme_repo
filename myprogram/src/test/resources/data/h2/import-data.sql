delete from users;
delete from departments;
delete from roles;
delete from user_role;
delete from modules;
delete from functions;
delete from role_function;
delete from category;
delete from medias;



insert into users(id, name, password, email, register_date, department_id) values('admin','admin','admin','myloginname@sina.com','2012-06-04 01:00:00','D1-1');
insert into users(id, name, password, email, register_date, department_id) values('zhang3','user','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','z2@gmail.com','2012-06-04 02:00:00','D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid1','乔布斯','userid1','userid1@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid2','乔布斯','userid2','userid2@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid3','乔布斯','userid3','userid3@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid4','乔布斯','userid4','userid4@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid5','乔布斯','userid5','userid5@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid6','乔布斯','userid6','userid6@gmail.com', now(),'D1-2-1');
insert into users(id, name, password, email, register_date, department_id) values('userid7','乔布斯','userid7','userid7@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, register_date, department_id) values('userid8','乔布斯','userid8','userid8@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, register_date, department_id) values('userid9','乔布斯','userid9','userid9@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, register_date, department_id) values('userid99','乔布斯','userid99','userid10@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, sex, register_date, department_id) values('ydq','ydq','ydq','ydq@gmail.com','男','2012-06-04 02:00:00','D1-1');


insert into departments(department_id, name, pid, description) values('D1','EastTeam','','EastTeam公司');
insert into departments(department_id, name, pid, description) values('D1-1','研发部','D1','EastTeam公司');
insert into departments(department_id, name, pid, description) values('D1-2','销售部','D1','EastTeam公司');
insert into departments(department_id, name, pid, description) values('D1-2-1','渠道销售部','D1-2','EastTeam公司');

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

insert into modules(module_id, pid, name, description, path) values('M1','','方案管理系统','方案管理系统','');
insert into modules(module_id, pid, name, description, path) values('M1-1','M1','管理模块','针对管理员进行操作的系统管理模块','');
insert into modules(module_id, pid, name, description, path) values('M1-2','M1','资料管理','资料的上传及管理','');
insert into modules(module_id, pid, name, description, path) values('M1-3','M1','角色管理','角色管理','');


insert into functions(function_id, module_id, name, description, path) values('F0','M1','主界面','查看主界面','/index.jsp');
insert into functions(function_id, module_id, name, description, path) values('F1','M1-1','用户：查看','有权限查看用户列表','/account/list');
insert into functions(function_id, module_id, name, description, path) values('F2','M1-1','用户：修改','有权限修改用户信息','/account/show');
insert into functions(function_id, module_id, name, description, path) values('F3','M1-1','用户：增加','有权限修增加用户','account/add');
insert into functions(function_id, module_id, name, description, path) values('F4','M1-1','类别：查看','有权限查看类别','/category/');
insert into functions(function_id, module_id, name, description, path) values('F5','M1-1','类别：修改','有权限新增类别','/category/api/save');
insert into functions(function_id, module_id, name, description, path) values('F6','M1-1','类别：删除','有权限删除类别','/category/api/delete');
insert into functions(function_id, module_id, name, description, path) values('F7','M1-3','角色：创建新角色','有权限查看角色列表','/role/add');
insert into functions(function_id, module_id, name, description, path) values('F8','M1-3','角色：修改角色权限','有权限修改角色','/role/api/update');
insert into functions(function_id, module_id, name, description, path) values('F9','M1-3','角色：删除角色','有权限删除角色','/role/api/delete');
insert into functions(function_id, module_id, name, description, path) values('F10','M1-1','用户：修改个人信息','有权限修改个人信息','/account/editProfile');

insert into role_function(role_id, function_id, description) values('R0','F0','');
insert into role_function(role_id, function_id, description) values('R0','F1','');
insert into role_function(role_id, function_id, description) values('R0','F2','');
insert into role_function(role_id, function_id, description) values('R0','F3','');
insert into role_function(role_id, function_id, description) values('R0','F4','');
insert into role_function(role_id, function_id, description) values('R0','F5','');
insert into role_function(role_id, function_id, description) values('R0','F6','');
insert into role_function(role_id, function_id, description) values('R0','F7','');
insert into role_function(role_id, function_id, description) values('R0','F8','');
insert into role_function(role_id, function_id, description) values('R0','F9','');
insert into role_function(role_id, function_id, description) values('R0','F10','');
insert into role_function(role_id, function_id, description) values('R1','F0','');
insert into role_function(role_id, function_id, description) values('R1','F1','');
insert into role_function(role_id, function_id, description) values('R1','F2','');
insert into role_function(role_id, function_id, description) values('R2','F0','');
insert into role_function(role_id, function_id, description) values('R2','F4','');
insert into role_function(role_id, function_id, description) values('R3','F0','');
insert into role_function(role_id, function_id, description) values('R3','F6','');

insert into category(id, pid, name, created_date, trashed, comment) values('1','','类别','2012-06-04 02:00:00','F','分类根节点');
insert into category(id, pid, name, created_date, trashed, comment) values('1-1','1','婚庆','2012-06-04 02:00:00','F','婚庆根节点');
insert into category(id, pid, name, created_date, trashed, comment) values('1-1-1','1-1','婚庆:搞笑','2012-06-04 02:00:00','F','搞笑的媒体资源');
insert into category(id, pid, name, created_date, trashed, comment) values('1-1-2','1-1','婚庆：浪漫','2012-06-04 02:00:00','F','温馨的媒体资源');
insert into category(id, pid, name, created_date, trashed, comment) values('1-2','1','庆祝生日','2012-06-04 02:00:00','F','生日根节点');
insert into category(id, pid, name, created_date, trashed, comment) values('1-2-1','1-2','生日：搞笑','2012-06-04 02:00:00','F','搞笑的媒体资源');
insert into category(id, pid, name, created_date, trashed, comment) values('1-2-2','1-2','生日：浪漫','2012-06-04 02:00:00','F','温馨的媒体资源');
insert into category(id, pid, name, created_date, trashed, comment) values('1-3','1','图片','2012-06-04 02:00:00','F','图片根节点');
insert into category(id, pid, name, created_date, trashed, comment) values('1-3-1','1-3','桌花','2012-06-04 02:00:00','F','桌花');
insert into category(id, pid, name, created_date, trashed, comment) values('1-3-2','1-3','舞台','2012-06-04 02:00:00','F','舞台');

insert into medias (description,media_type,path,status,user_id,category_id,upload_timestamp) values('description 1','图片','bp1.jpg','可用','admin','1-1-1',now());
insert into medias (description,media_type,path,status,user_id,category_id,upload_timestamp) values('description 1','图片','bp2.jpg','可用','admin','1-1-1',now());
insert into medias (description,media_type,path,status,user_id,category_id,upload_timestamp) values('description 1','图片','bp3.jpg','可用','admin','1-1-2',now());
insert into medias (description,media_type,path,status,user_id,category_id,upload_timestamp) values('description 1','图片','bp4.jpg','可用','admin','1-1-2',now());
insert into medias (description,media_type,path,status,user_id,category_id,upload_timestamp) values('description 1','图片','bp5.jpg','可用','admin','1-2-1',now());
insert into medias (description,media_type,path,status,user_id,category_id,upload_timestamp) values('description 1','图片','bp6.jpg','可用','admin','1-2-2',now());
insert into medias (description,media_type,path,status,user_id,category_id,upload_timestamp) values('description 1','图片','bp7.jpg','可用','admin','1-1',now());
insert into medias (description,media_type,path,status,user_id,category_id,upload_timestamp) values('description 1','图片','bp8.jpg','可用','admin','1-1',now());
insert into medias (description,media_type,path,status,user_id,category_id,upload_timestamp) values('description 1','图片','bp9.jpg','可用','admin','1-2',now());
insert into medias (description,media_type,path,status,user_id,category_id,upload_timestamp) values('description 1','图片','bp10.jpg','可用','admin','1-1-2',now());
insert into medias (description,media_type,path,status,user_id,category_id,upload_timestamp) values('description 1','图片','bp11.jpg','可用','admin','1-1-1',now());
insert into medias (description,media_type,path,status,user_id,category_id,upload_timestamp) values('description 1','图片','bp12.jpg','可用','admin','1-2-2',now());
insert into medias (description,media_type,path,status,user_id,category_id,upload_timestamp) values('description 1','视频','bp13.jpg','可用','admin','1-2-1',now());
