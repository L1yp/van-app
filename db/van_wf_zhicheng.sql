create table wf_zhicheng
(
    id                    bigint auto_increment
        primary key,
    process_bpmn_id       bigint       default 0                 not null comment '流程版本ID',
    process_definition_id varchar(128) default ''                not null comment '流程定义ID',
    process_instance_id   varchar(36)                            null comment '流程实例ID',
    code                  varchar(64)                            not null,
    name                  varchar(64)                            not null,
    creator               bigint                                 not null,
    update_by             varchar(64)                            not null,
    update_time           datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time           datetime     default CURRENT_TIMESTAMP not null,
    judges                varchar(128)                           null comment '评委用户列表',
    expert_status         bigint                                 null comment '专家审核',
    constraint code_uindex
        unique (code),
    constraint process_instance_id_uindex
        unique (process_instance_id)
)
    comment '职称申请流程';

create index process_bpmn_id_index
    on wf_zhicheng (process_bpmn_id);

create index process_definition_id_index
    on wf_zhicheng (process_definition_id);

INSERT INTO van.wf_zhicheng (id, process_bpmn_id, process_definition_id, process_instance_id, code, name, creator, update_by, update_time, create_time, judges, expert_status) VALUES (1, 17, 'Process_0dm6mw4:1:f4ffb253-e2ec-11ec-a472-00e0705f49db', '027a51b4-e2ed-11ec-a472-00e0705f49db', 'ZL2022060300001', '测试职称', 5, '5', '2022-06-03 11:31:10', '2022-06-03 11:26:51', '1,2,3,4,5,6', 43);
INSERT INTO van.wf_zhicheng (id, process_bpmn_id, process_definition_id, process_instance_id, code, name, creator, update_by, update_time, create_time, judges, expert_status) VALUES (2, 17, 'Process_0dm6mw4:1:f4ffb253-e2ec-11ec-a472-00e0705f49db', '7d19f72c-e2ee-11ec-9cfd-00e0705f49db', 'ZL2022060300002', '测试2', 1, '1', '2022-06-03 11:37:48', '2022-06-03 11:37:27', '2,3,4,5,6,7', 43);
INSERT INTO van.wf_zhicheng (id, process_bpmn_id, process_definition_id, process_instance_id, code, name, creator, update_by, update_time, create_time, judges, expert_status) VALUES (3, 17, 'Process_0dm6mw4:1:f4ffb253-e2ec-11ec-a472-00e0705f49db', '01a934dc-e2ef-11ec-bc7d-00e0705f49db', 'ZL2022060300003', '测试34', 1, '1', '2022-06-03 11:41:58', '2022-06-03 11:41:09', '2,3,4,5,6,7', 43);
