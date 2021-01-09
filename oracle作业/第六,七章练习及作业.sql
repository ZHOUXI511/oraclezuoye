 
第六章练习
查询所有员工的每个月工资总和，平均工资
select sum(sal),avg(sal) from emp
查询工资最高和最低的工资是多少？
select max(sal),min(sal) from emp
查询公司的总人数？
select count(1) from emp
查询有奖金的总人数？
select count(distinct comm) from emp
……….
1.查询部门20的员工，每个月的工资总和及平均工资。
select sum(sal),avg(sal) from emp where deptno=20
2.查询工作在CHICAGO的员工人数，最高工资及最低工资。
select max(e.sal),min(e.sal) from emp e,dept d where e.deptno=d.deptno and loc in ('CHICAGO')
3.查询员工表中一共有几种岗位类
select count(distinct job) from emp
查询每个部门的平均工资
select avg(sal) from emp where deptno=20
select * from emp
select * from dept
1.查询每个部门的部门编号，部门名称，部门人数，最高工资，最低工资，工资总和
，平均工资。
select d.deptno,d.dname,count(d.deptno),max(sal),avg(sal),min(sal),sum(sal)
from emp e,dept d
where e.deptno=d.deptno
group by d.deptno,dname
2.查询每个部门，每个岗位的部门编号，部门名称，岗位名称，部门人数，
最高工资，最低工资，工资总和，平均工资。
select  d.deptno,d.dname,job,count(1),max(sal),avg(sal),min(sal),sum(sal)
from emp  e,dept d
where e.deptno=d.deptno
group by d.deptno,d.dname,job
3.查询每个经理所管理的人数，经理编号，经理姓名，要求包括没有下属的经理信息。
select m.empno,m.ename,count(w.empno)
from emp w,emp m
where w.mgr(+) = m.empno
group by m.empno,m.ename
1.查询部门人数大于2的部门编号，部门名称，部门人数。
select e.deptno,d.dname,count(empno)
from emp e,dept d
where e.deptno=d.deptno 
group by  e.deptno,d.dname
having count(empno)>2
2.查询部门平均工资大于2000，且人数大于2的部门编号，部门名称，部门人数，部门平均工资，并按照部门人数升序排序。
select e.deptno,d.dname,count(empno),avg(sal)
from emp e join dept d
on  e.deptno=d.deptno 
group by  e.deptno,d.dname
having  count(empno)>2 
--and avg(sal)>2000
1.查询部门平均工资在2500元以上的部门名称及平均工资。
Select d.dname,avg(sal) from emp e join dept d on e.deptno=d.deptno
group by d.dname,e.deptno
having avg(sal)>1800
--
Select d.dname,avg(sal) from emp e,dept d where e.deptno=d.deptno
group by d.dname,e.deptno
having avg(sal)>1800
2.查询员工岗位中不是以“SA”开头并且平均工资在2500元以上的岗位及平均工资，并按平均工资降序排序。
select e.job,avg(sal) from emp e,dept d where e.deptno=d.deptno 
group by e.deptno,e.job
having job not like 'SA%' and avg(sal)>1000
order by avg(sal)
3.查询部门人数在2人以上的部门名称、最低工资、最高工资,并对求得的工资进行四舍五入到整数位。
select d.dname,round(min(sal)),round(max(sal)),count(1) from dept d,emp e where e.deptno=d.deptno
group by d.dname,e.deptno
having count(1)>2
4.查询岗位不为SALESMAN，工资和大于等于2500的岗位及每种岗位的工资和。 
select job,sum(sal) from emp group by job 
having sum(sal)>1000 and job<>'SALESMAN'
5.显示经理号码和经理姓名，这个经理所管理员工的最低工资，没有经理的KING也要显示，不包括最低工资小于3000的，按最低工资由高到低排序。
select m.empno,m.ename,min(e.sal) from emp e,emp m where e.mgr(+)=m.empno
group by m.empno,m.ename 
having min(e.sal) >1000
order by min(e.sal)
6.写一个查询，显示每个部门最高工资和最低工资的差额
select deptno,max(sal),min(sal),max(sal)-min(sal) from emp 
group by deptno
第七章
查询工资比Jones工资高的员工信息？
select * from emp  where sal>(select sal from emp where ename='Jones')
查询工资最低的员工姓名？
select ename from emp where sal=(select min(sal) from emp )
1.查询入职日期最早的员工姓名，入职日期
select ename,hiredate from emp where hiredate=(select min(hiredate) from emp)
2.查询工资比SMITH工资高并且工作地点在CHICAGO的员工姓名，工资，部门名称
select e.ename,e.sal,d.dname from emp e,dept d where e.deptno=d.deptno  AND sal>(select sal from emp where ename='SMITH') and loc in 'CHICAGO'
3.查询入职日期比20部门入职日期最早的员工还要早的员工姓名，入职日期
select ename,hiredate from emp where hiredate<(select min(hiredate) from emp where deptno=20)
4.查询部门人数大于所有部门平均人数的的部门编号，部门名称，部门人数
select e.deptno,d.dname,count(e.ename) from emp e,dept d where e.deptno(+)=d.deptno group by e.deptno,d.dname 
having count(e.ename) >(select avg(count(e.ename)) from emp e ,dept d where e.deptno(+)=d.deptno group by e.deptno)
Select 'test' || '&' from dual
 Select 'test&' from dual;
Select 'It' || chr(39) || 'fine' from dual;
---练习2
1.查询入职日期比10部门任意一个员工晚的员工姓名、入职日期，不包括10部门员工iredat
select ename,hiredate
from emp
where hiredate>any(select hiredate from emp where deptno=10)
and deptno<>10
2.查询入职日期比10部门所有员工晚的员工姓名、入职日期，不包括10部门员工
select ename,hiredate
from emp
where hiredate>all (select hiredate from emp where deptno=10)
and deptno<>10
3.查询职位和10部门任意一个员工职位相同的员工姓名，职位，不包括10部门员工
select  ename,job
from emp
where job in (select job from emp where deptno=10)
and deptno<>10
--练习三
1.查询职位及经理和10部门任意一个员工职位及经理相同的员工姓名，职位，不包括10部门员工
select ename,job from emp 
where (mgr,job) in (select mgr,job from emp where deptno=10) and deptno<>10 

2.查询职位及经理和10部门任意一个员工职位或经理相同的员工姓名，职位，不包括10部门员工
 select ename,job from emp 
where (mgr in (select mgr from emp where deptno=10)  
or
job in (select job from emp where deptno=10))and deptno<>10
--练习4
1.查询比自己职位平均工资高的员工姓名、职位，部门名称，职位平均工资
 select e.ename  员工姓名, e.job    职位,d.dname  部门名称, a.avgsal 职位平均工资
      from emp e,dept d,(select e.job, avg(sal) avgsal from emp e group by e.job) a
     where e.deptno = d.deptno
       and e.job = a.job
       and e.sal > a.avgsal;
2.查询职位和经理同员工SCOTT或BLAKE完全相同的员工姓名、职位，不包括SCOOT和BLAKE本人。
select e.ename,e.job from emp e
where (e.job,e.mgr) in (select e.job,e.mgr from emp e where e.ename in ('SCOTT','BLAKE'))
and e.ename not in ('SCOTT','BLAKE');
3.查询不是经理的员工姓名。

select * from emp e where 0=(select count(1) from emp  where e.empno=mgr)
select * from emp e where not exists (select 1 from emp  where mgr=e.empno)
练习五
1.查询入职日期最早的前5名员工姓名，入职日期。
select rownum,e.ename,e.hiredate from (select ename,hiredate from emp order by hiredate asc) e
where rownum<5
2.查询工作在CHICAGO并且入职日期最早的前2名员工姓名，入职日期。
select rownum, e.ename 员工姓名, e.hiredate 入职日期, e.loc
from (select e.*,d.* from emp e, dept d
where e.deptno = d.deptno  and d.loc = 'CHICAGO'
order by hiredate asc) e
where rownum <= 2;
1.按照每页显示5条记录，分别查询第1页，第2页，第3页信息，要求显示员工姓名、
入职日期、部门名称。
select e.rn,e.ename,  e.hiredate ,e.dname   
from (select rownum rn, e.*, d.*  from emp e, dept d
where e.deptno = d.deptno) e
where e.rn <= 5;

作业:
1.查询工资高于编号为7782的员工工资，并且和7369号员工从事相同工作的员工的编号、
姓名及工资。
select empno,ename,sal
from emp
where sal>(select sal from emp where empno=7782)
and job=(select job from emp where empno=7369)

2.查询工资最高的员工姓名和工资。 
select ename,sal
from emp
where sal=(select max(sal) from emp )
3.查询部门最低工资高于10号部门最低工资的部门的编号、名称及部门最低工资。
--部门最低工资 
select min(sal) from emp group by deptno
--10号部门最低工资
select min(sal) from emp where deptno=10

select d.deptno,d.dname,min(sal) 
from emp e,dept d
where e.deptno=d.deptno 
group by d.deptno,d.dname
having min(sal)>(select min(sal) from emp where deptno=10)

4.查询员工工资为其部门最低工资的员工的编号和姓名及工资。
--部门最低工资
select min(sal) from emp group by deptno
select ename,deptno,empno
from emp 
where deptno is not null and
sal in (select min(sal) from emp group by deptno)

5.显示经理是KING的员工姓名，工资。
select empno from emp where ename='KING'
select ename,sal
from emp
where mgr=(select empno from emp where ename='KING')

6.显示比员工SMITH参加工作时间晚的员工姓名，工资，参加工作时间。
--select hiredate from emp where ename='SMITH'
select ename,sal,hiredate
from emp
where hiredate >(select hiredate from emp where ename='SMITH')

7.使用子查询的方式查询哪些职员在NEW YORK工作。
select e.ename from emp e,dept d where e.deptno=d.deptno and loc='NEW YORK'
8.写一个查询显示和员工SMITH工作在同一个部门的，雇用日期，查询结果中排除SMITH。
--select deptno from emp where ename='SMITH';
select ename 员工姓名, hiredate 雇用日期
from emp
where deptno =(select deptno from emp where ename='SMITH')
9.写一个查询显示其工资比全体职员平均工资高的员工编号、姓名。
--select avg(sal) from emp 
select empno 员工编号,ename 姓名
from emp
where sal>(select avg(sal) from emp)
10.写一个查询显示其上级领导是King的员工姓名、工资。
--上级领导是King:select empno from emp where ename='KING' 
select ename 员工姓名,sal 工资 from emp where mgr=(select empno from emp where ename='KING' ) 

11.显示所有工作在RESEARCH部门的员工姓名，职位。
--工作在RESEARCH部门 select deptno from dept where dname='RESEARCH' 
select e.ename 员工姓名,e.job 职位
from dept d,emp e
where d.deptno=e.deptno
and d.deptno=(select deptno from dept where dname='RESEARCH')
12.查询每个部门的部门编号、平均工资，要求部门的平均工资高于部门20的平均工资。
--select avg(sal) from emp where deptno is not null group by deptno
--select avg(sal) from emp where deptno=20
select deptno 部门编号,avg(sal) 平均工资  from emp where deptno is not null
group by deptno having avg(sal) >(select avg(sal) from emp where deptno=20)
--13.查询大于自己部门平均工资的员工姓名，工资，所在部门平均工资，高于部门平均工资的额度。
--自己部门平均工资select avg(sal),deptno from emp where deptno is not null group by deptno
select e.ename 员工姓名,e.sal 工资,avgsal 所在部门平均工资,sal-avgsal 高于部门平均工资的额度
from emp e,(select avg(sal) avgsal,deptno from emp where deptno is not null group by deptno) d
where e.deptno=d.deptno and  e.sal > avgsal

 -- sal > (select avg(sal) from emp group by deptno)
14. 列出至少有一个雇员的所有部门
select d.deptno 部门, count(e.ename) 部门人数
from emp e, dept d
where e.deptno(+) = d.deptno
group by d.deptno
having count(e.ename) >= 1;
15. 列出薪金比"SMITH"多的所有雇员
--select sal from emp where ename='SMITH'
select ename from emp where sal>(select sal from emp where ename='SMITH')
--16. 列出入职日期早于其直接上级的所有雇员
--select m.hiredate from emp e,emp m where e.mgr =m.empno
select e.ename 雇员姓名, e.mgr 雇员经理, e.hiredate 雇员入职日期,mgr.hiredate 经理入职日期
from emp e, emp mgr
where e.mgr = mgr.empno(+)
and e.hiredate < mgr.hiredate;
17. 找员工姓名和直接上级的名字
select e.ename 员工姓名,m.ename 直接上级的名字
from emp e,emp m
where e.mgr=m.empno 
18. 显示部门名称和人数
select count(e.deptno) 人数,d.dname 部门名称
from emp e,dept d
where e.deptno=d.deptno
group by e.deptno,d.dname
19. 显示每个部门的最高工资的员工
--每个部门的最高工资select max(sal) from emp where deptno is not null group by deptno 
select ename 员工,deptno 部门,sal 工资
  from emp
 where sal in
       (select max(sal) maxsal from emp where deptno is not null group by deptno)
20. 显示出和员工号7369部门相同的员工姓名，工资
select deptno from emp where empno =7369
select ename 员工姓名,sal 工资,deptno 部门 from emp where deptno=(select deptno from emp where empno =7369)
21. 显示出和姓名中包含"W"的员工相同部门的员工姓名
--select ename,deptno from emp where instr(ename,'W',1,1)>0
select e.ename 员工姓名,d.deptno  from emp e,(select ename,deptno from emp where instr(ename,'W',1,1)>0) d
 where e.deptno =d.deptno
--select *from emp
22. 显示出工资大于平均工资的员工姓名，工资
--select avg(sal) from emp 
select ename,sal from emp where sal>(select avg(sal) from emp)
23. 显示出工资大于本部门平均工资的员工姓名，工资
--本部门平均工资select avg(sal),deptno from emp where deptno is not null group by deptno
select  ename,sal from emp where sal > (select avg(sal) from emp where deptno is not null group by deptno)
24. 显示每位经理管理员工的最低工资，及最低工资者的姓名
select mgr,min(sal) from emp group by mgr
select ename 最低工资者的姓名,sal from emp where sal in (select min(sal) from emp group by mgr)
select minsal,ename 最低工资者的姓名
from emp e,(select mgr,min(sal) minsal from emp group by mgr) m
where e.mgr=m.mgr
25. 显示比工资最高的员工参加工作时间晚的员工姓名，参加工作时间
select max(sal) from emp 
select ename 员工姓名,hiredate 参加工作时间 from emp where sal=(select max(sal) from emp )
26. 显示出平均工资最高的的部门平均工资及部门名称
select max(avg(sal))  from emp where deptno is not null group by deptno
select  dname 部门名称,avg(sal) 工资最高的的部门平均工资
from emp e,dept d
where e.deptno=d.deptno 
group by dname
having avg(sal)=(select max(avg(sal))  from emp where deptno is not null group by deptno  )



