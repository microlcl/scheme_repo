delete from users;
delete from departments;
delete from roles;
delete from user_role;
delete from modules;
delete from functions;
delete from role_function;
delete from category;
delete from medias;

insert into modules(module_id, pid, name, description, path) values('M1','','方案管理系统','方案管理系统','');
insert into modules(module_id, pid, name, description, path) values('M1-1','M1','类别管理','类别管理','');
insert into modules(module_id, pid, name, description, path) values('M1-2','M1','人员管理','人员管理','');
insert into modules(module_id, pid, name, description, path) values('M1-3','M1','角色管理','角色管理','');
insert into modules(module_id, pid, name, description, path) values('M1-4','M1','多媒体资源管理','多媒体资源管理','');
insert into modules(module_id, pid, name, description, path) values('M1-5','M1','产品管理','产品管理','');

insert into functions(function_id, module_id, name, description, path) values('F0','M1','主界面','查看主界面','/index.jsp');
insert into functions(function_id, module_id, name, description, path) values('F1-1','M1-1','类别：菜单','菜单导航','/category/');
insert into functions(function_id, module_id, name, description, path) values('F1-2','M1-1','类别：查看','有权限查看','/category/show');
insert into functions(function_id, module_id, name, description, path) values('F1-3','M1-1','类别：增加','有权限增加','category/add');
insert into functions(function_id, module_id, name, description, path) values('F1-4','M1-1','类别：修改','有权限修改','/category/');
insert into functions(function_id, module_id, name, description, path) values('F1-5','M1-1','类别：删除','有权限删除','/category/api/save');
insert into functions(function_id, module_id, name, description, path) values('F1-6','M1-1','类别：保存','有权限保存','/category/api/delete');
insert into functions(function_id, module_id, name, description, path) values('F1-7','M1-1','类别：折叠','有权限折叠','/category/api/delete');
insert into functions(function_id, module_id, name, description, path) values('F1-8','M1-1','类别：展开','有权限展开','/category/api/delete');
insert into functions(function_id, module_id, name, description, path) values('F2-1','M1-2','人员：菜单','菜单导航','/account/list');
insert into functions(function_id, module_id, name, description, path) values('F2-2','M1-2','人员：查看','有权限查看','/account/list');
insert into functions(function_id, module_id, name, description, path) values('F2-3','M1-2','人员：增加','有权限增加','/account/show');
insert into functions(function_id, module_id, name, description, path) values('F2-4','M1-2','人员：修改','有权限修改','account/add');
insert into functions(function_id, module_id, name, description, path) values('F2-5','M1-2','人员：修改','有权限修改','/account/editProfile');
insert into functions(function_id, module_id, name, description, path) values('F2-6','M1-2','人员：删除','有权限删除','/category/');
insert into functions(function_id, module_id, name, description, path) values('F2-5','M1-2','人员：查询','有权限查询','/category/api/save');
insert into functions(function_id, module_id, name, description, path) values('F3-1','M1-3','角色：菜单','菜单','/role/list');
insert into functions(function_id, module_id, name, description, path) values('F3-2','M1-3','角色：创建','有权限查看角色列表','/role/add');
insert into functions(function_id, module_id, name, description, path) values('F3-3','M1-3','角色：修改','有权限修改角色','/role/api/update');
insert into functions(function_id, module_id, name, description, path) values('F3-4','M1-3','角色：删除','有权限删除角色','/role/api/delete');
insert into functions(function_id, module_id, name, description, path) values('F3-5','M1-3','角色：查询','有权限查询','/role/api/update');
insert into functions(function_id, module_id, name, description, path) values('F4-1','M1-4','多媒体：菜单','菜单','/role/add');
insert into functions(function_id, module_id, name, description, path) values('F4-2','M1-4','多媒体：增加','有权限增加','/role/add');
insert into functions(function_id, module_id, name, description, path) values('F4-3','M1-4','多媒体：修改','有权限修改','/role/api/update');
insert into functions(function_id, module_id, name, description, path) values('F4-4','M1-4','多媒体：删除','有权限删除','/role/api/delete');
insert into functions(function_id, module_id, name, description, path) values('F4-5','M1-4','多媒体：查询','有权限查询','/role/api/delete');
insert into functions(function_id, module_id, name, description, path) values('F5-1','M1-5','产品：菜单','菜单','/product/add');
insert into functions(function_id, module_id, name, description, path) values('F5-2','M1-5','产品：增加','增加','/product/add');
insert into functions(function_id, module_id, name, description, path) values('F5-3','M1-5','产品：修改','修改','/product/update');
insert into functions(function_id, module_id, name, description, path) values('F5-4','M1-5','产品：删除','删除','/product/delete');


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
insert into category(id, pid, name, created_date, trashed, comment) values('1-5','1','颜色','2012-06-04 02:00:00','F','产品颜色');
insert into category(id, pid, name, created_date, trashed, comment) values('1-5-1','1-5','白色','2012-06-04 02:00:00','F','白色');
insert into category(id, pid, name, created_date, trashed, comment) values('1-5-2','1-5','黑色','2012-06-04 02:00:00','F','黑色');
insert into category(id, pid, name, created_date, trashed, comment) values('1-6','1','尺寸','2012-06-04 02:00:00','F','产品尺寸');
insert into category(id, pid, name, created_date, trashed, comment) values('1-6-1','1-6','40','2012-06-04 02:00:00','F','40');
insert into category(id, pid, name, created_date, trashed, comment) values('1-6-2','1-6','42','2012-06-04 02:00:00','F','42');
insert into category(id, pid, name, created_date, trashed, comment) values('1-6-3','1-6','4','2012-06-04 02:00:00','F','45');


insert into module_category(module_id,category_id) values('M1-4','1-1');
insert into module_category(module_id,category_id) values('M1-4','1-2');
insert into module_category(module_id,category_id) values('M1-5','1-5');
insert into module_category(module_id,category_id) values('M1-5','1-6');


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
insert into product_category(product_id,category_id,picture_id) values(7,'1-6-2',8);
insert into product_category(product_id,category_id,picture_id) values(8,'1-5-1',1);
insert into product_category(product_id,category_id,picture_id) values(8,'1-5-2',2);
insert into product_category(product_id,category_id,picture_id) values(8,'1-6-1',3);
insert into product_category(product_id,category_id,picture_id) values(8,'1-6-2',4);
insert into product_category(product_id,category_id,picture_id) values(9,'1-5-1',2);
insert into product_category(product_id,category_id,picture_id) values(9,'1-5-2',9);
insert into product_category(product_id,category_id,picture_id) values(9,'1-6-1',1);
insert into product_category(product_id,category_id,picture_id) values(9,'1-6-2',3);
insert into product_category(product_id,category_id,picture_id) values(9,'1-6-3',4);




