---------第十五章-------
--练习1
1.创建一个视图，通过该视图可以查询到工资在2000-5000内并且姓名中包含有A的员工编号，姓名，工资。
create view empno_sal 
as select empno ,ename,sal
FROM EMP where sal between 2000 and 5000 and ename like '%A%'
select * from emp
2.通过上述创建的视图查询数据
select * from empno_sal;
---练习2
1.创建一个视图，通过该视图可以查询到工作在NEW YORK和CHICAGO的员工编号，姓名，部门编号，入职日期。
create view dept_loc as select e.empno,e.deptno,e.hiredate
from emp e,dept d where e.deptno=d.deptno and d.loc in ('NEW YORK','CHICAGO');
create or replace view dept_loc as select e.empno,e.deptno,e.hiredate,d.loc
from emp e,dept d where e.deptno=d.deptno and d.loc in ('NEW YORK','CHICAGO');
select * from dept_loc
inesrt into dept_loc 
2.创建一个视图，通过该视图可以查询到每个部门的部门名称及最低工资。
create or replace view dept_minsal as select d.dname,min(nvl(e.sal,0)) minsal
from emp e,dept d where e.deptno(+)=d.deptno group by d.dname;
select * from dept_minsal
3.通过如上视图，查询每个部门工资最低的员工姓名及部门名称
select e.ename,m.dname 部门名称 from emp e,dept d, dept_minsal m
where e.deptno=d.deptno and d.dname=m.dname and m.minsal=e.sal;
--作业---
1.创建视图v_emp_20，包含20号部门的员工编号，姓名，年薪列(年薪=12*(工资+奖金）；
create or replace view v_emp_20 as select empno,ename,(sal+nvl(comm,0))*12 年薪 from emp ;
2.从视图v_emp_20中查询年薪大于1万元员工的信息；
select * from v_emp_20 where 年薪>10000;
3.请为工资大于2000的员工创建视图，要求显示员工的部门信息，职位信息，工作地点；
create or replace view v_emp_sal as select d.deptno,e.job,d.loc from emp e,dept d where e.deptno=d.deptno;

4.针对以上视图执行insert,update,delete,语句能否成功，为什么？
insert into v_emp_20 values (999,'波拉比拉',3000)
update v_emp_20 set ename='NNN' where empno=8988
select * from v_emp_20
delete v_emp_20
