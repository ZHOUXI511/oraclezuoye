�ھ���
˼����β�ѯ������ְλƽ�����ʸߵ�Ա��������ְλ��
select ename Ա������, job ְλ from emp e
where sal > (select avg(sal) from emp where job = e.job);

1.��ѯ������ְλƽ�����ʸߵ�Ա��������ְλ��
select ename Ա������, job ְλ from emp e
where sal > (select avg(sal) from emp where job = e.job);
2.��ѯ����Ϊ�䲿����͹��ʵ�Ա����ţ����������ʡ�
select empno Ա����ţ� ename ����, sal ���� from emp e
where sal = (select min(sal) from emp where deptno = e.deptno);
24
��ϰ��
 1.��ѯ���й�Ա��ţ����ֺͲ������֡�
select e.empno Ա����ţ�e.ename ����, (select dname from dept where deptno = e.deptno) ��������
from emp e;
 2.��ѯ��ЩԱ���Ǿ���
select * from emp e
where 0 < (select count(1) from emp where mgr = e.empno);
 3.��ѯ��ЩԱ�����Ǿ���
select * from emp e
where 0 = (select count(1) from emp where mgr = e.empno);
4.��ѯÿ�����Ź�����͵�����Ա����ţ����������ʡ�
select e.empno Ա�����, e.ename ����, e.sal ����,deptno from emp e
where 2 > (select count(*) from emp 
  where deptno = e.deptno and sal < e.sal)
and deptno is not null;

��ϰ��
 1.�г�������һ����Ա�����в������ơ�
select dname �������� from dept d
where exists (select 1 from emp where deptno = d.deptno);

 2.�г�һ����Ա��û�е����в������ơ�
select dname �������� from dept d
where not exists (select 1 from emp where deptno = d.deptno);

-- �κ���ҵ
 1.��ѯнˮ���������ڲ���ƽ��нˮ�Ĺ�Ա���֣����źš�
select ename ��Ա����, deptno ���ź�,sal from emp e
where sal > (select avg(sal) from emp where deptno = e.deptno);
 2.��ѯԱ��������ֱ���ϼ������֡�
select e.ename Ա������, (select ename from emp where empno = e.mgr) �ϼ�����
from emp e;
3.��ѯÿ�����Ź�����ߵ�Ա�����������ʡ�
select e.ename Ա������, e.sal ���� from emp e
where sal = (select max(sal) from emp where deptno = e.deptno);
4.��ѯÿ�����Ź���ǰ�����ߵ�Ա�����������ʡ�
select e.ename Ա������, e.sal ����,deptno from emp e
where 2 > (select count(ename) from emp 
where deptno = e.deptno and e.sal<sal);
