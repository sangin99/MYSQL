-- 24.02.05 -- 

use practice_sql;

-- DML (데이터 조작어)
-- 테이블에 데이터를 삽입, 조회, 수정, 삭제 할 때 사용

# INSERT : 테이블에 데이터를 `삽입`하는 명령어
	-- 1. 모든 열에 대하여 데이터 삽입
    -- 	INSERT INTO 테이블명 VALUES (데이터1, 데이터2, ...);
	INSERT INTO example_table
	VALUES ('문자열데이터', '텍스트데이터', 99, 3.14, 3.21, true, '2024-02-05', now());
	
    -- 2. 특정 열에 대하여 데이터 삽입
    -- 	INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...) VALUES (데이터1, 데이터2, ...);
	INSERT INTO example_table (int_column, boolean_column)
	VALUES (50, false);

# SELECT : 테이블에서 데이터를 `조회`하는 명령어
	-- 1. 모든 데이터 조회
    -- 	SELECT * FROM 테이블명;
	SELECT * FROM example_table;
	
	-- 2. 테이블의 특정 컬럼 데이터 조회
    -- 	SELECT 컬럼명1, 컬럼명2, ... FROM 테이블명;
	SELECT int_column, text_column FROM example_table;

	-- 3. 테이블에서 특정 조건에 따른 데이터 조회
    -- 	SELECT 조회할 컬럼명... FROM 테이블명 WHERE 조건;
	SELECT * FROM example_table WHERE int_column = 50;
    
# UPDATE : 테이블에서 데이터를 `수정`하는 명령어
	-- UPDATE 테이블명 SET 컬럼1 = 데이터1, ... ;
	-- UPDATE 테이블명 SET 컬럼1 = 데이터1, ... WHERE 조건;
    UPDATE example_table SET boolean_column = false;
    UPDATE example_table SET datetime_column = now() WHERE int_column = 50; 
    
# DELETE : 테이블에서 데이터를 `삭제`하는 명령어
	-- DELETE FROM 테이블명;
    -- DELETE FROM 테이블명 WHERE 조건;
    DELETE FROM example_table WHERE int_column = 50;
    DELETE FROM example_table;

TRUNCATE TABLE example_table;   -- 구조만 남기고, 내용을 지운다


create table auto_table (
	idx int primary key auto_increment,      -- auto_increment : 숫자 자동 증가 명령어 / 데이터만 지웠기 때문에 삭제 후 다시 생성하면 이후 번호부터 시작!
    
    num int 
);

insert into auto_table (num) values(0);
select * from auto_table;
delete from auto_table;       -- 데이터에 대한 작업
truncate table auto_table;    -- 구조만 남기고

## 삭제 명령어 3가지
-- DROP TABLE : DDL 테이블의 구조 전체를 제거
-- TUNCATE TABLE : DDL 테이블의 구조만 남기고 초기화
-- DELETE TABLE : DML 테이블에서 데이터만 제거

 















