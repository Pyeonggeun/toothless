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
        	
        	
        	// 공고 리스트 출력
        	function reloadJobPostingList(searchType, searchWord){
        		
        		// 링크 가져오기
        		const url = "./getJobPostingListForStudent?searchType=" + searchType + "&searchWord=" + searchWord;
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
        				
        				/* const selectBox = document.querySelector(".selectBox")
        				
        				const categoryList = [
        				    {id: e.fieldCategoryList.job_field_category_pk, categoryName: e.fieldCategoryList.job_field_category_name}
        				];

        				categoryList.forEach(category => {
        				    // 체크박스 생성
        				    const checkBox = document.createElement("input");
        				    checkBox.name = "categoryId"; 
        				    checkBox.value = category.id;
        				    checkBox.type = "checkbox"; 

        				    // 라벨 생성(체크박스 내용?)
        				    const label = document.createElement("label");
        				    label.innerText = category.categoryName;

        				    // 부모 요소에 추가
        				    selectBox.appendChild(checkBox);
        				    selectBox.appendChild(label);
        				    selectBox.appendChild(document.createTextNode("\u00A0"));
        				}); */
        				
        				// 딱 1개의 클래스를 가져옴 + cloneNode(true)로 안쪽까지 모두 복사
        				const postingWrapper = document.querySelector("#templete .postingWrapper").cloneNode(true);
        				
        				// 내용 입력
        				
        				// 회사명
        				const postingCompanyName = postingWrapper.querySelector(".postingCompanyName");
        				
		        		const companyInfoLink =	document.createElement("a");
		        		
		        		
		        		companyInfoLink.href = "./companyPostingListForStudentPage?com_pk=" + e.companyDto.com_pk;

		        		companyInfoLink.innerText = e.companyDto.com_name;
		        		companyInfoLink.classList.add("navbar-brand");
		        		
		        		postingCompanyName.appendChild(companyInfoLink);
		        		
		        		if(e.interestCompany.includes(e.companyDto.com_pk)){
			        		const heartFillIcon = document.createElement("i");
			        		heartFillIcon.classList.add("text-danger", "bi", "bi-suit-heart-fill")
			        		postingCompanyName.appendChild(heartFillIcon);
			        		 
		        		}else{
			        		const heartIcon = document.createElement("i");
			        		heartIcon.classList.add("text-danger", "bi", "bi-suit-heart")
			        		postingCompanyName.appendChild(heartIcon); 
		        		}
        				 
		        		
		        		
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
        				
        				const postingNameLink = document.createElement("a");
        				
        				postingNameLink.href="./jobPostingDetailForStudentPage?id=" + e.jobPostingDto.job_posting_pk;
        				postingNameLink.classList.add("navbar-brand");
        				
        				postingNameLink.innerText = e.jobPostingDto.posting_name;
        				
        				jobPostingName.appendChild(postingNameLink);
        				
						
        				// 분야 + 직무 + 지역 + 마감일 
        				const jobPostingCondition = postingWrapper.querySelector(".jobPostingCondition");
        				
        				const postingLink = document.createElement("a");
							
        				postingLink.href="./jobPostingDetailForStudentPage?id=" + e.jobPostingDto.job_posting_pk;
        				
        				postingLink.classList.add("navbar-brand", "text-secondary");
        				
        				
        				// date 변환(자바스크립트 클래스)
        				const date = new Date(e.jobPostingDto.posting_deadline);
        				
        				// 요일 변환
        				let week = new Array('일', '월', '화', '수', '목', '금', '토');  
        				let theDay = date.getDay();    
        				let dayLabel = week[theDay];   
        				
        				postingLink.innerText = "#" + e.jobFieldCategoryDto.job_field_category_name + " " 
        				+ "#" + e.jobPostingDto.job_position + " " + "#" + e.companyDto.com_address + " "
        				// DATE 변환 필요 (달은 + 1 해줘야함)
        				+ "#" + "~" + (date.getMonth() + 1) + "/" + date.getDate() + "(" + dayLabel + ")" + " ";
        				
        				jobPostingCondition.appendChild(postingLink);
        				
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
        				
        				 if (e.allPostingInterest == 0) {
     			        	const starIcon = document.createElement("i");
     			        	starIcon.classList.add("text-warning", "bi", "bi-star");
         					interestPosting.appendChild(starIcon);
     			        } else {
     			        	const starFillIcon = document.createElement("i");
     			        	starFillIcon.classList.add("text-warning", "bi", "bi-star-fill");
         					interestPosting.appendChild(starFillIcon);
     			        }       				
        			    
        			    
        				const allInterestCount = document.createElement("span");
        				allInterestCount.innerText = " " + e.allPostingInterest;
        				
        				interestPosting.appendChild(allInterestCount);
        			    
        				/* 관심공고를 시도중 1..  
        				checkMyInterestPosting(e.jobPostingDto.job_posting_pk)
        			    .then(isInterest => {
        			        if (isInterest === 0) {
        			        	//const starIcon = document.createElement("i");
            					starBox.classList.remove("bi-star-fill")
            					starBox.classList.add("bi-star");
            					starBox.setAttribute("onclick","Interest(" + e.jobPostingDto.job_posting_pk + ")");
            					//interestPosting.appendChild(starIcon);
        			        } else {
        			        	//const starFillIcon = document.createElement("i");
            					starBox.classList.remove("bi-star")
            					starBox.classList.add("bi-star-fill");
            					starBox.setAttribute("onclick","unInterest(" + e.jobPostingDto.job_posting_pk + ")");
            					//interestPosting.appendChild(starFillIcon);
        			        }
        			    }); */
        			    
				       /* 관심공고를 시도중 2..
				       
				       // 새로운 별 아이콘을 생성
				        const starIcon = document.createElement("i");
				        interestPosting.appendChild(starIcon);
				
				        // 클래스 설정
				        starIcon.classList.add("text-warning", "bi");
        			    
        				checkMyInterestPosting(e.jobPostingDto.job_posting_pk)
        					 .then(myInterestCount => {
        						 
						        if (myInterestCount === 0) {
						            starIcon.classList.add("bi-star");
						            starIcon.setAttribute("onclick", "interest(" + e.jobPostingDto.job_posting_pk + ")");
						        } else {
						            starIcon.classList.add("bi-star-fill");
						            starIcon.setAttribute("onclick", "unInterest(" + e.jobPostingDto.job_posting_pk + ")");
						        }
        				
        					});
        				
	        				getTotalInterestPostingCount(e.jobPostingDto.job_posting_pk)
	        					.then(interestCount =>{
		        				
		        				const allInterestCount = document.createElement("span");
		        				allInterestCount.innerText = " " + interestCount;
		        				
		        				
		        				
		        				interestPosting.appendChild(allInterestCount);
		        				
	        					
	        				});
        			 */
        				 
        				
        				const applyPosting = postingWrapper.querySelector(".applyPosting");
        				
        				/* 좀 더 깔끔하게 하기 */ 
        				if(e.endPostingList.includes(e.jobPostingDto.job_posting_pk)){
        					const endButton = document.createElement("button");
        					endButton.classList.add("btn", "btn-dark", "btn-sm");
        					endButton.innerText = "채용마감";
        					endButton.disabled = true;
        					applyPosting.appendChild(endButton); 
        				}else if (e.myApplyPostingList.includes(e.jobPostingDto.job_posting_pk)){
        					const applyEndButton = document.createElement("button");
        					applyEndButton.classList.add("btn", "btn-dark", "btn-sm");
        					applyEndButton.innerText = "지원완료";
        					applyEndButton.disabled = true;
        					applyPosting.appendChild(applyEndButton); 
        				}else if (studentId != null){
	        				const applyLink = document.createElement("a");
        					applyLink.href="../sb_resume/applyJobPostingPage?job_posting_pk=" + e.jobPostingDto.job_posting_pk;
        					applyLink.classList.add("btn", "btn-dark","btn-sm");
        					applyLink.innerText = "지원하기";
        					applyPosting.appendChild(applyLink);
        					
        				}else{
	        				const applyButton = document.createElement("button");
    	    				applyButton.classList.add("btn", "btn-dark", "btn-sm");
        					applyButton.innerText = "지원하기";
        					applyButton.disabled = true;
        					applyPosting.appendChild(applyButton);
        				}
        				
        			 	        				 
        				// 반복문 돌면서 postingListBox 안쪽에 붙임
        				postingListBox.appendChild(postingWrapper);
        				 
        			}
        			
        		});
        		
        	}
        	
               	
         	// 관심공고
        	function interest(job_posting_pk){
        		
        	/* 	if(studentId == null){
        			alert("로그인 후에 이용해주세요")
					return;
        		} */
        		
        		fetch(" ./interestPosting?job_posting_pk=" + job_posting_pk)
        		.then(response => response.json())
        		.then(response =>{
        			checkMyInterestPosting(job_posting_pk);
        			reloadJobPostingList();
        		});
        		
        	} 
        	
        	function unInterest(job_posting_pk){
        		
        	/* 	if(studentId == null){
        			alert("로그인 후에 이용해주세요")
					return;
        		}
        		 */
        		
        		fetch("./unInterestPosting?job_posting_pk=" + job_posting_pk)
        		.then(response => response.json())
        		.then(response =>{
        			checkMyInterestPosting(job_posting_pk);
        			reloadJobPostingList();
        		});
        		
        	} 
        	 
        	// 내가 관심공고를 했는지..?
        	function checkMyInterestPosting(job_posting_pk){
        		
        	/* 	if(studentId == null){
        			alert("로그인 후에 이용해주세요")
					return;
        		} */
        		return fetch("./isInterestPosting?job_posting_pk=" + job_posting_pk)
        		.then(response => response.json())
        		.then(response =>{
        			return response.data;
        		});
        	}
        	
        	function getTotalInterestPostingCount(job_posting_pk){
        		return fetch("./getTotalInterestPostingCount?job_posting_pk=" + job_posting_pk)
        		.then(response => response.json())
        		.then(response =>{
	    				return response.data;
        		});
        	}
        
        	function search(){
        		const searchTypeValue = document.querySelector(".searchType");
        		const searchType = searchTypeValue.value;
        		
        		const searchWordValue = document.querySelector(".searchWord");
        		const searchWord = searchWordValue.value;
        		
        		reloadJobPostingList(searchType, searchWord);
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
			<%-- 취업팀 메뉴 바 --%>
			<div class="col-2">
				<jsp:include page="../common/studentMenu.jsp"></jsp:include>
			</div>
			<%-- 가운데 여백--%>	
			<div class="col-1 px-0 border-start"></div>
			<%-- 채용공고 리스트 양식 --%>
			<div class="col">
				<%-- 채용공고 --%>
				<div class="row">
					<div class="col fs-4 fw-bold mt-5 pb-3 border-bottom border-3">채용공고리스트</div>
				</div>
				<%-- 검색 바 --%>
				<div class="row mt-3 p-2">
					<div class="col">
						<div class="row">
							<%-- 분야 체크박스 --%>
							<div class="col text-secondary border p-3">
								<c:forEach items="${jobFieldList}" var="jobField">
									 <input name="job_field_category_pk" value="${jobField.job_field_category_pk}" type="checkbox">${jobField.job_field_category_name}&nbsp; 
								</c:forEach> 
							</div>  
						</div>
						<div class="row">
							<div class="col-6 border p-3">
								<input type="text" class="form-control border-0" placeholder="직무검색"> 
							</div>
							<div class="col-6 border p-3">
								<input type="text" class="form-control border-0" placeholder="지역검색"> 
							</div>
						</div>
						<div class="row">
							<div class="col-2 border p-3">
								<select class="searchType form-select border-0">
									<option value="posting_name">제목</option>
									<option value="posting_contents">내용</option>
								</select>				
							</div>
							<div class="col-8 border p-3">
								 <input type="text" class="searchWord form-control border-0" placeholder="검색내용을 입력해주세요"> 
							</div>
							<div class="col border p-3">
								<button onclick="search()" class="form-control bg-white border-0">
									<span class="fw-bold text-secondary">검색</span>
								</button>
							</div>						
						</div>
					</div>
				</div>
				<div class="row mt-5 pb-1 border-bottom">
					<div class="col-1 pt-1 mt-3">
						<c:if test="${!empty sessionStudentInfo}">
							총 <span class="fw-bold">${postingCount}</span>건
						</c:if>
					</div>
		            <div class="col-9 px-0"></div>
					<div class="col px-0 mt-2">
						<select class="form-select form-select-sm">
						    <option selected>정확도순</option>
						    <option value="1">등록일순</option>
						    <option value="2">마감임박순</option>
						    <!-- <option value="3"></option> -->
						</select>
					</div>
				</div>
				<div class="row pb-3">
					<div id="postingListBox" class="col"></div>
				</div>
			</div>
			<%-- 오른쪽 --%>	
			<div class="col-2"></div>	
		</div>
		<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
		<%-- futter --%>
		<div class="row">
			<div class="col">
				<jsp:include page="../common/futter.jsp"></jsp:include>
			</div>
		</div>	
	</div>
	
	
	
<%-- 클론 --%>
<%-- 안쪽에 id 절대 넣지 못함! --%>
<div id="templete" class="d-none">
	<div class="postingWrapper row border-bottom py-2">
		<%-- 1번째 칸 --%>
		<div class="col-2 mt-2 ps-4">
			<div class="row">
				<%-- 기업명 --%>
				<div class="postingCompanyName col pe-0"></div>
			</div>
			<div class="row">
				<%-- 가족기업여부 --%>
				<div class="isFamilyCompany col ms-1"></div>
			</div>
		</div>
		<%-- 2번째 칸 --%>
		<%-- 공고제목 --%>
		<div class="col-8 ps-4 pt-2">
			<div class="row">
				<div class="jobPostingName col"></div>
			</div>
			<div class="row">
				<%-- 분야/지역/기간 태그  --%>
				<div class="jobPostingCondition col"></div>
			</div>
		</div>
		<%-- 3번째 칸 --%>
		<div class="col-2">	
			<div class="row">
				<%-- 관심공고 별 --%>
				<div class="interestPosting col ms-3 mb-1">
					<%-- <i onclick="interestBox()" class="starBox text-warning bi bi-star"></i> --%>
					<%-- <c:choose>
						<c:when test="${jobPostingForStudent.allPostingInterest == 0}">
							<i class="text-warning bi bi-star"></i>
						</c:when>
						<c:otherwise>
							<i class="text-warning bi bi-star-fill"></i>
						</c:otherwise>
					</c:choose>
					<span>${jobPostingForStudent.allPostingInterest}</span>	 --%>
				</div>
			</div>
			<div class="row">
				<div class="applyPosting col"></div>
			</div>
		</div>
	</div>
</div>
	
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>