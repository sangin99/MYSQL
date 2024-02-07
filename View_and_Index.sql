-- 24.02.07 --

USE practice_sql;

# VIEW : 논리적으로만 존재하는 읽기 전용의 가상의 테이블
-- 제한된 보기를 제공할 때, 특정 쿼리문(SELECT)을 미리 작성해두는 용도
CREATE VIEW employee_view AS 
SELECT 
    E.employee_number AS employee_number,
    E.name AS employee_name,
    D.code AS department_code,
    D.name AS department_name,
    D.tel_number AS department_tel_number
FROM employee AS E LEFT JOIN department AS D
ON E.department_code = D.code;

SELECT * FROM employee_view;
SELECT * FROM employee_view WHERE employee_name = '홍길동'; 
-- !! View 는 물리적으로 데이터 복사되는 것이 아니고 논리적으로 결과를 불러오는 것이기 때문에 
-- 		view 자체로 insert, update, delete 가 불가능
INSERT INTO employee_view VALUES (10, '김길동', 'MM', '물류부', '051-0000-1234');    -- Error Code 발생

DROP VIEW employee_view;  -- 삭제
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
# 인덱스 (INDEX) : 테이블에서 데이터를 빠르게 조회할 수 있도록 도와주는 요소
CREATE INDEX department_tel_number_index
ON department (tel_number);

SELECT * FROM department WHERE tel_number = '010-1111-1111';
-- ex)예제
CREATE INDEX department_index_1
ON department (name, tel_number);
SELECT * FROM department 
WHERE name = '인사부' 
AND tel_number = '010-1111-1111';

SELECT * FROM department 
WHERE tel_number = '010-1111-1111' 
AND name = '인사부';                

drop index department_index_1 on department;   -- 삭제 : drop index 삭제할인덱스 on 인덱스명