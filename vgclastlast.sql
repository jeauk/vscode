-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        11.3.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- vgc 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `vgc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `vgc`;

-- 테이블 vgc.movies 구조 내보내기
CREATE TABLE IF NOT EXISTS `movies` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '영화아이디',
  `title` varchar(255) NOT NULL COMMENT '영화제목',
  `description` text DEFAULT NULL COMMENT '영화설명',
  `release_date` date DEFAULT NULL COMMENT '제작연도',
  `genre` varchar(100) DEFAULT NULL COMMENT '장르',
  `rating` varchar(50) DEFAULT NULL COMMENT '평점',
  `poster_url` varchar(255) DEFAULT NULL COMMENT '사진위치',
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 vgc.movies:~12 rows (대략적) 내보내기
DELETE FROM `movies`;
INSERT INTO `movies` (`movie_id`, `title`, `description`, `release_date`, `genre`, `rating`, `poster_url`) VALUES
	(1, '설계자', '“정말 우연이라고 생각해요?\n\n의뢰받은 청부 살인을 사고사로 조작하는 설계자 ‘영일’(강동원).\n그의 설계를 통해 우연한 사고로 조작된 죽음들이\n실은 철저하게 계획된 살인이라는 것을 아무도 알지 못한다.\n\n최근의 타겟 역시 아무 증거 없이 완벽하게 처리한 ‘영일’에게\n새로운 의뢰가 들어온다.\n이번 타겟은 모든 언론과 세상이 주목하고 있는 유력 인사.\n작은 틈이라도 생기면 자신의 정체가 발각될 수 있는 위험한 의뢰지만\n‘영일’은 그의 팀원인 ‘재키’(이미숙), ‘월천’(이현욱), ‘점만’(탕준상)과 함께 이를 맡기로 결심한다.\n철저한 설계와 사전 준비를 거쳐 마침내 실행에 옮기는 순간\n‘영일’의 계획에 예기치 못한 변수가 발생하는데...!\n\n사고인가\n살인인가\n그의 실체가 드러나기 시작했다!', '2024-05-29', '드라마', '9.73', '/images/movie/001.jpg'),
	(2, '소울메이트', 'No.01 1998년, 처음 만났다\n“날도 더웠고 수업도 지루했고...\n그렇게 졸리고 나른하던 날에 너를 처음 만났어.”\n\nNo.02 2004년, 첫사랑이 생겼다\n“누굴 좋아하면 용기 내야 된대.”\n\nNo.03 2010년, 각자 어른이 되어간다\n“몰랐어? 나 원래 이렇게 살아.”\n\nNo.04 2014년, 흔적을 따라간다\n“가장 그리운 건... 너였어.”\n\nNo.05 지금, 그리움을 그리다\n“이젠 니 얼굴을 그리고 싶어.\n사랑 없인 그릴 수조차 없는 그림 말이야.”', '2024-05-31', '로맨스', '7.98', '/images/movie/002.jpg'),
	(3, '바커스-슈퍼스타가 될 거야', '“나는 슈퍼스타가 될 거야!”\n\n슈퍼스타를 꿈 꿔왔던 ‘로지’와 친구들은\n유명해지기 위해 다양한 종류의 영상들을\n\n인터넷에 올리지만 반응이 좋지는 않다.\n\n그러던 중 우연히 옆집에 이사를 온 슈퍼스타 ‘캣’을 만나게 되고\n\n‘로지’의 꿈을 알게 된 ‘캣’은 함께 무대에 오를 것을 제안한다.\n\n단 조건은 그동안 함께한 친구들을 버리고\n‘로지’만 함께 무대에 오르는 것\n\n거부할 수 없는 ‘캣’의 제안에 ‘로지’의 선택은?', '2024-06-01', '음악', '10.0', '/images/movie/003.jpg'),
	(4, '명탐정 코난 VS 괴도 키드', '세상을 떠들썩하게 하는 괴도이면서, 암호를 섞은 예고장과 굉장한 대사,\n화려한 수법(쇼)으로 수많은 비보를 훔쳐 인기를 얻는 "괴도 키드".\n그런 신출귀몰의 대괴도가 탄생한 것은⋯⋯.\n에코다 고등학교 2학년, 쿠로바 카이토. 어느 날, 집에 있는 숨겨진 방을 찾아\n세계적인 마술사였던 아버지 쿠로바 도이치가\n실은 세상을 떠들썩하게 하고 있던 <괴도 키드>로, 수수께끼의 조직에 살해된 것을 알게 된다.\n진상을 알아내기 위해, 카이토는 도이치가 남긴 의상을 입고\n2대 <괴도 키드>가 되어 도이치가 쫓고 있던 "전설의 빅 쥬얼"과,\n“수수께끼의 조직”의 정체에 다가간다⋯.\n\n교묘한 수법으로 수많은 사냥감을 훔쳐내는 키드가 새롭게 노린 것은, 전설의 아쿠아마린 "대해의 기적(블루 원더)".\n키드 포획에 집념을 불태우는 소노코의 친척, 스즈키 재벌 상담역 스즈키 지로키치는, 빅 쥬얼을 사용해 키드에 도전장을 보낸 것이다!\n지로키치의 도전을 받은 키드는 지로키치와 경찰의 경비에도 아랑곳하지 않고, 언제나처럼 선명하게 훔칠 터였지만,\n트릭을 풀기 위한 코난의 명추리가 시작된다!', '2024-06-05', '애니메이션', '0.00', '/images/movie/004.jpg'),
	(5, '존 오브 인터레스트', '독일 장교 루돌프 회스(크리스티안 프리델)의 가족이 사는\n그들만의 꿈의 왕국 아우슈비츠.\n아내 헤트비히(산드라 휠러)가 정성스럽게 가꾼 꽃이 만발한 정원에는\n재잘거리는 아이들의 웃음소리로 가득하다.\n\n마치 한 폭의 그림 같은 집.\n\n과연 악마는 다른 세상을 사는가?', '2024-06-05', '액션', '9.21', '/images/movie/005.jpg'),
	(6, '가필드 더 무비', '세상귀찮 집냥이, 바쁘고 험난한 세상에 던져졌다!\n\n집사 ‘존’과 반려견 ‘오디’를 기르며 평화로운 나날을 보내던 집냥이 ‘가필드’.\n어느 날, 험악한 길냥이 무리에게 납치당해 냉혹한 거리로 던져진다.\n돌봐주는 집사가 없는 집 밖 세상은 너무나도 정신없게 돌아가고\n길에서 우연히 다시 만난 아빠 길냥이 ‘빅’은 오히려 ‘가필드’를 위기에 빠지게 하는데…\n\n험난한 세상, 살아남아야 한다!', '2024-05-15', '애니메이션', '7.92', '/images/movie/006.jpg'),
	(7, '분노의 강', '“ 행복하게 살자, 우리”\n\n모두가 모르는 반쪽의 진실\n\n아버지 ‘기철’은 소중한 가족과\n\n철책의 반대편, 내일이 있는 삶을 꿈꾸며\n목숨 건 모험에 뛰어든다.\n\n하지만 그의 계획은 수포로 돌아가고,\n아들 ‘철수’만이 살아남는다.\n\n그로부터 10년 후, 모든 걸 잃은 ‘철수’ 앞에\n한줄기 빛 ‘연희’가 나타나고\n‘철수’는 다시 새로운 세상을 꿈꾸게 되는데…', '2024-05-29', '스릴러', '6.80', '/images/movie/007.jpg'),
	(8, '로봇 드림', '뉴욕 맨해튼에서 홀로 외롭게 살던 ‘도그’는\nTV를 보다 홀린 듯 반려 로봇을 주문하고\n그와 둘도 없는 단짝이 되어 행복한 나날을 보낸다\n\n그러던 어느 날, 해수욕장에 놀러 간 ‘도그’와 ‘로봇’은\n예기치 못한 상황에 휩쓸려 이별을 맞이하게 되는데···\n\n“기다려, 내가 꼭 다시 데리러 올게!”', '2024-04-13', 'SF', '8.89', '/images/movie/008.jpg'),
	(9, '청춘18x2 너에게로 이어지는 길', '“만일 그때 너에게 내 마음을 전했다면 지금의 난 달라졌을까?”\n18년 전의 대만 타이난.\n노래방에서 아르바이트를 하는 고등학생 ‘지미(허광한)’는,\n배낭여행 중 잠시 일자리를 찾아 온\n일본인 ‘아미(키요하라 카야)’를 만난다.\n\n천진난만한 그녀와 지내는 동안\n풋풋한 첫사랑의 감정이 자라는 ‘지미’.\n그러나, 돌연 ‘아미’가 귀국을 하게 되고\n갑작스런 이별에 충격을 받은 ‘지미’에게\n‘아미’는 서로의 꿈을 이룬 뒤\n다시 만나자는 약속을 하고 떠난다.\n\n“나 지금, 너에게로 가고 있어”\n시간이 지나 현재.\n타이페이에서의 성공한 삶에 지쳐 고향에 돌아온 ‘지미’는,\n예전에 ‘아미’로부터 받은 그림엽서를 발견한다.\n\n첫사랑의 기억이 되살아나고 그날의 약속을 지키기 위해\n그녀가 나고 자란 일본으로의 여행을 결심하는 ‘지미’.\n도쿄부터 가마쿠라, 나가노, 니가타\n그리고 ‘아미’의 고향 타다미로 향하는 도중\n예기치 않았던 소중한 만남을 되풀이하며\n‘지미’는 ‘아미’와 보냈던 그 여름의 나날들을 떠올린다.\n이윽고 다다른 ‘아미’의 고향에서\n‘지미’가 알게 된 18년 전 ‘아미’의 진짜 마음이란...', '2024-05-22', '드라마', '7.98', '/images/movie/009.jpg'),
	(10, '혹성탈출-새로운 시대', '인류의 시대는 끝났고, 세상의 주인이 바뀌었다!\n\n진화한 유인원과 퇴화된 인간들이 살아가는 땅.\n유인원 리더 \'프록시무스\'는 완전한 군림을 위해 \n인간들을 사냥하며 자신의 제국을 건설한다.\n\n한편, 또 다른 유인원 \'노아\'는 우연히\n숨겨진 과거의 이야기와 ‘시저’의 가르침을 듣게 되고,\n의문의 한 인간 소녀와 함께 자유를 향한 여정을 시작하게 되는데…\n\n美 버라이어티 선정 2024년 최고의 기대작\n<아바타: 물의 길> 제작진 x <메이즈 러너> 웨스 볼 감독\n5월 8일, 압도적 비주얼 스펙터클을 경험하라!', '2024-05-08', 'SF', '7.72', '/images/movie/010.jpg'),
	(11, '키타로 탄생 게게게의 수수께끼', '“절대 엿봐서는 안되는 금지된 이야기”\n\n폐허가 된 나구라 마을,\n키타로와 눈알 아버지는\n70년 전 이곳에서 일어났던 사건을 떠올린다\n\n류가 가문의 당주 \'토키사다\'의 장례식 참석을 명목으로\n수수께끼를 쫓아 마을로 오게 된 ‘미즈키’\n한편 실종된 아내를 찾기 위해\n마을에 도착한 키타로의 아버지\n‘토키사다’의 후계자 자리를 두고 소란스러운 가운데\n가문의 일족들이 하나둘씩 살해를 당하는데...\n\n인간과 요괴, 두 남자의 운명적인 만남 속\n마을에 감춰진 무시무시한 진실이 밝혀진다!', '2024-06-12', '애니메이션', '0.00', '/images/movie/011.jpg'),
	(12, '창가의 토토전', '남들과 조금 다르다는 이유로\n다니던 초등학교에서 쫓겨나게 된 ‘토토’는\n엄격한 규율로 가르치는 이전 학교와 달리,\n있는 그대로의 ‘토토’를 품어주는\n새로운 학교로 가게 된다.\n인자한 교장 선생님, 전차로 만들어진 교실,\n다양한 친구들과 함께하는 그곳에서\n‘토토’는 모든 것이 새롭고 설레는 나날을 맞이하는데…\n\n사랑스러운 토토의 세계로 초대합니다!', '2024-05-29', '드라마', '7.86', '/images/movie/012.jpg');

-- 테이블 vgc.reservation 구조 내보내기
CREATE TABLE IF NOT EXISTS `reservation` (
  `reservationId` int(11) NOT NULL AUTO_INCREMENT COMMENT '아이디',
  `location` varchar(10) DEFAULT NULL COMMENT '지역이름',
  `hall` varchar(50) DEFAULT '' COMMENT '상영관',
  `spot` varchar(10) DEFAULT NULL COMMENT '지점',
  `date` date DEFAULT NULL COMMENT '날짜',
  `starttime` time DEFAULT NULL COMMENT '시간',
  `endtime` time DEFAULT NULL COMMENT '시간',
  `userId` varchar(15) DEFAULT NULL COMMENT '회원아이디',
  PRIMARY KEY (`reservationId`),
  KEY `FK_user_TO_reservation` (`userId`),
  CONSTRAINT `FK_user_TO_reservation` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='영화예약';

-- 테이블 데이터 vgc.reservation:~21 rows (대략적) 내보내기
DELETE FROM `reservation`;
INSERT INTO `reservation` (`reservationId`, `location`, `hall`, `spot`, `date`, `starttime`, `endtime`, `userId`) VALUES
	(27, '창원', '3관', '합성점', '2024-05-09', '09:00:00', '01:00:00', NULL),
	(28, '대구', '1관', '수성점', '2024-05-09', '11:00:00', '01:00:00', NULL),
	(29, '부산', '1관', '서면점', '2024-05-30', '09:00:00', '11:00:00', NULL),
	(32, '부산', '4관', '센텀점', '2024-05-22', '05:00:00', '07:00:00', NULL),
	(33, '대구', '2관', '수성점', '2024-05-16', '11:00:00', '01:00:00', NULL),
	(34, '대구', '3관', '북구점', '2024-05-15', '09:00:00', '11:00:00', NULL),
	(35, '창원', '4관', '창원중앙점', '2024-05-08', '07:00:00', '09:00:00', NULL),
	(36, '창원', '1관', '창원중앙점', '2024-05-08', '11:00:00', '01:00:00', NULL),
	(37, '대구', '1관', '수성점', '2024-05-15', '11:00:00', '01:00:00', NULL),
	(38, '서울', '1관', '홍대점', '2024-05-08', '11:00:00', '01:00:00', NULL),
	(39, '대구', '2관', '수성점', '2024-05-15', '11:00:00', '01:00:00', NULL),
	(41, '대구', '1관', '대구중앙점', '2024-06-12', '01:00:00', '03:00:00', NULL),
	(44, '대구', '1관', '북구점', '2024-06-12', '07:00:00', '09:00:00', NULL),
	(45, '부산', '1관', '센텀점', '2024-06-06', '01:00:00', '03:00:00', NULL),
	(46, '대구', '3관', '수성점', '2024-06-21', '01:00:00', '03:00:00', NULL),
	(47, '대구', '3관', '수성점', '2024-06-21', '01:00:00', '03:00:00', NULL),
	(48, '부산', '1관', '센텀점', '2024-06-12', '03:00:00', '05:00:00', NULL),
	(49, '대구', '1관', '북구점', '2024-06-19', '03:00:00', '05:00:00', NULL),
	(50, '부산', '3관', '센텀점', '2024-06-03', '09:00:00', '11:00:00', NULL),
	(51, '부산', '1관', '센텀점', '2024-06-05', '05:00:00', '07:00:00', NULL),
	(52, '대구', '1관', '수성점', '2024-06-05', '05:00:00', '07:00:00', NULL);

-- 테이블 vgc.ticketing 구조 내보내기
CREATE TABLE IF NOT EXISTS `ticketing` (
  `ticketingId` int(11) NOT NULL AUTO_INCREMENT COMMENT '아아디',
  `seat` varchar(500) NOT NULL COMMENT '좌석좌표',
  `price` varchar(50) DEFAULT NULL,
  `reservationId` int(11) DEFAULT NULL COMMENT '아이디',
  `movieId` varchar(15) DEFAULT NULL COMMENT '아이디2',
  PRIMARY KEY (`ticketingId`),
  KEY `FK_reservation_TO_ticketing` (`reservationId`),
  KEY `FK_movie_TO_ticketing` (`movieId`),
  CONSTRAINT `FK_movie_TO_ticketing` FOREIGN KEY (`movieId`) REFERENCES `movie` (`movieId`),
  CONSTRAINT `FK_reservation_TO_ticketing` FOREIGN KEY (`reservationId`) REFERENCES `reservation` (`reservationId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='티켓팅';

-- 테이블 데이터 vgc.ticketing:~1 rows (대략적) 내보내기
DELETE FROM `ticketing`;
INSERT INTO `ticketing` (`ticketingId`, `seat`, `price`, `reservationId`, `movieId`) VALUES
	(38, 'D8', '10000', NULL, NULL),
	(39, 'D12', '10000', NULL, NULL);

-- 테이블 vgc.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `userId` varchar(15) NOT NULL COMMENT '회원아이디',
  `userName` varchar(40) NOT NULL COMMENT '이름',
  `userPw` varchar(15) NOT NULL COMMENT '회원비밀번호',
  `userPhone` varchar(20) NOT NULL COMMENT '회원휴대폰번호',
  `userEmail` varchar(50) NOT NULL COMMENT '회원이메일',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='회원';

-- 테이블 데이터 vgc.user:~0 rows (대략적) 내보내기
DELETE FROM `user`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
