-- drop table t; 
-- drop table date_t;

-- create table t (n int);
-- insert into t values (1);
-- insert into t select * from t; -- 이걸 13번 반복하면 4096행이 생성됨. 10년치 데이터라면 대략 3650일이므로 이정도면 충분
-- create table date_t (d date, ds char(8)); -- 날짜를 저장할 테이블
-- insert into date_t
-- select d, date_format(d, '%Y%m%d') from (
--   select @rnum:=@rnum+1 as rownum, date(adddate('2021-01-01', interval @rnum day)) as d
--   from (select @rnum:=-1) r, t
--   ) t
-- where year(d) < 2031;

select date_format(adddate('2021-1-1', @num:=@num+1), '%Y-%m-%d') date from date_t, (select @num:=-1) num limit 3652;

-- left join
select * from (select date_format(adddate('2021-1-1', @num:=@num+1), '%Y-%m-%d') date from date_t, (select @num:=-1) num limit 3652) a left join onoff b on a.date=b.date;
select a.date, b.user_no, b.on_time, b.off_time, b.state from (select date_format(adddate('2021-1-1', @num:=@num+1), '%Y-%m-%d') date from date_t, (select @num:=-1) num limit 3652) a left join onoff b on a.date=b.date;

-- join
select * from user;
select * from onoff;
select a.no, a.name, a.role, a.birth, a.gender, a.phone, a.hire_date, a.leave_date, a.profile, a.position, a.m_leave, a.a_leave, a.address, a.email from user a left join onoff b on a.no=b.user_no;
select * from onoff a join schedule b on a.user_no=b.user_no;
select a.date, a.user_no, a.on_time, a.off_time, a.state, b.from_date, b.to_date, b.category, b.title, b.memo from onoff a join schedule b on a.user_no=b.user_no;

select * from (select date_format(adddate('2021-1-1', @num:=@num+1), '%Y-%m-%d') date from date_t, (select @num:=-1) num limit 3652) a left join (select a.date, a.user_no, a.on_time, a.off_time, a.state, b.from_date, b.to_date, b.category, b.title, b.memo from onoff a join schedule b on a.user_no=b.user_no) b on a.date=b.date;

