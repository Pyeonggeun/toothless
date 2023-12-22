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
				<div class="row text-center">
					<div class="col"></div>
					<div class="col py-3">
						<img class="img-fluid" style="width: 50px;" src="../../../resources/img/another/logo_black.png">
						<a class="fw-bold fs-4 link-offset-2 link-underline link-underline-opacity-0 text-black" href="../../taeho/external/companyMainPage">MK University</a>
					</div>
					<div class="col"></div>
				</div>
				<div class="row">
					<div class="col w-100 h-100">
						<img class="img-fluid" src="../../../resources/img/tll_c/asdassadsdddd.jpg">
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
			      	<span class="fw-bold text-primary">중요 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;업무 및 일정 안내</span>
			      </button>
			    </h2>
			    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      	회사 내부에서의 원활한 커뮤니케이션과 업무 진행을 위해 다가오는 프로젝트, 회의 일정, 혹은 중요한 변경 사항 등을 공지합니다. <br>
			      	이러한 공지는 회사의 모든 직원이 업무 계획을 조율하고 협력하는 데 큰 도움이 됩니다. <br>
			      	또한, 이는 갑작스러운 변화에 대비하여 투명하고 조직적인 업무 환경을 조성합니다.
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
			        <span class="fw-bold text-primary">중요 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;현장실습 안내</span>
			      </button>
			    </h2>
			    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      	학생들을 위한 현장실습의 세부 일정과 장소, 실습 기간, 근무 시간 등을 상세히 안내합니다. <br>
			      	실습을 위해 필요한 도구나 개인 준비물, 적절한 복장 등에 대한 규정을 설명하여 학생들이 명확한 방향성 아래 실습에 참여할 수 있도록 돕습니다. <br> <br>

					업무 내용 및 목표: 학생들이 현장에서 수행할 실제 업무 내용과 목표를 명확히 설명합니다. <br>
					어떤 프로젝트나 업무에 참여하게 될지, 이를 통해 기대되는 성과는 무엇인지에 대한 정보를 전달하여 학생들이 목표를 이해하고 이를 달성하기 위해 노력할 수 있도록 돕습니다.
 				</div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
			        <span class="fw-bold text-primary">중요 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;안전 규정 및 교육</span>
			      </button>
			    </h2>
			    <div id="flush-collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      	작업장 내 안전에 대한 규정과 지침을 상세히 안내합니다. <br>
			      	안전 규정 준수, 비상 상황 대처 방법, 안전 장비 사용법 등을 교육하여 학생들의 안전을 최우선으로 고려하고 사고 예방에 힘씁니다.
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
			        <span class="fw-bold text-primary">중요 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;직원 소개 및 멘토링 프로그램</span>
			      </button>
			    </h2>
			    <div id="flush-collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      	회사의 직원들을 소개하고, 학생들에게 멘토링을 제공할 수 있는 프로그램을 소개합니다. <br>
			      	현업 전문가들로부터의 조언과 지도를 통해 학생들은 현장에서의 경험과 전문성을 배양할 수 있습니다.
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
			        <span class="fw-bold ">일반 공지</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;피드백 및 평가 체계</span>
			      </button>
			    </h2>
			    <div id="flush-collapseFive" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			      <div class="accordion-body">
			      	학생들의 성과를 평가하고 피드백을 제공하는 시스템을 안내합니다. <br>
			      	학생들이 자신의 성장과 발전을 측정하고 향상시킬 수 있도록 하여 실습 기간 동안의 학습 경험을 최대한 유용하게 활용할 수 있도록 지원합니다.
			      </div>
			    </div>
			  </div>
			</div>
			
		</div>
		<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>
		
</body>
</html>