-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2023 at 01:14 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tasktrackingsystem`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addProject` (IN `project_name` VARCHAR(255), IN `start_date` DATE, IN `deadline` DATE, IN `user_id` INT)   BEGIN
    INSERT INTO project_project(ProjectName, StartDate, Deadline, user_id)
    VALUES (project_name, start_date, deadline, user_id);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `checkCredentials` (IN `p_username` VARCHAR(15), IN `p_password` VARCHAR(15))   BEGIN
	DECLARE p_result INT;
    DECLARE p_user_id INT;
    SELECT COUNT(*) INTO p_result
    FROM user_user
    WHERE username = p_username AND password = p_password;

    IF p_result > 0 THEN
        SELECT user_id INTO p_user_id
        FROM user_user
        WHERE username = p_username AND password = p_password;
    END IF;

    SELECT p_result AS result, p_user_id AS user_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteProject` (IN `p_project_id` INT)   BEGIN
    DELETE FROM project_project WHERE 
    ProjectID = p_project_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteTask` (IN `p_TaskId` INT)   BEGIN
    DELETE FROM task_task WHERE TaskId = p_TaskId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `editTask` (IN `p_TaskID` INT(11), IN `p_TaskName` VARCHAR(255), IN `p_Description` VARCHAR(255), IN `p_Status` VARCHAR(25), IN `p_Priority` VARCHAR(255), IN `p_DueDate` DATE)   BEGIN
    UPDATE task_task
    SET
        TaskName = p_TaskName,
        Description = p_Description,
        Status = p_Status,
        Priority = p_Priority,
        DueDate = p_DueDate
    WHERE TaskID = p_TaskID;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser` (IN `uname` VARCHAR(30), IN `pwd` VARCHAR(30), IN `email` VARCHAR(30), IN `fname` VARCHAR(30), IN `lname` VARCHAR(30), OUT `result` INT(30))   begin
	declare ctr int;
    
    select count(*) into ctr from user_user where username=uname;
    
    if ctr=0 THEN
    	insert into user_user(Username, Password, Email, Firstname, Lastname)
        value(uname, pwd, email, fname, lname);
        set result = 'new user added';
    ELSE
    	set result =  concat(uname,' username is already existing.');
    end if;
    select result;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add leader', 8, 'add_leader'),
(30, 'Can change leader', 8, 'change_leader'),
(31, 'Can delete leader', 8, 'delete_leader'),
(32, 'Can view leader', 8, 'view_leader'),
(33, 'Can add project', 9, 'add_project'),
(34, 'Can change project', 9, 'change_project'),
(35, 'Can delete project', 9, 'delete_project'),
(36, 'Can view project', 9, 'view_project'),
(37, 'Can add task', 10, 'add_task'),
(38, 'Can change task', 10, 'change_task'),
(39, 'Can delete task', 10, 'delete_task'),
(40, 'Can view task', 10, 'view_task'),
(41, 'Can add member_ role', 11, 'add_member_role'),
(42, 'Can change member_ role', 11, 'change_member_role'),
(43, 'Can delete member_ role', 11, 'delete_member_role'),
(44, 'Can view member_ role', 11, 'view_member_role'),
(45, 'Can add achievement', 12, 'add_achievement'),
(46, 'Can change achievement', 12, 'change_achievement'),
(47, 'Can delete achievement', 12, 'delete_achievement'),
(48, 'Can view achievement', 12, 'view_achievement'),
(49, 'Can add skill', 13, 'add_skill'),
(50, 'Can change skill', 13, 'change_skill'),
(51, 'Can delete skill', 13, 'delete_skill'),
(52, 'Can view skill', 13, 'view_skill'),
(53, 'Can add capabilities', 14, 'add_capabilities'),
(54, 'Can change capabilities', 14, 'change_capabilities'),
(55, 'Can delete capabilities', 14, 'delete_capabilities'),
(56, 'Can view capabilities', 14, 'view_capabilities');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$v8ubg0fBiMCMKlj89bvdlU$5h2HsiY+1Th+m/XhHa6mqlQBlKpk7CBoLl5rVCF0WQk=', '2023-11-05 06:14:27.405118', 1, 'admin', '', '', 'edwardjohn.camarillo@cit.edu', 1, 1, '2023-10-09 04:22:06.562983');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capabilities_achievement`
--

CREATE TABLE `capabilities_achievement` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capabilities_capabilities`
--

CREATE TABLE `capabilities_capabilities` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capabilities_capabilities_achievements`
--

CREATE TABLE `capabilities_capabilities_achievements` (
  `id` bigint(20) NOT NULL,
  `capabilities_id` bigint(20) NOT NULL,
  `achievement_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capabilities_capabilities_skills`
--

CREATE TABLE `capabilities_capabilities_skills` (
  `id` bigint(20) NOT NULL,
  `capabilities_id` bigint(20) NOT NULL,
  `skill_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capabilities_skill`
--

CREATE TABLE `capabilities_skill` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-10-15 08:57:09.815875', '14', 'Testing', 3, '', 7, 1),
(2, '2023-10-15 08:57:09.919841', '13', 'Testing', 3, '', 7, 1),
(3, '2023-10-15 08:57:09.933837', '12', 'Testing', 3, '', 7, 1),
(4, '2023-10-15 08:57:10.035809', '11', 'Testing', 3, '', 7, 1),
(5, '2023-10-15 08:57:10.108782', '10', 'usernametest', 3, '', 7, 1),
(6, '2023-10-15 08:57:10.120786', '9', 'usernametest', 3, '', 7, 1),
(7, '2023-10-15 08:57:10.133790', '8', 'usernametest', 3, '', 7, 1),
(8, '2023-10-15 08:57:10.145862', '7', 'usernametest', 3, '', 7, 1),
(9, '2023-10-15 08:57:10.157756', '6', 'usernametest', 3, '', 7, 1),
(10, '2023-10-15 08:57:10.188248', '5', 'Testing', 3, '', 7, 1),
(11, '2023-10-15 08:57:10.216786', '4', 'Testing', 3, '', 7, 1),
(12, '2023-10-15 08:57:10.254645', '3', 'Testing', 3, '', 7, 1),
(13, '2023-10-15 08:57:10.283794', '2', 'Testing', 3, '', 7, 1),
(14, '2023-10-15 08:57:10.326935', '1', 'Testing', 3, '', 7, 1),
(15, '2023-11-04 10:41:40.215759', '16', 'testuser', 3, '', 7, 1),
(16, '2023-11-04 10:41:40.695827', '15', 'testuser', 3, '', 7, 1),
(17, '2023-11-04 10:49:27.794241', '17', 'user1', 3, '', 7, 1),
(18, '2023-11-04 11:15:16.336486', '18', 'user1', 3, '', 7, 1),
(19, '2023-11-04 12:36:56.896544', '19', 'user1', 3, '', 7, 1),
(20, '2023-11-05 03:46:12.108811', '20', 'user1', 3, '', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(12, 'capabilities', 'achievement'),
(14, 'capabilities', 'capabilities'),
(13, 'capabilities', 'skill'),
(5, 'contenttypes', 'contenttype'),
(8, 'leader', 'leader'),
(11, 'member_role', 'member_role'),
(9, 'project', 'project'),
(6, 'sessions', 'session'),
(10, 'task', 'task'),
(7, 'user', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-10-09 04:20:47.125466'),
(2, 'auth', '0001_initial', '2023-10-09 04:20:52.288440'),
(3, 'admin', '0001_initial', '2023-10-09 04:20:54.281871'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-10-09 04:20:54.337858'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-09 04:20:54.377844'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-10-09 04:20:54.794350'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-10-09 04:20:55.375174'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-10-09 04:20:55.504124'),
(9, 'auth', '0004_alter_user_username_opts', '2023-10-09 04:20:55.576105'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-10-09 04:20:56.182913'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-10-09 04:20:56.227915'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-10-09 04:20:56.278901'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-10-09 04:20:56.386998'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-10-09 04:20:56.490963'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-10-09 04:20:56.688900'),
(16, 'auth', '0011_update_proxy_permissions', '2023-10-09 04:20:56.726888'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-10-09 04:20:56.834855'),
(18, 'capabilities', '0001_initial', '2023-10-09 04:21:00.713350'),
(19, 'user', '0001_initial', '2023-10-09 04:21:01.004256'),
(20, 'leader', '0001_initial', '2023-10-09 04:21:02.868264'),
(21, 'member_role', '0001_initial', '2023-10-09 04:21:03.944922'),
(22, 'project', '0001_initial', '2023-10-09 04:21:04.923955'),
(23, 'sessions', '0001_initial', '2023-10-09 04:21:05.183872'),
(24, 'task', '0001_initial', '2023-10-09 04:21:05.609737'),
(25, 'user', '0002_rename_userid_user_user_id', '2023-10-09 04:21:05.797676'),
(26, 'task', '0002_alter_task_status', '2023-12-10 04:46:33.817856');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0th2dgiawo4etjeqy6d8rd6th18wiwwx', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUtw:AIpYtIz0QXUoIBjhRzNqLzgByMBlOSpZ9Dk6dJbztQo', '2023-11-19 04:38:20.763189'),
('1w05of8mvheok2h3evp2qg8g1slxlyky', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUnB:nO2MBFv1ptxhXiI12g88AG_y3cZotkr7uuVEw2GsPTg', '2023-11-19 04:31:21.025346'),
('22z9b41o3dvi0h13i6p9pm0bf4muk75u', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUu9:oh1mA1r00l89gAUNPtCbArmWwzJFMUA3tL0BOpswsNI', '2023-11-19 04:38:33.084531'),
('2geycu7gq0yxy5azf1cmn55rcsg44gka', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUXT:PJXeyjQVSzKuLsbsSSxKBUC_MfUiNlp__6lcjkqliEk', '2023-11-19 04:15:07.520023'),
('49i937ylg1xh71hfhm0oqj9fucganvzw', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzVWa:Zyf-HV5EYzG3UatTwmg63c5OhaKiirUWTQFo2dHGLTA', '2023-11-19 05:18:16.658152'),
('52m7gi6h1e2jdjrb1lpiejghsz4iu4mi', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzVLt:JjbHzvc3fMNif9IKXJw6MjR4RY6mgfLzW7jtXgu65j0', '2023-11-19 05:07:13.469894'),
('5p8zp272vzse4cqaakslo8i28jqlafx3', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzV60:Xz0oI2UTQfKSl03tFFGeQsRF-WeAavdawlyjrDFU33E', '2023-11-19 04:50:48.604940'),
('64y6h74vta25p736xwczryb4flsgnvph', 'eyJ1c2VybmFtZSI6InVzZXIxIiwidXNlcl9pZCI6MjF9:1rDgk1:Otc4zvAu4fXdj6U33N1t-FE2VeAVFhsgnZ-g8vW1AbA', '2023-12-28 08:06:45.607450'),
('6uxe18uhre1ywi3kfx5xpc79tumminur', '.eJxVjMsOwiAQRf-FtSG8GVy69xvIDFCpGkhKuzL-uzbpQrf3nHNfLOK21riNssQ5szOT7PS7EaZHaTvId2y3zlNv6zIT3xV-0MGvPZfn5XD_DiqO-q0deoGTs04H4ROEIJUNZECHYhRKK5WRAjJMoIXVglBpT2SyN9aBNY69P6SONf0:1qzEwK:2MseNDZe2LgOUKFFBu4IBo4NTgqmzRQQex5e7P6EcfM', '2023-11-18 11:35:44.553879'),
('780pp0zeo1r5668vnt32t0ir278pw2bu', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUu0:wQXeDIntQaZWBLw_E0BMmFdPgou6U0qC2_6SpMicVYw', '2023-11-19 04:38:24.072313'),
('7fijzhihwo4p6qx5gceskuoamr59wbq2', '.eJxVjMsOwiAQRf-FtSG8GVy69xvIDFCpGkhKuzL-uzbpQrf3nHNfLOK21riNssQ5szOT7PS7EaZHaTvId2y3zlNv6zIT3xV-0MGvPZfn5XD_DiqO-q0deoGTs04H4ROEIJUNZECHYhRKK5WRAjJMoIXVglBpT2SyN9aBNY69P6SONf0:1qphmr:Hpx5dZ9bkOEC8COOB9riEdWvTTzIiqEx9DMmUnN0e1s', '2023-10-23 04:22:33.745262'),
('7hdqzuglftwax6aypkz2cs58r96pcc63', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzVzS:JfWrQOxfRcWhf1BL7cMI9u3LUj9vIxF6zgE7PJ6unR4', '2023-11-19 05:48:06.821902'),
('7jkzvv9s5gsgci7kxkfclybgbpzo4ji5', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzVIS:Ijkt6wEJmY_fTgvyG7VMh_cEJ5FLW6Zg7nnUsc9Ychk', '2023-11-19 05:03:40.470606'),
('7oulusxty30d02llx3uz7cxej3ogqcxw', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUa8:MxQDpu8LMiDNcddKieDb15WhGZDcfQOh9SvKDDNkGXI', '2023-11-19 04:17:52.935159'),
('98japwosyenl8hlo392ww6j4ilgizlyr', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUqp:chRjKCf3XDzT4U2JTPL7OoMvgux8YljgAW5G89ryF-s', '2023-11-19 04:35:07.460359'),
('9dd1igy7z8tauwewxb1ahe0o7kv6g960', '.eJxVjMsOwiAQRf-FtSG8GVy69xvIDFCpGkhKuzL-uzbpQrf3nHNfLOK21riNssQ5szOT7PS7EaZHaTvId2y3zlNv6zIT3xV-0MGvPZfn5XD_DiqO-q0deoGTs04H4ROEIJUNZECHYhRKK5WRAjJMoIXVglBpT2SyN9aBNY69P6SONf0:1qz8J9:6A0cqBtQLEa_-9HrGviZvEclODy2xnAxut5hKUH83YA', '2023-11-18 04:30:51.822436'),
('akfrna3ks5ej8vtf780kb5fsc4019e2g', '.eJxdjDkOwjAURO_iGlneF0r6nMH633ZwWGwpS4W4OzFKA93MvJl5kW3Jc4VnJuev5OREAmxrCd2FKe35X4YQ77l2kG5Qr43GVtd5Qtor9KALHVrKj8vR_TkosJR9bcAyGI020jMbnfdcaI_KSZ-VAK65UJy55EYnmZYMQUiLqJJV2jitDHl_ABYVPDs:1qzWOW:mdzaSyMPMHA5485pm8B-KfraOPcGJgPegBA6D3kreuY', '2023-11-19 06:14:00.803211'),
('buj00xsjjdito31cv4nkrascryctd9m6', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUbu:egvKPfpKvdWthaV8o8aiZbuoFdmBLaPiRe0vc2jh9yU', '2023-11-19 04:19:42.606874'),
('ca1sejmic5qb9za2ifhwkj8anc3v15be', '.eJxVjMsOwiAQRf-FtSG8GVy69xvIDFCpGkhKuzL-uzbpQrf3nHNfLOK21riNssQ5szOT7PS7EaZHaTvId2y3zlNv6zIT3xV-0MGvPZfn5XD_DiqO-q0deoGTs04H4ROEIJUNZECHYhRKK5WRAjJMoIXVglBpT2SyN9aBNY69P6SONf0:1qzEcG:wTTYfQ-hddyd5LpOaeMSNnbgvWc0y1gsdUrRbSF5V1I', '2023-11-18 11:15:00.710598'),
('fh3tzfyfrmbou2w7squaaqibv7lpso7l', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUdP:GfngWgBnepZcU-uxSK51ICizf6gB9DWbAx0lNlGGyvM', '2023-11-19 04:21:15.495591'),
('fsvq85ak70wrusq4djoyu9orsvzpkqaa', 'e30:1qzXJe:mwTTUoMOh1gliMw11Dxl85PYxi9IGhXxkqVPFSKhFgs', '2023-11-19 07:13:02.089981'),
('hxk3ttuk1lcyl23r7v4z3gp5q8f5mvn2', '.eJxVjDcOAyEURO9CbSHSJ7h07zOgT1izDiBtqCzf3SBtYXejmTfvTTzuW_H7mhc_J3ImnJx-u4DxkesY0h3rrdHY6rbMgQ6EHutKry3l5-Vg_wQF19LfGg3DSYOWjploneMCXFBWuqwEcuBCcWaTnaxkIFlAIU0IKhkF2oLSXTp0FV-520bk5PMF42o8Ow:1qzUCw:Tp1BhJb4wwN3PJeTdKlTU0Na32kG31NiHbTvp5kDDqg', '2023-11-19 03:53:54.477791'),
('ikn48l6vjwbqw0r7j5lq87my539upl6e', 'eyJ1c2VyX2lkIjoyMH0:1qzTzs:fMBgxrTp4ni4J6ubUeZ_6EOhAKKqjk68DewS9VcPp40', '2023-11-19 03:40:24.294537'),
('j1jouh4y8hmf9ed3eytv1xdarm3j4fke', '.eJxVjMsOwiAQRf-FtSG8GVy69xvIDFCpGkhKuzL-uzbpQrf3nHNfLOK21riNssQ5szOT7PS7EaZHaTvId2y3zlNv6zIT3xV-0MGvPZfn5XD_DiqO-q0deoGTs04H4ROEIJUNZECHYhRKK5WRAjJMoIXVglBpT2SyN9aBNY69P6SONf0:1qzGVz:C7NaxEVwDLVAgNcNMNo3lwxK3uXrIW1MOWWuNy9QQGM', '2023-11-18 13:16:39.908960'),
('kj8kuws5xr9k3s42ax3clkoigxx8x7py', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUZm:YztRwJHy9alSfKJXilFNu55aeQ18W2ds_4fIX42gMvg', '2023-11-19 04:17:30.413004'),
('lmd0mh2eo2e397t265ei6qyexcxd1qoq', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUgl:8jaw8Ueza-mqq1LLJKfDz3W1xd_N3H6wcxkOg24vKyI', '2023-11-19 04:24:43.102795'),
('mc07g6ieh6avsgpyo45c8m8hjrkgl344', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUY2:dgk5P4rUxOToS5HpUaKJZegoyyJ7CmNfr0ZHF3_q1ys', '2023-11-19 04:15:42.207631'),
('u9tpggwbt3ymjjy3tqlfvi1soa25aak5', 'e30:1qzzBE:osIAgfgFUtjcnUa5SLruQQrdzszptwff6rgsC9AiLYc', '2023-11-20 12:58:12.223470'),
('ujjhusv9fg5a5yu5vuha3g510hc6t497', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUlq:GZu9xwr-rdN9cPAf2FiOMqVtpuOmW7QvFQP-muO5S_8', '2023-11-19 04:29:58.746094'),
('vlyqgattnvf327ajwjbr07nits74gfq1', 'e30:1qzXNW:wjWfP_wzAYZVqhCLq-lhnCgEXUAt991gbrpndAKJCBI', '2023-11-19 07:17:02.822712'),
('yhea1876xpsy1aclcxwlvnuuigche992', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzVgu:fhchNyQx8pdtJvjs8prK0TOXhEqVQWnSLPkyloH_Eg0', '2023-11-19 05:28:56.236463'),
('yvwh0e08rqpdwus76tzubs2td8ilafp7', '.eJxVjMsOwiAQRf-FtSG8GVy69xvIDFCpGkhKuzL-uzbpQrf3nHNfLOK21riNssQ5szOT7PS7EaZHaTvId2y3zlNv6zIT3xV-0MGvPZfn5XD_DiqO-q0deoGTs04H4ROEIJUNZECHYhRKK5WRAjJMoIXVglBpT2SyN9aBNY69P6SONf0:1qzHCv:ivsighPsnZdiOTCKUWp_tQpCElm69sDZ0uf2jzQ-zzI', '2023-11-18 14:01:01.307978'),
('zipk0w3o1fq72x0395fttzpmb3t7a6xa', 'eyJ1c2VybmFtZSI6InVzZXIxIn0:1qzUZE:q2Os97HkvcVXjHUNP9u5MrN-vchG9pY2TcO9gxA-XDc', '2023-11-19 04:16:56.158772');

-- --------------------------------------------------------

--
-- Table structure for table `leader_leader`
--

CREATE TABLE `leader_leader` (
  `LeaderID` int(11) NOT NULL,
  `UserID_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_role_member_role`
--

CREATE TABLE `member_role_member_role` (
  `RoleName` varchar(100) NOT NULL,
  `AssignDate` date NOT NULL,
  `LeaderID_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_project`
--

CREATE TABLE `project_project` (
  `ProjectID` int(11) NOT NULL,
  `ProjectName` varchar(255) NOT NULL,
  `StartDate` date NOT NULL,
  `Deadline` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_project`
--

INSERT INTO `project_project` (`ProjectID`, `ProjectName`, `StartDate`, `Deadline`, `user_id`) VALUES
(1, 'testproject', '2023-12-08', '2023-12-29', 21),
(3, 'meme project', '2023-12-05', '2023-12-31', 21),
(5, 'user2\'s project', '2023-12-02', '2023-12-25', 22),
(6, 'i love botan', '2023-12-01', '2024-03-21', 21),
(17, 'memeguy\'s project test', '2023-12-14', '2024-03-02', 26),
(18, 'Exams', '2023-12-15', '2023-12-23', 21),
(19, 'Task Tracking Project', '2023-11-14', '2023-12-18', 21);

-- --------------------------------------------------------

--
-- Table structure for table `task_task`
--

CREATE TABLE `task_task` (
  `TaskId` int(11) NOT NULL,
  `TaskName` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Status` varchar(25) NOT NULL,
  `Priority` varchar(255) NOT NULL,
  `DueDate` date NOT NULL,
  `Project_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task_task`
--

INSERT INTO `task_task` (`TaskId`, `TaskName`, `Description`, `Status`, `Priority`, `DueDate`, `Project_id`) VALUES
(12, 'test task', 'test task description', 'In Progress', 'High', '2024-01-06', 1),
(13, 'another task', 'description for this task', 'Done', 'Low', '2024-01-06', 1),
(14, 'marry botan', 'yes i love her', 'To Do', 'High', '2023-12-30', 6),
(15, 'some other task', 'i guess', 'To Do', 'Medium', '2024-01-27', 1),
(16, 'skibidi gyat toilet ohio rizzler 420', 'test', 'In Progress', 'Low', '2024-01-05', 1),
(21, 'nothing here', 'some description about say gex here', 'In Progress', 'Low', '2023-12-12', 3),
(27, 'testing', 'xddddd', 'Done', 'Medium', '2023-12-22', 3),
(28, 'no man', 'xddddd', 'To Do', 'High', '2023-12-22', 3),
(30, 'test task', 'xddxdxd', 'In Progress', 'Medium', '2023-12-01', 5),
(37, 'meme someone', 'make a meme of someone hell yeah', 'In Progress', 'Medium', '2023-12-30', 17),
(39, 'IM2 Exam', 'CASE Room | Bring laptop\r\n\r\nCoverage:\r\nDjango (Project, Model, Form, Session)\r\nSQL until Stored Procedure', 'In Progress', 'High', '2023-12-15', 18),
(40, 'IM2 Project Presentation', 'Online project presentation', 'To Do', 'High', '2023-12-18', 18),
(41, 'Project creation view and form', 'Create the form and view for project creation which saves the project to the database with current logged in user as user ID', 'Done', 'High', '2023-12-02', 19),
(42, 'Create project list for side nav', 'Create a working project list that the logged in user owns. Have them displayed in the left side bar.', 'Done', 'Medium', '2023-12-08', 19),
(43, 'Task create/add view and form', 'Create a pop up window for the add task form', 'Done', 'High', '2023-12-09', 19),
(44, 'Create task list for task menu', 'Have a list of tasks of the current project owned by the logged in user displayed on the main body', 'Done', 'High', '2023-12-09', 19),
(45, 'Add option to edit task', 'Have an edit task window pop up upon clicking a task in the task list. Updates the selected task in the database', 'Done', 'Medium', '2023-12-10', 19),
(46, 'Project Deletion button', 'Create a button to delete the current project', 'Done', 'Medium', '2023-12-10', 19),
(47, 'Task Deletion button', 'Add an option to delete the current selected project, inside the edit task container', 'Done', 'Medium', '2023-12-10', 19),
(48, 'Style everything accordingly', 'Code the css for everything', 'Done', 'Low', '2023-12-10', 19),
(49, 'Add option to edit project', 'On the top right dropdown into Settings, have a window popup for Project Settings in order to edit the project.', 'In Progress', 'Medium', '2023-12-16', 19),
(50, 'Edit user profile view and form', 'Create a new view and form for the user profile to allow editing. Allow user to edit first name, last name, etc.', 'To Do', 'Medium', '2023-12-17', 19),
(51, 'Edit user account view and form', 'Use same view for user profile edit but with different form. Have user edit their details like username and password.', 'To Do', 'Medium', '2023-12-17', 19);

-- --------------------------------------------------------

--
-- Table structure for table `user_user`
--

CREATE TABLE `user_user` (
  `user_id` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Firstname` varchar(255) NOT NULL,
  `Lastname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_user`
--

INSERT INTO `user_user` (`user_id`, `Username`, `Password`, `Email`, `Firstname`, `Lastname`) VALUES
(21, 'user1', 'user1', 'user1@gmail.com', 'user', 'abuser'),
(22, 'user2', 'user2', 'user2@gmail.com', 'usermeme', 'memer'),
(23, 'testuser', 'testuser', 'testuser@gmail.com', 'user', 'test'),
(24, 'erurina', 'erurina', 'shishiro', 'erurina@gmail.com', 'botan'),
(26, 'memeguy', 'memeguy', 'meme', 'memeguy@gmail.com', 'guy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `capabilities_achievement`
--
ALTER TABLE `capabilities_achievement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `capabilities_capabilities`
--
ALTER TABLE `capabilities_capabilities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `capabilities_capabilities_user_id_e3f83353_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `capabilities_capabilities_achievements`
--
ALTER TABLE `capabilities_capabilities_achievements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `capabilities_capabilitie_capabilities_id_achievem_06765b16_uniq` (`capabilities_id`,`achievement_id`),
  ADD KEY `capabilities_capabil_achievement_id_6cf1d128_fk_capabilit` (`achievement_id`);

--
-- Indexes for table `capabilities_capabilities_skills`
--
ALTER TABLE `capabilities_capabilities_skills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `capabilities_capabilitie_capabilities_id_skill_id_671fbda6_uniq` (`capabilities_id`,`skill_id`),
  ADD KEY `capabilities_capabil_skill_id_d3330d7d_fk_capabilit` (`skill_id`);

--
-- Indexes for table `capabilities_skill`
--
ALTER TABLE `capabilities_skill`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `leader_leader`
--
ALTER TABLE `leader_leader`
  ADD PRIMARY KEY (`LeaderID`),
  ADD UNIQUE KEY `UserID_id` (`UserID_id`);

--
-- Indexes for table `member_role_member_role`
--
ALTER TABLE `member_role_member_role`
  ADD PRIMARY KEY (`RoleName`),
  ADD KEY `member_role_member_r_LeaderID_id_872073c0_fk_leader_le` (`LeaderID_id`);

--
-- Indexes for table `project_project`
--
ALTER TABLE `project_project`
  ADD PRIMARY KEY (`ProjectID`),
  ADD KEY `project_project_ibfk_1` (`user_id`);

--
-- Indexes for table `task_task`
--
ALTER TABLE `task_task`
  ADD PRIMARY KEY (`TaskId`),
  ADD KEY `task_task_Project_id_0471e42f_fk_project_project_ProjectID` (`Project_id`);

--
-- Indexes for table `user_user`
--
ALTER TABLE `user_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `capabilities_achievement`
--
ALTER TABLE `capabilities_achievement`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `capabilities_capabilities`
--
ALTER TABLE `capabilities_capabilities`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `capabilities_capabilities_achievements`
--
ALTER TABLE `capabilities_capabilities_achievements`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `capabilities_capabilities_skills`
--
ALTER TABLE `capabilities_capabilities_skills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `capabilities_skill`
--
ALTER TABLE `capabilities_skill`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `project_project`
--
ALTER TABLE `project_project`
  MODIFY `ProjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `task_task`
--
ALTER TABLE `task_task`
  MODIFY `TaskId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `user_user`
--
ALTER TABLE `user_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `capabilities_capabilities`
--
ALTER TABLE `capabilities_capabilities`
  ADD CONSTRAINT `capabilities_capabilities_user_id_e3f83353_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `capabilities_capabilities_achievements`
--
ALTER TABLE `capabilities_capabilities_achievements`
  ADD CONSTRAINT `capabilities_capabil_achievement_id_6cf1d128_fk_capabilit` FOREIGN KEY (`achievement_id`) REFERENCES `capabilities_achievement` (`id`),
  ADD CONSTRAINT `capabilities_capabil_capabilities_id_3ad36a5a_fk_capabilit` FOREIGN KEY (`capabilities_id`) REFERENCES `capabilities_capabilities` (`id`);

--
-- Constraints for table `capabilities_capabilities_skills`
--
ALTER TABLE `capabilities_capabilities_skills`
  ADD CONSTRAINT `capabilities_capabil_capabilities_id_b9572b1b_fk_capabilit` FOREIGN KEY (`capabilities_id`) REFERENCES `capabilities_capabilities` (`id`),
  ADD CONSTRAINT `capabilities_capabil_skill_id_d3330d7d_fk_capabilit` FOREIGN KEY (`skill_id`) REFERENCES `capabilities_skill` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `leader_leader`
--
ALTER TABLE `leader_leader`
  ADD CONSTRAINT `leader_leader_ibfk_1` FOREIGN KEY (`UserID_id`) REFERENCES `user_user` (`user_id`);

--
-- Constraints for table `member_role_member_role`
--
ALTER TABLE `member_role_member_role`
  ADD CONSTRAINT `member_role_member_r_LeaderID_id_872073c0_fk_leader_le` FOREIGN KEY (`LeaderID_id`) REFERENCES `leader_leader` (`LeaderID`);

--
-- Constraints for table `project_project`
--
ALTER TABLE `project_project`
  ADD CONSTRAINT `project_project_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `task_task`
--
ALTER TABLE `task_task`
  ADD CONSTRAINT `task_task_Project_id_0471e42f_fk_project_project_ProjectID` FOREIGN KEY (`Project_id`) REFERENCES `project_project` (`ProjectID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
