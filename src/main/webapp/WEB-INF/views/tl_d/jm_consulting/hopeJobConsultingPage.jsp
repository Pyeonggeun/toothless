<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">


<title>Insert title here</title>

<script>
	//온라인 상담 등록을 누르면 신청가능키가 변경되어야하고 새답변키도 변경
	//그러면 등록하면서 리로딩이 되어야함
	//리로딩 함수안에선 신청가능키, 새답변키 함수가 실행
	
	var shared_hope_job_pk;
	
	function openModal() {
	  var modal = document.getElementById('myModal');
	  modal.style.display = 'block';
	}
	
	
	
	//온라인상담 등록
	function onlineConsultingProcess(){
		
		const insertOnlineConsultingValue = document.getElementById("insertOnlineConsulting").value;
		
		const url = "./onlineConsultingProcess?on_consulting_contents=" + insertOnlineConsultingValue;
		
		fetch(url)
		.then(response => response.json())
		.then(response =>{
			reloadOnlineConsultingState();
			
		});	
	};
	
	
	//온라인상담현황 리로딩현황
	function reloadOnlineConsultingState(){
		
		const url = "./reloadOnlineConsultingState";
		
		fetch(url)
		.then(response => response.json())
		.then(response =>{
			
			
			//실행할 함수들
			
			//온라인상담가능?
			checkIsInsertOnlineConsulting(response.data);
			//새답변있음?
			checkIsNewOnlineConsultingReply(response.data);
					
		});		
	};

	
	//온라인 상담 신청 가능여부 체크
	function checkIsInsertOnlineConsulting(check){
		

			//어디에?
			const checkIsInsertOnlineConsulting = document.querySelector("#checkIsInsertOnlineConsulting");
			

					
			//if문, 그냥 false일때 disabled걸자
			if(check==false){
				
				//신청창
				
				checkIsInsertOnlineConsulting.classList.add('btn-outline-secondary');
				checkIsInsertOnlineConsulting.disabled = true;
				checkIsInsertOnlineConsulting.innerText='';
				checkIsInsertOnlineConsulting.innerText='신청 완료';				
			}
			

					
		};
	
	
	
	//새답변 있는지 체크
	function checkIsNewOnlineConsultingReply(check){
		

		//어디에?
		const checkIsNewOnlineConsultingReply = document.querySelector("#checkIsNewOnlineConsultingReply");
		
				
		//if문, false일때 신청가능하다 = 답변이있다 즉 상담현황은 true일때 새답변 알람끄기 
		if(check==true){
			const spanValue = document.createElement('span');
			//spanValue.classList.add('position-absolute','top-0','start-100','translate-middle','p-2','bg-danger','border','border-light','rounded-circle');
			checkIsNewOnlineConsultingReply.innerText ='';
			checkIsNewOnlineConsultingReply.innerText ='목록보기';
			//checkIsNewOnlineConsultingReply.appendChild(spanValue);		
		}
		else{
			checkIsNewOnlineConsultingReply.innerText ='';
			checkIsNewOnlineConsultingReply.innerText ='미답변';
			
			
		};
				
	}	;
		

	
	
	
	
	
	
<%-- 구직관심관리 --%>
<%-- --%>
<%-- 전체 카테고리 불러오고 출력 --%>
function getCategortListAll(){
	
	url = "./getHopeJobCategoryList"
	
	fetch(url)
	.then(response => response.json())
	.then(response =>{
		
		
		//복사 붙여넣기할 위치
		const allJobFiledList = document.getElementById("allJobFiledList");
		
		allJobFiledList.innerText='';
		allJobFiledList.innerHTML='';
		for(e of response.data){
		
		<%-- 복사할 템플릿 불러오기 --%>
		const listWrapper = document.querySelector("#templete .listWrapper").cloneNode(true);
		
		//리스트네임 위치찾기
		const listName = listWrapper.querySelector(".listName");
		
		//리스트네임에 불러온값(카테고리이름) 넣어주기
		listName.innerText = e.jobFieldCategoryDto.job_field_category_name;	
		//카테고리 input type checkbox 값 할당해서 넣어주기
		
		//위치찾기
		const listIsCheck = listWrapper.querySelector(".listIsCheck");
		
		//input엘리먼트부여
		const listIsCheckElement = document.createElement('input');
		
		//type속성부여
		listIsCheckElement.type = 'checkbox';
		listIsCheckElement.value = e.jobFieldCategoryDto.job_field_category_pk;
		
		//나중에 등록할때 다중 선택을 위한 class부여
		listIsCheckElement.classList.add('insertHopeJobCategoryValue');
		
		//이미 학생의 관심분야일때 disabled
		if(e.isBoolean == true){
			listIsCheckElement.disabled = true;
		}
		
		
		//마무리
		listIsCheck.appendChild(listIsCheckElement);
		allJobFiledList.appendChild(listWrapper);
		};//포문끝
				
	});
	
}//전체 카테고리끝

<%--내 카테고리 --%>
function getMyHopeJobCategoryList(){

	url = "./getMyHopeJobCategoryList"
		
		fetch(url)
		.then(response => response.json())
		.then(response =>{
			
			const myJobFiledList = document.getElementById("myJobFiledList");
			
			
			myJobFiledList.innerText='';
			
			
			for(e of response.data){
				
				const listWrapper = document.querySelector("#templete .listWrapper").cloneNode(true);
				const listName = listWrapper.querySelector(".listName");
				listName.innerText = e.jobFieldCategoryDto.job_field_category_name;
				
				
				const listIsCheck = listWrapper.querySelector(".listIsCheck");
				
				
				const listIsCheckElement = document.createElement('input');
				listIsCheckElement.type = 'checkbox';					
				listIsCheckElement.value = e.hopeJobCategoryDto.hope_job_category_pk;
				listIsCheckElement.classList.add("deleteMyHopeJobCategoryValue");
				
				listIsCheck.appendChild(listIsCheckElement);
				myJobFiledList.appendChild(listWrapper);
				
			};				
		});
	
}


//구직관심분야 등록하기	
function insertHopeJobCategory(){

	//체크된 등록 벨류들 가져오기
	//input.에서 .은 class선택자라고함
	var checkboxes = document.querySelectorAll('input.insertHopeJobCategoryValue:checked');
	console.log(checkboxes);
	// 체크박스 벨류담을 배열생성
	var checkBoxValues = [];
	//for문돌려서 value뽑기
      checkboxes.forEach(function(checkbox) {
    	checkBoxValues.push(checkbox.value);
      });
	
	if(checkboxes.length==0){
		alert("등록할 분야를 선택해 주세요!");
		return;
	}

	//등록		
	<%--링크--%>
	const url = "./insertHopeJobCategory?checkBoxValues=" + checkBoxValues;
	fetch(url)
	.then(response => response.json()) //얘는 es5처럼 역직렬화 해줘야함(제이쿼리는 안해줌) (언어변환) 
	.then((response) => {
		getCategortListAll();
		getMyHopeJobCategoryList();
	})	;
}


//내 구직희망 카테고리 삭제
function deleteMyHopeJobCategory(){
	
	
	//체크된거 뽑기
	var checkboxes = document.querySelectorAll('input.deleteMyHopeJobCategoryValue:checked');
	
	var checkBoxValues = [];
	
	if(checkboxes.length==0){
		alert("삭제할 분야를 선택해 주세요!");
		return;
	}		
	
	for(var e of checkboxes){
		checkBoxValues.push(e.value);
	};
	
	//체크된거 삭제
	const url = "./deleteMyHopeJobCategory?checkBoxValues=" + checkBoxValues;
	fetch(url)
	.then(response => response.json()) //얘는 es5처럼 역직렬화 해줘야함(제이쿼리는 안해줌) (언어변환) 
	.then((response) => {
		getCategortListAll();
		getMyHopeJobCategoryList();
	})	;		
	
}
	
	
	
	
	
	//내 구직희망 정보 ${map.studentInfoDto.student_pk}
	function myHopeJobInfo(){
		const url = "./myHopeJobInfo";
		
		fetch(url)
		.then(response => response.json())  
		.then((response) => {
			
			const myHopeJobInfo = response.data;
			const requierments = myHopeJobInfo.hopeJobDto.requierments;
			const hope_area = myHopeJobInfo.hopeJobDto.hope_area;
			const hope_salary = myHopeJobInfo.hopeJobDto.hope_salary;
			const hope_job_pk = myHopeJobInfo.hopeJobDto.hope_job_pk;
			const student_pk = myHopeJobInfo.studentInfoDto.student_pk;
			shared_hope_job_pk = myHopeJobInfo.hopeJobDto.hope_job_pk;
			//다른곳에서도 hope_job_pk필요
			
			//값 세팅
			document.querySelector("#requierments").value = requierments;
			document.querySelector("#hope_area").value = hope_area;
			document.querySelector("#hope_salary").value = hope_salary;
			document.querySelector("#hope_job_pk").value = hope_job_pk;
			document.querySelector("#student_pk").value = student_pk;

		})	
	}
	
	
	<%-- --%>
	//구직희망정보 수정
	function updateMyHopeJobInfo(){
		
		//값세팅
		const hope_job_pk = document.querySelector("#hope_job_pk").value;
		const requierments = document.querySelector("#requierments").value;
		const hope_area = document.querySelector("#hope_area").value;
		const hope_salary = document.querySelector("#hope_salary").value;
		const student_pk = document.querySelector("#student_pk").value;
		
		//예외처리
		if(hope_salary==0){
							
		}
		if(hope_area==null){
					
		}
			
		
		if(requierments==null){
						
		}

		
		//코드실행
		const url ="./updateHopeJobProcess?hope_job_pk="+hope_job_pk+"&requierments="+requierments+"&hope_area="+hope_area+"&hope_salary="+hope_salary+"&student_pk="+student_pk ;
		fetch(url)
		.then(response => response.json())  
		.then((response) => {
		})	;
		
	}
	
	
	
	
	
	//희망연봉 null점검
	function checkHopeSalaryNull(){
		var warningHopeSalaryValue = document.querySelector("#warningHopeSalaryValue")
		var checkHopeSalaryNull = document.querySelector("#hope_salary").value;
		if(checkHopeSalaryNull==null || checkHopeSalaryNull==0 ||checkHopeSalaryNull == ''){
			warningHopeSalaryValue.innerHTML='';
			const spanEl = document.createElement('span');
			spanEl.innerText="연봉 0원 이상으로 입력해주세요";
			warningHopeSalaryValue.appendChild(spanEl);
		};
	}
	
	//희망지역 null점검
	function checkHopeAreaNull(){
		var warningHopeAreaValue = document.querySelector("#warningHopeAreaValue")
		var checkHopeAreaNull = document.querySelector("#hope_area").value;
		if(checkHopeAreaNull==null ||checkHopeAreaNull == ''){
			warningHopeAreaValue.innerHTML='';
			const spanEl = document.createElement('span');
			spanEl.innerText="희망지역을 입력해주세요";

			warningHopeAreaValue.appendChild(spanEl);
		};
	}	
	
	//희망요구사항 null점검
	function checkHopeRequiermentsNull(){
		var warningHopeRequiermentsValue = document.querySelector("#warningHopeRequiermentsValue")
		var checkHopeRequiermentsNull = document.querySelector("#requierments").value;
		if(checkHopeRequiermentsNull==null ||checkHopeRequiermentsNull == ''){
			warningHopeRequiermentsValue.innerHTML='';
			const spanEl = document.createElement('span');
			spanEl.innerText="요구사항을 입력해주세요";
			warningHopeRequiermentsValue.appendChild(spanEl);
		};
	}	
	
	
	
	//구직희망프로그램 종료
	function endHopeJobConsulting(){
		console.log(shared_hope_job_pk+"따당");
		const url="./endHopeJobConsulting?hope_job_pk=" + shared_hope_job_pk;
		
		
			fetch(url)
			.then(response => response.json())  
			.then((response) => {
			})	;
		
	}
	
	//화살표 효과
	function insertHJCMouseOver(e){
		e.classList.remove("bi-arrow-right-square")
		e.classList.add("bi-arrow-right-square-fill")		
	}
	
	function insertHJCMouseOut(e){
		e.classList.remove("bi-arrow-right-square-fill")
		e.classList.add("bi-arrow-right-square")		
	}
	
	function deleteHJCMouseOver(e){
		e.classList.remove("bi-arrow-left-square")
		e.classList.add("bi-arrow-left-square-fill")		
	}
	
	function deleteHJCMouseOut(e){
		e.classList.remove("bi-arrow-left-square-fill")
		e.classList.add("bi-arrow-left-square")		
	}	
	
	
	<!-- -->
	window.addEventListener("DOMContentLoaded", () => {
		reloadOnlineConsultingState();
		getCategortListAll();
		getMyHopeJobCategoryList();
		myHopeJobInfo();
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
	
	
	<div class="row">
		<div class="col-2">
			<jsp:include page="../common/studentMenu.jsp"></jsp:include>	
		</div>
		<div class="col mt-3">
		
			<div class="row">
				
				<div class="col-1"></div>
			
				<div class="col">
					<div class="row mt-3">						
						<div class="col bg-primary-subtle me-3 text-center border rounded-3">
							<div class="row">
								<div class="col pt-3">
									<span class="rounded-circle" style="font-size:3em;">
										<i class="bi bi-pencil"></i>
									</span>
								</div>						
							</div>
							<div class="row">
								<div class="col">
								

								</div>						
							</div>
							<div class="row">
								<div class="col pt-1 pb-3 fw-bold" style="font-size:1.2em;">

									<span class="">
										온라인 상담 신청
									</span>

								</div>						
							</div>
							<div class="row">
								<div  class="col pt-1 pb-3" style="font-size:0.8em;">										
											<button id="checkIsInsertOnlineConsulting" type="button" class="btn btn-primary-subtle btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
												신청가능
											</button>
											
											<!-- Modal -->
											<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h1 class="modal-title fs-5 fw-bold" id="exampleModalLabel">온라인 상담 신청</h1>
											        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											      </div>
											      <div class="modal-body">
											      	
							
											      		<div class="row mt-1">
											      			<div class="col">
											      				<textarea id="insertOnlineConsulting" rows="5" cols="70" style="border:none;" placeholder="내용 입력"></textarea>
											      			</div>
											      		</div>											      	 	
											      	  
											      	
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
											        <button onclick="onlineConsultingProcess()" data-bs-dismiss="modal" type="button" class="btn btn-primary">등록</button>
											      </div>
											    </div>
											  </div>
											</div>										
									
								</div>						
							</div>																	
						</div>
		
						<div class="col bg-primary-subtle  me-3 text-center border rounded-3">
							<div class="row">
								<div class="col pt-3">
									<span style="font-size:3em;">
										<i class="bi bi-book"></i>
									</span>
								</div>						
							</div>
							<div class="row">
								<div class="col pt-1 pb-3">
									<a class="navbar-brand" href="./myOnlineConsultingListPage">
										<span class="fw-bold" style="font-size:1.2em;">
											내 온라인 상담 현황
										</span>
									</a>
								</div>						
							</div>
							<div class="row">
								<div class="col pt-1 pb-3" style="font-size:0.8em;">
									
									<a class="navbar-brand" href="./myOnlineConsultingListPage">
										<button id="checkIsNewOnlineConsultingReply" type="button" class="btn btn-primary-subtle btn-outline-primary position-relative">
										  <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
										    <span class="visually-hidden">New alerts</span>
										  </span>	
										</button>

									</a>										
								</div>						
							</div>										
						</div>				
					</div>					
				</div>
				
				<div class="col-2 me-3"></div>				
			</div>
			
			
			
			
			
			
			
			
			
			<div class="row">
				
				<div class="col-1"></div>
			
				<div class="col">
					<div class="row mt-3 ">						
						<div class="col bg-success-subtle me-3 text-center border rounded-3">
							<div class="row">
								<div class="col pt-3">
									<span style="font-size:3em;">
										<i class="bi bi-balloon-heart"></i>
									</span>
								</div>						
							</div>
							<div class="row ">
								<div class="col">
									
									<span class="fw-bold pt-2" style="font-size:1.2em;">
										구직관심 관리
									</span>
									
								</div>						
							</div>
							<div class="row">
								<div class="col pt-1 pb-3" style="font-size:0.8em;">
								<%--
									<span>
										나의 구직관심 분야를 관리
									</span>
								 --%>
								<button type="button" class=" btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#hopeJobSettingModal">
									이동
								</button>
								
								<!-- Modal -->
								<div class="modal fade" id="hopeJobSettingModal" tabindex="-1" aria-labelledby="hopeJobSettingModal" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header text-center">
								        <h1 class="modal-title text-center fs-5 fw-bold" id="exampleModalLabel">구직관심분야 관리</h1>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								      	
				
										<div class="col mx-2 my-2">
										
										
											
											<div class="row">
												<div class="col p-3 border text-center">
													<div class="row py-3 border-bottom border-2 ">
														<div class="col fw-bold" style="font-size:1.4em;">
															전체 관심 분야
														</div>
													</div>
													<div class="row pt-3">
														<div id="allJobFiledList" class="col" style="font-size:0.9em;">
															
														</div>
													</div>					
												</div>
												<!-- 등록/삭제버튼 -->
												<div class="col-2 text-center">
													<div class="row mt-5 pt-5">
														<div class="col mt-5 pt-5" style="font-size:2.3em;">
															<div class="row">
																<div class="col">
																	<i onmouseout="insertHJCMouseOut(this)" onmouseover="insertHJCMouseOver(this)" onclick="insertHopeJobCategory()" class="bi-btn bi-arrow-right-square"></i>
																	
																</div>
															</div>
															<div class="row pt-2">
																<div class="col">
																	<i onmouseout="deleteHJCMouseOut(this)" onmouseover="deleteHJCMouseOver(this)" onclick="deleteMyHopeJobCategory()" class="bi bi-arrow-left-square"></i>
																</div>
															</div>							
														</div>
													</div>							
												</div>
												
												<div class="col p-3 border text-center">
													<div class="row py-3 border-bottom border-2">
														<div class="col fw-bold" style="font-size:1.4em;">
															내 관심 분야
														</div>
													</div>
													<div class="row pt-3">
														<div id="myJobFiledList" class="col" style="font-size:0.9em;"><!-- 리스트래퍼 -->
															
														</div>
													</div>					
												</div>
											</div>
														
																	
										</div>											      	 	
								      	  
								      	
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
								        
								      </div>
								    </div>
								  </div>
								</div>									 
								 
								 
								 
								 
								</div>						
							</div>										
						</div>
		
						<div class="col bg-success-subtle me-3 text-center border rounded-3">
							<div class="row">
								<div class="col pt-3">
									<span style="font-size:3em;">
										<i class="bi bi-emoji-smile"></i>
									</span>
								</div>						
							</div>
							<div class="row">
								<div class="col">
									
										<span class="fw-bold pt-2" style="font-size:1.2em;">
											미응답 만족도 조사
										</span>
									
								</div>						
							</div>
							<div class="row">
								<div class="col pt-1 pb-3" style="font-size:0.8em;">
								
								
									<c:choose>
										<c:when test="${countUnAnsweredHJF==0}">
											<button disabled type="button" class=" btn btn-outline-secondary">
												<span class="fw-bold" style="font-size:1.2em;">${countUnAnsweredHJF}</span> 건
											</button>	
										
										</c:when>
										
										<c:otherwise>
										
										
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#myUnAnsweredHJF">
										  <span class="fw-bold" style="font-size:1.2em;">${countUnAnsweredHJF}</span> 건
										</button>
										
										<!-- Modal -->
										<div class="modal fade" id="myUnAnsweredHJF" tabindex="-1" aria-hidden="true">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h1 class="modal-title fs-5" id="exampleModalLabel">미응답 만족도 조사 리스트</h1>
										        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										      </div>
										      <div class="modal-body">
										        <div class="row">
										        	<div class="col">
										        		<div class="row fw-bold border-2 border-bottom pb-3">
										        			<div class="col">
										        				신청번호
										        			</div>
										        			<div class="col">
										        				구직 희망 신청일
										        			</div>
										        			<div class="col">
										        				만족도 조사하기
										        			</div>										        													        			
										        		</div>
										        		<div class="row pt-2">
										        			<div class="col">
										        				<c:forEach items="${hopeJobDtoList}" var="e">
										        					<div class="row py-3">
										        						<div class="col">
										        							${e.hope_job_pk}
										        						</div>
										        						<div class="col">
										        							<fmt:formatDate value="${e.created_at}" pattern="yyyy-MM-dd"/>
										        						</div>
										        						<div class="col">
										        							<a href="./insertHJFPage?hope_job_pk=${e.hope_job_pk}" style="text-decoration: none;"> 바로가기 ></a>
										        						</div>										        																        																        						
										        					</div>										        				
										        				</c:forEach>
										        			</div>
										        		</div>
										        	</div>
										        </div>
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>										        
										      </div>
										    </div>
										  </div>
										</div>										
										
										
										
										
							
																																					
										</c:otherwise>													
									</c:choose>
								
								
								</div>						
							</div>										
						</div>			
					</div>					
				</div>
				
				<div class="col-2 me-3"></div> 		
			</div>
			
			
			
			
			
			
			
			
			
			
			<div class="row">
				
				<div class="col-1"></div>
			
				<div class="col">
					<div class="row mt-3 ">						
						<div class="col bg-danger-subtle me-3 text-center border rounded-3">
							<div class="row">
								<div class="col pt-3">
									<span style="font-size:3em;">
										<i class="bi bi-journal-check"></i>
									</span>
								</div>						
							</div>
							<div class="row">
								<div class="col">
									
										<span class="fw-bold pt-2" style="font-size:1.2em;">
											구직희망 정보 관리
										</span>
								
								</div>						
							</div>
							<div class="row">
								<div class="col pt-1 pb-3" style="font-size:0.8em;">
									
									<button onclick="myHopeJobInfo()" type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#updateHopeJob">
									  수정
									</button>
									
									
									<div class="modal fade" id="updateHopeJob" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-scrollable">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h1 class="modal-title fs-5" id="exampleModalLabel">구직희망 정보 수정</h1>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
											  <div class="row mt-4" style="font-size:0.9em;">
													<div class="col">
														<div class="row">
															<div class="col-2 pe-0 border-end">
																희망 연봉
															</div>
															<div class="col ms-4 border">
																<input onblur="checkHopeSalaryNull()" id="hope_salary" type="number" min="0" name="hope_salary" value="" style="width:100%; border:none; outline:none;">
															</div>	
															<div class="col-1" style="font-size:0.8em; display: flex; align-items: center;">원</div>
															<div id="warningHopeSalaryValue" class="col-6" style="text-align: left; display: flex; align-items:center; color:red; font-size:0.9em;"></div>				
														</div>
														<div class="row pt-3">
															<div class="col-2 pe-0 border-end">
																희망 지역
															</div>
															<div class="col ms-4 border">
																<input onblur="checkHopeAreaNull()" id="hope_area" type="text" name="hope_area" placeholder="" style="width:100%; border:none; outline:none;">
															</div>				
															<div class="col-1"></div>
															<div id="warningHopeAreaValue" class="col-6" style="text-align: left; display: flex; align-items:center; color:red; font-size:0.9em;"></div>			
														</div>
														<div class="row text-left pt-3">
															<div class="col">
																<div class="row">
																	<div class="col ps-4" style="text-align:left;">
																	 	요구사항
																	</div>
																	<div id="warningHopeRequiermentsValue" class="col-9" style="text-align: left; display: flex; align-items:center; color:red; font-size:0.9em;">
																		
																	</div>
																</div>
																<div class="row border mx-2 my-2 px-1 py-1">
																	<div class="col">
																		<textarea onblur="checkHopeRequiermentsNull()" id="requierments" name="requierments" rows="30" cols="8" placeholder="" style="width:100%; border:none; outline:none;"></textarea>
																	</div>
																</div>							
															</div>						
														</div>																	
													</div>
													<div class="row">
														<div class="col">
															<input id="hope_job_pk" type="hidden" name="hope_job_pk" value="">
															<input id="student_pk" type="hidden" name="student_pk" value="">
														</div>
													</div>
												</div>								       
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									        <button onclick="updateMyHopeJobInfo()" type="button" class="btn btn-primary" data-bs-dismiss="modal">수정</button>
									      </div>
									    </div>
									  </div>
									</div>
								</div>						
							</div>										
						</div>
		
						<div class="col bg-danger-subtle me-3 text-center border rounded-3">
							<div class="row">
								<div class="col pt-3">
									<span style="font-size:3em;">
										<i class="bi bi-x-octagon" style="color:red"></i>
									</span>
								</div>						
							</div>
							<div class="row">
								<div class="col">
									<a class="navbar-brand" href="./insertOnConsultingPage">
										<span class="fw-bold pt-2" style="font-size:1.2em;">
											구직희망 프로그램 종료하기
										</span>
									</a>
								</div>						
							</div>
							<div class="row">
								<div class="col pt-1 pb-3" style="font-size:0.8em;">
								
									<!-- Button trigger modal -->
									<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#endHopeJobConsulting">
									  종료
									</button>
									
									<!-- Modal -->
									<div class="modal fade" id="endHopeJobConsulting" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h1 class="modal-title fs-5" id="staticBackdropLabel">구직희망 프로그램 종료</h1>
									        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									      </div>
									      <div class="modal-body">
									        <div class="row">
									        	<div class="col fw-bold">
									        		정말로 구직희망 프로그램을 <span class="color-red">종료</span> 하시겠습니까?	
									        	</div>
									        </div>
									        <div class="row pt-2">
									        	<div class="col text-secondary" style="font-size:0.9em;">
									        		*종료하신후 복구는 불가능 합니다.
									        	</div>
									        </div>									        
									        
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
									        
									        <a href="../../another/student/mainPage" style="">
									        <button onclick="endHopeJobConsulting()" type="button" class="btn btn-danger" data-bs-dismiss="modal">
									        프로그램 종료
									        </button>
									        </a>
									        
									      </div>
									    </div>
									  </div>
									</div>								


								</div>						
							</div>										
						</div>				
					</div>					
				</div>
				
				<div class="col-2 me-3"></div>				
			</div>						
		
		
	</div>
	
	
	</div>
	<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
	<!-- futter -->
	<div class="row">
		<div class="col">
			<jsp:include page="../common/futter.jsp"></jsp:include>
		</div>
	</div>
</div>



<div id ="templete" class="d-none">
	<div class="listWrapper row py-2" style="font-size:1.1em;">
		<div class="listName col ps-3">

		</div>
		<div class="listIsCheck ps-4 col">
			
		</div>					
	</div>
</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>