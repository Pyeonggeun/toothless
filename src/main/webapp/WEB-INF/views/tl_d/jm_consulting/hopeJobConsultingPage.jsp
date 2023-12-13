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
			
			console.log(response.data+"리로딩쪽");
			
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
			
			console.log(check+"신청현황");

					
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
		
		console.log(check+"상담현황");
				
		//if문, false일때 신청가능하다 = 답변이있다 즉 상담현황은 true일때 새답변 알람끄기 
		if(check==true){
			const spanValue = document.createElement('span');
			spanValue.classList.add('position-absolute','top-0','start-100','translate-middle','p-2','bg-danger','border','border-light','rounded-circle');
			checkIsNewOnlineConsultingReply.innerText ='';
			checkIsNewOnlineConsultingReply.innerText ='답변';
			checkIsNewOnlineConsultingReply.appendChild(spanValue);		
		}
		else{
			checkIsNewOnlineConsultingReply.innerText ='';
			checkIsNewOnlineConsultingReply.innerText ='미답변';
			
			
		};
				
	}	;
		
	
	
	<!-- -->
	window.addEventListener("DOMContentLoaded", () => {
		reloadOnlineConsultingState();

	});		

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
		
		
	</div>
	
</div>
</div>









<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>