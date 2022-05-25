create table sys_config
(
    id          bigint auto_increment
        primary key,
    val         varchar(128)                          not null comment '配置值',
    scope       varchar(32)                           null comment '域',
    order_no    int         default 0                 null comment '键排序ID',
    remark      varchar(256)                          null comment '备注',
    status      tinyint     default 0                 null comment '状态,0=启用,1=禁用',
    update_by   varchar(32) default 'admin'           not null,
    update_time datetime    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    create_time datetime    default CURRENT_TIMESTAMP not null,
    constraint sys_config_scope_order_no_uindex
        unique (scope, order_no)
)
    comment '配置表';

