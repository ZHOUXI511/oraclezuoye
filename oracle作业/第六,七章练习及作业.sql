 
��������ϰ
��ѯ����Ա����ÿ���¹����ܺͣ�ƽ������
select sum(sal),avg(sal) from emp
��ѯ������ߺ���͵Ĺ����Ƕ��٣�
select max(sal),min(sal) from emp
��ѯ��˾����������
select count(1) from emp
��ѯ�н������������
select count(distinct comm) from emp
������.
1.��ѯ����20��Ա����ÿ���µĹ����ܺͼ�ƽ�����ʡ�
select sum(sal),avg(sal) from emp where deptno=20
2.��ѯ������CHICAGO��Ա����������߹��ʼ���͹��ʡ�
select max(e.sal),min(e.sal) from emp e,dept d where e.deptno=d.deptno and loc in ('CHICAGO')
3.��ѯԱ������һ���м��ָ�λ��
select count(distinct job) from emp
��ѯÿ�����ŵ�ƽ������
select avg(sal) from emp where deptno=20
select * from emp
select * from dept
1.��ѯÿ�����ŵĲ��ű�ţ��������ƣ�������������߹��ʣ���͹��ʣ������ܺ�
��ƽ�����ʡ�
select d.deptno,d.dname,count(d.deptno),max(sal),avg(sal),min(sal),sum(sal)
from emp e,dept d
where e.deptno=d.deptno
group by d.deptno,dname
2.��ѯÿ�����ţ�ÿ����λ�Ĳ��ű�ţ��������ƣ���λ���ƣ�����������
��߹��ʣ���͹��ʣ������ܺͣ�ƽ�����ʡ�
select  d.deptno,d.dname,job,count(1),max(sal),avg(sal),min(sal),sum(sal)
from emp  e,dept d
where e.deptno=d.deptno
group by d.deptno,d.dname,job
3.��ѯÿ������������������������ţ�����������Ҫ�����û�������ľ�����Ϣ��
select m.empno,m.ename,count(w.empno)
from emp w,emp m
where w.mgr(+) = m.empno
group by m.empno,m.ename
1.��ѯ������������2�Ĳ��ű�ţ��������ƣ�����������
select e.deptno,d.dname,count(empno)
from emp e,dept d
where e.deptno=d.deptno 
group by  e.deptno,d.dname
having count(empno)>2
2.��ѯ����ƽ�����ʴ���2000������������2�Ĳ��ű�ţ��������ƣ���������������ƽ�����ʣ������ղ���������������
select e.deptno,d.dname,count(empno),avg(sal)
from emp e join dept d
on  e.deptno=d.deptno 
group by  e.deptno,d.dname
having  count(empno)>2 
--and avg(sal)>2000
1.��ѯ����ƽ��������2500Ԫ���ϵĲ������Ƽ�ƽ�����ʡ�
Select d.dname,avg(sal) from emp e join dept d on e.deptno=d.deptno
group by d.dname,e.deptno
having avg(sal)>1800
--
Select d.dname,avg(sal) from emp e,dept d where e.deptno=d.deptno
group by d.dname,e.deptno
having avg(sal)>1800
2.��ѯԱ����λ�в����ԡ�SA����ͷ����ƽ��������2500Ԫ���ϵĸ�λ��ƽ�����ʣ�����ƽ�����ʽ�������
select e.job,avg(sal) from emp e,dept d where e.deptno=d.deptno 
group by e.deptno,e.job
having job not like 'SA%' and avg(sal)>1000
order by avg(sal)
3.��ѯ����������2�����ϵĲ������ơ���͹��ʡ���߹���,������õĹ��ʽ����������뵽����λ��
select d.dname,round(min(sal)),round(max(sal)),count(1) from dept d,emp e where e.deptno=d.deptno
group by d.dname,e.deptno
having count(1)>2
4.��ѯ��λ��ΪSALESMAN�����ʺʹ��ڵ���2500�ĸ�λ��ÿ�ָ�λ�Ĺ��ʺ͡� 
select job,sum(sal) from emp group by job 
having sum(sal)>1000 and job<>'SALESMAN'
5.��ʾ�������;����������������������Ա������͹��ʣ�û�о����KINGҲҪ��ʾ����������͹���С��3000�ģ�����͹����ɸߵ�������
select m.empno,m.ename,min(e.sal) from emp e,emp m where e.mgr(+)=m.empno
group by m.empno,m.ename 
having min(e.sal) >1000
order by min(e.sal)
6.дһ����ѯ����ʾÿ��������߹��ʺ���͹��ʵĲ��
select deptno,max(sal),min(sal),max(sal)-min(sal) from emp 
group by deptno
������
��ѯ���ʱ�Jones���ʸߵ�Ա����Ϣ��
select * from emp  where sal>(select sal from emp where ename='Jones')
��ѯ������͵�Ա��������
select ename from emp where sal=(select min(sal) from emp )
1.��ѯ��ְ���������Ա����������ְ����
select ename,hiredate from emp where hiredate=(select min(hiredate) from emp)
2.��ѯ���ʱ�SMITH���ʸ߲��ҹ����ص���CHICAGO��Ա�����������ʣ���������
select e.ename,e.sal,d.dname from emp e,dept d where e.deptno=d.deptno  AND sal>(select sal from emp where ename='SMITH') and loc in 'CHICAGO'
3.��ѯ��ְ���ڱ�20������ְ���������Ա����Ҫ���Ա����������ְ����
select ename,hiredate from emp where hiredate<(select min(hiredate) from emp where deptno=20)
4.��ѯ���������������в���ƽ�������ĵĲ��ű�ţ��������ƣ���������
select e.deptno,d.dname,count(e.ename) from emp e,dept d where e.deptno(+)=d.deptno group by e.deptno,d.dname 
having count(e.ename) >(select avg(count(e.ename)) from emp e ,dept d where e.deptno(+)=d.deptno group by e.deptno)
Select 'test' || '&' from dual
 Select 'test&' from dual;
Select 'It' || chr(39) || 'fine' from dual;
---��ϰ2
1.��ѯ��ְ���ڱ�10��������һ��Ա�����Ա����������ְ���ڣ�������10����Ա��iredat
select ename,hiredate
from emp
where hiredate>any(select hiredate from emp where deptno=10)
and deptno<>10
2.��ѯ��ְ���ڱ�10��������Ա�����Ա����������ְ���ڣ�������10����Ա��
select ename,hiredate
from emp
where hiredate>all (select hiredate from emp where deptno=10)
and deptno<>10
3.��ѯְλ��10��������һ��Ա��ְλ��ͬ��Ա��������ְλ��������10����Ա��
select  ename,job
from emp
where job in (select job from emp where deptno=10)
and deptno<>10
--��ϰ��
1.��ѯְλ�������10��������һ��Ա��ְλ��������ͬ��Ա��������ְλ��������10����Ա��
select ename,job from emp 
where (mgr,job) in (select mgr,job from emp where deptno=10) and deptno<>10 

2.��ѯְλ�������10��������һ��Ա��ְλ������ͬ��Ա��������ְλ��������10����Ա��
 select ename,job from emp 
where (mgr in (select mgr from emp where deptno=10)  
or
job in (select job from emp where deptno=10))and deptno<>10
--��ϰ4
1.��ѯ���Լ�ְλƽ�����ʸߵ�Ա��������ְλ���������ƣ�ְλƽ������
 select e.ename  Ա������, e.job    ְλ,d.dname  ��������, a.avgsal ְλƽ������
      from emp e,dept d,(select e.job, avg(sal) avgsal from emp e group by e.job) a
     where e.deptno = d.deptno
       and e.job = a.job
       and e.sal > a.avgsal;
2.��ѯְλ�;���ͬԱ��SCOTT��BLAKE��ȫ��ͬ��Ա��������ְλ��������SCOOT��BLAKE���ˡ�
select e.ename,e.job from emp e
where (e.job,e.mgr) in (select e.job,e.mgr from emp e where e.ename in ('SCOTT','BLAKE'))
and e.ename not in ('SCOTT','BLAKE');
3.��ѯ���Ǿ����Ա��������

select * from emp e where 0=(select count(1) from emp  where e.empno=mgr)
select * from emp e where not exists (select 1 from emp  where mgr=e.empno)
��ϰ��
1.��ѯ��ְ���������ǰ5��Ա����������ְ���ڡ�
select rownum,e.ename,e.hiredate from (select ename,hiredate from emp order by hiredate asc) e
where rownum<5
2.��ѯ������CHICAGO������ְ���������ǰ2��Ա����������ְ���ڡ�
select rownum, e.ename Ա������, e.hiredate ��ְ����, e.loc
from (select e.*,d.* from emp e, dept d
where e.deptno = d.deptno  and d.loc = 'CHICAGO'
order by hiredate asc) e
where rownum <= 2;
1.����ÿҳ��ʾ5����¼���ֱ��ѯ��1ҳ����2ҳ����3ҳ��Ϣ��Ҫ����ʾԱ��������
��ְ���ڡ��������ơ�
select e.rn,e.ename,  e.hiredate ,e.dname   
from (select rownum rn, e.*, d.*  from emp e, dept d
where e.deptno = d.deptno) e
where e.rn <= 5;

��ҵ:
1.��ѯ���ʸ��ڱ��Ϊ7782��Ա�����ʣ����Һ�7369��Ա��������ͬ������Ա���ı�š�
���������ʡ�
select empno,ename,sal
from emp
where sal>(select sal from emp where empno=7782)
and job=(select job from emp where empno=7369)

2.��ѯ������ߵ�Ա�������͹��ʡ� 
select ename,sal
from emp
where sal=(select max(sal) from emp )
3.��ѯ������͹��ʸ���10�Ų�����͹��ʵĲ��ŵı�š����Ƽ�������͹��ʡ�
--������͹��� 
select min(sal) from emp group by deptno
--10�Ų�����͹���
select min(sal) from emp where deptno=10

select d.deptno,d.dname,min(sal) 
from emp e,dept d
where e.deptno=d.deptno 
group by d.deptno,d.dname
having min(sal)>(select min(sal) from emp where deptno=10)

4.��ѯԱ������Ϊ�䲿����͹��ʵ�Ա���ı�ź����������ʡ�
--������͹���
select min(sal) from emp group by deptno
select ename,deptno,empno
from emp 
where deptno is not null and
sal in (select min(sal) from emp group by deptno)

5.��ʾ������KING��Ա�����������ʡ�
select empno from emp where ename='KING'
select ename,sal
from emp
where mgr=(select empno from emp where ename='KING')

6.��ʾ��Ա��SMITH�μӹ���ʱ�����Ա�����������ʣ��μӹ���ʱ�䡣
--select hiredate from emp where ename='SMITH'
select ename,sal,hiredate
from emp
where hiredate >(select hiredate from emp where ename='SMITH')

7.ʹ���Ӳ�ѯ�ķ�ʽ��ѯ��ЩְԱ��NEW YORK������
select e.ename from emp e,dept d where e.deptno=d.deptno and loc='NEW YORK'
8.дһ����ѯ��ʾ��Ա��SMITH������ͬһ�����ŵģ��������ڣ���ѯ������ų�SMITH��
--select deptno from emp where ename='SMITH';
select ename Ա������, hiredate ��������
from emp
where deptno =(select deptno from emp where ename='SMITH')
9.дһ����ѯ��ʾ�乤�ʱ�ȫ��ְԱƽ�����ʸߵ�Ա����š�������
--select avg(sal) from emp 
select empno Ա�����,ename ����
from emp
where sal>(select avg(sal) from emp)
10.дһ����ѯ��ʾ���ϼ��쵼��King��Ա�����������ʡ�
--�ϼ��쵼��King:select empno from emp where ename='KING' 
select ename Ա������,sal ���� from emp where mgr=(select empno from emp where ename='KING' ) 

11.��ʾ���й�����RESEARCH���ŵ�Ա��������ְλ��
--������RESEARCH���� select deptno from dept where dname='RESEARCH' 
select e.ename Ա������,e.job ְλ
from dept d,emp e
where d.deptno=e.deptno
and d.deptno=(select deptno from dept where dname='RESEARCH')
12.��ѯÿ�����ŵĲ��ű�š�ƽ�����ʣ�Ҫ���ŵ�ƽ�����ʸ��ڲ���20��ƽ�����ʡ�
--select avg(sal) from emp where deptno is not null group by deptno
--select avg(sal) from emp where deptno=20
select deptno ���ű��,avg(sal) ƽ������  from emp where deptno is not null
group by deptno having avg(sal) >(select avg(sal) from emp where deptno=20)
--13.��ѯ�����Լ�����ƽ�����ʵ�Ա�����������ʣ����ڲ���ƽ�����ʣ����ڲ���ƽ�����ʵĶ�ȡ�
--�Լ�����ƽ������select avg(sal),deptno from emp where deptno is not null group by deptno
select e.ename Ա������,e.sal ����,avgsal ���ڲ���ƽ������,sal-avgsal ���ڲ���ƽ�����ʵĶ��
from emp e,(select avg(sal) avgsal,deptno from emp where deptno is not null group by deptno) d
where e.deptno=d.deptno and  e.sal > avgsal

 -- sal > (select avg(sal) from emp group by deptno)
14. �г�������һ����Ա�����в���
select d.deptno ����, count(e.ename) ��������
from emp e, dept d
where e.deptno(+) = d.deptno
group by d.deptno
having count(e.ename) >= 1;
15. �г�н���"SMITH"������й�Ա
--select sal from emp where ename='SMITH'
select ename from emp where sal>(select sal from emp where ename='SMITH')
--16. �г���ְ����������ֱ���ϼ������й�Ա
--select m.hiredate from emp e,emp m where e.mgr =m.empno
select e.ename ��Ա����, e.mgr ��Ա����, e.hiredate ��Ա��ְ����,mgr.hiredate ������ְ����
from emp e, emp mgr
where e.mgr = mgr.empno(+)
and e.hiredate < mgr.hiredate;
17. ��Ա��������ֱ���ϼ�������
select e.ename Ա������,m.ename ֱ���ϼ�������
from emp e,emp m
where e.mgr=m.empno 
18. ��ʾ�������ƺ�����
select count(e.deptno) ����,d.dname ��������
from emp e,dept d
where e.deptno=d.deptno
group by e.deptno,d.dname
19. ��ʾÿ�����ŵ���߹��ʵ�Ա��
--ÿ�����ŵ���߹���select max(sal) from emp where deptno is not null group by deptno 
select ename Ա��,deptno ����,sal ����
  from emp
 where sal in
       (select max(sal) maxsal from emp where deptno is not null group by deptno)
20. ��ʾ����Ա����7369������ͬ��Ա������������
select deptno from emp where empno =7369
select ename Ա������,sal ����,deptno ���� from emp where deptno=(select deptno from emp where empno =7369)
21. ��ʾ���������а���"W"��Ա����ͬ���ŵ�Ա������
--select ename,deptno from emp where instr(ename,'W',1,1)>0
select e.ename Ա������,d.deptno  from emp e,(select ename,deptno from emp where instr(ename,'W',1,1)>0) d
 where e.deptno =d.deptno
--select *from emp
22. ��ʾ�����ʴ���ƽ�����ʵ�Ա������������
--select avg(sal) from emp 
select ename,sal from emp where sal>(select avg(sal) from emp)
23. ��ʾ�����ʴ��ڱ�����ƽ�����ʵ�Ա������������
--������ƽ������select avg(sal),deptno from emp where deptno is not null group by deptno
select  ename,sal from emp where sal > (select avg(sal) from emp where deptno is not null group by deptno)
24. ��ʾÿλ�������Ա������͹��ʣ�����͹����ߵ�����
select mgr,min(sal) from emp group by mgr
select ename ��͹����ߵ�����,sal from emp where sal in (select min(sal) from emp group by mgr)
select minsal,ename ��͹����ߵ�����
from emp e,(select mgr,min(sal) minsal from emp group by mgr) m
where e.mgr=m.mgr
25. ��ʾ�ȹ�����ߵ�Ա���μӹ���ʱ�����Ա���������μӹ���ʱ��
select max(sal) from emp 
select ename Ա������,hiredate �μӹ���ʱ�� from emp where sal=(select max(sal) from emp )
26. ��ʾ��ƽ��������ߵĵĲ���ƽ�����ʼ���������
select max(avg(sal))  from emp where deptno is not null group by deptno
select  dname ��������,avg(sal) ������ߵĵĲ���ƽ������
from emp e,dept d
where e.deptno=d.deptno 
group by dname
having avg(sal)=(select max(avg(sal))  from emp where deptno is not null group by deptno  )



