-- 24.02.06 -- 

USE practice_sql;

-- ---------- 컬럼 데이터 추가 -----------------
ALTER TABLE jeju ADD above_avg_spd BOOLEAN;
ALTER TABLE jeju ADD above_avg_dir BOOLEAN;
ALTER TABLE jeju ADD null_column1 DOUBLE;
ALTER TABLE jeju ADD null_column2 DOUBLE;

UPDATE jeju
SET above_avg_spd = true
WHERE speed_80m > 5.5;

UPDATE jeju
SET above_avg_spd = false
WHERE speed_80m <= 5.5;

UPDATE jeju
SET above_avg_dir = true
WHERE direction_50m > 160;

UPDATE jeju
SET above_avg_dir = false
WHERE direction_50m <= 160;

UPDATE jeju
SET null_column1 = speed_80m
WHERE speed_80m > 5.5;

UPDATE jeju
SET null_column2 = direction_50m
WHERE direction_50m > 160;
-- -----------------------------------------
# 연산자
-- 1) 산술 연산자 : + , - , * , / , %
SELECT speed_80m + speed_76m + speed_70m + speed_35m AS total_speed    -- AS (total_speed) : () 출력 이름명
FROM jeju;

SELECT (speed_80m + speed_76m + speed_70m + speed_35m) / 4 AS 'speed 결과'
FROM jeju;
-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
-- 2) 비교 연산자 (WHERE절에서 자주 사용)
-- = : 좌항이 우항이 같으면 true
	SELECT * FROM jeju WHERE observe_date = '2023-07-05';   -- > 2023-07-05 데이터만! 
-- <> , != : 좌항이 우항과 다르면 true
	SELECT * FROM jeju WHERE observe_date <> '2023-07-05';
    SELECT * FROM jeju WHERE observe_date != '2023-07-05';  -- > 2023-07-05 데이터만 빼고!
-- < : 좌항이 우항보다 작으면 true
-- <= : 좌항이 우항보다 작거나 같으면 true
	SELECT * FROM jeju WHERE speed_80m < 3.5;     
    SELECT * FROM jeju WHERE speed_80m <= 3.5;
-- > : 좌항이 우항보다 크면 true
-- >= : 좌항이 우항보다 크거나 같으면 true 
	SELECT * FROM jeju WHERE speed_80m > 3.5;
    SELECT * FROM jeju WHERE speed_80m >= 3.5;
-- <=> : 좌항과 우항이 모두 null 이면 true
	SELECT * FROM jeju WHERE null_column1 <=> null_column2;
-- IS : 좌항과 우항이 같으면 true (키워드)
-- IS NOT : 좌항이 우항과 다르면 true (키워드)
	SELECT * FROM jeju WHERE above_avg_spd IS TRUE;      -- 1로 표현
    SELECT * FROM jeju WHERE above_avg_dir IS NOT FALSE; -- 1로 표현
-- IS NULL : 좌항이 NULL 이면 true
-- IS NOT NULL : 좌항이 NULL 이 아니면 true
	SELECT * FROM jeju WHERE null_column1 IS NULL;
	SELECT * FROM jeju WHERE null_column1 IS NOT NULL;
-- BETWEEN min AND max : 좌항이 min 보다 크거나 같으면서 max 보다 작거나 같으면 true
-- NOT BETWEEN min AND max : 좌항이 min 보다 작거나 max 보다 크면 같으면 true
	SELECT * FROM jeju WHERE direction_50m BETWEEN 270 AND 360;
    SELECT * FROM jeju WHERE direction_50m NOT BETWEEN 270 AND 360;
-- IN() : 주어진 값중에 하나라도 일치하는 값이 존재하면 true
-- NOT IN() : 주어진 값 들이 모두 일치하지 않으면 true
	SELECT * FROM jeju WHERE observe_date IN ('2023-08-01', '2023-09-01', '2023-10-01', '2023-11-01' , '2023-12-01');
    SELECT * FROM jeju WHERE observe_date NOT IN ('2023-08-01', '2023-09-01', '2023-10-01', '2023-11-01' , '2023-12-01');
-- ---------------- ---------------------- ------------------------- ------------------------- --------------
-- 3) 논리 연산자
-- AND (&&) : 좌항과 우항이 모두 true 이면 true 
	SELECT * FROM jeju WHERE speed_80m > 4 AND direction_50m < 180;     -- 교집합
-- OR (||) : 좌항과 우항 중 하나라도 true 이면 true
	SELECT * FROM jeju WHERE speed_80m > 4 OR direction_50m < 180;      -- 합집합
-- XOR : 좌항과 우항이 다르면 true
	SELECT * FROM jeju WHERE speed_80m > 4 XOR direction_50m < 180;     -- 합집합에서 교집합 부분을 뺸 값
-- -----------------------------------------------------------------------------------------------------------
-- 4) LIKE 연산자 : 문자열을 비교할 때 패턴을 기준으로 비교
-- % : 임의의 개수 (0-무한대) 의 문자
-- _ : 임의의 한 개 문자
	SELECT * FROM jeju WHERE observe_date LIKE '20%';  	-- '20' 으로 시작하는
	SELECT * FROM jeju WHERE observe_date LIKE '%08';	-- '08'로 끝나는
	SELECT * FROM jeju WHERE observe_date LIKE '%08%';   -- 처음이든 끝이든 '08' 을 포함한 값
   
	SELECT * FROM jeju WHERE observe_date LIKE '20_';	-- 20으로 시작하는 3자리 수
	SELECT * FROM jeju WHERE observe_date LIKE '2023-__-08';   -- 08일로 끝나는 데이터
-- ---------------------------------------------------------------------------
# 정렬 
-- 1) ORDER BY : 쿼리 결과 기준으로 정렬
-- 	ASC : 오름차순 정렬
-- 	DESC : 내림차순 정렬
-- 		**따로 적지 않아도 되지만, 기본값은 ASC 오름차순**
	SELECT * FROM jeju ORDER BY speed_80m ASC;
	SELECT * FROM jeju ORDER BY speed_80m DESC;
    SELECT observe_date FROM jeju ORDER BY speed_80m DESC;
	# 받는 순서 : FROM > WHERE > ORDER BY > SELECT
-- --------------------------------------------------------
# 중복제거
-- DISTINCT : SELECT 결과 테이블에서 컬럼의 조합의 중복을 제거하여 출력 
	SELECT DISTINCT above_avg_spd FROM jeju;
    SELECT DISTINCT above_avg_spd, above_avg_dir FROM jeju;
    

	




























