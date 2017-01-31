DROP TABLE IF EXISTS users;

create table users (id SERIAL PRIMARY KEY, username VARCHAR(25) NOT NULL, password VARCHAR(128) NOT NULL, super smallint NOT NULL DEFAULT 0);
CREATE UNIQUE INDEX users_username ON users (username);

insert into users(username, password, super) values('admin', 'PBKDF2$sha256$901$qy3SCiU4YncLaVLv$uE/2grmw1lxKm4CsbrqcL6ObQKLXHZxk', 1);
insert into users(username, password) values('jin', 'PBKDF2$sha256$901$qy3SCiU4YncLaVLv$uE/2grmw1lxKm4CsbrqcL6ObQKLXHZxk');


DROP TABLE IF EXISTS acls;
CREATE TABLE acls (id SERIAL PRIMARY KEY, username VARCHAR(25) NOT NULL, topic VARCHAR(256) NOT NULL, acc smallint NOT NULL DEFAULT 1);

CREATE UNIQUE INDEX acls_user_topic ON acls (username, topic);

INSERT INTO acls (username, topic, acc) VALUES ('jin', 'read/+', 1);
INSERT INTO acls (username, topic, acc) VALUES ('jin', 'write/+', 2);
INSERT INTO acls (username, topic, acc) VALUES ('jin', 'both/+', 3);
