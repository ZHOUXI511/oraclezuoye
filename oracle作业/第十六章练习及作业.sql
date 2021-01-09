-----第十六章
练习1
1.创建一个序列，该序列起始值从1开始，无最大值，增量是1，不循环。
create sequence dept_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
cache 20;

2.查询序列的当前值及下一个值
select dept_seq.nextval from dual
select dept_seq.currval from dual
3.使用第1题所建的序列，向部门表中插入两条记录，部门编号使用序列值，部门名称分别为：Education、Market，城市分别为：DALLAS、WASHTON
insert into dept (deptno,dname,loc) values (dept_seq.nextval,'Education','DALLAS') 
insert into dept (deptno,dname,loc) values (dept_seq.nextval,'Market','WASHTO')
select *from dept
CREATE TABLE e1 AS SELECT * FROM emp;
INSERT INTO e1 SELECT * FROM e1;--多次运行 
UPDATE e1 SET empno=ROWNUM;  --更新所有记录的empno，
					--以使其数值唯一
commit;--提交
select * from e1
insert into e1 select * from e1
update e1 set empno=rownum
---练习2----------
1.使用子查询的方式，创建test表。
create table test as select * from emp
2.快速复制test表中的数据，复制到100w条左右
insert into test select * from test
3.更新test表中的empno字段为rownum
update test set empno=rownum
4.查询test中empno为800000的记录值，记录查询执行时间。
select * from e1 where empno=80033
5.在test表的empno字段上创建索引
create index idx_test_empno on  test(empno)
create index idx_e1_empno on e1(empno)
6.重新执行第4题，对比查询时间
select ename,sal from e1 where empno=203656
1.有如下关系模式，
student(sno,sname,gender,birthday,email);--学生
course(cno,cname,type,credit);--课程
sc（sno,cno,grade);--选课
试分析哪些列上适合创建索引？
适合:sno,cno
--适合创建索引
表数据量很大
要查询的结果集在2%-4%左右
经常用来做WHERE条件中的列或者多表连接的列
查询列的数据范围分布很广
查询列中包含大量的NULL值,因为空值不包含在索引中
---不适合创建索引
数据量很小的表
在查询中不常用来作为查询条件的列
频繁更新的表
索引列作为表达式的一部分被使用时，比如常查询的条件是SALARY*12，此时在SALARY列上创建索引是没有效果的
查询条件中有单行函数时，用不上索引
1.创建序列，起始位1，自增为1，最小值为1，最大值为9999
create sequence esc_seq
start with 1
increment by 1
minvalue 1
maxvalue 9999
cycle
 
2.创建序列，起始值为50，每次增加5；
create sequence ess_seq
start with 50
increment by 5
3.在表copy_dept中插入记录，其中部门号码采用上一步中创建的序列生成；
create table copy_dept as select * from dept
insert into copy_dept (dname,deptno,loc) values ('ddd',esc_seq.nextval,'ccc')
select * from copy_dept
4.请为工资创建索引，比较<10000,>1000,与round（sal）>10000,哪个索引有效，哪个索引无效；
  create index sal_index on emp(sal);
    select * from emp where sal < 10000;--有
    select * from emp where sal > 1000;--有
    select * from emp where round(sal) > 10000;--无

5.创建表，采用“create table copy_emp_index as select * from emp”，生成500万条数据，把其中的“员工号”字段修改为唯一；
create table copy_emp_index as select * from emp
---update table copy_emp_index modify empno constraints table copy_emp_index_un unique(empno)
----Create unique index index_empno on table(copy_emp_index) 
alter table copy_emp_index modify(empno unique)

6.查询表copy_emp_index表中员工号为200001的员工姓名，工资，记录执行时间；
select ename,sal 
from copy_emp_index
where empno=200001
7.在copy_emp_index表的empno字段上创建索引，再次执行第6题语句，记录执行时间并做对比；

create index ccc_index on copy_emp_index(empno)
alter table copy_emp_index modify(empno) 
select ename,sal
from copy_emp_index
where empno=19994
