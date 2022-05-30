create table wf_change_budget
(
    id                    bigint auto_increment
        primary key,
    process_bpmn_id       bigint       default 0                 not null,
    process_definition_id varchar(128) default ''                not null,
    process_instance_id   varchar(36)                            null comment '流程实例ID',
    name                  varchar(64)                            null,
    creator               varchar(64)                            not null,
    update_by             varchar(64)                            not null,
    update_time           datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time           datetime     default CURRENT_TIMESTAMP not null,
    hq_high_leader        varchar(64)                            null comment '总部高层',
    sub_high_leader       varchar(64)                            null comment '子公司高层',
    sub_finance           varchar(64)                            null comment '子公司财务',
    hq_finance            varchar(64)                            null comment '总部财务',
    end_monthly           tinyint                                null comment '是否月结调整'
)
    comment '预算调整流程';

INSERT INTO van.wf_change_budget (id, process_bpmn_id, process_definition_id, process_instance_id, name, creator, update_by, update_time, create_time, hq_high_leader, sub_high_leader, sub_finance, hq_finance, end_monthly) VALUES (1, 3, 'change_budget:1:5b93bc62-df27-11ec-8327-00e0705f49db', '671990a3-df27-11ec-8327-00e0705f49db', '预算调整1653812086484', 'admin', 'admin', '2022-05-29 16:14:46', '2022-05-29 16:14:46', null, null, null, null, 39);
INSERT INTO van.wf_change_budget (id, process_bpmn_id, process_definition_id, process_instance_id, name, creator, update_by, update_time, create_time, hq_high_leader, sub_high_leader, sub_finance, hq_finance, end_monthly) VALUES (2, 3, 'change_budget:1:5b93bc62-df27-11ec-8327-00e0705f49db', '3a4dc08e-df29-11ec-8327-00e0705f49db', '预算调整1653812870329', 'admin', 'admin', '2022-05-29 16:36:00', '2022-05-29 16:27:50', '1', '1', '1', '1', 40);
