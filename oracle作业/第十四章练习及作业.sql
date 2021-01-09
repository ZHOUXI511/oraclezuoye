1.学校有一个选课系统，其中包括如下关系模式：
系(系编号： 主键，
   系名称:  唯一键，
   系主任： 非空约束，
   系所在校去：取值范围只能在南湖校区和浑南校区)
   create table xi
(
xi_id number(5) primary key,
xi_name varchar2(30) unique,
xi_head varchar2(30) not null,
xi_loc varchar2(30) check(xi_loc='南湖校区' and xi_loc='浑南校区')
)
select * from xi
班级(班级编号： 主键，
     班级名称： 唯一键，
     所属系：  外键)
     create table classss (
     c_id number(5) primary key,
     c_cname varchar2(30) unique ,
     c_xi  varchar2(30) not null
     )
     select * from classs
2.创建学生表，包含如下属性:
学号 定长字符型 10位 主键
姓名 变长字符型 20位 非空
性别 定长字符型 2位 取值范围只能为男或女
出生日期 日期型 
所在班级 
create table student1
(
stu_id char(10) primary key,
stu_name varchar2(20)not null,
stu_sex char(2) check(stu_sex ='男' and stu_sex ='女'),
stu_birthday date,
stu_class number(5) constraint fk_student1_cla_id REFERENCES classss (c_id ))
1.简述5种约束的含义。
1.not null
2.primary key
3.foreign key
4.unique
5.check
2.创建学生关系sc，包括属性名：
选课流水号 数值型 主键；
学生编号 非空 外键
课程编号 非空 外键；
成绩     0-100之间；
create table stu
(
stu_id number(5)primary key,
stu_ename nvarchar2(50)not null
);
create table course1
(
cour_id number(5)primary key,
cour_ename varchar2(50)not null
);
3.创建copy_emp，要求格式同emp表完全一样，不包含数据。
create table copy_emp1 as
select *from emp where 1=0
4.创建copy_dept，要求格式同dept表完全一样，不包含数据。
create table copy_dept1 as
select *from dept where 1=0;
5.设置copy_emp 表中外键deptno，参照copy_dept中deptno,语句能否成功,为什么？
alter table copy_emp1 add constraint copy_emp1_deptno_fk foreign key(deptno) references copy_dept1(deptno);
6.追加copy_dept表中主键deptno
alter table copy_dept1 add constraint copy_dept1_deptno_pk primary key(deptno);
