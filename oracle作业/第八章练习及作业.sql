--第八章练习
思考：查询编号为7839的员工当前工资、岗位及历史工资、岗位？
select sal ,job from emp where empno=7839
union all
select sal,job from emp_jobhistory where empno=7839
--练习1
1.分别使用联合运算及完全联合运算完成，按照时间升序顺序，查询员工7839的工作岗位列表。
select hiredate,job from emp where empno=7839
union 
select begindate, job  from emp_jobhistory where empno=7839 
--
select job,hiredate from emp where empno=7839
union all
select job ,begindate from emp_jobhistory where empno=7839 
order by hiredate asc
2.使用多表连接，查询每个部门的部门编号，部门人数，没有人数的部门显示0。
---select d.deptno ,count(1) from emp e,(SELECT DEPTNO from dept ) d where e.deptno(+)=d.deptno group by d.deptno
select d.deptno 部门编号,COUNT(empno) from emp e,dept d where e.deptno(+)=d.deptno group by d.deptno---ok

3.使用联合运算，查询每个部门的部门编号，部门人数，没有人数的部门显示0。
select deptno,count(1) from emp  where deptno is not null group by deptno
union all
select deptno, nvl(to_number(null),0) from dept where deptno is not null 
---
select deptno,count(empno) from emp where deptno is not null group by deptno
union
select d.deptno,count(empno) from emp e,dept d where e.deptno(+)=d.deptno group by d.deptno;
4.使用联合运算，查询10号部门及20号部门的员工姓名，部门编号。
select ename,deptno from emp where deptno=10
union
select ename,deptno from emp where deptno=20
ORDER BY DEPTNO
select id, empno, job, begindate, sal from emp_jobhistory
5. 使用集合运算，输出如下效果？
select deptno,loc,to_char(null),to_date(null) from dept where deptno is not null 
union 
select deptno,to_char(null),ename,hiredate from emp where deptno is not null 

1.用集合运算，列出不包含job为SALESMAN 的部门的部门号。
select deptno from emp where deptno is not null
minus
select deptno from emp where job='SALESMAN' 
select *from emp
2.写一个联合查询，列出下面的信息：
EMP表中所有雇员的名字和部门编号,不管他们是否属于任何部门。
select ename,deptno from emp 
union 
select to_char(null),deptno from dept
DEPT表中的所有部门编号和部门名称，不管他们是否有员工。
select deptno,dname from dept
minus
select deptno,to_char(null) from emp
3.用集合运算查询出职位为SALESMAN和部门编号为10的人员编号、姓名、职位，不排除重复结果。
select deptno,ename,job from emp where job='SALESMAN'
union all
select deptno,ename,job from emp where deptno=10
4.用集合查询出部门为10和20的所有人员编号、姓名、所在部门名称。
select e.deptno,e.ename,d.dname from emp e,dept d where e.deptno=d.deptno and e.deptno=10
union 
select e.deptno,e.ename,d.dname from emp e,dept d where e.deptno=d.deptno and e.deptno=20
