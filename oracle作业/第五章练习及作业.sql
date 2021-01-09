1.查询每个员工的编号，姓名，工资，工资等级，所在工作城市，按照工资等级进行升序排序。
廖秀丽(D8C4970E4637对话) 10:57:14
select e.deptno 员工编号,e.ename 姓名,e.sal 工资,s.grade,d.loc 工作城市
from emp e,salgrade s,dept d
where e.deptno=d.deptno and
(losal<=e.sal and e.sal<=hisal)
 order by grade asc;
select * from salgrade;
select* from dept
SELECT deptno
from emp e natural join dept d
where
natural
using
select e.ename,d.dname,s.grade
from emp e join dept d on e.deptno=d.deptno
join salgrade s on e.sal between s.losal and s.hisal


1.写一个查询，显示所有员工姓名，部门编号，部门名称。
select e.ename 姓名员工,d.deptno 部门标号,d.dname 部门名称
from emp e,dept d
where e.deptno=d.deptno;
2.写一个查询，显示所有工作在CHICAGO并且奖金不为空的员工姓名，工作地点，奖金
select e.ename,d.loc,e.comm
from emp e,dept d
where loc ='CHICAGO' and comm is not null;
select * from emp
3.写一个查询，显示所有姓名中含有A字符的员工姓名，工作地点。
select e.ename 员工姓名,d.loc 工作地点
from emp e,dept d
where e.deptno=d.deptno and instr(upper(ename),'A',1,1)>0;


select e.empno,e.ename,d.dname,deptno
from emp e 
natural join dept d

select e.ename ,d.dname,d.deptno,s.grade
from emp e
join dept d on(e.deptno=d.deptno)
join salgrade s on(e.sal between s.losal and s.hisal)
写一条查询语句，查询员工姓名、部门名称、工作地点？
select w.ename,d.dname,d.loc
from emp w,dept d
where w.deptno=d.deptno
1.写一个查询，显示所有员工姓名，部门编号，部门名称。
select  w.ename,d.deptno,d.dname
from emp w,dept d
where w.deptno=d.deptno
2.写一个查询，显示所有工作在CHICAGO并且奖金不为空的员工姓名，工作地点，奖金
select w.ename,d.loc,w.sal
from emp w , dept d
where w.deptno=d.deptno and loc in ('CHICAGO') and comm is not null;
3.写一个查询，显示所有姓名中含有A字符的员工姓名，工作地点。
select e.ename,d.loc
from emp e,dept d
where e.deptno=d.deptno and instr(ename,'A',1,1)>0;

----二---
查询每个员工的编号，姓名，工资，工资等级，所在工作城市，按照工资等级进行升序排序。
select e.ename,e.deptno,e.sal,s.grade,d.loc
from emp e,dept d,salgrade s
where e.deptno=d.deptno and e.sal between s.losal and s.hisal
order by grade asc
select *from salgrade

查询每个员工的姓名和直接上级姓名？
select w.ename,m.empno
from emp w,emp m
where w.mgr=m.empno(+)

1.查询所有工作在NEW YORK和CHICAGO的员工姓名，员工编号，以及他们的经理姓名，经理编号。
select w.ename,w.deptno,m.ename,m.empno
from emp w,emp m,dept d
where w.mgr=m.empno and d.deptno=w.deptno and loc in ('NEW YORK','CHICAGO')
2.第上一题的基础上，添加没有经理的员工King，并按照员工编号排序。
select w.ename,w.deptno,m.ename,m.empno
from emp w,emp m,dept d
where w.mgr=m.empno(+) and d.deptno=w.deptno and loc in ('NEW YORK','CHICAGO')
order by w.deptno
3.查询所有员工编号，姓名，部门名称，包括没有部门的员工也要显示出来。
select w.ename,w.deptno,d.dname
from emp w,dept d
where w.deptno=d.deptno(+)

使用SQL-99写法，完成如下练习
1.创建一个员工表和部门表的交叉连接。
select * from emp cross join dept;
2.使用自然连接，显示入职日期在80年5月1日之后的员工姓名，部门名称，入职日期
select w.ename,d.dname,w.hiredate
from emp w
natural join dept d where hiredate>'1-5月-80'
3.使用USING子句，显示工作在CHICAGO的员工姓名，部门名称，工作地点
select w.ename,d.dname,d.loc
from emp w join dept d using(deptno)
where loc in ('CHICAGO')
4.使用ON子句，显示工作在CHICAGO的员工姓名，部门名称，工作地点，薪资等级
select w.ename,d.dname,d.loc,s.grade
from emp w 
join dept d on (w.deptno=d.deptno)
join salgrade s on (w.sal between losal and hisal)
where d.loc in ('CHICAGO')
select * from salgrade
5.使用左连接，查询每个员工的姓名，经理姓名，没有经理的King也要显示出来。
select w.ename,m.ename
from emp w
left join emp m
on w.mgr=m.empno
select w.ename worker,m.ename manager
from emp w left join emp m on(w.mgr=m.empno)
6.使用右连接，查询每个员工的姓名，经理姓名，没有经理的King也要显示出来。
select w.ename,m.ename
from emp w
right join emp m
on m.mgr=w.empno

1.显示员工SMITH的姓名，部门名称，直接上级名称\
select * from emp
select w.ename,m.ename,d.dname
from emp w 
join dept d
on w.deptno=d.deptno 
join emp m
on w.mgr=m.empno
where w.ename='SMITH'

2.显示员工姓名，部门名称，工资，工资级别，要求工资级别大于4级。
select w.ename，d.dname,w.sal,s.grade
from emp w
join dept d on (w.deptno=d.deptno(+))
join salgrade s on (w.sal between losal and hisal )
where s.grade>4
select * from emp;

select * from salgrade
3.显示员工KING和FORD管理的员工姓名及其经理姓名。
select w.ename,m.ename
from emp w
join emp m on (w.mgr=m.empno(+))
where w.ename in ('KING','FORD')
4.显示员工姓名，参加工作时间，经理名，参加工作时间，要求参加时间比经理早。
select w.ename,w.mgr,m.hiredate,w.hiredate
from emp w 
join emp m on (w.mgr = m.empno)
where w.hiredate>m.hiredate


