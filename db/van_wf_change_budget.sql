create table wf_change_budget
(
    id                    bigint auto_increment
        primary key,
    process_bpmn_id       bigint       default 0                 not null,
    process_definition_id varchar(128) default ''                not null,
    process_instance_id   varchar(36)                            null comment '流程实例ID',
    code                  varchar(64)                            not null,
    name                  varchar(64)                            null,
    creator               bigint                                 not null,
    update_by             varchar(64)                            not null,
    update_time           datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time           datetime     default CURRENT_TIMESTAMP not null,
    hq_high_leader        varchar(64)                            null comment '总部高层',
    sub_high_leader       varchar(64)                            null comment '子公司高层',
    sub_finance           varchar(64)                            null comment '子公司财务',
    hq_finance            varchar(64)                            null comment '总部财务',
    end_monthly           tinyint                                null comment '是否月结调整',
    constraint code_uindex
        unique (code),
    constraint process_instance_id_uindex
        unique (process_instance_id)
)
    comment '预算调整流程';

create index process_bpmn_id_index
    on wf_change_budget (process_bpmn_id);

create index process_definition_id_index
    on wf_change_budget (process_definition_id);