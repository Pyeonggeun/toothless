<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        
        <script>
        	// 로그인하지 않음
        	let studentId = null;
        	
        	// 로그인 확인
        	function getStudentId(){
        		fetch("./getStudentId")
        		.then(response => response.json())
        		// 응답된 결과
        		.then(response => {
        			// 로그인하면 값을 넣어줌
        			studentId = response.data;
        		});
        	}
        
        	// 글로벌 변수
        	//const comPk = ${jobPostingForStudent.companyDto.com_pk};
        	//const jobPostingPk = null;
        
        
        	// 공고 리스트 출력
        	function reloadJobPostingList(){
        		
        		// 링크 가져오기
        		const url = "./getJobPostingListForStudent";
        		// get방식 
        		//fetch(url)
				
        		// post방식 - 설정이 더 필요
        		fetch(url)
        		// 역직렬화(필수!)
        		.then(response => response.json())
        		.then(response => {

       				const postingListBox = document.getElementById("postingListBox");
       				
       				// 초기화 필요
       				postingListBox.innerHTML = ""; 
        			// 클라이언트 사이드 렌더링
        			// 리스트 반복문
        			for(e of response.data){
        				
        				
        				// 딱 1개의 클래스를 가져옴 + cloneNode(true)로 안쪽까지 모두 복사
        				const postingWrapper = document.querySelector("#templete .postingWrapper").cloneNode(true);
        				
        				// 내용 입력
        				
        				// 회사명
        				const postingCompanyName = postingWrapper.querySelector(".postingCompanyName");
        				postingCompanyName.innerText = e.companyDto.com_name;
        				
        				// 가족기업여부
        				const isFamilyCompany = postingWrapper.querySelector(".isFamilyCompany");
        				
        					if(e.companyDto.is_family_company != null && e.companyDto.is_family_company == "Y"){
        						const badge = document.createElement("span");
        					    badge.classList.add("badge", "text-bg-info", "text-white"); 
        					    badge.innerText = "Family";

        					    // 부모 엘리먼트에 자식 엘리먼트로 추가
        					    isFamilyCompany.appendChild(badge);
        					}
						
        				// 공고제목
        				const jobPostingName = postingWrapper.querySelector(".jobPostingName");
        				jobPostingName.innerText = e.jobPostingDto.posting_name;
						
        				// 분야 + 직무 + 지역 + 마감일 
        				const jobPostingCondition = postingWrapper.querySelector(".jobPostingCondition");
        				jobPostingCondition.classList.add("text-secondary");
        				
        				// date 변환(자바스크립트 클래스)
        				const date = new Date(e.jobPostingDto.posting_deadline);
        				
        				// 요일 변환
        				var week = new Array('일', '월', '화', '수', '목', '금', '토');  
        				var theDay = date.getDay();    
        				var dayLabel = week[theDay];   
        				
        				jobPostingCondition.innerText = "#" + e.jobFieldCategoryDto.job_field_category_name + " " 
	        				+ "#" + e.jobPostingDto.job_position + " " + "#" + e.companyDto.com_address + " "
	        				// DATE 변환 필요 (달은 + 1 해줘야함)
	        				+ "#" + "~" + (date.getMonth() + 1) + "/" + date.getDate() + "(" + dayLabel + ")" + " ";
        				
        				// 마감임박 + 채용마감
        				if(e.postingDeadlineList.includes(e.jobPostingDto.job_posting_pk)){
        					const deadlineBadge = document.createElement("span");
        					deadlineBadge.classList.add("badge", "text-bg-danger");
        					deadlineBadge.innerText = "마감임박!";
        					
        					jobPostingCondition.appendChild(deadlineBadge);
        					
        				}else if(e.endPostingList.includes(e.jobPostingDto.job_posting_pk)){
        					const endBadge = document.createElement("span");
        					endBadge.classList.add("badge", "text-bg-secondary");
        					endBadge.innerText = "채용마감";
        					
        					jobPostingCondition.appendChild(endBadge);
        				}
        				
        				// 공고스크랩
        				const interestPosting = postingWrapper.querySelector(".interestPosting");
        				
        				
        				if(e.allPostingInterest == 0){
        					const icon = document.createElement("i");
        					icon.classList.add("text-warning", "bi", "bi-star");
        					interestPosting.appendChild(icon);
        					icon.setAttribute("onclick","toggleInterest()")
        				}else{
        					const fillIcon = document.createElement("i");
        					fillIcon.classList.add("text-warning", "bi", "bi-star-fill");
        					interestPosting.appendChild(fillIcon);
        					fillIcon.setAttribute("onclick","toggleInterest()")
        				}
        				
        				const allInterestCount = document.createElement("span");
        				allInterestCount.innerText = " " + e.allPostingInterest;
        				
        				interestPosting.appendChild(allInterestCount);
        				
        				
        				
        				// 즐겨찾기 pk받기
        				/*  const interestPostings = postingWrapper.querySelectorAll(".interestPosting");
        	                interestPostings.forEach(interestPosting => {
        	                    interestPosting.addEventListener("click", function (event) {
        	                    	plusInterest(event, e.jobPostingDto.job_posting_pk);
        	                    });
        	                });
        				 */
        				 
        				
        				const applyPosting = postingWrapper.querySelector(".applyPosting");
        				
        				
        			 	// 지원하기 버튼  처리
        				/*  if(studentId == null){
	        				applyPosting.setAttribute("onclick", "cannotApply()");
        				}else{
        					applyPosting.setAttribute("onclick", "canApply()");
        				}  
        				 */
        				 
        				// 반복문 돌면서 postingListBox 안쪽에 붙임
        				postingListBox.appendChild(postingWrapper);
        				 
        			}
        			
        		});
        		
        	}
        	
         	/*  function cannotApply(){
				
			}
        	
        	function canApply(){
        		const url = "../sb_resume/applyJobPostingPage?job_posting_pk=" + jobPostingPk;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        				
        		});
        		
        	}   */
        	
        	// 관심공고
        	function toggleInterest(){
        		// 관심공고 추가 + 삭제 로직
        	} 
        	
        	
        	
        	// 제일 처음 실행되는 구간
        	window.addEventListener("DOMContentLoaded", () => {
        		getStudentId();
        		reloadJobPostingList();
        		
        		// n초마다 로드
        		// setInterval(reloadJobPostingList, n);
        	});
        </script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
			</div>
		</div>
	 	<%-- 전체 크기 --%>
		<div class="row">
			<%-- 왼쪽 여백--%>
			<div class="col-1"></div>
			<%-- 취업팀 메뉴 바 --%>
			<div class="col-1 me-5">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			<%-- 가운데 여백--%>	
			<div class="col-1 px-0 border-start"></div>
			<%-- 채용공고 리스트 양식 --%>
			<div class="col">
				<!-- 채용공고 -->
				<div class="row">
					<div class="col fs-4 fw-bold mt-5 text-center">채용공고리스트</div>
				</div>
				<div class="row mt-5 pb-3 border-bottom">
					<div class="col-9 pt-1">
						총 <span class="fw-bold">${postingCount}</span>건
					</div>
					<div class="col">
						<select class="form-select form-select-sm">
						    <option selected>정확도순</option>
						    <option value="1">등록일순</option>
						    <option value="2">마감임박순</option>
						    <!-- <option value="3"></option> -->
						</select>
					</div>
				</div>
				<div class="row pb-3">
					<div id="postingListBox" class="col">
					
					</div>
				<!-- 리스트 출력 -->
				<%-- <c:forEach items="${jopPostingForStudentList}" var="jobPostingForStudent">
					<div class="row mt-3 pb-3 border-bottom">
						<!-- 1번째 칸 -->
						<div class="col-2 mt-2 ps-4">
							<div class="row">
								<!-- 기업명 -->
								<div class="col pe-0">
									<a class="navbar-brand" href="./companyPostingListForStudentPage?com_pk=${jobPostingForStudent.companyDto.com_pk}">${jobPostingForStudent.companyDto.com_name}</a>
									<i class="text-danger bi bi-suit-heart"></i>
								</div>
							</div>
							<div class="row">
								<!-- 가족기업여부 -->
								<div class="col mt-1 ms-1">
									<c:if test="${jobPostingForStudent.companyDto.is_family_company ne null and jobPostingForStudent.companyDto.is_family_company eq 'Y'}">
										<span class="badge text-bg-info text-white">Family</span>
									</c:if>						
								</div>
							</div>
						</div>
						<!-- 2번째 칸 -->
						<!-- 공고제목 -->
						<div class="col-8 ps-4 pt-2">
							<div class="row">
								<div class="col">
								<!-- 링크 더 좋은 방법 생각해보기 -->
								<a class="navbar-brand" href="./jobPostingDetailForStudentPage?id=${jobPostingForStudent.jobPostingDto.job_posting_pk}">
										${jobPostingForStudent.jobPostingDto.posting_name}
								</a>
								</div>
							</div>
							<div class="row">
								<!-- 분야/지역/기간 태그  -->
								<div class="col">
									<a class="navbar-brand" href="./jobPostingDetailPage?id=${jobPostingForStudent.jobPostingDto.job_posting_pk}">
									<span class="text-secondary">#&nbsp;${jobPostingForStudent.jobFieldCategoryDto.job_field_category_name} #&nbsp;${jobPostingForStudent.jobPostingDto.job_position}
									#&nbsp;${jobPostingForStudent.companyDto.com_address} #&nbsp;<fmt:formatDate value="${jobPostingForStudent.jobPostingDto.posting_deadline}" pattern="~MM/dd(EEE)"/></span>
									<c:choose>
										<c:when test="${jobPostingForStudent.postingDeadlineList.contains(jobPostingForStudent.jobPostingDto.job_posting_pk)}">
											<span class="badge text-bg-danger">마감임박!</span>
										</c:when>
										<c:when test="${jobPostingForStudent.endPostingList.contains(jobPostingForStudent.jobPostingDto.job_posting_pk)}">
											<span class="badge text-bg-secondary">채용마감</span>
										</c:when>
									</c:choose>
									</a>
								</div>
							</div>
						</div>
						<!-- 3번째 칸 -->
						<!-- 별 크기 생각해보기 -->
						<div class="col-2">	
							<div class="row">
								<div class="col ms-3 mb-1">
									<c:choose>
										<c:when test="${jobPostingForStudent.allPostingInterest == 0}">
											<i class="text-warning bi bi-star"></i>
										</c:when>
										<c:otherwise>
											<i class="text-warning bi bi-star-fill"></i>
										</c:otherwise>
									</c:choose>
									<span>${jobPostingForStudent.allPostingInterest}</span>	
								</div>
							</div>
							<div class="row">
								<div class="col">
									<c:choose>
										<c:when test="${jobPostingForStudent.endPostingList.contains(jobPostingForStudent.jobPostingDto.job_posting_pk)}">
											<button class="btn btn-dark btn-sm" disabled>채용마감</button>
										</c:when>
										<c:when test="${empty sessionStudentInfo}">
											<button class="btn btn-dark btn-sm" disabled>지원하기</button>
										</c:when>
										<c:otherwise>
											<a class="btn btn-dark btn-sm" 
												href="../sb_resume/applyJobPostingPage?job_posting_pk=${jobPostingForStudent.jobPostingDto.job_posting_pk}">지원하기</a>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</c:forEach> --%>
				</div>
			</div>
			<%-- 오른쪽 --%>	
			<div class="col-2"></div>	
		</div>
		<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
	</div>
	
	
	
	<!-- 클론 -->
	<!-- 안쪽에 id 절대 넣지 못함! -->
	<div id="templete" class="d-none">
		<div class="postingWrapper row border-bottom py-2">
			<!-- 1번째 칸 -->
			<div class="col-2 mt-2 ps-4">
				<div class="row">
					<!-- 기업명 -->
					<div class="col pe-0">
						<a class="postingCompanyName navbar-brand" href="./companyPostingListForStudentPage?com_pk=${jobPostingForStudent.companyDto.com_pk}"></a>
						<i class="text-danger bi bi-suit-heart"></i>
					</div>
				</div>
				<div class="row">
					<!-- 가족기업여부 -->
					<div class="isFamilyCompany col ms-1"></div>
				</div>
			</div>
			<!-- 2번째 칸 -->
			<!-- 공고제목 -->
			<div class="col-8 ps-4 pt-2">
				<div class="row">
					<div class="col">
					<!-- 링크 더 좋은 방법 생각해보기 -->
					<a class="jobPostingName navbar-brand" href="./jobPostingDetailForStudentPage?id=${jobPostingForStudent.jobPostingDto.job_posting_pk}">
					</a>
					</div>
				</div>
				<div class="row">
					<!-- 분야/지역/기간 태그  -->
					<div class="jobPostingCondition col">
						<a class="navbar-brand" href="./jobPostingDetailPage?id=${jobPostingForStudent.jobPostingDto.job_posting_pk}">
						</a>
					</div>
				</div>
			</div>
			<!-- 3번째 칸 -->
			<div class="col-2">	
				<div class="row">
					<!-- 관심공고 별 -->
					<div class="interestPosting col ms-3 mb-1"></div>
				</div>
				<div class="row">
					<div class="col">
						<c:choose>
							<c:when test="${jobPostingForStudent.endPostingList.contains(jobPostingForStudent.jobPostingDto.job_posting_pk)}">
								<button class="btn btn-dark btn-sm" disabled>채용마감</button>
							</c:when>
							<c:when test="${empty sessionStudentInfo}">
								<button class="btn btn-dark btn-sm" disabled>지원하기</button>
							</c:when>
							<c:otherwise>
								<a class="applyPosting btn btn-dark btn-sm" 
									href="../sb_resume/applyJobPostingPage?job_posting_pk=${jobPostingForStudent.jobPostingDto.job_posting_pk}">지원하기</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>