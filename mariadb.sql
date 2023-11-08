#관리자 계정으로 진행 - root
#DB 생성
create database nam2626;

#계정 생성 방법
create user 'nam2626'@'%' identified by '123456';
#모든 권한 부여
grant all privileges on nam2626.* to 'nam2626'@'%';
#권한 회수 방법
revoke all privileges on nam2626.* from 'nam2626'@'%';

#데이터 베이스 목록 확인
show databases;

#데이터 베이스 선택
use nam2626;

#데이터 타입
#숫자 : INT,BIGINT, DECIMAL, FLOAT, DOUBLE
#문자열 : CHAR, VARCHAR, TEXT, BLOB
#날짜 : DATE, TIME, TIMESTAMP

#학생 테이블
#학번 이름 학과번호 평점
create table student(
	std_no char(8) primary key,
	std_name varchar(30),
	major_no decimal(2) default 0,
	std_score float(3,2)
);
#학과 테이블
#학과번호 학과명
create table major(
	major_no decimal(2) primary key,
	major_name varchar(50) not null
);
#과목 테이블
#과목번호, 과목명, 교수번호, 최대수강인원수
create table subject(
	subject_no decimal(2) primary key,
	subject_name varchar(50) not null,
	professor_no char(8) not null,
	total_count int(3) default 0
);
#교수 테이블
create table professor(
	professor_no char(8) primary key,
	professor_name varchar(30) not null,
	major_no decimal(2) default 0
);
#수강 테이블
create table subject_sugang(
	su_no int auto_increment primary key,
	student_no char(8) not null,
	subject_no decimal(2) not null,
	add_time timestamp default current_timestamp
);
#학생 테이블에 학과번호를 외래키로 지정, 학과 테이블에 있는 학과번호를 참조
alter table student add constraint sdt_fk_majro_no
foreign key(major_no) references major(major_no) on update cascade;
#과목 테이블에서 교수번호를 외래키로 지정, 교수 테이블에 있는 교수번호를 참조
alter table subject add constraint subject_fk_professor_no
foreign key(professor_no) 
references professor(professor_no) on delete cascade on update cascade;
#교수 테이블에서 학과번호를 외래키로 지정, 학과 테이블에 있는 학과번호를 참조
alter table professor add constraint professor_fk_major_no
foreign key(major_no) references major(major_no);
#수강 테이블에서 학생번호,과목번호를 외래키로 지정, 
#학생 테이블에 있는 학생번호를 참조, 과목 테이블에 있는 과목번호를 참조
alter table subject_sugang add constraint sugang_fk_std_no
foreign key(student_no) references student(std_no)
on delete cascade on update cascade;
alter table subject_sugang add constraint sugang_fk_subject_no
foreign key(subject_no) references subject(subject_no)
on delete cascade on update cascade;

#학생테이블의 평점은 0.0~4.5로 제약조건 추가
#과목테이블의 총수강인원은 0 이상 입력되게끔 제약조건을 추가









