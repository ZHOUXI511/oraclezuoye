---------��ʮ����-------
--��ϰ1
1.����һ����ͼ��ͨ������ͼ���Բ�ѯ��������2000-5000�ڲ��������а�����A��Ա����ţ����������ʡ�
create view empno_sal 
as select empno ,ename,sal
FROM EMP where sal between 2000 and 5000 and ename like '%A%'
select * from emp
2.ͨ��������������ͼ��ѯ����
select * from empno_sal;
---��ϰ2
1.����һ����ͼ��ͨ������ͼ���Բ�ѯ��������NEW YORK��CHICAGO��Ա����ţ����������ű�ţ���ְ���ڡ�
create view dept_loc as select e.empno,e.deptno,e.hiredate
from emp e,dept d where e.deptno=d.deptno and d.loc in ('NEW YORK','CHICAGO');
create or replace view dept_loc as select e.empno,e.deptno,e.hiredate,d.loc
from emp e,dept d where e.deptno=d.deptno and d.loc in ('NEW YORK','CHICAGO');
select * from dept_loc
inesrt into dept_loc 
2.����һ����ͼ��ͨ������ͼ���Բ�ѯ��ÿ�����ŵĲ������Ƽ���͹��ʡ�
create or replace view dept_minsal as select d.dname,min(nvl(e.sal,0)) minsal
from emp e,dept d where e.deptno(+)=d.deptno group by d.dname;
select * from dept_minsal
3.ͨ��������ͼ����ѯÿ�����Ź�����͵�Ա����������������
select e.ename,m.dname �������� from emp e,dept d, dept_minsal m
where e.deptno=d.deptno and d.dname=m.dname and m.minsal=e.sal;
--��ҵ---
1.������ͼv_emp_20������20�Ų��ŵ�Ա����ţ���������н��(��н=12*(����+���𣩣�
create or replace view v_emp_20 as select empno,ename,(sal+nvl(comm,0))*12 ��н from emp ;
2.����ͼv_emp_20�в�ѯ��н����1��ԪԱ������Ϣ��
select * from v_emp_20 where ��н>10000;
3.��Ϊ���ʴ���2000��Ա��������ͼ��Ҫ����ʾԱ���Ĳ�����Ϣ��ְλ��Ϣ�������ص㣻
create or replace view v_emp_sal as select d.deptno,e.job,d.loc from emp e,dept d where e.deptno=d.deptno;

4.���������ͼִ��insert,update,delete,����ܷ�ɹ���Ϊʲô��
insert into v_emp_20 values (999,'��������',3000)
update v_emp_20 set ename='NNN' where empno=8988
select * from v_emp_20
delete v_emp_20
