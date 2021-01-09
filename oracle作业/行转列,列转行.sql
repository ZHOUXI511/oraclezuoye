---------------------------Oracle数据库 行转列 列转行
在统计数据的时候，尤其是画图表的时候，都需要不同形式的数据格式和数据结构，方便前端的展示
对于不同的展示也需要不同的数据结构处理，

列转行:
思路：通过名字分组，然后查询每个人各科成绩
关键字：decode() 
语法：decode(条件,值一,返回值一) 
当条件等于值一时，输出返回值一

ex:
-------创建学生成绩表
create table tab_student
(
       sid number(10) primary key,----給学生编号加主键
       sname varchar(20) not null ,----学生姓名
       course varchar(20) not null,----课程
       score number(5,2) check(score >= 0) ----学生成绩 大于或等于0
)
drop table tab_student
-------添加数据
insert into tab_student values(1,'张三','语文',81);
insert into tab_student values(2,'张三','数学',75);
insert into tab_student values(3,'李四','语文',62.5);
insert into tab_student values(4,'李四','数学',90);
insert into tab_student values(5,'王五','语文',80);
insert into tab_student values(6,'王五','数学',100);
insert into tab_student values(7,'王五','英语',75);

-------查询表
select * from tab_student

-------列转行
select sname,decode(course,'语文',score) 语文 from tab_student
select sname,
       min(decode(course,'语文',score)) 语文,---分组之后只能使用分组函数
       max(decode(course,'数学',score)) 数学,---用min,max,sum函数都行，因为只有一个数
       sum(decode(course,'英语',score)) 英语
from tab_student
group by sname----根据名字分组



用途：查询一个人各科的成绩

-------行转列
想法：通过名字分组 将每个人的语文成绩分为一组，数学成绩分一组，英语成绩分为一组
       然后运用联合运算将每个组相加合成一个新的表
关键词：union all 
--------------将列转行的结果生成一个新的表
create table student_copy as (select sname,
                              min(decode(course,'语文',score)) 语文,
                              max(decode(course,'数学',score)) 数学,
                              sum(decode(course,'英语',score)) 英语
                              from tab_student
                              group by sname)

-----查询新表
select * from  student_copy
drop table student_copy
select * from (
       select sname ,'语文' course,min(语文) source from student_copy group by sname
       union all
       select sname ,'数学' course,max(数学) source from student_copy group by sname
       union all 
       select sname ,'英语' course,sum(英语) source from student_copy group by sname
       )
where source is not null -----去掉空值
order by sname


用途：查询几个商品四个季度的销售





