select * from user;
select * from schedule;
select * from onoff;
select * from leaves;

insert into user value(null, '이재성', 'admin', now(), 'male', '01022256816', now(), now(), 'images/dooly.jpg', 'doctor', 1.0, 5.5, '수영구', 'dlwo9503@naver.com');
insert into user value(null, '김정현', 'user', now(), 'male', '01012341234', now(), now(), 'images/dooly.jpg', 'nurse', 1.0, 0.0, '사상구', 'wjdgus123@naver.com');
insert into user value(null, '김정인', 'user', now(), 'female', '01023452345', now(), now(), 'images/dooly.jpg', 'nurse', 0.0, 7.5, '금정구', 'wjddls123@naver.com');
insert into user value(null, '안대혁', 'admin', now(), 'male', '01034563456', now(), now(), 'images/dooly.jpg', 'doctor', 0.0, 12.0, '해운대구', 'kickscar@gmail.com');

alter table user auto_increment=1;
delete from user where no=2;
update user set no=1 where name='이재성';

