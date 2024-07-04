select * from DBMS_WORKDAY;



-- create view DBMS_WORKDAY as
select id, actdate as "WORKDAY", isworkday
from um_workday;


-- auto-generated definition
create table UM_WORKDAY
(
    ID        NUMBER not null
        constraint PK_UM_WORKDAY
            primary key,
    ACTDATE   DATE   not null
        constraint UM_WORKDAY_CONSTRAINT
            unique,
    ISWORKDAY NUMBER not null
)
/

comment on column UM_WORKDAY.ID is '流水号'
/

comment on column UM_WORKDAY.ACTDATE is '日期'
/

comment on column UM_WORKDAY.ISWORKDAY is '是否工作日'
/
