	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body class="mx-0">
	
		<div class="row">
			<div class="col">
				<img class="img-fluid" style="max-width: 100%; max-height: 100%" src="../../../resources/img/tll_c/tem.jpg">
			</div>
		</div>
		<div class="row bg-light fw-bold py-3 fs-6">
			<div class="col">
				<div class="container">
					<div class="row">
						<div class="col-2">공지사항</div>
						<div class="col-2 text-secondary">자주하는 질문</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col">
					<br>
				</div>
			</div>
			<div class="row mt-5">
				<div class="col fw-bold fs-4">
					공지사항
				</div>
			</div>
			<div class="row mt-4">
				<div class="col border border-1 border-light-subtle"></div>
			</div>
			<div class="accordion accordion-flush" id="accordionFlushExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
			      	<span class="fw-bold text-primary">중요 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;교직원 메인페이지 서버 점검 안내 (12/29)</span>
			      </button>
			    </h2>
			    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      	원격교육운영지원센터에서는 사이버캠퍼스의 안정화된 서비스 사용을 위해 DB서버 점검 작업 등 으로 인한 사이버캠퍼스 이용이 중단되오니 참고하시기 바랍니다.
					<br>			
					<br>
					<br>
					■ 서비스 중단 사항
					<br>
					&nbsp;&nbsp;&nbsp;가. 중단 서비스: 교직원 메인페이지(MKU.ac.kr)
					<br>
					&nbsp;&nbsp;&nbsp;나. 서비스 중단 일시 : 2023.12.29(월) 20:00 ~ 12.30(화) 08:00 (12시간)
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;※ 서비스 중단 시간은 다소 유동적일 수 있음.
					<br>
					&nbsp;&nbsp;&nbsp;다. 서비스 중단 내용: 사이버캠퍼스 접속 불가
					<br>
					<br>
					<br>
					■ 작업 사항: 사이버캠퍼스 DB 성능 개선 및 점검 등 안정화. 끝.
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
			        <span class="fw-bold text-primary">중요 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2024-1학기 재입학 신청 안내</span>
			      </button>
			    </h2>
			    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      		· 홈페이지 공지 : 2024.01.19(금) 예정
						<br>
					 ※ 재입학은 재입학 규정(또는 지침)에 따라 재입학 여석과 우선순위에 의하여 결정
					<br>
					 ※ 재입학 신청자가 정원을 초과할 경우 다음 각 호의 순으로 등록 횟수가 많은 자를 우선 선별함.
					<br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(1. 미등록 제적자  2. 미복학 제적자  3. 자퇴자  4. 학사경고 제적자)
					<br>
					 ※ 합격자 발표 시 수강신청기간, 등록기간은 별도 안내 예정
 				</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
			        <span class="fw-bold text-primary">중요 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2024-1학기 휴학 및 휴학연기 안내</span>
			      </button>
			    </h2>
			    <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      	1. 복학기간 : 2024. 01. 08(월) ~ 01. 12(금)
					<br>
					  <br>
					<br>
					 2. 복학절차
					<br>
					  가. 일반휴학자(온라인신청) :【홈페이지[포털]> 학사행정> [학적관리](조기*)복학신청】
					<br>
					<br>
					<br>
					  나. 입대휴학자 
					<br>
					   1) 전역자 :전역(복부만료)일자가 복학기간 이전인 학생 
					<br>
					     (온라인신청)글로벌▶홈페이지[포털]→학사행정→[부속기관]예비군자원등록**→[학적관리](조기*)복학신청】
					<br>
					                                메디컬▶홈페이지[포털]→학사행정→[학적관리](조기*)복학신청<증빙자료(전역증 등) 첨부(업로드)>】
					<br>
					<br>
					<br>
					   2) 전역예정자 :전역(복무만료)일자가 복학기간 이후인 학생 
					<br>
					     (서면신청) 복학신청서+첨부서류(전역예정증명서,잔여휴가확인서(해당자)***)제출→담당자 복학처리
					<br>
					                                   ↳ 사회복무(공익근무)요원 복무확인서
					<br>
					       글로벌▶학사지원팀(전자정보도서관 1층 학생서비스센터)방문 또는 FAX(02-000-131)
					<br>
					               또는 이메일(mku.ac.kr) 제출
					<br>
					       메디컬▶교무학사팀(보건과학대학 1층)방문 또는 FAX(02-045-0000) 
					
					               또는 이메일(mku.ac.kr) 제출
					<br>
					<br>
					<br>
					     ***(해당자)잔여휴가확인서
					<br>
					       - 전역(소집해제)일이 수업일수 1/4일선 이후인 경우, 잔여휴가(연가)를 사용하여 수업일수 1/4일선 이전 수업참여 가능자
					<br>
					         (사회복무(공익근무)요원은 연가만(병가·대체휴무·반일연가·분할연가 불가)을 연속사용에 한함)
					<br>
					<br>
					<br>
					     **예비군자원등록 : 
					<br>
					      글로벌▶(전역예정자) 전역(소집해제)일 즉시 온라인신청【홈페이지[포털]→학사행정→[부속기관]예비군자원등록】
					<br>
					      메디컬▶(전역자+전역예정자) 전역(소집해제) 후 거주지 관할 예비군동대에 방문신청 (학적부사본, 재학증명서 지참)  
					<br>
					<br>
					<br>
					     *조기복학 신청 : 복학예정 학기보다 앞선 학기에 복학신청 
					<br>
					<br>       
					
					  ※신청서류 제출 후 다음날 승인여부 온라인으로 필히 확인요망【홈페이지[포털]→학사행정→[학적관리]개인별학적사항조회】
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
			        <span class="fw-bold text-primary">중요 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2024-1학기 현장 실습 신청 메뉴얼</span>
			      </button>
			    </h2>
			    <div id="flush-collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      	이차전지 혁신융합대학사업단에서는 문제해결형 실무능력을 제고하기 위하여 《2023학년도 동계단기캠프》를 개최하고자 합니다. 2박 3일간 이차전지 제작 이론을 수강하고, 실제로 이차전지를 제작해 볼 수 있는 좋은 기회로, 기업 현장견학과 전국에 있는 이차전지 컨소시엄 참여대학의 학생들과 네트워킹을 할 수 있는 시간을 제공하오니 관심 있는 학생들의 적극적인 참여를 부탁드립니다.
					<br>
					<br>
					<br>
					1) 일시 : 2024. 1. 22.(월) 13시~2024. 1. 24.(수) 16시, 2박 3일
					<br>
					<br>
					<br>
					2) 장소 : 우리대학교 글로벌캠퍼스, 현장견학(대성기계공업 주식회사)
					<br>
					<br>
					<br>
					3) 모집인원 : 5명 (각 이차전지 컨소시엄 참여대학 별 5명 선발, 총 25명)
					<br>
					<br>
					<br>
					4) 지원자격 : 이차전지 혁신융합대학사업 참여 재학생(대학원생 제외)
					<br>
					(예1) 이차전지 혁신융합대학 마이크로디그리 필수교과목 중 1과목 이상 수강(중)
					<br>
					(예2) 이차전지 혁신융합대학사업단 운영 프로그램에 참여했던 학생
					<br>
					<br>
					<br>
					5) 지원일정 : 2023. 12. 20.(수) 까지, 첨부된 지원서 및 개인정보 수집·이용 동의서 양식 서명 후 이메일 제출 (제출처: qwer@mku.ac.kr)
					<br>
					<br>
					<br>
					6) 주요 프로그램
					<br>
					가. 이차전지 이론교육 : 기초, 소재, 공정 등
					<br>
					나. 이차전지 제작 실습 : 코인셀 용 전극 제작
					<br>
					다. 이차전지 관련 기업 탐방 : 대성기계공업 주식회사 본사 및 공장 견학
					<br>
					라. 이차전지 분야 전공생 간 지역을 융합한 네트워킹 기회 제공
					<br>
					<br>
					<br>
					7) 참여 혜택
					<br>
					가. 이차전지 교육 및 제작 실습, 관련 기업 탐방 기회 제공
					<br>
					나. 동계단기캠프 이수증 수여
					<br>
					다. 참가 기념품 지급
					<br>
					<br>
					<br>
					8) 참가 비용 : 없음, 전액 이차전지 혁신융합대학사업단 지원
			      </div>
			    </div>
			  </div>
			</div>
		</div>
		<div class="row bg-dark-subtle mt-5">
			<div class="col">
			</div>
			<div class="col-10 fw-bold fs-6">
				<div class="row py-3">
					<div class="col text-center">
						대학 발전 기금&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;개인정보처리방침&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
						개인정보공시&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;구매입찰&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
						예산공고&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;결산공고&nbsp;&nbsp;&nbsp:&nbsp;&nbsp;&nbsp;
						대학자체평가&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;
						정보공개&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;대학정보공시&nbsp;&nbsp;&nbsp;
						:&nbsp;&nbsp;&nbsp;운영지원센터&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;사이트맵
					</div>
				</div>
				<div class="row">
					<div class="col border border-light"></div>
				</div>
				<div class="row mt-3 py-3">
					<div class="col-1"></div>
					<div class="col-2">
						<img class="img-fluid" src="../../../resources/img/another/logo_black.png" style="width: 80px;">
						<span class="fw-bold fs-5">MK University</span>
					</div>
					<div class="col">
						강남캠퍼스 : 서울특별시 강남구 테헤란로7길 7 에스코빌딩 6~7층 TEL.02-000-5504 <br>
						용인캠퍼스 : 경기도 용인시 뒷골마을 191 TEL.031-111-2222<br>
						© 2023 MK University. All Rights Reserved
					</div>
					<div class="col-3">
						<div class="row">
							<div class="col">
								<button type="button" class="btn btn-outline-dark">주요기관 바로가기</button> <br>
							</div>
							<div class="col">
								<button type="button" class="btn btn-outline-dark">제단 바로가기</button> <br>
							</div>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
			</div>
			<div class="col"></div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
</body>
</html>