--第二章
--练习1
--1.使用两种方式查询所有员工(EMP)信息
select * from emp;
--2.查询(EMP)员工编号、员工姓名、员工职位、员工月薪、工作部门编号。
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp
--第二章练习2
--1.员工转正后，月薪上调20%，请查询出所有员工转正后的月薪。
select ename,sal,sal*1.2 from emp;
--2.员工试用期6个月，转正后月薪上调20%，请查询出所有员工工作第一年的年薪所得（不考虑奖金部分,年薪的试用期6个月的月薪+转正后6个月的月薪)
select ename,sal,(sal+sal*1.2)*6 年收入 from emp;
--第二章练习3
--1.员工试用期6个月，转正后月薪上调20%，请查询出所有员工工作第一年的所有收入（需考虑奖金部分)，要求显示列标题为员工姓名，工资收入，奖金收入，总收入。
select ename 员工姓名,sal 工资收入,nvl（comm，0） 奖金收入，(sal+sal*1.2)*6 总收入 from emp;
--第二章练习4
--1.员工试用期6个月，转正后月薪上调20%，请查询出所有员工工作第一年的所有收入（需考虑奖金部分)，要求显示格式为:XXX的第一年总收入为XXX。
select ename||'的第一年总收入为'||(sal+sal*1.2)*6 第一年总收入  from emp;
--2.查询员工表中一共有哪几种岗位类型。
select job from emp;
--1.分别选择员工表、部门表、薪资等级表中的所有数据。
select * from emp;
select *from dept;
select * from salgrade;
--2.分别查看员工表、部门表、薪资等级表的表结构。
desc emp;
desc dept;
desc salgrade;
--第三章：
--第三章练习1
--1.查询职位为SALESMAN的员工编号、职位、入职日期。
select deptno,job,hiredate from emp where job = 'SALESMAN';
--2.查询1985年12月31日之前入职的员工姓名及入职日期。
select ename,hiredate from emp where hiredate<to_date('31-12-1985','dd-mm-yyyy');
--3.查询部门编号不在10部门的员工姓名、部门编号。
select ename,deptno from emp where deptno in 10;
--第三章练习2
--1.查询入职日期在82年至85年的员工姓名，入职日期。;
select ename,hiredate from emp where hiredate between '01-1月-1982' and '31-12月-1985';
--2.查询月薪在3000到5000的员工姓名，月薪。
select ename,sal from emp where sal between 3000 and 5000;
--3.查询部门编号为10或者20的员工姓名，部门编号。
select ename,deptno from emp where deptno in (10,20);
--4.查询经理编号为7902, 7566, 7788的员工姓名，经理编号；
select ename,mgr from emp where mgr in (7902,7566,7788);
--第三章练习三；
--1.查询员工姓名以W开头的员工姓名。
select ename from emp where ename like 'W%'; 
--2.查询员工姓名倒数第2个字符为T的员工姓名。
select ename from emp where ename like '%T_';
--3.查询奖金为空的员工姓名，奖金。
select ename，comm from emp where comm is null;
--第三章练习四；
--1.查询工资超过2000并且职位是MANAGER,或者职位是SALESMAN的员工姓名、职位、工资
select ename,job,sal from emp where (sal>2000 and job='MANAGER') or job='SALESMAN';
--2.查询工资超过2000并且职位是 MANAGER或SALESMAN的员工姓名、职位、工资。
select ename ,job,sal from emp where sal>2000 and ( job= 'MANAGER' or job= 'SALESMAN');
---3.查询部门在10或者20，并且工资在3000到5000之间的员工姓名、部门、工资。
select ename,deptno,sal from emp where deptno in (10,20) and (sal<3000 and sal>5000);
--4.查询入职日期在81年，并且职位不是SALES开头的员工姓名、入职日期、职位。
select ename,hiredate,job from emp where hiredate between '01-1月-1981' and '31-12月-1981' and job not like  'SALES%';
--5.查询职位为SALESMAN或MANAGER，部门编号为10或者20，姓名包含A的员工姓名、职位、部门编号。
select ename,deptno,job from emp where （job='SALESMAN' or job='MANAGER'） and deptno in (10,20) and ename like '%A%';








