CREATE ALIAS IF NOT EXISTS DATE_FORMAT FOR "com.heeexy.example.util.CommonUtil.dateFormat";



-- 创建文章表
CREATE TABLE article (
                         id INT PRIMARY KEY AUTO_INCREMENT,
                         content VARCHAR(255) DEFAULT '',
                         create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         delete_status VARCHAR(1) DEFAULT '1'
);

-- 创建后台权限表
CREATE TABLE sys_permission (
                                id INT PRIMARY KEY,
                                menu_code VARCHAR(255) DEFAULT '',
                                menu_name VARCHAR(255) DEFAULT '',
                                permission_code VARCHAR(255) DEFAULT '',
                                permission_name VARCHAR(255) DEFAULT '',
                                required_permission BOOLEAN DEFAULT FALSE
);

-- 创建后台角色表
CREATE TABLE sys_role (
                          id INT PRIMARY KEY AUTO_INCREMENT,
                          role_name VARCHAR(20) DEFAULT NULL,
                          create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          delete_status VARCHAR(1) DEFAULT '1'
);

-- 创建角色-权限关联表
CREATE TABLE sys_role_permission (
                                     id INT PRIMARY KEY AUTO_INCREMENT,
                                     role_id INT DEFAULT NULL,
                                     permission_id INT DEFAULT NULL,
                                     create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                     update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                     delete_status VARCHAR(1) DEFAULT '1'
);

-- 创建用户表
CREATE TABLE sys_user (
                          id INT PRIMARY KEY AUTO_INCREMENT,
                          username VARCHAR(255) DEFAULT NULL,
                          password VARCHAR(255) DEFAULT NULL,
                          nickname VARCHAR(255) DEFAULT NULL,
                          create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          delete_status VARCHAR(1) DEFAULT '1'
);

-- 创建用户-角色关联表
CREATE TABLE sys_user_role (
                               id INT PRIMARY KEY AUTO_INCREMENT,
                               user_id INT NOT NULL,
                               role_id INT DEFAULT NULL
);
