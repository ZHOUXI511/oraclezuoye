
  
 --������-��ϰ��
 1.��ѯ������20��30��Ա�����������ű�ţ������չ�����������
 select ename,deptno,sal from emp where deptno in (10,20) order by sal;
2.��ѯ������2000-3000֮�䣬���Ų���10�ŵ�Ա�����������ű�ţ����ʣ������ղ������򣬹��ʽ�������
select deptno,sal,ename from emp where sal>=2000 and sal<=3000 order by deptno, sal desc;
3.��ѯ��ְ������82����83��֮�䣬ְλ��SALES����MAN��ͷ��Ա����������ְ���ڣ�ְλ����������ְ���ڽ�������
select ename,hiredate,job from emp where hiredate between '1-1��-1982' and '31-12��-1983' and job like 'SALES%'
or job like 'MAN%' order by hiredate desc;
--�����£���ϰ1
1.дһ����ѯ,������ĸ��д��������ĸСд��ʾ��Ա�� ename����ʾ���ֵĳ��ȣ�����ÿ��һ���ʵ��ı�ǩ��
�������������й�Ա���ֵĿ�ʼ��ĸ��J��A �� M �Ĺ�Ա�����Բ�ѯ�������Ա��ename��������
����ʾ��ʹ��initcap��length��substr��
select initcap(ename) ���֣�length(ename) ���ֳ��� from emp where substr��ename��1��1�� in ('A','J','M') order by ename asc;
--��������ϰ��
1.��ѯԱ���������а�����д��Сд��ĸA��Ա��������
select ename from emp where instr(upper(ename),'A',1,1)>0;
select ename from emp where lower(ename) like '%a%' and upper(ename) like '%A%';
2.��ѯ���ű��Ϊ10��20����ְ������81��5��1��֮�󣬲��������а�����д��ĸA��Ա��������Ա����������
����ʾ��Ҫ��ʹ��INSTR����������ʹ��like�����ж�)
select ename,deptno, length(ename) from emp where hiredate>'1-5��-81' and deptno in (10,20) and instr(initcap(ename),'A',1,1)>0;
3.��ѯÿ��ְ���ı��,����������
Ҫ�󽫲�ѯ�������ݰ���һ���ĸ�ʽ�ϲ���һ���ַ���.
ǰ10λ�����,���㲿����*���,�����
�м�10λ�����������㲿����*���,�����
��10λ�����ʣ����㲿����*���,�Ҷ���
select  concat(concat(lpad(deptno,10,'*'),lpad(ename,10,'*')),rpad(sal,10,'*')) from emp; 
--������ ��ϰ��
1.дһ����ѯ���ֱ����100.456 �������뵽С������2λ����1λ������λ��ֵ��
select round(100.456,2) from dual
select round(100.456,1) from dual;
select round(100.456,0) from dual;
2.дһ����ѯ���ֱ����100.456 ��С������2λ����1λ������λ�ضϵ�ֵ��
select trunc(100.456,2) from dual;
select trunc(100.456,1) from dual;
select trunc(100.456,0) from dual;
--�����£���ϰ��
1.��ѯÿ��Ա����ֹ������һ����ְ�����죿
select ename,round(sysdate-hiredate) from emp;
2.��ǰ����Ϊ2015�ָ꣬�����ڸ�ʽΪDD-MON-RR,ָ������Ϊ01-1��-01��������ʵ�������������Ϊ��
select to_date('01-1��-01','DD-MON-RR') from dual;
3.��ǰ����Ϊ2015�ָ꣬�����ڸ�ʽΪDD-MON-RR,ָ������Ϊ01-1��-95��������ʵ�������������Ϊ��
select to_date('01-1��-95','DD-MON-RR') from dual;
4.��ǰ����Ϊ1998�ָ꣬�����ڸ�ʽΪDD-MON-RR,ָ������Ϊ01-1��-01��������ʵ�������������Ϊ��
select to_date('01-1��-01','DD-MON-RR') from dual;
5.��ǰ����Ϊ1998�ָ꣬�����ڸ�ʽΪDD-MON-RR,ָ������Ϊ01-1��-95��������ʵ�������������Ϊ��
select to_date('01-1��-95','DD-MON-RR') from dual;
6.��ǰ����Ϊ2015�ָ꣬�����ڸ�ʽΪDD-MON-YY,ָ������Ϊ01-1��-01��������ʵ�������������Ϊ��
select to_date('01-1��-01','DD-MON-YY')from dual;
7.��ǰ����Ϊ1998�ָ꣬�����ڸ�ʽΪDD-MON-YY,ָ������Ϊ01-1��-95��������ʵ�������������Ϊ��
select to_date('01-1��-95','DD-MON-YY')from dual;
select to_date('01-1��-95','DD_MON_YY')from dual;
--��������ϰ��
1.��ѯ��������ǰʱ��
select  sysdate from dual;
2.��ѯ����10,20��Ա����ֹ��2000��1��1�գ������˶��ٸ��£���ְ���·ݡ�(��ʾ��ʹ��months_between,extract)
SELECT months_between('1-1��-2000',hiredate) ,extract (month from hiredate) num_month,ename,hiredate
 from emp where deptno in (10,20); 
3.���Ա��������6���£���ѯְλ����MANAGER��Ա����������ְ���ڣ�ת�����ڣ���ְ���ں�ĵ�һ������һ
,��ְ���µ����һ�����ڡ�����ʾ��ʹ��add_months,next_day,last_day)
select ename,hiredate,add_months(hiredate,6) ת�����ڣ�next_day(hiredate,'����һ')��
last_day(hiredate) from emp;
��������ϰ��
1.��ʾ������ϵͳ��ǰʱ�䣬��ʽΪ2007-10-12 17:11:11(��ʾ��ʹ��to_char����)
select to_char(sysdate,'YYYY-MM-DD HH24:mm:ss') from dual;
2.��ʾename��hiredate �� ��Ա��ʼ�����������ڼ����б�ǩDAY(��ʾ��ʹ��to_char����)
select ename,hiredate,to_char(hiredate,'day') Day from emp;
select ename,hiredate,to_char(hiredate,'day') from emp;

3.��ѯԱ�����������ʣ���ʽ���Ĺ��ʣ���999,999.99�� (��ʾ��ʹ��to_char����)
select ename,sal,to_char(sal,'L999,999.99') sal from emp; 
4.���ַ���2015-3��-18 13:13:13 ת�������ڸ�ʽ���������ϵͳ��ǰʱ���������졣 (��ʾ��ʹ��to_date����)
select to_date('2015-3��-18 13:13:13','yyyy-mon-DD HH24:mi:ss') ����,
round(sysdate-to_date('2015-3��-18 13:13:13','YYYY-mon-DD HH24:mi:ss' ))
from dual;


--1.����2000��1��1�յ������ж����£������ܣ��������룩��
SELECT round(months_between(sysdate,'1-1��-2000')) from dual;
SELECT round((sysdate - to_date('1-1��-2000')) / 7) from dual;
--2.��ѯԱ��ENAME�ĵ�������ĸ��A��Ա������Ϣ(ʹ��2������)��
select * from emp where substr(upper(ename),3,1) in ('A');
--3.ʹ��trim�������ַ�����hello������  Hello ������bllb������ hello    ���ֱ���õ������ַ���ello��Hello��ll��hello��
select trim('h' from 'hello' ) from dual;
select trim('  Hello ') from dual;
select trim('b' from 'bllb') from dual; 
select trim ('hello       ')from dual;
--4.��Ա�����ʰ����¸�ʽ��ʾ��123,234.00 RMB ��
select to_char(sal,'L999,999.99')||'RMB' from emp;
select concat��to_char��sal��'L999,9999.99'��,'RMB'�� from emp;
--5.��ѯԱ�����������侭���ţ�Ҫ�����û�о������ʾ��No Manager���ַ�����
select ename,mgr,nvl2(mgr,to_char(mgr),'NO MANAGER') from emp;
select ename,mgr,case when mgr is null then 'NO Manager' else to_char(mgr) end from emp;
--6.��Ա���Ĳμӹ������ڰ����¸�ʽ��ʾ���·�/��ݡ� 
select ename��to_char(hiredate,'MM/YY')  from emp;

--7.��Ա�����в�ѯ��Ա���Ĺ��ʣ�������Ӧ��˰��������С��1000,˰��Ϊ0��������ʴ��ڵ���1000��С��2000��˰��Ϊ10����
������ʴ��ڵ���2000��С��3000��˰��Ϊ15����������ʴ��ڵ���3000��˰��Ϊ20����

select ename,sal,case 
  when sal>=1000 and sal<2000 then (sal-1000)*0.1
    when sal>=2000 and sal<3000 then (sal-2000)*0.15+1000*0.1
      when sal>=3000 then (sal-3000)*0.2+1000*0.1+1000*0.15
        else 0 
          end ˰��
          from emp;
--8.����һ����ѯ��ʾ���й�Ա�� ename�� sal����ʽ��salΪ 15 ���ַ����ȣ��� $ ����䣬�б�ǩ SALARY��
select ename,lpad(sal,15,'$') SALARY from emp;



