--�ڶ���
--��ϰ1
--1.ʹ�����ַ�ʽ��ѯ����Ա��(EMP)��Ϣ
select * from emp;
--2.��ѯ(EMP)Ա����š�Ա��������Ա��ְλ��Ա����н���������ű�š�
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp
--�ڶ�����ϰ2
--1.Ա��ת������н�ϵ�20%�����ѯ������Ա��ת�������н��
select ename,sal,sal*1.2 from emp;
--2.Ա��������6���£�ת������н�ϵ�20%�����ѯ������Ա��������һ�����н���ã������ǽ��𲿷�,��н��������6���µ���н+ת����6���µ���н)
select ename,sal,(sal+sal*1.2)*6 ������ from emp;
--�ڶ�����ϰ3
--1.Ա��������6���£�ת������н�ϵ�20%�����ѯ������Ա��������һ����������루�迼�ǽ��𲿷�)��Ҫ����ʾ�б���ΪԱ���������������룬�������룬�����롣
select ename Ա������,sal ��������,nvl��comm��0�� �������룬(sal+sal*1.2)*6 ������ from emp;
--�ڶ�����ϰ4
--1.Ա��������6���£�ת������н�ϵ�20%�����ѯ������Ա��������һ����������루�迼�ǽ��𲿷�)��Ҫ����ʾ��ʽΪ:XXX�ĵ�һ��������ΪXXX��
select ename||'�ĵ�һ��������Ϊ'||(sal+sal*1.2)*6 ��һ��������  from emp;
--2.��ѯԱ������һ�����ļ��ָ�λ���͡�
select job from emp;
--1.�ֱ�ѡ��Ա�������ű�н�ʵȼ����е��������ݡ�
select * from emp;
select *from dept;
select * from salgrade;
--2.�ֱ�鿴Ա�������ű�н�ʵȼ���ı�ṹ��
desc emp;
desc dept;
desc salgrade;
--�����£�
--��������ϰ1
--1.��ѯְλΪSALESMAN��Ա����š�ְλ����ְ���ڡ�
select deptno,job,hiredate from emp where job = 'SALESMAN';
--2.��ѯ1985��12��31��֮ǰ��ְ��Ա����������ְ���ڡ�
select ename,hiredate from emp where hiredate<to_date('31-12-1985','dd-mm-yyyy');
--3.��ѯ���ű�Ų���10���ŵ�Ա�����������ű�š�
select ename,deptno from emp where deptno in 10;
--��������ϰ2
--1.��ѯ��ְ������82����85���Ա����������ְ���ڡ�;
select ename,hiredate from emp where hiredate between '01-1��-1982' and '31-12��-1985';
--2.��ѯ��н��3000��5000��Ա����������н��
select ename,sal from emp where sal between 3000 and 5000;
--3.��ѯ���ű��Ϊ10����20��Ա�����������ű�š�
select ename,deptno from emp where deptno in (10,20);
--4.��ѯ������Ϊ7902, 7566, 7788��Ա�������������ţ�
select ename,mgr from emp where mgr in (7902,7566,7788);
--��������ϰ����
--1.��ѯԱ��������W��ͷ��Ա��������
select ename from emp where ename like 'W%'; 
--2.��ѯԱ������������2���ַ�ΪT��Ա��������
select ename from emp where ename like '%T_';
--3.��ѯ����Ϊ�յ�Ա������������
select ename��comm from emp where comm is null;
--��������ϰ�ģ�
--1.��ѯ���ʳ���2000����ְλ��MANAGER,����ְλ��SALESMAN��Ա��������ְλ������
select ename,job,sal from emp where (sal>2000 and job='MANAGER') or job='SALESMAN';
--2.��ѯ���ʳ���2000����ְλ�� MANAGER��SALESMAN��Ա��������ְλ�����ʡ�
select ename ,job,sal from emp where sal>2000 and ( job= 'MANAGER' or job= 'SALESMAN');
---3.��ѯ������10����20�����ҹ�����3000��5000֮���Ա�����������š����ʡ�
select ename,deptno,sal from emp where deptno in (10,20) and (sal<3000 and sal>5000);
--4.��ѯ��ְ������81�꣬����ְλ����SALES��ͷ��Ա����������ְ���ڡ�ְλ��
select ename,hiredate,job from emp where hiredate between '01-1��-1981' and '31-12��-1981' and job not like  'SALES%';
--5.��ѯְλΪSALESMAN��MANAGER�����ű��Ϊ10����20����������A��Ա��������ְλ�����ű�š�
select ename,deptno,job from emp where ��job='SALESMAN' or job='MANAGER'�� and deptno in (10,20) and ename like '%A%';








