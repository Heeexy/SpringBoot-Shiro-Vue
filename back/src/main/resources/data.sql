
INSERT INTO `article` VALUES (5, '莎士比亚', '2017-10-25 09:08:45', '2017-10-30 17:59:41', '1');
INSERT INTO `article` VALUES (6, '亚里士多德', '2017-10-26 10:49:28', '2017-11-18 09:54:15', '1');
INSERT INTO `article` VALUES (10, '亚历山大', '2017-10-26 14:57:45', '2017-11-08 13:28:52', '1');
INSERT INTO `article` VALUES (11, '李白', '2017-10-26 15:23:42', '2017-10-26 15:23:42', '1');
INSERT INTO `article` VALUES (19, '文章test2🤣', '2017-11-18 13:37:07', '2021-05-08 16:10:55', '1');

INSERT INTO `sys_permission` VALUES (101, 'article', '文章管理', 'article:list', '列表', 1);
INSERT INTO `sys_permission` VALUES (102, 'article', '文章管理', 'article:add', '新增', 2);
INSERT INTO `sys_permission` VALUES (103, 'article', '文章管理', 'article:update', '修改', 2);
INSERT INTO `sys_permission` VALUES (601, 'user', '用户', 'user:list', '列表', 1);
INSERT INTO `sys_permission` VALUES (602, 'user', '用户', 'user:add', '新增', 2);
INSERT INTO `sys_permission` VALUES (603, 'user', '用户', 'user:update', '修改', 2);
INSERT INTO `sys_permission` VALUES (701, 'role', '角色权限', 'role:list', '列表', 1);
INSERT INTO `sys_permission` VALUES (702, 'role', '角色权限', 'role:add', '新增', 2);
INSERT INTO `sys_permission` VALUES (703, 'role', '角色权限', 'role:update', '修改', 2);
INSERT INTO `sys_permission` VALUES (704, 'role', '角色权限', 'role:delete', '删除', 2);

INSERT INTO `sys_role` VALUES (1, '管理员', '2017-11-22 16:24:34', '2017-11-22 16:24:52', '1');
INSERT INTO `sys_role` VALUES (2, '作家🌝', '2017-11-22 16:24:34', '2021-05-08 16:11:27', '1');
INSERT INTO `sys_role` VALUES (3, '程序员', '2017-11-22 16:28:47', '2017-11-22 16:28:47', '1');
INSERT INTO `sys_role` VALUES (4, '只有文章', '2021-05-08 23:21:42', '2021-05-08 23:26:03', '1');

INSERT INTO `sys_role_permission` VALUES (1, 2, 101, '2017-11-22 16:26:21', '2017-11-22 16:26:32', '1');
INSERT INTO `sys_role_permission` VALUES (2, 2, 102, '2017-11-22 16:26:21', '2017-11-22 16:26:32', '1');
INSERT INTO `sys_role_permission` VALUES (5, 2, 602, '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` VALUES (6, 2, 601, '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` VALUES (7, 2, 603, '2017-11-22 16:28:28', '2021-05-08 16:11:27', '2');
INSERT INTO `sys_role_permission` VALUES (8, 2, 703, '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` VALUES (9, 2, 701, '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` VALUES (10, 2, 702, '2017-11-22 16:28:28', '2017-11-22 16:28:28', '1');
INSERT INTO `sys_role_permission` VALUES (11, 2, 704, '2017-11-22 16:28:31', '2017-11-22 16:28:31', '1');
INSERT INTO `sys_role_permission` VALUES (12, 2, 103, '2017-11-22 16:28:31', '2017-11-22 16:28:31', '1');
INSERT INTO `sys_role_permission` VALUES (13, 3, 601, '2017-11-22 16:28:47', '2017-11-22 16:28:47', '1');
INSERT INTO `sys_role_permission` VALUES (14, 3, 701, '2017-11-22 16:28:47', '2017-11-22 16:28:47', '1');
INSERT INTO `sys_role_permission` VALUES (15, 3, 702, '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` VALUES (16, 3, 704, '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` VALUES (17, 3, 102, '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` VALUES (18, 3, 101, '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` VALUES (19, 3, 603, '2017-11-22 16:35:01', '2017-11-22 16:35:01', '1');
INSERT INTO `sys_role_permission` VALUES (20, 4, 101, '2021-05-08 23:21:42', '2021-05-08 23:21:42', '1');
INSERT INTO `sys_role_permission` VALUES (21, 4, 102, '2021-05-08 23:21:42', '2021-05-08 23:21:42', '1');
INSERT INTO `sys_role_permission` VALUES (22, 4, 103, '2021-05-08 23:21:42', '2021-05-08 23:21:42', '1');

INSERT INTO `sys_user` VALUES (10001, 'admin', '123456', '超级用户', '2017-10-30 11:52:38', '2021-05-08 23:26:56', '1');
INSERT INTO `sys_user` VALUES (10004, 'user', '123456', '莎士比亚😘', '2017-10-30 16:13:02', '2021-05-08 16:11:13', '1');
INSERT INTO `sys_user` VALUES (10005, 'aaa', '123456', '🌹', '2017-11-15 14:02:56', '2021-05-08 23:26:23', '1');
INSERT INTO `sys_user` VALUES (10007, 'test', '123456', '就看看列表', '2017-11-22 16:29:41', '2021-05-08 23:28:44', '2');
INSERT INTO `sys_user` VALUES (10008, 'sa', '1', '😯', '2021-05-08 23:21:54', '2021-05-08 23:26:32', '1');

INSERT INTO `sys_user_role` VALUES (1, 10001, 1);
INSERT INTO `sys_user_role` VALUES (3, 10004, 2);
INSERT INTO `sys_user_role` VALUES (4, 10004, 3);
INSERT INTO `sys_user_role` VALUES (9, 10005, 1);
INSERT INTO `sys_user_role` VALUES (10, 10005, 2);
INSERT INTO `sys_user_role` VALUES (11, 10008, 4);
INSERT INTO `sys_user_role` VALUES (13, 10007, 1);
