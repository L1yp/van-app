create table sys_role_menu
(
    id        bigint auto_increment
        primary key,
    role_id   bigint                      not null,
    menu_id   bigint                      not null,
    create_by varchar(32) default 'admin' null,
    constraint sys_role_menu_role_id_menu_id_uindex
        unique (role_id, menu_id)
)
    comment '角色菜单表';

INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (288, 2, 1, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (289, 2, 3, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (290, 2, 4, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (291, 2, 5, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (292, 2, 7, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (293, 2, 8, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (294, 2, 12, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (295, 2, 14, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (296, 2, 23, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (297, 2, 25, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (298, 2, 28, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (299, 2, 29, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (300, 2, 30, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (301, 2, 31, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (302, 2, 32, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (303, 2, 33, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (359, 1, 1, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (360, 1, 3, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (361, 1, 4, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (362, 1, 5, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (363, 1, 7, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (364, 1, 8, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (365, 1, 12, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (366, 1, 14, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (367, 1, 23, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (368, 1, 29, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (369, 1, 30, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (370, 1, 31, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (371, 1, 32, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (372, 1, 33, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (373, 1, 34, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (374, 1, 35, 'admin');
INSERT INTO van.sys_role_menu (id, role_id, menu_id, create_by) VALUES (375, 1, 36, 'admin');
