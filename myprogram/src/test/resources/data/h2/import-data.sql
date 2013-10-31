insert into ss_task (id, title, description, user_id) values(1, 'Study PlayFramework 2.0','http://www.playframework.org/', 2);
insert into ss_task (id, title, description, user_id) values(2, 'Study Grails 2.0','http://www.grails.org/', 2);
insert into ss_task (id, title, description, user_id) values(3, 'Try SpringFuse','http://www.springfuse.com/', 2);
insert into ss_task (id, title, description, user_id) values(4, 'Try Spring Roo','http://www.springsource.org/spring-roo', 2);
insert into ss_task (id, title, description, user_id) values(5, 'Release SpringSide 4.0','As soon as posibble.', 2);

insert into users (id, name, password, email, register_date) values('myloginname','admin','691b14d79bf0fa2215f155235df5e670b64394cc','myloginname@sina.com','2012-06-04 01:00:00');
insert into users (id, name, password, email, register_date) values('zhang3','user','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','z2@gmail.com','2012-06-04 02:00:00');
insert into users (id, name, password, email, register_date) values('microlcl','李春雷','2488aa0c31c624687bd9928e0a5d29e7d1ed520b','microlcl@gmail.com', now());

insert into category (id, pid, name, created_date, trashed, comment) values('1','','类别','2012-06-04 02:00:00','F','分类根节点');
insert into category (id, pid, name, created_date, trashed, comment) values('1-1','1','视频','2012-06-04 02:00:00','F','视频根节点');
insert into category (id, pid, name, created_date, trashed, comment) values('1-1-1','1-1','自拍','2012-06-04 02:00:00','F','自拍的视频');
insert into category (id, pid, name, created_date, trashed, comment) values('1-1-2','1-1','电影','2012-06-04 02:00:00','F','电影片段');