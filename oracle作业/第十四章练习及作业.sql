1.ѧУ��һ��ѡ��ϵͳ�����а������¹�ϵģʽ��
ϵ(ϵ��ţ� ������
   ϵ����:  Ψһ����
   ϵ���Σ� �ǿ�Լ����
   ϵ����Уȥ��ȡֵ��Χֻ�����Ϻ�У���ͻ���У��)
   create table xi
(
xi_id number(5) primary key,
xi_name varchar2(30) unique,
xi_head varchar2(30) not null,
xi_loc varchar2(30) check(xi_loc='�Ϻ�У��' and xi_loc='����У��')
)
select * from xi
�༶(�༶��ţ� ������
     �༶���ƣ� Ψһ����
     ����ϵ��  ���)
     create table classss (
     c_id number(5) primary key,
     c_cname varchar2(30) unique ,
     c_xi  varchar2(30) not null
     )
     select * from classs
2.����ѧ����������������:
ѧ�� �����ַ��� 10λ ����
���� �䳤�ַ��� 20λ �ǿ�
�Ա� �����ַ��� 2λ ȡֵ��Χֻ��Ϊ�л�Ů
�������� ������ 
���ڰ༶ 
create table student1
(
stu_id char(10) primary key,
stu_name varchar2(20)not null,
stu_sex char(2) check(stu_sex ='��' and stu_sex ='Ů'),
stu_birthday date,
stu_class number(5) constraint fk_student1_cla_id REFERENCES classss (c_id ))
1.����5��Լ���ĺ��塣
1.not null
2.primary key
3.foreign key
4.unique
5.check
2.����ѧ����ϵsc��������������
ѡ����ˮ�� ��ֵ�� ������
ѧ����� �ǿ� ���
�γ̱�� �ǿ� �����
�ɼ�     0-100֮�䣻
create table stu
(
stu_id number(5)primary key,
stu_ename nvarchar2(50)not null
);
create table course1
(
cour_id number(5)primary key,
cour_ename varchar2(50)not null
);
3.����copy_emp��Ҫ���ʽͬemp����ȫһ�������������ݡ�
create table copy_emp1 as
select *from emp where 1=0
4.����copy_dept��Ҫ���ʽͬdept����ȫһ�������������ݡ�
create table copy_dept1 as
select *from dept where 1=0;
5.����copy_emp �������deptno������copy_dept��deptno,����ܷ�ɹ�,Ϊʲô��
alter table copy_emp1 add constraint copy_emp1_deptno_fk foreign key(deptno) references copy_dept1(deptno);
6.׷��copy_dept��������deptno
alter table copy_dept1 add constraint copy_dept1_deptno_pk primary key(deptno);
