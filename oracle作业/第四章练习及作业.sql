
  
 --第三章-练习五
 1.查询部门在20或30的员工姓名，部门编号，并按照工资升序排序。
 select ename,deptno,sal from emp where deptno in (10,20) order by sal;
2.查询工资在2000-3000之间，部门不在10号的员工姓名，部门编号，工资，并按照部门升序，工资降序排序。
select deptno,sal,ename from emp where sal>=2000 and sal<=3000 order by deptno, sal desc;
3.查询入职日期在82年至83年之间，职位以SALES或者MAN开头的员工姓名，入职日期，职位，并按照入职日期降序排序。
select ename,hiredate,job from emp where hiredate between '1-1月-1982' and '31-12月-1983' and job like 'SALES%'
or job like 'MAN%' order by hiredate desc;
--第五章：练习1
1.写一个查询,用首字母大写，其它字母小写显示雇员的 ename，显示名字的长度，并给每列一个适当的标签，
条件是满足所有雇员名字的开始字母是J、A 或 M 的雇员，并对查询结果按雇员的ename升序排序。
（提示：使用initcap、length、substr）
select initcap(ename) 名字，length(ename) 名字长度 from emp where substr（ename，1，1） in ('A','J','M') order by ename asc;
--第五章练习二
1.查询员工姓名中中包含大写或小写字母A的员工姓名。
select ename from emp where instr(upper(ename),'A',1,1)>0;
select ename from emp where lower(ename) like '%a%' and upper(ename) like '%A%';
2.查询部门编号为10或20，入职日期在81年5月1日之后，并且姓名中包含大写字母A的员工姓名，员工姓名长度
（提示，要求使用INSTR函数，不能使用like进行判断)
select ename,deptno, length(ename) from emp where hiredate>'1-5月-81' and deptno in (10,20) and instr(initcap(ename),'A',1,1)>0;
3.查询每个职工的编号,姓名，工资
要求将查询到的数据按照一定的格式合并成一个字符串.
前10位：编号,不足部分用*填充,左对齐
中间10位：姓名，不足部分用*填充,左对齐
后10位：工资，不足部分用*填充,右对齐
select  concat(concat(lpad(deptno,10,'*'),lpad(ename,10,'*')),rpad(sal,10,'*')) from emp; 
--第五章 练习三
1.写一个查询，分别计算100.456 四舍五入到小数点后第2位，第1位，整数位的值。
select round(100.456,2) from dual
select round(100.456,1) from dual;
select round(100.456,0) from dual;
2.写一个查询，分别计算100.456 从小数点后第2位，第1位，整数位截断的值。
select trunc(100.456,2) from dual;
select trunc(100.456,1) from dual;
select trunc(100.456,0) from dual;
--第五章，练习四
1.查询每个员工截止到现在一共入职多少天？
select ename,round(sysdate-hiredate) from emp;
2.当前日期为2015年，指定日期格式为DD-MON-RR,指定日期为01-1月-01，该日期实际所代表的日期为？
select to_date('01-1月-01','DD-MON-RR') from dual;
3.当前日期为2015年，指定日期格式为DD-MON-RR,指定日期为01-1月-95，该日期实际所代表的日期为？
select to_date('01-1月-95','DD-MON-RR') from dual;
4.当前日期为1998年，指定日期格式为DD-MON-RR,指定日期为01-1月-01，该日期实际所代表的日期为？
select to_date('01-1月-01','DD-MON-RR') from dual;
5.当前日期为1998年，指定日期格式为DD-MON-RR,指定日期为01-1月-95，该日期实际所代表的日期为？
select to_date('01-1月-95','DD-MON-RR') from dual;
6.当前日期为2015年，指定日期格式为DD-MON-YY,指定日期为01-1月-01，该日期实际所代表的日期为？
select to_date('01-1月-01','DD-MON-YY')from dual;
7.当前日期为1998年，指定日期格式为DD-MON-YY,指定日期为01-1月-95，该日期实际所代表的日期为？
select to_date('01-1月-95','DD-MON-YY')from dual;
select to_date('01-1月-95','DD_MON_YY')from dual;
--第五章练习五
1.查询服务器当前时间
select  sysdate from dual;
2.查询部门10,20的员工截止到2000年1月1日，工作了多少个月，入职的月份。(提示：使用months_between,extract)
SELECT months_between('1-1月-2000',hiredate) ,extract (month from hiredate) num_month,ename,hiredate
 from emp where deptno in (10,20); 
3.如果员工试用期6个月，查询职位不是MANAGER的员工姓名，入职日期，转正日期，入职日期后的第一个星期一
,入职当月的最后一天日期。（提示：使用add_months,next_day,last_day)
select ename,hiredate,add_months(hiredate,6) 转正日期，next_day(hiredate,'星期一')，
last_day(hiredate) from emp;
第五章练习六
1.显示服务器系统当前时间，格式为2007-10-12 17:11:11(提示：使用to_char函数)
select to_char(sysdate,'YYYY-MM-DD HH24:mm:ss') from dual;
2.显示ename、hiredate 和 雇员开始工作日是星期几，列标签DAY(提示：使用to_char函数)
select ename,hiredate,to_char(hiredate,'day') Day from emp;
select ename,hiredate,to_char(hiredate,'day') from emp;

3.查询员工姓名，工资，格式化的工资（￥999,999.99） (提示：使用to_char函数)
select ename,sal,to_char(sal,'L999,999.99') sal from emp; 
4.把字符串2015-3月-18 13:13:13 转换成日期格式，并计算和系统当前时间间隔多少天。 (提示：使用to_date函数)
select to_date('2015-3月-18 13:13:13','yyyy-mon-DD HH24:mi:ss') 日期,
round(sysdate-to_date('2015-3月-18 13:13:13','YYYY-mon-DD HH24:mi:ss' ))
from dual;


--1.计算2000年1月1日到现在有多少月，多少周（四舍五入）。
SELECT round(months_between(sysdate,'1-1月-2000')) from dual;
SELECT round((sysdate - to_date('1-1月-2000')) / 7) from dual;
--2.查询员工ENAME的第三个字母是A的员工的信息(使用2个函数)。
select * from emp where substr(upper(ename),3,1) in ('A');
--3.使用trim函数将字符串‘hello’、‘  Hello ’、‘bllb’、‘ hello    ’分别处理得到下列字符串ello、Hello、ll、hello。
select trim('h' from 'hello' ) from dual;
select trim('  Hello ') from dual;
select trim('b' from 'bllb') from dual; 
select trim ('hello       ')from dual;
--4.将员工工资按如下格式显示：123,234.00 RMB 。
select to_char(sal,'L999,999.99')||'RMB' from emp;
select concat（to_char（sal，'L999,9999.99'）,'RMB'） from emp;
--5.查询员工的姓名及其经理编号，要求对于没有经理的显示“No Manager”字符串。
select ename,mgr,nvl2(mgr,to_char(mgr),'NO MANAGER') from emp;
select ename,mgr,case when mgr is null then 'NO Manager' else to_char(mgr) end from emp;
--6.将员工的参加工作日期按如下格式显示：月份/年份。 
select ename，to_char(hiredate,'MM/YY')  from emp;

--7.在员工表中查询出员工的工资，并计算应交税款：如果工资小于1000,税率为0，如果工资大于等于1000并小于2000，税率为10％，
如果工资大于等于2000并小于3000，税率为15％，如果工资大于等于3000，税率为20％。

select ename,sal,case 
  when sal>=1000 and sal<2000 then (sal-1000)*0.1
    when sal>=2000 and sal<3000 then (sal-2000)*0.15+1000*0.1
      when sal>=3000 then (sal-3000)*0.2+1000*0.1+1000*0.15
        else 0 
          end 税款
          from emp;
--8.创建一个查询显示所有雇员的 ename和 sal。格式化sal为 15 个字符长度，用 $ 左填充，列标签 SALARY。
select ename,lpad(sal,15,'$') SALARY from emp;



