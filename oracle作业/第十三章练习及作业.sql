��ʮ����:
--��ϰһ
1.ѧУ����һ��ѡ��ϵͳ�������漰���γ̱�ѧ������ֱ𴴽����������Լ�˼������Ӧ�е��м��������͡�
create table tab_student (
shao number(11)
sname varchar2(5)

)
create table tab_course(
cid  number(3)
cname  varchar2(8)

)

--��ϰ�� 
1.ͨ���Ӳ�ѯ�ķ�ʽ����һ����dept10,�ñ���10�Ų��ŵ�Ա�����ݡ�
create table tab_dept10 as select * from emp where deptno=10
--��ϰ��
1.��Ա���������һ���Ա��У�����Ϊgender������Ϊchar(2)��Ĭ��ֵΪ���С�
alter table emp add (gender char(2) default '��')
alter table emp drop (gender)
select * from emp
2.�޸�Ա�������Ա��е���������Ϊchar(4)
alter table emp modify (gender char(4))
3.�޸�Ա�������Ա��е�Ĭ��ֵΪ��Ů��
alter table emp modify (gender char(4) default  'Ů') 
4.ɾ��Ա�����е��Ա���
alter table emp drop(gender) 

--��ҵ
1.�������������Ҫ����Ҫ����ʲô���͵��ֶ�?
(1)���2000���ֽڶ����ַ���
char(2000)
(2)������롮������ ����ո�6��
char(10)
--(3)�Ա�����'��'��'Ů��
char(4)
(4)���4000���ֽڱ䳤�ַ���
varchar2(4000)
--(5)��������ݿ�������'����'����ʾ����'������
varchar2(10)
(6)��ʾ���ַ�ΧΪ- 10��125�η���10��126�η�, ���Ա�ʾС�� Ҳ���Ա�ʾ����
number
(7)����ʾ4λ����  -9999 �� 9999
number(4)
(8)��ʾ5λ��Ч���� 2λС���� һ��С��  -999.99 �� 999.99
number(5,2)
(9)���������պ�ʱ����
date
(10)���������պ�ʱ�������
timestamp
(11)�����ƴ����ͼ��/����
blob
2.������date_test,������d������Ϊdate�͡�����date_test���в���������¼��һ����ǰϵͳ���ڼ�¼��һ����¼Ϊ��1998-08-18����
create table date_test (
d date 
)
insert into date_test (d) values (sysdate)
insert into date_test (d) values (to_date ('1998-08-18','YYYY-MM-DD'))
select * from date_test
3.������dept����ͬ��ṹ�ı�dtest����dept���в��ű����40֮ǰ����Ϣ����ñ�
create table tab_dtest as select * from dept where deptno<40
select * from tab_dtest
3.������emp��ṹ��ͬ�ı�empl�������䲿�ű��Ϊǰ30�ŵ�Ա����Ϣ���Ƶ�empl��
create table emp1 as select * from emp where deptno<30
4.��Ϊѧ����student����һ��ѧ���Ա�gender Ĭ��ֵ ��Ů����
alter table student add (gender char (2) default 'Ů')
select * from student
5.���޸�ѧ����������������Ϊ�����ַ���10λ��
alter table student modify (xm varchar2(10))

