-----��ʮ����
��ϰ1
1.����һ�����У���������ʼֵ��1��ʼ�������ֵ��������1����ѭ����
create sequence dept_seq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
cache 20;

2.��ѯ���еĵ�ǰֵ����һ��ֵ
select dept_seq.nextval from dual
select dept_seq.currval from dual
3.ʹ�õ�1�����������У����ű��в���������¼�����ű��ʹ������ֵ���������Ʒֱ�Ϊ��Education��Market�����зֱ�Ϊ��DALLAS��WASHTON
insert into dept (deptno,dname,loc) values (dept_seq.nextval,'Education','DALLAS') 
insert into dept (deptno,dname,loc) values (dept_seq.nextval,'Market','WASHTO')
select *from dept
CREATE TABLE e1 AS SELECT * FROM emp;
INSERT INTO e1 SELECT * FROM e1;--������� 
UPDATE e1 SET empno=ROWNUM;  --�������м�¼��empno��
					--��ʹ����ֵΨһ
commit;--�ύ
select * from e1
insert into e1 select * from e1
update e1 set empno=rownum
---��ϰ2----------
1.ʹ���Ӳ�ѯ�ķ�ʽ������test��
create table test as select * from emp
2.���ٸ���test���е����ݣ����Ƶ�100w������
insert into test select * from test
3.����test���е�empno�ֶ�Ϊrownum
update test set empno=rownum
4.��ѯtest��empnoΪ800000�ļ�¼ֵ����¼��ѯִ��ʱ�䡣
select * from e1 where empno=80033
5.��test���empno�ֶ��ϴ�������
create index idx_test_empno on  test(empno)
create index idx_e1_empno on e1(empno)
6.����ִ�е�4�⣬�ԱȲ�ѯʱ��
select ename,sal from e1 where empno=203656
1.�����¹�ϵģʽ��
student(sno,sname,gender,birthday,email);--ѧ��
course(cno,cname,type,credit);--�γ�
sc��sno,cno,grade);--ѡ��
�Է�����Щ�����ʺϴ���������
�ʺ�:sno,cno
--�ʺϴ�������
���������ܴ�
Ҫ��ѯ�Ľ������2%-4%����
����������WHERE�����е��л��߶�����ӵ���
��ѯ�е����ݷ�Χ�ֲ��ܹ�
��ѯ���а���������NULLֵ,��Ϊ��ֵ��������������
---���ʺϴ�������
��������С�ı�
�ڲ�ѯ�в���������Ϊ��ѯ��������
Ƶ�����µı�
��������Ϊ���ʽ��һ���ֱ�ʹ��ʱ�����糣��ѯ��������SALARY*12����ʱ��SALARY���ϴ���������û��Ч����
��ѯ�������е��к���ʱ���ò�������
1.�������У���ʼλ1������Ϊ1����СֵΪ1�����ֵΪ9999
create sequence esc_seq
start with 1
increment by 1
minvalue 1
maxvalue 9999
cycle
 
2.�������У���ʼֵΪ50��ÿ������5��
create sequence ess_seq
start with 50
increment by 5
3.�ڱ�copy_dept�в����¼�����в��ź��������һ���д������������ɣ�
create table copy_dept as select * from dept
insert into copy_dept (dname,deptno,loc) values ('ddd',esc_seq.nextval,'ccc')
select * from copy_dept
4.��Ϊ���ʴ����������Ƚ�<10000,>1000,��round��sal��>10000,�ĸ�������Ч���ĸ�������Ч��
  create index sal_index on emp(sal);
    select * from emp where sal < 10000;--��
    select * from emp where sal > 1000;--��
    select * from emp where round(sal) > 10000;--��

5.���������á�create table copy_emp_index as select * from emp��������500�������ݣ������еġ�Ա���š��ֶ��޸�ΪΨһ��
create table copy_emp_index as select * from emp
---update table copy_emp_index modify empno constraints table copy_emp_index_un unique(empno)
----Create unique index index_empno on table(copy_emp_index) 
alter table copy_emp_index modify(empno unique)

6.��ѯ��copy_emp_index����Ա����Ϊ200001��Ա�����������ʣ���¼ִ��ʱ�䣻
select ename,sal 
from copy_emp_index
where empno=200001
7.��copy_emp_index���empno�ֶ��ϴ����������ٴ�ִ�е�6����䣬��¼ִ��ʱ�䲢���Աȣ�

create index ccc_index on copy_emp_index(empno)
alter table copy_emp_index modify(empno) 
select ename,sal
from copy_emp_index
where empno=19994
