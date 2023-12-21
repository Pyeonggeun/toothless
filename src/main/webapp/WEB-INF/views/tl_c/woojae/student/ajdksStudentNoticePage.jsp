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
				<img class="img-fluid" style="max-width: 100%; max-height: 100%" src="../../../resources/img/tll_c/temp_1.jpg">
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
			      	<span class="fw-bold text-primary">중요 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학습 자료실 안내 및 업데이트: 도서관 리소스 및 학습 도구 최신 정보 공유</span>
			      </button>
			    </h2>
			    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      	안녕하세요, 도서관 자료실의 최신 업데이트와 학습 도구에 대한 정보를 안내합니다. <br>
			      	다가오는 학기를 위해 준비된 학습 자료들과 도서관의 다양한 서비스를 활용하여 효율적인 학습을 할 수 있도록 돕겠습니다.
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
			        <span class="fw-bold text-primary">중요 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장학금 신청 안내: 새로운 장학금 지원 요령 및 기한 안내 </span>
			      </button>
			    </h2>
			    <div id="flush-collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      다가오는 학기에 새로운 장학금 신청 요령과 마감일이 공지됩니다. <br> 
			      자격 요건과 신청 방법, 제출 서류 등에 대한 안내가 제공될 예정이니 관심 있는 학생들은 마감일을 놓치지 않도록 주의해주세요.
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
			        <span class="fw-bold text-secondary">중요 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장학금 신청 안내: 새로운 장학금 지원 요령 및 기한 안내 </span>
			      </button>
			    </h2>
			    <div id="flush-collapseFive" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      다가오는 학기에 새로운 장학금 신청 요령과 마감일이 공지됩니다. <br> 
			      자격 요건과 신청 방법, 제출 서류 등에 대한 안내가 제공될 예정이니 관심 있는 학생들은 마감일을 놓치지 않도록 주의해주세요.
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
			        <span class="fw-bold text-secondary">중요 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;캠퍼스 편의시설 개선 안내: 캠퍼스 내 편의시설 및 서비스 개선 사항 안내 </span>
			      </button>
			    </h2>
			    <div id="flush-collapseSix" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      대학 내부의 다양한 편의시설 및 서비스가 개선될 예정입니다. <br>
			      새로운 도서관 개장, 식당 메뉴 업데이트, 캠퍼스 내 건물 리모델링 등에 대한 안내가 예정되어 있으니 많은 관심 부탁드립니다.
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSeven" aria-expanded="false" aria-controls="flush-collapseSeven">
			        <span class="fw-bold text-secondary">중요 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;국제교류 프로그램 안내: 해외 교환 및 인턴십 프로그램 소개 </span>
			      </button>
			    </h2>
			    <div id="flush-collapseSeven" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      다양한 해외 교류 및 인턴십 프로그램에 참여할 기회가 있습니다. <br>
			      다가오는 학기에 제공되는 프로그램에 대한 안내와 지원 방법에 대한 공지가 예정되어 있습니다. <br> 
			      국제 교류에 관심 있는 학생들은 반드시 확인해주세요.
			      </div>
			    </div>
			  </div>
			</div>
		</div>
		<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>
		
		
		
</body>
</html>