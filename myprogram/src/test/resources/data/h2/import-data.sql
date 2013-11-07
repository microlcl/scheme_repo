insert into users(id, name, password, email, register_date, department_id) values('admin','admin','admin','myloginname@sina.com','2012-06-04 01:00:00','D1-1');
insert into users(id, name, password, email, register_date, department_id) values('zhang3','user','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','z2@gmail.com','2012-06-04 02:00:00','D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid1','乔布斯','userid1','userid1@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid2','乔布斯','userid2','userid2@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid3','乔布斯','userid3','userid3@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid4','乔布斯','userid4','userid4@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid5','乔布斯','userid5','userid5@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid6','乔布斯','userid6','userid6@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid7','乔布斯','userid7','userid7@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, register_date, department_id) values('userid8','乔布斯','userid8','userid8@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, register_date, department_id) values('userid9','乔布斯','userid9','userid9@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, register_date, department_id) values('userid99','乔布斯','userid99','userid10@gmail.com', now(),'D1-2');

insert into departments(department_id, name, pid, description) values('D1','EastTeam','','EastTeam公司');
insert into departments(department_id, name, pid, description) values('D1-1','研发部','D1','EastTeam公司');
insert into departments(department_id, name, pid, description) values('D1-2','销售部','D1','EastTeam公司');

insert into roles(role_id, name, description) values('R1', '管理员','超级用户');
insert into roles(role_id, name, description) values('R2', '总经理','角色：总经理');
insert into roles(role_id, name, description) values('R3', '研发部经理','角色：研发经理');
insert into roles(role_id, name, description) values('R4', '研发部员工','角色：员工');
insert into roles(role_id, name, description) values('R5', '销售部经理','角色：销售经理');
insert into roles(role_id, name, description) values('R6', '销售部员工','角色：员工');

insert into user_role(user_id, role_id) values('userid1','R1');
insert into user_role(user_id, role_id) values('userid1','R2');
insert into user_role(user_id, role_id) values('userid1','R3');
insert into user_role(user_id, role_id) values('userid2','R3');

insert into modules(module_id, pid, name, description, path) values('M1','','方案管理系统','方案管理系统','');
insert into modules(module_id, pid, name, description, path) values('M1-1','M1','管理模块','针对管理员进行操作的系统管理模块','');
insert into modules(module_id, pid, name, description, path) values('M1-2','M1','资料管理','资料的上传及管理','');

insert into functions(function_id, module_id, name, description, path) values('F1','M1-1','用户：查看','有权限查看用户列表','account/list');
insert into functions(function_id, module_id, name, description, path) values('F2','M1-1','用户：修改','有权限修改用户信息','account/update');
insert into functions(function_id, module_id, name, description, path) values('F3','M1-1','用户：增加','有权限修增加用户','account/add');
insert into functions(function_id, module_id, name, description, path) values('F4','M1-2','资料：上传','有权限上传资料','assert/upload');
insert into functions(function_id, module_id, name, description, path) values('F5','M1-2','资料：修改','有权限修改资料','assert/update');
insert into functions(function_id, module_id, name, description, path) values('F6','M1-2','资料：删除','有权限删除资料','assert/delete');

insert into role_function(role_id, function_id, description) values('R1','F1','');
insert into role_function(role_id, function_id, description) values('R1','F2','');
insert into role_function(role_id, function_id, description) values('R2','F4','');
insert into role_function(role_id, function_id, description) values('R3','F6','');

insert into category(id, pid, name, created_date, trashed, comment) values('1','','类别','2012-06-04 02:00:00','F','分类根节点');
insert into category(id, pid, name, created_date, trashed, comment) values('1-1','1','视频','2012-06-04 02:00:00','F','视频根节点');
insert into category(id, pid, name, created_date, trashed, comment) values('1-1-1','1-1','自拍','2012-06-04 02:00:00','F','自拍的视频');
insert into category(id, pid, name, created_date, trashed, comment) values('1-1-2','1-1','电影','2012-06-04 02:00:00','F','电影片段');