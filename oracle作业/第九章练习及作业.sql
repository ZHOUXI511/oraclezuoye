第九章
思考如何查询比所在职位平均工资高的员工姓名，职位。
select ename 员工姓名, job 职位 from emp e
where sal > (select avg(sal) from emp where job = e.job);

1.查询比所在职位平均工资高的员工姓名，职位。
select ename 员工姓名, job 职位 from emp e
where sal > (select avg(sal) from emp where job = e.job);
2.查询工资为其部门最低工资的员工编号，姓名，工资。
select empno 员工编号， ename 姓名, sal 工资 from emp e
where sal = (select min(sal) from emp where deptno = e.deptno);
24
练习二
 1.查询所有雇员编号，名字和部门名字。
select e.empno 员工编号，e.ename 名字, (select dname from dept where deptno = e.deptno) 部门名字
from emp e;
 2.查询哪些员工是经理？
select * from emp e
where 0 < (select count(1) from emp where mgr = e.empno);
 3.查询哪些员工不是经理？
select * from emp e
where 0 = (select count(1) from emp where mgr = e.empno);
4.查询每个部门工资最低的两个员工编号，姓名，工资。
select e.empno 员工编号, e.ename 姓名, e.sal 工资,deptno from emp e
where 2 > (select count(*) from emp 
  where deptno = e.deptno and sal < e.sal)
and deptno is not null;

练习三
 1.列出至少有一个雇员的所有部门名称。
select dname 部门名称 from dept d
where exists (select 1 from emp where deptno = d.deptno);

 2.列出一个雇员都没有的所有部门名称。
select dname 部门名称 from dept d
where not exists (select 1 from emp where deptno = d.deptno);

-- 课后作业
 1.查询薪水多于他所在部门平均薪水的雇员名字，部门号。
select ename 雇员姓名, deptno 部门号,sal from emp e
where sal > (select avg(sal) from emp where deptno = e.deptno);
 2.查询员工姓名和直接上级的名字。
select e.ename 员工姓名, (select ename from emp where empno = e.mgr) 上级姓名
from emp e;
3.查询每个部门工资最高的员工姓名，工资。
select e.ename 员工姓名, e.sal 工资 from emp e
where sal = (select max(sal) from emp where deptno = e.deptno);
4.查询每个部门工资前两名高的员工姓名，工资。
select e.ename 员工姓名, e.sal 工资,deptno from emp e
where 2 > (select count(ename) from emp 
where deptno = e.deptno and e.sal<sal);
