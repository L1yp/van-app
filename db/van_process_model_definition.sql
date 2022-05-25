create table process_model_definition
(
    id                bigint auto_increment
        primary key,
    process_key       varchar(64)                        not null comment '流程定义文件的ID属性',
    title             varchar(64)                        not null,
    code_prefix       varchar(64)                        null comment '流程编号前缀',
    code_time_pattern varchar(32)                        not null comment '编号时间pattern',
    code_joiner       varchar(8)                         null comment '编号连接符',
    code_joiner2      varchar(8)                         null,
    code_suffix       varchar(8)                         not null comment '编号后缀：#代表序号',
    update_time       datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time       datetime default CURRENT_TIMESTAMP not null
)
    comment '流程定义信息';

create index process_definition_process_key_index
    on process_model_definition (process_key);

INSERT INTO van.process_model_definition (id, process_key, title, code_prefix, code_time_pattern, code_joiner, code_joiner2, code_suffix, update_time, create_time) VALUES (1, 'change_budget', '预算调整流程', 'CB', 'yyyyMMdd', '-', '-', '#####', '2022-04-29 22:02:36', '2022-04-27 14:23:49');
