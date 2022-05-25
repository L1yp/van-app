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

INSERT INTO van.wf_change_budget (id, process_bpmn_id, process_definition_id, process_instance_id, name, creator, update_by, update_time, create_time, hq_high_leader, sub_high_leader, sub_finance, hq_finance, end_monthly) VALUES (1, 2, 'change_budget:1:5bcbdf5b-d855-11ec-aa63-00e0705f49db', '803ca36c-d855-11ec-aa63-00e0705f49db', '202205预算调整', 'A52738', 'A52738', '2022-05-20 23:57:07', '2022-05-20 23:57:07', '4', '3', '2', '5', 40);
INSERT INTO van.wf_change_budget (id, process_bpmn_id, process_definition_id, process_instance_id, name, creator, update_by, update_time, create_time, hq_high_leader, sub_high_leader, sub_finance, hq_finance, end_monthly) VALUES (2, 2, 'change_budget:1:5bcbdf5b-d855-11ec-aa63-00e0705f49db', 'dfcc2344-d9dd-11ec-a1be-00e0705f49db', '202205预算调整', 'admin', 'admin', '2022-05-22 22:45:50', '2022-05-22 22:45:50', '4', '3', '2', '5', 40);
