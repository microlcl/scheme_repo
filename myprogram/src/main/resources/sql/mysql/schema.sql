drop table if exists users;
drop table if exists category;
drop table if exists modules;
drop table if exists functions;
drop table if exists role_function;
drop table if exists departments;
drop table if exists user_department;
drop table if exists medias;
drop table if exists user_role;

CREATE TABLE `category` (
  `id` varchar(64) NOT NULL,
  `pid` varchar(64) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trashed` varchar(1) NOT NULL,
  `comment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `function_category` (
  `function_id` varchar(64) NOT NULL DEFAULT '',
  `category_id` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`function_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `departments` (
  `department_id` varchar(64) NOT NULL,
   `name` varchar(64) NOT NULL,
  `pid` varchar(64),
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_id` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `functions` (
  `function_id` varchar(64) NOT NULL,
  `module_id` varchar(64) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`function_id`),
  UNIQUE KEY `function_id` (`function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `modules` (
  `module_id` varchar(64) NOT NULL DEFAULT '',
  `pid` varchar(64) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `moduleId` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `role_function` (
  `role_id` varchar(64) NOT NULL,
  `function_id` varchar(64) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`role_id`,`function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `roles` (
  `role_id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_role` (
  `user_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `department_id` varchar(64) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone_num` varchar(20) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `hometown` varchar(64) DEFAULT NULL,
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `register_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(20) DEFAULT NULL,
  `comment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `medias` (
  `media_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `media_type` varchar(10) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `upload_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(128) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `media_category` (
  `media_id` bigint(20) NOT NULL DEFAULT '0',
  `category_id` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`media_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `products` (
  `product_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `default_picture_id` bigint(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `product_category` (
  `product_id` bigint(20) NOT NULL DEFAULT '0',
  `category_id` varchar(64) NOT NULL DEFAULT '',
  `picture_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `module_category` (
  `module_id` varchar(64) NOT NULL DEFAULT '',
  `category_id` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`module_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `holders` (
  `holder_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `holder_name` varchar(32) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  `level` int(1) DEFAULT NULL,
  `contact` varchar(24) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`holder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `spaces` (
  `space_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `holder_id` bigint(11),
  `space_name` varchar(32) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `hall_height` int(11) DEFAULT NULL,
  `stage_length` int(11) DEFAULT NULL,
  `stage_width` int(11) DEFAULT NULL,
  `stage_height` int(11) DEFAULT NULL,
  `attributes` varchar(256) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`space_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `questions` (
	`question_id` bigint(11) NOT NULL AUTO_INCREMENT,
	`question` varchar(256) NOT NULL,
	`question_type` varchar(64) NOT NULL, -- 问题种类：单选，多选，开放式问题等 ,不用在category table里面配置
	`question_options` varchar(512), -- 问题答案选项，用特殊字符^分隔， 如果是开放式问题， 此字段为空
	`business_type` varchar(64), -- 庆典种类：婚庆，生日，公司年会,年终员工调查等，可以在category table配置
	`trashed` varchar(1),
	 PRIMARY KEY (`question_id`)
);

CREATE TABLE `paper_questions` (
	`paper_id` bigint(11) NOT NULL,
	`question_id` bigint(11) NOT NULL,
	`position` int(3) not null, -- 问题在调查问卷中的位置
	PRIMARY KEY (`paper_id`, `question_id`)	
);

CREATE TABLE `question_type` (
	`question_type` varchar(1) NOT NULL,
	`question_name` varchar(16) NOT NULL,
	PRIMARY KEY(`question_type`, `question_name`)
);


CREATE TABLE `paper_answers` (
	`business_id` varchar(64), -- 由business_code与具体业务表的sequence构成
	`paper_id` bigint(11) NOT NULL,
	`question_id` bigint(11) NOT NULL,
	`answer` varchar(256), -- 多选项的答案应该是用逗号隔开的所选答案的index
	PRIMARY KEY (`business_id`,`paper_id`,`question_id`)
);


CREATE TABLE `papers` (
	`paper_id` bigint(11) NOT NULL AUTO_INCREMENT,
	`paper_name` varchar(32) NOT NULL,
	`creat_timestamp` timestamp,
	`status` varchar(64) NOT NULL, -- 调查问卷的状态： draft, publish, trashed,只有publish状态的才能使用。此status在category的系统参数节点下配置，此处保存的是category id.
	`business_type` varchar(64) NOT NULL, -- 庆典种类：婚庆，生日，公司年会,年终员工调查等，可以在category table配置
	PRIMARY KEY (`paper_id`)	
);

CREATE TABLE `cases` (
	`case_id` bigint(11) NOT NULL AUTO_INCREMENT,
	`case_title` varchar(32), -- case的title，比如： 张三的婚庆，李四公司的年会庆典等
	`created_time` timestamp, -- case创建时间戳
	`assigned_department_id` varchar(64), -- assigned 给哪个部门
	`case_owner` varchar(64), -- 这个case的跟单人
	`business_type` varchar(64),   -- 庆典种类：婚庆，生日，公司年会等，可以在category table配置
	`event_time` timestamp,    -- 庆典时间
	`guest_num` int,     -- 客人人数
	`space_id` bigint(11),    -- 庆典地点,关联space table
	`space_tip` varchar(64), -- 庆典地点信息，由前台文字输入。后续跟单者可以根据这个信息完成space_id字段的填写。
	`description` varchar(1024),
	`paper_id` bigint(11),
	`status` varchar(64), -- case的状态（new, in progress, finished, trashed）,配置在category table的系统参数节点下
	`business_code` varchar(6),-- 默认为C, 与case_id 联合组成business_id,与paper_answers table相关联
	 PRIMARY KEY (case_id)
);

CREATE TABLE `visit_activities` (
	`visit_id` bigint(11) NOT NULL AUTO_INCREMENT,
	`customer_id` bigint(11),
	`visit_type` varchar(64), -- 访问类别： 到访，回访，在category table配置
	`visit_stime` timestamp,  -- 默认是系统时间，可以修改
	`visitor_num` int,	-- 到访，回访人数
	`assigned_department_id` varchar(64), -- assigned 给哪个部门
	`recipient` varchar(64),  -- 接待者（前台接待）
	`operator` varchar(64), -- 经办人（跟单者）
	`business_type` varchar(64), -- 庆典种类：婚庆，生日，公司年会等，可以在category table配置
	`case_id` bigint(11),   -- 这次到访是为了哪个case
	`is_visited` varchar(1), -- 是否初次到访： Ture/False
	`comment` varchar(256), -- 备注
	`paper_id` bigint(11), -- 回访单id
	-- 以下4个字段改由动态表单完成，更加灵活
	-- appeal_point varchar(1024), -- 客户信息（诉求）要点
	-- focus_on varchar(1024), -- 客户重点关心
	-- remaining_issues varchar(1024), -- 需要进一步确认的问题
	-- result varchar(1024), -- 洽谈结果
	PRIMARY KEY (`visit_id`)
);