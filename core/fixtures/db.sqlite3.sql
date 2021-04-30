BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "core_cliente" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"nome"	varchar(100) NOT NULL,
	"sobrenome"	varchar(100) NOT NULL,
	"email"	varchar(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS "core_produto" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"nome"	varchar(100) NOT NULL,
	"preco"	decimal NOT NULL,
	"estoque"	integer NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"name"	varchar(150) NOT NULL UNIQUE
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag">=0),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL PRIMARY KEY AUTOINCREMENT,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL
);
INSERT INTO "django_session" VALUES ('jfb8z8a47xopcxws72jk25cyqhlirvup','.eJxVjDEOAiEQRe9CbYgIzIClvWcgAwyyaiBZdivj3XWTLbT9773_EoHWpYZ18BymLM5CicPvFik9uG0g36nduky9LfMU5abInQ557Zmfl939O6g06rdGyMhZkzpmVUwkQBuVA3RcPFqI1qM7QWGnPXjDpBIwG3SgtS8aWbw_3I03fQ:1lboqR:pzGQhDVVivZUSvdHQL3eWhIrSp5F-RXCyZf7_UtOea0','2021-05-12 18:23:31.085715');
INSERT INTO "core_cliente" VALUES (1,'Lucas','Silva','lucas@gmail.com');
INSERT INTO "core_cliente" VALUES (2,'Joao','Souza','joao.souza@gmail.com');
INSERT INTO "core_cliente" VALUES (3,'Silva','Kavinsk','silka@uol.com.br');
INSERT INTO "core_produto" VALUES (1,'Playstation5',500,1);
INSERT INTO "core_produto" VALUES (2,'Xbox360',2500,5);
INSERT INTO "core_produto" VALUES (3,'Xbox One',7800,6);
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$260000$APHa9RHrE4btCghGq8L10e$oGOr/RFDS8yAILP93fJ/fPGywAWcgpx39CuZEowgqcw=','2021-04-28 18:23:31.082251',1,'uilan','','uilan.souza@gmail.com',1,1,'2021-04-28 17:32:23.488090','');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_produto','Can add produto');
INSERT INTO "auth_permission" VALUES (26,7,'change_produto','Can change produto');
INSERT INTO "auth_permission" VALUES (27,7,'delete_produto','Can delete produto');
INSERT INTO "auth_permission" VALUES (28,7,'view_produto','Can view produto');
INSERT INTO "auth_permission" VALUES (29,8,'add_cliente','Can add cliente');
INSERT INTO "auth_permission" VALUES (30,8,'change_cliente','Can change cliente');
INSERT INTO "auth_permission" VALUES (31,8,'delete_cliente','Can delete cliente');
INSERT INTO "auth_permission" VALUES (32,8,'view_cliente','Can view cliente');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'core','produto');
INSERT INTO "django_content_type" VALUES (8,'core','cliente');
INSERT INTO "django_admin_log" VALUES (1,'2021-04-28 17:32:56.665795','1','Lucas Silva','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (2,'2021-04-28 17:33:10.958666','2','Joao Souza','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (3,'2021-04-28 17:33:34.408641','3','Silva Kavinsk','[{"added": {}}]',8,1,1);
INSERT INTO "django_admin_log" VALUES (4,'2021-04-28 17:33:36.474823','3','Silva Kavinsk','[]',8,1,2);
INSERT INTO "django_admin_log" VALUES (5,'2021-04-28 17:33:49.037119','1','Playstation5','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (6,'2021-04-28 17:33:58.392899','2','Xbox360','[{"added": {}}]',7,1,1);
INSERT INTO "django_admin_log" VALUES (7,'2021-04-28 17:34:16.363721','3','Xbox One','[{"added": {}}]',7,1,1);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2021-04-27 21:22:41.575252');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2021-04-27 21:22:41.599565');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2021-04-27 21:22:41.622097');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2021-04-27 21:22:41.633116');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2021-04-27 21:22:41.644999');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2021-04-27 21:22:41.663742');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2021-04-27 21:22:41.674466');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2021-04-27 21:22:41.685471');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2021-04-27 21:22:41.694109');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2021-04-27 21:22:41.703605');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2021-04-27 21:22:41.706162');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2021-04-27 21:22:41.714237');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2021-04-27 21:22:41.723902');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2021-04-27 21:22:41.733819');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2021-04-27 21:22:41.743330');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2021-04-27 21:22:41.752109');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2021-04-27 21:22:41.761702');
INSERT INTO "django_migrations" VALUES (18,'core','0001_initial','2021-04-27 21:22:41.765386');
INSERT INTO "django_migrations" VALUES (19,'core','0002_cliente','2021-04-27 21:22:41.769088');
INSERT INTO "django_migrations" VALUES (20,'core','0003_alter_produto_preco','2021-04-27 21:22:41.772702');
INSERT INTO "django_migrations" VALUES (21,'sessions','0001_initial','2021-04-27 21:22:41.778977');
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
COMMIT;
