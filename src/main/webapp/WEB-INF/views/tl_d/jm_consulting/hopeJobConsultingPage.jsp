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
	
	
	//온라인상담 등록
	function onlineConsultingProcess(){
		
		const insertOnlineConsultingValue = document.getElementById("insertOnlineConsulting").value;
		
		const url = "./onlineConsultingProcess?on_consulting_contents=" + insertOnlineConsultingValue;
		
		fetch(url)
		.then(response => response.json())
		.then(response =>{
			reloadOnlineConsulting()
			
		});	
	}
	
	
	//온라인상담현황 리로딩
	function reloadOnlineConsulting(){
		
		const url = "./reloadIsOnlineconsulting";
		
		fetch(url)
		.then(response => response.json())
		.then(response =>{
			
			//어디에?
			const isInsertOnlineConsulting = document.querySelector("#isInsertOnlineConsulting");
			
			isInsertOnlineConsulting.innerText='';
					
			//if문, 그냥 false일때 disabled걸자
			if(response.data==false){
				//신청창
				const buttonElement = document.createElement('button');	
				buttonElement.classList.add('btn btn-primary-subtle', 'btn-outline-primary');
				isInsertOnlineConsulting.innerHTML='';
				isInsertOnlineConsulting.innerText="신청 가능";
				isInsertOnlineConsulting.appendChild(buttonElement);
			}
			else{
				const buttonElement = document.createElement('button');	
				buttonElement.classList.add('btn', 'btn-outline-secondary', 'disabled');
				isInsertOnlineConsulting.innerHTML='';
				isInsertOnlineConsulting.innerText="신청 완료";
				isInsertOnlineConsulting.appendChild(buttonElement);				
			}
			
			//2.내 상담가능여부 바뀌기
			//3.그 상담현황도			
			
			
			
	
			
		});			
	}
	
		

</script>




</head>
<body>
<div class="container">


	<div class="row mt-5">
		<div class="col">

				<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>

		</div>
	</div>
	
	
	<div class="row mt-5">
		<div class="col-3">
			<jsp:include page="../common/studentMenu.jsp"></jsp:include>	
		</div>
		<div class="col-9">
		
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
								
									<%--
									<a class="navbar-brand" href="./insertOnConsultingPage">
										<span class="fw-bold pt-2" style="font-size:1.2em;">
											온라인 상담 신청
										</span>
									</a>
									 --%>
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
								<div class="col pt-1 pb-3" style="font-size:0.8em;">
										
											<button id="isInsertOnlineConsulting" type="button" class="btn btn-primary-subtle btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
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
											      	
											      		<div class="row">
											      			<div class="col" style="text-align:left;">
											      				<span class="ps-3 text-left fw-bold" style="color:gray;">내용 입력</span> 
											      			</div>
											      		</div>
											      		<div class="row mt-1">
											      			<div class="col">
											      				<textarea id="insertOnlineConsulting" rows="5" cols="70" style="border:none;"></textarea>
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
									<%--
									<c:choose>
										<c:when test="${isOnlineconsulting}">
											<button type="button" class="btn btn-primary-subtle btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
											 	신청 가능
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
											      	
											      		<div class="row">
											      			<div class="col" style="text-align:left;">
											      				<span class="ps-3 text-left fw-bold" style="color:gray;">내용 입력</span> 
											      			</div>
											      		</div>
											      		<div class="row mt-1">
											      			<div class="col">
											      				<textarea id="insertOnlineConsulting" rows="5" cols="70" style="border:none;"></textarea>
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
										</c:when>
										
										
										<c:otherwise>
											<button type="button" class="btn btn-outline-secondary disabled" data-bs-toggle="modal" data-bs-target="#exampleModal">
											 	신청 완료
											</button>
											
											<!-- Modal -->
											<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											  <div class="modal-dialog">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
											        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
											      </div>
											      <div class="modal-body">
											        ㅏㅏㅏㅏㅏㅏ
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
											        <button type="button" class="btn btn-primary">Save changes</button>
											      </div>
											    </div>
											  </div>
											</div>																					
										</c:otherwise>
										
									
									</c:choose>
									 --%>
																
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
									<c:choose>
									<%---- 이게 답변 안 달린상태 --> --%>
										<c:when test="${!isOnlineconsulting}">
											<a class="navbar-brand" href="./myOnlineConsultingListPage">
												<button type="button" class="btn btn-primary-subtle btn-outline-primary position-relative">
												  미답변
												</button>
											</a>																				
										</c:when>
										
										
										<c:otherwise>
											<a class="navbar-brand" href="./myOnlineConsultingListPage">
												<button type="button" class="btn btn-primary-subtle btn-outline-primary position-relative" data-bs-toggle="modal" data-bs-target="#exampleModal">
													새답변
												  <span class="position-absolute top-0 start-100 translate-middle p-2 bg-danger border border-light rounded-circle">
												    <span class="visually-hidden">New alerts</span>
												  </span>												 	
												</button>
											</a>																				
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
									<a class="navbar-brand" href="./insertHJCPage">
										<span class="fw-bold pt-2" style="font-size:1.2em;">
											구직관심 관리
										</span>
									</a>
								</div>						
							</div>
							<div class="row">
								<div class="col pt-1 pb-3" style="font-size:0.8em;">
									<span>
										나의 구직관심 분야를 관리
									</span>
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
									<a class="navbar-brand" href="./unAnsweredHJFListPage">
										<span class="fw-bold pt-2" style="font-size:1.2em;">
											만족도 조사
										</span>
									</a>
								</div>						
							</div>
							<div class="row">
								<div class="col pt-1 pb-3" style="font-size:0.8em;">
									<span>
										종료된 구직 희망 프로그램 만족도 조사 없으면 모달창@
									</span>
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
									<a class="navbar-brand" href="./updateHopeJobPage">
										<span class="fw-bold pt-2" style="font-size:1.2em;">
											구직희망 정보 관리
										</span>
									</a>
								</div>						
							</div>
							<div class="row">
								<div class="col pt-1 pb-3" style="font-size:0.8em;">
									<span>
										나의 구직희망 정보 열람 및 수정 하기
									</span>
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
									<span>
										진행중인 구직희망 프로그램을 종료 경고창 표시@
									</span>
								</div>						
							</div>										
						</div>				
					</div>					
				</div>
				
				<div class="col-2 me-3"></div>				
			</div>						
		
		
		
		<%--

			<div class="row">
				<div class="col">
					이 row삭제예쩡, 메인페이지 취업컨설팅/마이페이지 구직희망 누르면 오는 페이지,
					구직희망 신청 안했으면 구직희망 신청페이지로 이동
				</div>
			</div>		
			<div class="row mt-5">
				<div class="col border mx-2 my-2" >

				
					<div class="row py-3 bg-light text-dark ">
						<div class="col fw-bold ">
							내 최근 온라인 상담
						</div>
					</div>
					<div class="row pb-4 pt-2">
						<div class="col">
							<div class="row">
								<div class="col">
									<c:choose>
										<c:when test="${lastOnlineConsulting==null || lastOnlineConsulting.onlineConsultingDto==null}">
											상담 내역이 없습니다.
										</c:when>
										<c:otherwise>
												<div class="row">
													<div class="col">
		
														<a href="./myOnlineConsultingPage?on_consulting_pk=${lastOnlineConsulting.onlineConsultingDto.on_consulting_pk}" style="text-decoration: none; color:black;">이름 : ${lastOnlineConsulting.studentInfoDto.name}</a>
																																			
													</div>
												</div>
												<div class="row">
													<div class="col">
														<a href="./myOnlineConsultingPage?on_consulting_pk=${lastOnlineConsulting.onlineConsultingDto.on_consulting_pk}"
														style="text-decoration: none; color:black;">
														
														
															문의 날짜 : <fmt:formatDate value="${lastOnlineConsulting.onlineConsultingDto.created_at}" pattern="yyyy-MM-dd"/>
															<c:choose>
																<c:when test="${lastOnlineConsulting.onlineConsultingReplyDto == null}">
																	<span class="badge text-bg-primary ms-2"> 미답변</span>
							
																</c:when>
																<c:otherwise>
																	<span class="badge text-bg-primary"> 답변</span>
																</c:otherwise>
															</c:choose>	
														</a>																								
													</div>
												</div>		
										</c:otherwise>
									
									</c:choose>							
								</div>
							</div>
		
						</div>
					</div>
					<!-- <button type="button" class="btn btn-primary">목록</button> -->
					<div class="row pt-5 pb-0">
						<div class="col pb-0" style="font-size:0.6em;">
							<a href="./myOnlineConsultingListPage">전체보기 ></a>
						</div>
						<div class="col"></div>
						<div class="col" style="font-size:0.6em; text-align:right;">
							<a href="./insertOnConsultingPage">신청 하기 ></a>
						</div>
					</div>			
				</div>
				
				<div class="col mx-2 my-2 border">
					<div class="row bg-light text-dark">
						<div class="col pt-3 pb-3 fw-bold" >
							만족도 조사
						</div>
					</div>
					<div class="row">
						<div class="col pt-2 pb-3">
							<c:choose>
								<c:when test="${countUnAnsweredHJF==0 }">
									미응답 만족도 조사가 없습니다!
								</c:when>
								
								<c:otherwise>
									<div class="row">
										<div class="col">
											<a href="./unAnsweredHJFListPage"  style="text-decoration: none; color:black;">미응답 만족도 조사 : ${countUnAnsweredHJF}건</a>
										</div>
									<div class="row">
										<div class="col pt-5" style="font-size:0.7em;">
											<a href="./unAnsweredHJFListPage">이동하기</a>
										</div>									
									</div>										
									</div>
											
								</c:otherwise>
							
							</c:choose>
						
							
						</div>
					</div>				
				</div>
			</div>
			
			
			
			
			<div class="row">
				<div class="col border mx-2 my-2">
					<div class="row bg-light text-dark">
						<div class="col py-3 fw-bold" style="font-size:1em;">
							<a class="navbar-brand" href="./insertHJCPage">내 구직관심 분야 관리</a>
						</div>
					</div>
					<div class="row">
						<div class="col py-4 ps-4" >
							<a class="navbar-brand" href="./insertHJCPage" style="font-size:3em;">	<i class="bi bi-gear" style="font-size:3em;"></i></a>							 
						</div>
						<div class="col" style=" display:grid; place-items: center;">
							<a  href="./insertHJCPage" style="font-size:3em;" class="navbar-brand">관리</a>
						</div>

					</div>
				</div>
				<div class="col border mx-2 my-2">
					<div class="row bg-light text-dark">
						<div class="col py-3 fw-bold">
							내 구직희망 정보 관리
						</div>
					</div>
					<div class="row">
					
						<div class="col py-4 ps-4" >
						<a class="navbar-brand" href="./updateHopeJobPage" style="font-size:3em;">	<i class="bi bi-gear" style="font-size:3em;"></i></a>							 
						</div>
						<div class="col py-4" style="display:grid; place-items: center;">
							<a class="navbar-brand" href="./updateHopeJobPage" style="font-size:3em;">관리</a>
						</div>
													
					</div>		
				</div>
			</div>
	
		</div>
		 --%>
	</div>
	
</div>
</div>









<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>