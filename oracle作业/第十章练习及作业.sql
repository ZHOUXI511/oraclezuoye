��ʮ��
1.����һ��������ʾ BLAKE�������¼�������ֱ�Ӻͼ���¼�����Ա�����֡�нˮ�Ͳ��źš�
select level,ename,sal,deptno,empno,mgr from emp start with ename='BLAKE' connect by prior empno=mgr;
select * from emp
2.����һ��������ʾ���ڹ�Ա SMITH ����Ĳ�Σ����������������������ʾ����ֱ�Ӿ���
select level,ename from emp start with ename='SMITH' connect by prior mgr=empno 
3.����һ������������ʾ�����Σ�������Ϊ KING�Ĺ�Ա��ʼ����ʾ��Ա�����֡�����ID�Ͳ���ID��
select lpad(ename,length(ename)+(level*2)-2 ,'*'),ename,mgr,deptno from emp start with ename='KING' connect by prior empno=mgr
----4.����һ����˾��֯ͼ����ʾ�����Ρ���������˿�ʼ���ų�����jobΪCLERK���ˣ���Ҫ�ų�FORD����Щ��FORD����Ĺ�Ա��
select ename,mgr,deptno from emp where job<>'CLERK' start with ename='KING' connect by prior empno=mgr and ename<>'FORD' and mgr<>(select empno from emp where ename='FORD')
select * from emp

--�����ַ�
Select 'test' || '&' from dual
 Select 'test&' from dual;
Select 'It' || chr(39) || 'fine' from dual;