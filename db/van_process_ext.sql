create table process_ext
(
    id          bigint auto_increment
        primary key,
    process_key varchar(64) not null,
    ext         text        null,
    constraint process_ext_process_key_uindex
        unique (process_key)
);

