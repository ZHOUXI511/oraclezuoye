---------------------------Oracle���ݿ� ��ת�� ��ת��
��ͳ�����ݵ�ʱ�������ǻ�ͼ���ʱ�򣬶���Ҫ��ͬ��ʽ�����ݸ�ʽ�����ݽṹ������ǰ�˵�չʾ
���ڲ�ͬ��չʾҲ��Ҫ��ͬ�����ݽṹ����

��ת��:
˼·��ͨ�����ַ��飬Ȼ���ѯÿ���˸��Ƴɼ�
�ؼ��֣�decode() 
�﷨��decode(����,ֵһ,����ֵһ) 
����������ֵһʱ���������ֵһ

ex:
-------����ѧ���ɼ���
create table tab_student
(
       sid number(10) primary key,----�oѧ����ż�����
       sname varchar(20) not null ,----ѧ������
       course varchar(20) not null,----�γ�
       score number(5,2) check(score >= 0) ----ѧ���ɼ� ���ڻ����0
)
drop table tab_student
-------�������
insert into tab_student values(1,'����','����',81);
insert into tab_student values(2,'����','��ѧ',75);
insert into tab_student values(3,'����','����',62.5);
insert into tab_student values(4,'����','��ѧ',90);
insert into tab_student values(5,'����','����',80);
insert into tab_student values(6,'����','��ѧ',100);
insert into tab_student values(7,'����','Ӣ��',75);

-------��ѯ��
select * from tab_student

-------��ת��
select sname,decode(course,'����',score) ���� from tab_student
select sname,
       min(decode(course,'����',score)) ����,---����֮��ֻ��ʹ�÷��麯��
       max(decode(course,'��ѧ',score)) ��ѧ,---��min,max,sum�������У���Ϊֻ��һ����
       sum(decode(course,'Ӣ��',score)) Ӣ��
from tab_student
group by sname----�������ַ���



��;����ѯһ���˸��Ƶĳɼ�

-------��ת��
�뷨��ͨ�����ַ��� ��ÿ���˵����ĳɼ���Ϊһ�飬��ѧ�ɼ���һ�飬Ӣ��ɼ���Ϊһ��
       Ȼ�������������㽫ÿ������Ӻϳ�һ���µı�
�ؼ��ʣ�union all 
--------------����ת�еĽ������һ���µı�
create table student_copy as (select sname,
                              min(decode(course,'����',score)) ����,
                              max(decode(course,'��ѧ',score)) ��ѧ,
                              sum(decode(course,'Ӣ��',score)) Ӣ��
                              from tab_student
                              group by sname)

-----��ѯ�±�
select * from  student_copy
drop table student_copy
select * from (
       select sname ,'����' course,min(����) source from student_copy group by sname
       union all
       select sname ,'��ѧ' course,max(��ѧ) source from student_copy group by sname
       union all 
       select sname ,'Ӣ��' course,sum(Ӣ��) source from student_copy group by sname
       )
where source is not null -----ȥ����ֵ
order by sname


��;����ѯ������Ʒ�ĸ����ȵ�����





