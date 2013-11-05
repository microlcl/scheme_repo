insert into users(id, name, password, email, register_date, department_id) values('myloginname','admin','691b14d79bf0fa2215f155235df5e670b64394cc','myloginname@sina.com','2012-06-04 01:00:00','D1-1');
insert into users(id, name, password, email, register_date, department_id) values('zhang3','user','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','z2@gmail.com','2012-06-04 02:00:00','D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid1','乔布斯','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','userid1@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid2','乔布斯','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','userid2@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid3','乔布斯','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','userid3@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid4','乔布斯','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','userid4@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid5','乔布斯','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','userid5@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid6','乔布斯','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','userid6@gmail.com', now(),'D1-1');
insert into users(id, name, password, email, register_date, department_id) values('userid7','乔布斯','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','userid7@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, register_date, department_id) values('userid8','乔布斯','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','userid8@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, register_date, department_id) values('userid9','乔布斯','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','userid9@gmail.com', now(),'D1-2');
insert into users(id, name, password, email, register_date, department_id) values('userid99','乔布斯','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','userid10@gmail.com', now(),'D1-2');

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

insert into category(id, pid, name, created_date, trashed, comment) values('1','','类别','2012-06-04 02:00:00','F','分类根节点');
insert into category(id, pid, name, created_date, trashed, comment) values('1-1','1','视频','2012-06-04 02:00:00','F','视频根节点');
insert into category(id, pid, name, created_date, trashed, comment) values('1-1-1','1-1','自拍','2012-06-04 02:00:00','F','自拍的视频');
insert into category(id, pid, name, created_date, trashed, comment) values('1-1-2','1-1','电影','2012-06-04 02:00:00','F','电影片段');