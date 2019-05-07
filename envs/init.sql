use mysql;
DROP PROCEDURE if exists init;

DELIMITER //
CREATE PROCEDURE init()
BEGIN
set @user_num = (SELECT count(*) FROM user WHERE User = 'root' AND Host = '%');

CASE @user_num
WHEN 0 THEN
	CREATE USER root@'%' IDENTIFIED BY 'root';
WHEN 1 THEN
	SET PASSWORD FOR 'root'@'%' = PASSWORD('root');
END CASE;

-- 更新权限
GRANT ALL PRIVILEGES ON *.* TO root@"%" IDENTIFIED BY "root";

-- 增加grant权限
UPDATE user SET grant_priv = 'Y' WHERE User = 'root';

-- 刷新权限
FLUSH PRIVILEGES;

END//
DELIMITER ;

CALL init();