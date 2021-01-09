---第十七章
1.建立新用户neu
create user neu identified by 123456
2.给用户neu授权,使其能够登录到数据库，能够查询scott下的emp表，能修改emp表的sal,ename两个字段
grant create session to neu;
grant select on scott.emp to neu;
grant update(sal,ename) on scott.emp to neu;
3.回收用户neu的登录权限
revoke create session from emp;
4.回收用户neu的所有对象权限
revoke select on scott.emp from neu
revoke update on scott.emp from neu;
5.建立角色role_neu
create role role_neu;
6.给角色role_neu授权,使其能够登录到数据库
grant create session to role_test;
7.赋角色role_neu给用户neu
grant role_neu to neu;
8.删除角色role_neu
drop role role_neu;
9.删除用户neu
drop user test;
