INSERT INTO `article` (content, create_time, update_time, delete_status)
VALUES ('莎士比亚', '2017-10-25 09:08:45', '2017-10-30 17:59:41', '1');
INSERT INTO `article` (content, create_time, update_time, delete_status)
VALUES ('亚里士多德', '2017-10-26 10:49:28', '2017-11-18 09:54:15', '1');
INSERT INTO `article` (content, create_time, update_time, delete_status)
VALUES ('亚历山大', '2017-10-26 14:57:45', '2017-11-08 13:28:52', '1');
INSERT INTO `article` (content, create_time, update_time, delete_status)
VALUES ('⭐️demo数据库用的是h2，每次重启服务会重置⭐️', '2017-10-26 15:23:42', '2017-10-26 15:23:42', '1');
INSERT INTO `article` (content, create_time, update_time, delete_status)
VALUES ('文章test2🤣', '2017-11-18 13:37:07', '2021-05-08 16:10:55', '1');

INSERT INTO `sys_permission`
VALUES (101, 'article', '文章管理', 'article:list', '列表', 1);
INSERT INTO `sys_permission`
VALUES (102, 'article', '文章管理', 'article:add', '新增', 0);
INSERT INTO `sys_permission`
VALUES (103, 'article', '文章管理', 'article:update', '修改', 0);
INSERT INTO `sys_permission`
VALUES (601, 'user', '用户', 'user:list', '列表', 1);
INSERT INTO `sys_permission`
VALUES (602, 'user', '用户', 'user:add', '新增', 0);
INSERT INTO `sys_permission`
VALUES (603, 'user', '用户', 'user:update', '修改', 0);
INSERT INTO `sys_permission`
VALUES (701, 'role', '角色权限', 'role:list', '列表', 1);
INSERT INTO `sys_permission`
VALUES (702, 'role', '角色权限', 'role:add', '新增', 0);
INSERT INTO `sys_permission`
VALUES (703, 'role', '角色权限', 'role:update', '修改', 0);
INSERT INTO `sys_permission`
VALUES (704, 'role', '角色权限', 'role:delete', '删除', 0);

INSERT INTO `sys_role` (role_name, create_time, update_time, delete_status)
VALUES ('管理员', '2017-11-22 16:24:34', '2017-11-22 16:24:52', '1');
INSERT INTO `sys_role` (role_name, create_time, update_time, delete_status)
VALUES ('作家🌝', '2017-11-22 16:24:34', '2021-05-08 16:11:27', '1');
INSERT INTO `sys_role` (role_name, create_time, update_time, delete_status)
VALUES ('程序员', '2017-11-22 16:28:47', '2017-11-22 16:28:47', '1');
INSERT INTO `sys_role` (role_name, create_time, update_time, delete_status)
VALUES ('只有文章', '2021-05-08 23:21:42', '2021-05-08 23:26:03', '1');

INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (2, 101, '2017-11-22 16:26:21', '2017-11-22 16:26:32', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (2, 102, '2017-11-22 16:26:21', '2017-11-22 16:26:32', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (2, 602, '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (2, 601, '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (2, 603, '2017-11-22 16:28:28', '2021-05-08 16:11:27', '2');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (2, 703, '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (2, 701, '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (2, 702, '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (2, 704, '2017-11-22 16:28:31', '2017-11-22 16:28:31', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (2, 103, '2017-11-22 16:28:31', '2017-11-22 16:28:31', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (3, 601, '2017-11-22 16:28:47', '2017-11-22 16:28:47', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (3, 701, '2017-11-22 16:28:47', '2017-11-22 16:28:47', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (3, 702, '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (3, 704, '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (3, 102, '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (3, 101, '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (3, 603, '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (4, 101, '2021-05-08 23:21:42', '2021-05-08 23:21:42', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (4, 102, '2021-05-08 23:21:42', '2021-05-08 23:21:42', '1');
INSERT INTO `sys_role_permission` (role_id, permission_id, create_time, update_time, delete_status)
VALUES (4, 103, '2021-05-08 23:21:42', '2021-05-08 23:21:42', '1');

INSERT INTO `sys_user` (id, username, password, nickname, create_time, update_time, delete_status)
VALUES (10001, 'admin', '123456', '超级用户', '2017-10-30 11:52:38', '2021-05-08 23:26:56', '1');
INSERT INTO `sys_user` (id, username, password, nickname, create_time, update_time, delete_status)
VALUES (10004, 'user', '123456', '莎士比亚😘', '2017-10-30 16:13:02', '2021-05-08 16:11:13', '1');
INSERT INTO `sys_user` (id, username, password, nickname, create_time, update_time, delete_status)
VALUES (10005, 'aaa', '123456', '🌹', '2017-11-15 14:02:56', '2021-05-08 23:26:23', '1');
INSERT INTO `sys_user` (id, username, password, nickname, create_time, update_time, delete_status)
VALUES (10007, 'test', '123456', '就看看列表', '2017-11-22 16:29:41', '2021-05-08 23:28:44', '2');
INSERT INTO `sys_user` (id, username, password, nickname, create_time, update_time, delete_status)
VALUES (10008, 'sa', '1', '😯', '2021-05-08 23:21:54', '2021-05-08 23:26:32', '1');

INSERT INTO `sys_user_role`
VALUES (30000, 10004, 2);
INSERT INTO `sys_user_role`
VALUES (40000, 10004, 3);
INSERT INTO `sys_user_role`
VALUES (90000, 10005, 1);
INSERT INTO `sys_user_role`
VALUES (100000, 10005, 2);
INSERT INTO `sys_user_role`
VALUES (110000, 10008, 4);
INSERT INTO `sys_user_role`
VALUES (120000, 10001, 1);
INSERT INTO `sys_user_role`
VALUES (130000, 10007, 1);

