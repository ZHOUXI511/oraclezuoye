--�ڰ�����ϰ
˼������ѯ���Ϊ7839��Ա����ǰ���ʡ���λ����ʷ���ʡ���λ��
select sal ,job from emp where empno=7839
union all
select sal,job from emp_jobhistory where empno=7839
--��ϰ1
1.�ֱ�ʹ���������㼰��ȫ����������ɣ�����ʱ������˳�򣬲�ѯԱ��7839�Ĺ�����λ�б�
select hiredate,job from emp where empno=7839
union 
select begindate, job  from emp_jobhistory where empno=7839 
--
select job,hiredate from emp where empno=7839
union all
select job ,begindate from emp_jobhistory where empno=7839 
order by hiredate asc
2.ʹ�ö�����ӣ���ѯÿ�����ŵĲ��ű�ţ�����������û�������Ĳ�����ʾ0��
---select d.deptno ,count(1) from emp e,(SELECT DEPTNO from dept ) d where e.deptno(+)=d.deptno group by d.deptno
select d.deptno ���ű��,COUNT(empno) from emp e,dept d where e.deptno(+)=d.deptno group by d.deptno---ok

3.ʹ���������㣬��ѯÿ�����ŵĲ��ű�ţ�����������û�������Ĳ�����ʾ0��
select deptno,count(1) from emp  where deptno is not null group by deptno
union all
select deptno, nvl(to_number(null),0) from dept where deptno is not null 
---
select deptno,count(empno) from emp where deptno is not null group by deptno
union
select d.deptno,count(empno) from emp e,dept d where e.deptno(+)=d.deptno group by d.deptno;
4.ʹ���������㣬��ѯ10�Ų��ż�20�Ų��ŵ�Ա�����������ű�š�
select ename,deptno from emp where deptno=10
union
select ename,deptno from emp where deptno=20
ORDER BY DEPTNO
select id, empno, job, begindate, sal from emp_jobhistory
5. ʹ�ü������㣬�������Ч����
select deptno,loc,to_char(null),to_date(null) from dept where deptno is not null 
union 
select deptno,to_char(null),ename,hiredate from emp where deptno is not null 

1.�ü������㣬�г�������jobΪSALESMAN �Ĳ��ŵĲ��źš�
select deptno from emp where deptno is not null
minus
select deptno from emp where job='SALESMAN' 
select *from emp
2.дһ�����ϲ�ѯ���г��������Ϣ��
EMP�������й�Ա�����ֺͲ��ű��,���������Ƿ������κβ��š�
select ename,deptno from emp 
union 
select to_char(null),deptno from dept
DEPT���е����в��ű�źͲ������ƣ����������Ƿ���Ա����
select deptno,dname from dept
minus
select deptno,to_char(null) from emp
3.�ü��������ѯ��ְλΪSALESMAN�Ͳ��ű��Ϊ10����Ա��š�������ְλ�����ų��ظ������
select deptno,ename,job from emp where job='SALESMAN'
union all
select deptno,ename,job from emp where deptno=10
4.�ü��ϲ�ѯ������Ϊ10��20��������Ա��š����������ڲ������ơ�
select e.deptno,e.ename,d.dname from emp e,dept d where e.deptno=d.deptno and e.deptno=10
union 
select e.deptno,e.ename,d.dname from emp e,dept d where e.deptno=d.deptno and e.deptno=20
