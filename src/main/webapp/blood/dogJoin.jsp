<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style.css" />
<link rel="stylesheet" href="../css/dogJoin.css">
<link rel="stylesheet" type="text/css"
	href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet"
	href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean"
	rel="stylesheet" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript" src="../js/dogJoin.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
</head>

<body>
	<div id="headerDiv"></div>
	<div class="page-title">
		<h2>헌혈견정보입력</h2>
	</div>
	<form id="dogJoinForm" method="post">
		<div class="wrap">
			<div class="dogjoinframe">
			<div class="dog-join-bred">헌혈견등록</div>
			<h3>등록신청</h3>
			<input type="hidden" id="email" name="email" value="${memEmail }">

				<ul>
					<li><label>반려견 이름</label> <input type="text"
						placeholder="반려견 이름" id="dog_name" name="dog_name">
						<div id="dogNameDiv"></div></li>
					<li><label>반려견 나이</label> <input type="text"
						placeholder="숫자만 입력" id="dog_age" name="dog_age">
						<div id="dogAgeDiv"></div></li>
					<li><label>반려견 종</label>
						<input type="text" id="dog_breed" name="dog_breed" list="breed-list" placeholder="견종별(가나다순) 직접입력"> 
						<datalist id="breed-list">
							<option value="고든 세터">
							<option value="골든 리트리버">
							<option value="그랜드 그리펀 방데">
							<option value="그랜드 바세 그리펀 방데">
							<option value="그레이트 가스코뉴 블루">
							<option value="가스코뉴 생통주아">
							<option value="그레이트 덴">
							<option value="그레이트 스위스 마운틴 독">
							<option value="그레이트 앵글로-프랜치 트라이컬러 하운드">
							<option value="그레이트 앵글로-프랜치 화이트 앤드 블랙 하운드">
							<option value="그레이트 앵글로-프랜치 화이트 앤드 오렌지 하운드">
							<option value="그레이하운드/스페니쉬 그레이하운드">
							<option value="그레이하운드/아라비언 그레이하운드">
							<option value="그레이하운드/이탈리언 그레이하운드">
							<option value="그레이하운드/잉글리시 그레이하운드">
							<option value="그레이하운드/폴리시 그레이하운드">
							<option value="그레이하운드/헝가리언 그레이하운드">
							<option value="그리펀 니베르네">
							<option value="그린랜드 독">
							<option value="기타견종">
							<option value="네아폴리탄 마스티프">
							<option value="노르망 아르테시앙 바셋">
							<option value="노르보텐스피츠">
							<option value="노르웨이언 룬트훈트">
							<option value="노르웨이언 부훈트">
							<option value="노르웨이언 엘크하운드 그레이">
							<option value="노르웨이언 엘크하운드 블랙">
							<option value="노르웨이언 하운드">
							<option value="노리치 테리어">
							<option value="노바 스코셔 덕 톨링 리트리버">
							<option value="노폴크 테리어">
							<option value=">뉴펀들랜드">
							<option value="닥스훈트">
							<option value="달마시언">
							<option value="댄디 딘몬트 테리어">
							<option value="더치 샤펜더스">
							<option value="더치 세퍼드 독">
							<option value="더치 스모우스혼드">
							<option value="도고 아르헨티노">
							<option value="도그 드 보르도">
							<option value="도베르만<">
							<option value="도사">
							<option value="도이치 스티첼하르">
							<option value="동경견">
							<option value="드랜츠 파트리지 독">
							<option value="디어하운드">
							<option value="라사 압소">
							<option value="라이카/러시아-유럽 라이카">
							<option value="라이카/웨스트 시베리안 라이카">
							<option value="라이카/이스트 시베리안 라이카">
							<option value="래브라도 리트리버">
							<option value="랜드시어">
							<option value="레온베르거">
							<option value="레이크랜드 테리어">
							<option value="로디지언 리지백">
							<option value="로마냐 워터 독">
							<option value="로트바일러">
							<option value="롱-헤어드 피레니언 쉽독">
							<option value="리틀 라이언 독">
							<option value="마요르카 마스티프">
							<option value="마요르카 세퍼드 독">
							<option value="말티즈">
							<option value="매스티프">
							<option value="맨체스터 테리어">
							<option value="머레머 앤드 아브루츠 쉽독">
							<option value="멕시컨 헤어리스 독">
							<option value="몬테네그린 마운틴 하운드">
							<option value="무디">
							<option value="문스터랜더/라지">
							<option value="문스터랜더/스몰">
							<option value="미니어쳐 핀셔">
							<option value="미디엄 그리펀 방데">
							<option value="믹스견">
							<option value="바바리언 마운틴 센트하운드">
							<option value="바셋 하운드">
							<option value="바이마라너">
							<option value="버가마스코 세퍼드 독">
							<option value="버고스 포인팅 독">
							<option value="버니즈 마운틴 독">
							<option value="버센지">
							<option value="베들링턴 테리어">
							<option value="베르제 피카드">
							<option value="벨지언 그리펀">
							<option value="벨지언 세퍼드 독/그루넨달">
							<option value="벨지언 세퍼드 독/레커누아">
							<option value="벨지언 세퍼드 독/말리누아">
							<option value="벨지언 세퍼드 독/테르뷔랑">
							<option value="보더 콜리">
							<option value="보더 테리어">
							<option value="보르조이">
							<option value="보비에 드 플란더스">
							<option value="보스니언 콜스-헤어드 하운드">
							<option value="보스롱">
							<option value="보스턴 테리어">
							<option value="보헤미언 와이어-헤어드 포인팅 그리폰">
							<option value="복서">
							<option value="볼러니즈">
							<option value="볼피노 이탈리아노">
							<option value="부르보네 포인팅 독">
							<option value="불 마스티프">
							<option value="불 테리어">
							<option value="불개">
							<option value="불독">
							<option value="브라질리언 테리어">
							<option value="브로홀머">
							<option value="브뤼셀 그리펀">
							<option value="브리아드">
							<option value="브리터니 스패니얼">
							<option value="블랙 앤드 탄 쿤하운드">
							<option value="블랙 테리어">
							<option value="블러드하운드">
							<option value="블루 가스코뉴 그리펀">
							<option value="블루 가스코뉴 바셋">
							<option value="블루 피카르디 스패니얼">
							<option value="비글">
							<option value="비글-헤리어">
							<option value="비숑 프리제">
							<option value="비어디드 콜리">
							<option value="빌리">
							<option value="뽀흐슬렌">
							<option value="뿌아뚜방">
							<option value="사를로스 울프독">
							<option value="사모예드">
							<option value="사우스 러시언 세퍼드 독">
							<option value="삽살개">
							<option value="샤 페이">
							<option value="서식스 스패니얼">
							<option value="설루키">
							<option value="세라 다 에스트렐라 마운틴 독">
							<option value="세르비안 하운드">
							<option value="세르비언 트라이컬러 하운드">
							<option value="세인트 미겔 캐틀 독">
							<option value="세인트 버나드 독">
							<option value="세인트 저메인 포인터">
							<option value="센트럴 아시아 세퍼드 독">
							<option value="셔틀랜드 쉽독<">
							<option value="슈나우저/미니어처 슈나우저">
							<option value="슈나우저/스텐다드 슈나우저">
							<option value="슈나우저/자이언트 슈나우저">
							<option value="스말랜드 하운드">
							<option value="스몰 가스콩 블루">
							<option value="스몰 스위스 하운드">
							<option value="스웨디시 다츠브라케">
							<option value="스웨디시 랩훈트">
							<option value="스웨디시 발훈트">
							<option value="스웨디시 엘크하운드">
							<option value="스위스 하운드">
							<option value="스칠러 하운드">
							<option value="스카이 테리어">
							<option value="스코티쉬 테리어">
							<option value="스키퍼키">
							<option value="스테포드셔 불 테리어">
							<option value="스페니시 마스티프">
							<option value="스페니시 워터 독">
							<option value="스페니시 하운드">
							<option value="스피노네">
							<option value="슬로바키언 슈바시">
							<option value="슬로바키언 하운드">
							<option value="시 츄">
							<option value="시르네코 델레트나">
							<option value="시바">
							<option value="시베리안 허스키">
							<option value="시코꾸">
							<option value="실리햄 테리어">
							<option value="아나톨리안 세퍼드 독">
							<option value="아데네스 케틀 독">
							<option value="아르투아 하운드">
							<option value="아리제 포인팅 독">
							<option value="아리제 하운드">
							<option value="아메리칸 스테포드셔 테리어">
							<option value="아메리칸 워터 스패니얼">
							<option value="아메리칸 코커 스패니얼">
							<option value="아메리칸 폭스 하운드">
							<option value="아메리칸 핏 불 테리어">
							<option value="아메리컨 아키타">
							<option value="아이디">
							<option value="아이리시 글랜 이말 테리어">
							<option value="아이리시 레드 세터">
							<option value="아이리시 레드 앤드 화이트 세터">
							<option value="아이리시 소프트 코티드 휘튼 테리어">
							<option value="아이리시 울프하운드">
							<option value="아이리시 워터 스패니얼">
							<option value="아이리시 테리어">
							<option value="아이슬랜딕 쉽독">
							<option value="아자와크">
							<option value="아키타">
							<option value="아펜젤 케들 독">
							<option value="아펜핀셔">
							<option value="아프간 하운드">
							<option value="알래스칸 맬러뮤트">
							<option value="알렌테주 마스티프">
							<option value="알파인 다츠브라케">
							<option value="에어데일 테리어">
							<option value="엔틀레부흐 케틀 독">
							<option value="엥글로 프렌치 하운드">
							<option value="오베르뉴 포인팅 독">
							<option value="오수견">
							<option value="오스트랄리안 캐틀 독">
							<option value="오스트랄리안 캘피">
							<option value="오스트랄리안 테리어">
							<option value="오스트레일리언 세퍼드">
							<option value="오스트레일리언 실키 테리어">
							<option value="오스트리안 블랙 앤드 탄 하운드">
							<option value="오스트리안 핀셔">
							<option value="오터하운드">
							<option value="올드 데니시 포인팅 독">
							<option value="올드 잉글리시 쉽독">
							<option value="와이어헤어드 슬로바키언 포인터">
							<option value="완도견">
							<option value="요크셔 테리어">
							<option value="웨스트 하이랜드 화이트 테리어">
							<option value="웨스트팔리안 닥스브라케">
							<option value="웰시 스프링어 스패니얼">
							<option value="웰시 코기 카디건">
							<option value="웰시 코기 펨브로크">
							<option value="웰시 테리어">
							<option value="유고슬라비언 세퍼드 독-샤플라니나">
							<option value="유라시안">
							<option value="이비잔 와런 하운드-이비잔 포덴코">
							<option value="이스트리안 쇼트-헤어드 하운드">
							<option value="이스트리안 콜스-헤어드 하운드">
							<option value="이탈리안 포인팅 독">
							<option value="이탈리안 하운드/쇼트-헤어드">
							<option value="이탈리안 하운드/콜스-헤어드">
							<option value="이탈리언 코로소 독">
							<option value="잉글리쉬 포인터">
							<option value="잉글리시 세터">
							<option value="잉글리시 스프링어 스패니얼">
							<option value="잉글리시 코커 스패니얼">
							<option value="잉글리시 토이 테리어">
							<option value="잉글리시 폭스하운드">
							<option value="잭 러셀 테리어">
							<option value="저먼 롱헤어드 포인팅 독">
							<option value="저먼 세퍼드 독">
							<option value="저먼 쇼트헤어드 포인팅 독">
							<option value="저먼 스패니얼<">
							<option value="저먼 와이어헤어드 포인터">
							<option value="저먼 핀셔">
							<option value="저먼 하운드">
							<option value="저먼 헌팅 테리어">
							<option value="제주견">
							<option value="제퍼니즈 스피츠">
							<option value="제퍼니즈 친">
							<option value="제페니즈 테리어">
							<option value="진돗개">
							<option value="차우 차우">
							<option value="차이니즈 크레스티드 독">
							<option value="체서피크 베이 리트리버">
							<option value="체스키 테리어">
							<option value="체코슬로바키언 울프독">
							<option value="치와와">
							<option value="카나리안 와런 하운드">
							<option value="카렐리언 베어 독">
							<option value="카르스트 세퍼드 독">
							<option value="카스트로 라보레로 독">
							<option value="카이">
							<option value="캐리 블루 테리어">
							<option value="캐벌리어 킹 찰스 스패니얼">
							<option value="컬리 코티드 리트리버">
							<option value="케언 테리어">
							<option value="케이넌 독">
							<option value="케털런 쉽독">
							<option value="코몬도르">
							<option value="코카시언 세퍼드 독">
							<option value="코튼 드 툴리어">
							<option value="콜리 러프">
							<option value="콜리 스무스">
							<option value="콜스-헤어드 스타리언 하운드">
							<option value="쿠바스">
							<option value="쿠이커혼제">
							<option value="크로아티언 쉽독">
							<option value="크롬폴란데">
							<option value="클럼버 스패니얼">
							<option value="키슈">
							<option value="키스훈드">
							<option value="킹 찰스 스패니얼">
							<option value="타이 리지백 독">
							<option value="타트러 세퍼드 독">
							<option value="트랜실비안 하운드">
							<option value="티롤리언 하운드">
							<option value="티베탄 마스티프">
							<option value="티베탄 테리어">
							<option value="티베튼 스패니얼">
							<option value="파라오 하운드">
							<option value="파슨 러셀 테리어">
							<option value="파피용">
							<option value="팡 브리타니 바셋">
							<option value="팡 브리터니 그리펀">
							<option value="퍼그">
							<option value="페루비언 헤어리스 독">
							<option value="페키니즈">
							<option value="페터데일 테리어">
							<option value="포르투기 쉽독">
							<option value="포르투기 와런 하운드-포르투기 포덴코">
							<option value="포르투기 포인팅 독">
							<option value="포르투기즈 워터 독">
							<option value="포메라니언">
							<option value="포사바츠 하운드">
							<option value="폭스 테리어/스무스 폭스 테리어">
							<option value="폭스 테리어/와이어 폭스 테리어">
							<option value="폴리시 로렌드 쉽독">
							<option value="폴리시 하운드">
							<option value="퐁도드메르 스패니얼">
							<option value="푸델포인터">
							<option value="푸들/미니어처 푸들">
							<option value="푸들/미디엄 푸들">
							<option value="푸들/스텐다드 푸들">
							<option value="푸들/토이 푸들">
							<option value="푸미">
							<option value="풀리">
							<option value="풍산개">
							<option value="프랜치 불독">
							<option value="프랜치 스패니얼">
							<option value="프랜치 와이어-헤어드 코르탈스 포인팅 그리펀">
							<option value="프랜치 워터 독">
							<option value="프랜치 트라이컬러 하운드">
							<option value="프랜치 포인팅 독/가스콩타입">
							<option value="프랜치 포인팅 독/피레네타입">
							<option value="프랜치 화이트 앤드 블랙 하운드">
							<option value="프랜치 화이트 앤드 오렌지 하운드">
							<option value="프리전 포인팅 독">
							<option value="프리지언 워터 독">
							<option value="프티 바세 그리펀 방데">
							<option value="프티 브라반송">
							<option value="플랫 코티드 리트리버">
							<option value="피니쉬 레인디어 허더">
							<option value="피니시 랩훈트">
							<option value="피니시 스피츠">
							<option value="피니시 하운드">
							<option value="피레니언 마스티프">
							<option value="피레니언 마운틴 독">
							<option value="피레니언 쉽독, 스무스 페이스드">
							<option value="피카디 스패니얼">
							<option value="필드 스패니얼">
							<option value="필라 브라질레이로">
							<option value="하노베리언 센트하운드">
							<option value="하바니스">
							<option value="하이젠 하운드">
							<option value="할덴 하운드">
							<option value="해리어">
							<option value="헝가리언 쇼트-헤어드 포인터(비즐라)">
							<option value="헝가리언 와이어-헤어드 포인터(비즐라)">
							<option value="헤밀턴 하운드">
							<option value="헬레닉 하운드">
							<option value="호바와트">
							<option value="홋카이도">
							<option value="휘펫">
						</datalist>
					</li>
					<li><label>반려견 몸무게(kg)</label> <input type="text"
						placeholder="숫자만 입력" id="dog_weight" name="dog_weight">
						<div id="dogWeightDiv"></div></li>
					<li><label>반려견 혈액형</label><br /> 
						<select placeholder="숫자만 입력"id="dog_bloodType" name="dog_bloodType">
							<option value="1.1">1.1</option>
							<option value="1.2">1.2</option>
							<option value="1.3">1.3</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="7">7</option>
						</select>
					</li>
				</ul>
				<div class="btn_center">
					<button type="button" class="dogJoinBtn">등록신청</button>
				</div>
			</div>
		</div>
	</form>
	<div id="footerDiv"></div>
</body>
</html>
