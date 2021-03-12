CREATE DATABASE IF NOT EXISTS laravel_master;
USE laravel_master;

CREATE TABLE IF NOT EXISTS users(
    id              int(255) auto_increment not null,
    role            varchar(20),
    name            varchar(100),
    surname         varchar(200),
    nick            varchar(100),
    password        varchar(255),
    image           varchar(255),
    created_at      datetime,
    updated_at      datetime,
    remember_token  varchar(255),
    CONSTRAINT pk_users PRIMARY KEY(id)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS images(
    id              int(255) auto_increment not null,
    user_id         int(255),
    image_path      varchar(255),
    description     text,
    created_at      datetime,
    updated_at      datetime,
    CONSTRAINT pk_images PRIMARY KEY(id),
    CONSTRAINT fk_images_users FOREIGN KEY(user_id) REFERENCES users(id)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS coments(
    id              int(255) auto_increment not null,
    user_id         int(255),
    image_id        int(255),
    content         text,
    created_at      datetime,
    updated_at      datetime,
    CONSTRAINT pk_coments PRIMARY KEY(id),
    CONSTRAINT fr_coments_users FOREIGN KEY(user_id) REFERENCES users(id),
    CONSTRAINT fk_coments_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDb;

CREATE TABLE IF NOT EXISTS likes(
    id              int(255) auto_increment not null,
    user_id         int(255),
    image_id        int(255),
    created_at      datetime,
    updated_at      datetime,
    CONSTRAINT pk_likes PRIMARY KEY(id),
    CONSTRAINT fr_likes_users FOREIGN KEY(user_id) REFERENCES users(id),
    CONSTRAINT fk_likes_images FOREIGN KEY(image_id) REFERENCES images(id)
)ENGINE=InnoDb;