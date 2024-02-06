-- 24.02.05 -- 

-- 카타르 아시안컵(qatar asian cup)데이터 베이스 -- 

-- [주체]
# 참가국 (국가명, 조, 감독, 피파랭킹)
# 경기장 (경기장명, 수용인원, 주소)
# 축구선수 (이름, 나이, 포지션, 소속프로팀, 등번호, 국가)
# 심판 (이름, 나이, 포지션)       

-- [관계] - 주체를 통해 나오는
# 경기 (경기일정, 국가1, 국가2, 경기장, 주심, 선심, 경기결과)

-- qatar asian cup 
create database qatar_asian_cup;
use qatar_asian_cup;
-- country (name[가변문자열 30], groupname[가변문자열 1], manager[가변문자열 30], lasnking[정수])
create table country (
	name varchar(30),
    groupname varchar(1),
    manger varchar(30),
    lasnking int
);
-- stadium (name[가변문자열 50], capacity[정수], address[가변문자열 255])
create table stadium (
	name varchar(50),
    capcity int,
    address varchar(255)
);
-- player (name[가변문자열 30], age[정수], positsion[가변문자열 15], pro_team[가변문자열 30], uniform_number[정수], country[가변문자열 30])
create table player (
	name varchar(30),
    age int,
    positsion varchar(15),
    pro_team varchar(30),
    uniform_number int,
    country varchar(30)
);
-- referee(name[가변문자열 30], age[정수], position[가변문자열 15])
create table referee (
	name varchar(30),
    age int,
    positsion varchar(15)
);
-- game (schedule[날짜 및 시간], country1[가변문자열 30], country2[가변문자열 30], stadium[가변문자열 50], chief_referee[가변문자열 30], second_referee[가변문자열 30], winning_country[가변문자열 30])
create table game (
	schedule datetime,
    country1 varchar(30),
    country2 varchar(30),
    stadium varchar(50),
    chief_referee varchar(30),
    second_referee varchar(30),
    winning_country varchar(30)
);


	


 








 




