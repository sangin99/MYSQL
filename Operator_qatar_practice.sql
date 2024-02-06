-- 24.02.06 --

USE qatar_asian_cup;
-- --------- 데이터 삽입---------------
INSERT INTO player VALUES ('조규성', 0, null, null, null, '대한민국');
INSERT INTO player VALUES ('박용우', 0, null, null, null, '대한민국');
INSERT INTO player VALUES ('황인범', 0, null, null, null, '대한민국');
INSERT INTO player VALUES ('손흥민', 0, null, null, null, '대한민국');
INSERT INTO player VALUES ('송범근', 0, null, null, null, '한국');
INSERT INTO player VALUES ('오현규', 0, null, null, null, '한국');

INSERT INTO player VALUES ('쿠보 다케후사', 0, null, null, null, '일본');
INSERT INTO player VALUES ('이토 준야', 0, null, null, null, '일본');
INSERT INTO player VALUES ('미토마 가오루', 0, null, null, null, '일본');
INSERT INTO player VALUES ('엔도 와타루', 0, null, null, null, '일본');
-- -----------------------------------
-- > player 이름이 '조규성' 이면 나이를 27, 포지션을 FW, 프로팀을 FC 밀트윌란, 등번호를 10으로 변경
-- > player 이름이 '박용우' 이면 나이를 32, 포지션을 MF, 프로팀을 알아인 FC, 등번호를 5로 변경
-- > player 이름이 '쿠보 다케후사' 이면서 국적이 일본이면 나이를 24, 포지션을 MF/FW, 프로팀을 레알 소시에다드, 등번호를 20로 변경

-- **UPDATE절과 WHERE을 적절히 사용**
UPDATE player
SET age = 27 , positsion = 'FW' , pro_team = 'FC 미트월란' , uniform_number = 10
WHERE name = '조규성';

UPDATE player
SET age = 32 , positsion = 'MF' , pro_team = '알아인 FC' , uniform_number = 5
WHERE name = '박용우';

UPDATE player
SET age = 24 , positsion = 'MF/FW' , pro_team = '레알 소시에다드' , uniform_number = 20
WHERE name = '쿠보 다케후사' AND country = '일본';

-- **이름이 손흥민인 선수를 조회**
SELECT * FROM player WHERE name = '손흥민';

UPDATE player 
SET age = 34 ,  positsion = 'FW' , pro_team = '토트넘 훗스퍼' , uniform_number = 7
WHERE name = '손흥민';

-- **대한민국 선수 중 나이가 30세 이상인 선수 조회**
SELECT * FROM player 
WHERE country = '대한민국' AND age >= 30;

-- **국가명이 요르단인 국가를 제거**
DELETE FROM country WHERE name = '요르단';
