1.��ѯÿ��Ա���ı�ţ����������ʣ����ʵȼ������ڹ������У����չ��ʵȼ�������������
������(D8C4970E4637�Ի�) 10:57:14
select e.deptno Ա�����,e.ename ����,e.sal ����,s.grade,d.loc ��������
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


1.дһ����ѯ����ʾ����Ա�����������ű�ţ��������ơ�
select e.ename ����Ա��,d.deptno ���ű��,d.dname ��������
from emp e,dept d
where e.deptno=d.deptno;
2.дһ����ѯ����ʾ���й�����CHICAGO���ҽ���Ϊ�յ�Ա�������������ص㣬����
select e.ename,d.loc,e.comm
from emp e,dept d
where loc ='CHICAGO' and comm is not null;
select * from emp
3.дһ����ѯ����ʾ���������к���A�ַ���Ա�������������ص㡣
select e.ename Ա������,d.loc �����ص�
from emp e,dept d
where e.deptno=d.deptno and instr(upper(ename),'A',1,1)>0;


select e.empno,e.ename,d.dname,deptno
from emp e 
natural join dept d

select e.ename ,d.dname,d.deptno,s.grade
from emp e
join dept d on(e.deptno=d.deptno)
join salgrade s on(e.sal between s.losal and s.hisal)
дһ����ѯ��䣬��ѯԱ���������������ơ������ص㣿
select w.ename,d.dname,d.loc
from emp w,dept d
where w.deptno=d.deptno
1.дһ����ѯ����ʾ����Ա�����������ű�ţ��������ơ�
select  w.ename,d.deptno,d.dname
from emp w,dept d
where w.deptno=d.deptno
2.дһ����ѯ����ʾ���й�����CHICAGO���ҽ���Ϊ�յ�Ա�������������ص㣬����
select w.ename,d.loc,w.sal
from emp w , dept d
where w.deptno=d.deptno and loc in ('CHICAGO') and comm is not null;
3.дһ����ѯ����ʾ���������к���A�ַ���Ա�������������ص㡣
select e.ename,d.loc
from emp e,dept d
where e.deptno=d.deptno and instr(ename,'A',1,1)>0;

----��---
��ѯÿ��Ա���ı�ţ����������ʣ����ʵȼ������ڹ������У����չ��ʵȼ�������������
select e.ename,e.deptno,e.sal,s.grade,d.loc
from emp e,dept d,salgrade s
where e.deptno=d.deptno and e.sal between s.losal and s.hisal
order by grade asc
select *from salgrade

��ѯÿ��Ա����������ֱ���ϼ�������
select w.ename,m.empno
from emp w,emp m
where w.mgr=m.empno(+)

1.��ѯ���й�����NEW YORK��CHICAGO��Ա��������Ա����ţ��Լ����ǵľ��������������š�
select w.ename,w.deptno,m.ename,m.empno
from emp w,emp m,dept d
where w.mgr=m.empno and d.deptno=w.deptno and loc in ('NEW YORK','CHICAGO')
2.����һ��Ļ����ϣ����û�о����Ա��King��������Ա���������
select w.ename,w.deptno,m.ename,m.empno
from emp w,emp m,dept d
where w.mgr=m.empno(+) and d.deptno=w.deptno and loc in ('NEW YORK','CHICAGO')
order by w.deptno
3.��ѯ����Ա����ţ��������������ƣ�����û�в��ŵ�Ա��ҲҪ��ʾ������
select w.ename,w.deptno,d.dname
from emp w,dept d
where w.deptno=d.deptno(+)

ʹ��SQL-99д�������������ϰ
1.����һ��Ա����Ͳ��ű�Ľ������ӡ�
select * from emp cross join dept;
2.ʹ����Ȼ���ӣ���ʾ��ְ������80��5��1��֮���Ա���������������ƣ���ְ����
select w.ename,d.dname,w.hiredate
from emp w
natural join dept d where hiredate>'1-5��-80'
3.ʹ��USING�Ӿ䣬��ʾ������CHICAGO��Ա���������������ƣ������ص�
select w.ename,d.dname,d.loc
from emp w join dept d using(deptno)
where loc in ('CHICAGO')
4.ʹ��ON�Ӿ䣬��ʾ������CHICAGO��Ա���������������ƣ������ص㣬н�ʵȼ�
select w.ename,d.dname,d.loc,s.grade
from emp w 
join dept d on (w.deptno=d.deptno)
join salgrade s on (w.sal between losal and hisal)
where d.loc in ('CHICAGO')
select * from salgrade
5.ʹ�������ӣ���ѯÿ��Ա��������������������û�о����KingҲҪ��ʾ������
select w.ename,m.ename
from emp w
left join emp m
on w.mgr=m.empno
select w.ename worker,m.ename manager
from emp w left join emp m on(w.mgr=m.empno)
6.ʹ�������ӣ���ѯÿ��Ա��������������������û�о����KingҲҪ��ʾ������
select w.ename,m.ename
from emp w
right join emp m
on m.mgr=w.empno

1.��ʾԱ��SMITH���������������ƣ�ֱ���ϼ�����\
select * from emp
select w.ename,m.ename,d.dname
from emp w 
join dept d
on w.deptno=d.deptno 
join emp m
on w.mgr=m.empno
where w.ename='SMITH'

2.��ʾԱ���������������ƣ����ʣ����ʼ���Ҫ���ʼ������4����
select w.ename��d.dname,w.sal,s.grade
from emp w
join dept d on (w.deptno=d.deptno(+))
join salgrade s on (w.sal between losal and hisal )
where s.grade>4
select * from emp;

select * from salgrade
3.��ʾԱ��KING��FORD�����Ա���������侭��������
select w.ename,m.ename
from emp w
join emp m on (w.mgr=m.empno(+))
where w.ename in ('KING','FORD')
4.��ʾԱ���������μӹ���ʱ�䣬���������μӹ���ʱ�䣬Ҫ��μ�ʱ��Ⱦ����硣
select w.ename,w.mgr,m.hiredate,w.hiredate
from emp w 
join emp m on (w.mgr = m.empno)
where w.hiredate>m.hiredate


