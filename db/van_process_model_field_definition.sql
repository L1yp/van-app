create table process_model_field_definition
(
    id               bigint auto_increment
        primary key,
    process_key      varchar(64)                           not null comment '流程标识',
    name             varchar(64)                           null comment '字段名称',
    order_no         int         default 0                 not null comment '序号',
    label            varchar(64)                           null comment '标签',
    description      varchar(1024)                         null comment '描述',
    component_type   bigint                                not null comment '控件类型：单行文本/多行文本/字典单选/字典多选/数字/日期/用户/用户列表/动态标签/部门单选/部门多选/关联表单选/关联表多选',
    db_field_type    varchar(64)                           null comment '字段类型',
    db_default_value varchar(64)                           null comment '默认值',
    nullable         tinyint     default 0                 null comment '0=no, 1=yes',
    dict_scope       varchar(64) default 'global'          null comment '字典范围',
    dict_ident       varchar(64)                           null comment '字典标识',
    create_time      datetime    default CURRENT_TIMESTAMP not null,
    update_time      datetime    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    update_by        varchar(64) default 'admin'           null
)
    comment '流程字段定义';

create index process_field_definition_process_key_order_no_index
    on process_model_field_definition (process_key, order_no);

INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (1, 'change_budget', 'sub_finance', 1, '子公司财务', '调整会签', 6, 'varchar(64)', '0', 0, 'global', null, '2022-04-29 22:10:46', '2022-05-02 08:27:26', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (2, 'change_budget', 'sub_high_leader', 2, '子公司高层', '调整审核', 6, 'varchar(64)', '''''', 0, 'global', null, '2022-04-29 22:12:45', '2022-05-03 22:49:28', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (3, 'change_budget', 'hq_high_leader', 3, '总部高层', '调整批准', 6, 'varchar(64)', '''''', 0, 'global', null, '2022-04-29 22:13:10', '2022-05-03 22:49:32', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (4, 'change_budget', 'hq_finance', 4, '总部财务', '调整确认', 6, 'varchar(64)', '''''', 0, 'global', null, '2022-04-29 22:13:37', '2022-05-03 22:49:35', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (5, 'change_budget', 'end_monthly', 5, '是否月结调整', '0：否；1：是', 3, 'tinyint', '0', 0, 'global', 'yesno', '2022-04-29 22:15:03', '2022-05-17 11:18:45', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (7, 'holiday', 'id', 1, 'id', '主键', 5, 'BIGINT', null, 0, 'global', null, '2022-05-30 21:02:28', '2022-05-30 21:02:28', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (8, 'holiday', 'process_bpmn_id', 2, '版本ID', '流程版本ID', 5, 'BIGINT', null, 0, 'global', null, '2022-05-30 21:02:28', '2022-05-30 21:02:28', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (9, 'holiday', 'process_definition_id', 3, '定义ID', '流程定义ID', 1, 'VARCHAR(128)', null, 0, 'global', null, '2022-05-30 21:02:29', '2022-05-30 21:02:29', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (10, 'holiday', 'process_instance_id', 4, '实例ID', '流程实例ID', 1, 'VARCHAR(36)', null, 0, 'global', null, '2022-05-30 21:02:29', '2022-05-30 21:02:29', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (11, 'holiday', 'name', 5, '名称', '流程名称', 1, 'VARCHAR(64)', null, 0, 'global', null, '2022-05-30 21:02:29', '2022-05-30 21:02:29', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (12, 'holiday', 'creator', 6, '创建者', '流程发起者', 1, 'VARCHAR(64)', null, 0, 'global', null, '2022-05-30 21:02:29', '2022-05-30 21:02:29', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (13, 'holiday', 'update_by', 7, '更新人', '最后更新人', 1, 'VARCHAR(64)', null, 0, 'global', null, '2022-05-30 21:02:29', '2022-05-30 21:02:29', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (14, 'holiday', 'update_time', 8, '更新时间', '最后更新时间', 11, 'DATETIME', null, 0, 'global', null, '2022-05-30 21:02:29', '2022-05-30 21:02:29', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (15, 'holiday', 'create_time', 9, '创建时间', '创建时间', 11, 'DATETIME', null, 0, 'global', null, '2022-05-30 21:02:29', '2022-05-30 21:02:29', 'admin');
INSERT INTO van.process_model_field_definition (id, process_key, name, order_no, label, description, component_type, db_field_type, db_default_value, nullable, dict_scope, dict_ident, create_time, update_time, update_by) VALUES (18, 'holiday', 'dept_leader', 10, '部门领导', '直属上级', 6, 'BIGINT', null, 0, 'global', null, '2022-05-30 23:25:41', '2022-05-30 23:25:41', 'admin');
