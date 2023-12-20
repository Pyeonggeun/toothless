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
	
	//전역변수선언 
	var shared_pageNum = 1 ;
	var shared_isReply ;
	var shared_sortby = "earliest";
	var shared_searchType;
	var shared_searchContents;
	var shared_modal_contets ;
	
	
	//커서모양변경
	function cursorChangeLikeLink(e){
	
		e.style.cursor = "pointer";
	}
	
	
	//리로딩
	function reloadOnlineConsultingList(isReply, sortby,searchType ,searchContents, pageNum){
		if(pageNum == undefined){
			 pageNum = shared_pageNum ;
		}
		
		shared_isReply = isReply;
		shared_sortby = sortby ;
		shared_searchType = searchType ;
		shared_searchContents = searchContents ;
		
		//글자변경
		var getOnlineConsultingListEarliest = document.querySelector("#getOnlineConsultingListEarliest");
		var getOnlineConsultingListLatest = document.querySelector("#getOnlineConsultingListLatest");
		if(shared_sortby=='earliest'){
			getOnlineConsultingListEarliest.classList.add("fw-bold");
			getOnlineConsultingListLatest.classList.remove("fw-bold");
		}
		else if(shared_sortby=='latest'){
			getOnlineConsultingListEarliest.classList.remove("fw-bold");
			getOnlineConsultingListLatest.classList.add("fw-bold");
		}
		//리스트 출력
		const url = "./ViewOnlineConsultingList?isReply=" + shared_isReply +"&sortby=" + shared_sortby+"&searchType=" + shared_searchType +"&searchContents=" + shared_searchContents + "&pageNum=" + pageNum ;
		

		fetch(url)
		.then(response => response.json())
		.then(response => {
				
				//붙일 위치
				const viewListLocation = document.getElementById("viewListLocation");
				viewListLocation.innerHTML ='';
				viewListLocation.innerText ='';
				for(isReply of response.data){
					//위치찾기
					const wrapper = document.querySelector("#templete .wrapper").cloneNode(true);
					const wrapper_pk = wrapper.querySelector(".wrapper_pk");
					const wrapper_name = wrapper.querySelector(".wrapper_name");
					const wrapper_date = wrapper.querySelector(".wrapper_date");
					const wrapper_isAnswered = wrapper.querySelector(".wrapper_isAnswered");
					const wrapper_link = wrapper.querySelector(".wrapper_link");					
					
					wrapper_pk.innerText = isReply.onlineConsultingDto.on_consulting_pk;
					wrapper_name.innerText = isReply.studentInfoDto.name;
					
					//날짜
					const date = new Date(isReply.onlineConsultingDto.created_at);
					wrapper_date.innerText = date.getFullYear() +"." + (date.getMonth() + 1) + "." + date.getDate();
					
					//응답여부
					var button_isAnswered = document.createElement('button');
					button_isAnswered.style.width = '45%';
					button_isAnswered.style.height = '20%';
					button_isAnswered.style.fontSize = '1em';
					isReply.isReply ? (
							button_isAnswered.innerText = "답변완료",
							button_isAnswered.classList.add('btn', 'btn-primary')

							)
							
							: (button_isAnswered.innerText = "미답변",
							button_isAnswered.classList.add('btn', 'btn-danger')
							);
					wrapper_isAnswered.appendChild(button_isAnswered);

					
					//모달버튼 부르기
					const privewModalLink = wrapper.querySelector(".privewModalLink");
					privewModalLink.value= isReply.onlineConsultingDto.on_consulting_pk ;
					//붙이기
					wrapper_link.appendChild(privewModalLink);
					
					
					
					
					//마무리
					viewListLocation.appendChild(wrapper);
					
					
				};<%-- 포문끝 --%>
					

		});
		
		
		
		//페이징
		const urlPage = "./countTotalBoardNumInSOC?isReply=" + shared_isReply +"&sortby=" + shared_sortby+"&searchType=" + shared_searchType +"&searchContents=" + shared_searchContents + "&pageNum=" + pageNum ;
		
		
		
		fetch(urlPage)
		.then(response => response.json())
		.then(response => {
			
			//현재페이지	
			const currentPageNum = response.data.currentPageNum;
			//총 페이지
			const totalPageNumInSOC = response.data.totalPageNumInSOC;
			//시작 페이지 번호
			const startPageNumber = response.data.startPageNumber;

			//끝 페이지 번호
			const endPageNumber = response.data.endPageNumber;

			
			
			var pagingWrapper = document.querySelector(".pagingWrapper");
			pagingWrapper.innerHTML='';
			//페이지 출력
			for (let i = startPageNumber; i <= endPageNumber; i++) {
				
				var pagingNumber = document.querySelector("#pagingNumber").cloneNode(true);
				pagingNumber.innerText = i ;
				pagingWrapper.appendChild(pagingNumber);
				pagingNumber.value = i ;
				if(i==currentPageNum){
					pagingNumber.classList.add('active');
					pagingNumber.id="currentPageNum"
				}
								
			}
			
			//좌측우측 이동 if문
			if(startPageNumber <= 1){
				var pagingLeft = document.querySelector("#pagingLeft");
				pagingLeft.classList.add('disabled');				
			}
			
			if(endPageNumber >= totalPageNumInSOC){
				var pagingRight = document.querySelector("#pagingRight");
				pagingRight.classList.add('disabled');				
			}
			
				
		});
		
}
	
	
	

	
	
	//모달 클릭
	function manageOnlineConsulting(onlineConsultingPk){
		
		url ="./staffManageOnlineConsultingInfo?onlineConsultingPk=" + onlineConsultingPk ;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			var e = response.data ;
			
			//위치찾기
			const modalLink = document.querySelector("#modal_Link"); // 래퍼
			const modal_student_name = modalLink.querySelector(".modal_student_name");
			const modal_student_id = modalLink.querySelector(".modal_student_id");
			const modal_date = modalLink.querySelector(".modal_date");
			const modal_contents = modalLink.querySelector(".modal_contents");
			var modal_answer = modalLink.querySelector(".modal_answer");
			
			modal_student_name.innerText = e.studentInfoDto.name;
			modal_student_id.innerText = e.studentInfoDto.student_id;
			const date = new Date(e.onlineConsultingDto.created_at);
			modal_date.innerText = date.getFullYear() +"." + (date.getMonth() + 1) + "." + date.getDate();
			modal_contents.innerText = e.onlineConsultingDto.on_consulting_contents;
			
			//답변 안달렸으면 답변 입력창 생성
			if(e.onlineConsultingReplyDto==null){
				modal_answer.innerText = '';
				var modal_textarea = document.querySelector(".modal_textarea");
				modal_answer.appendChild(modal_textarea);

				const modal_insert = document.querySelector('.modal_insert');
				modal_insert.value = onlineConsultingPk ;
				
			}
			
			else{				
				modal_answer.innerText = e.onlineConsultingReplyDto.on_contents_reply;
				const modal_cancel = document.querySelector('.modal_cancel');
				modal_cancel.classList.remove('btn-secondary');
				modal_cancel.classList.add('btn-primary');
				modal_cancel.innerText = '확인';
				
				const modal_insert = document.querySelector('.modal_insert');
				modal_insert.remove();
			}
			
							
		});
		
	}
	
	
	
	
	//답변등록
	function insertOnlineConsultingReply(onlineConsultingPk){
		modal_textarea_value = document.querySelector('.modal_textarea').value;
		console.log(modal_textarea_value);
		
		url = "./insertOnlineConsultingReply?on_consulting_pk=" + onlineConsultingPk +"&on_contents_reply=" + modal_textarea_value   ;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			reloadOnlineConsultingList();

							
		});
		
	}
	
	
	
	
	
	
	
	window.addEventListener("DOMContentLoaded", () => {
		reloadOnlineConsultingList();

		
		
	});


</script>

</head>
<body>
<div class="container-fluid">

	<div class="row">
		<div class="col">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>		
		</div>
	</div>
	
	

	<div class="row">
	
				<div class="col">
					<div class="row">
						<div class="col-2 border-end pb-0">
							<jsp:include page="../common/staffMenu.jsp"></jsp:include>
						</div>
						
						<div class="col">
							<div class="row">
								<div class="col-1"></div>							
								<div class="col">
									<div class="row mt-5">
										<div class="col fw-bold ps-0" style="font-size:1.5em;">
											온라인 상담 목록
										</div>
									</div>	
									<div class="row mt-5 border border-secondary-subtle">
											<div class="col">	
											 
												<div class="row" style="font-size:0.8em;">																					
													<div class="col">									
														<select class="ps-0 form-select" aria-label="Default select example" onchange="reloadOnlineConsultingList(this.value,shared_sortby,searchCategory.value,searchContents.value, shared_pageNum)" style="border:none; outline:none;">
														  <option value="all" ${isReply == 'all' ? 'checked' : null }>전체 &nbsp;&nbsp;</option>
														  <option value="reply" ${isReply == 'Reply' ? 'checked' : null }>답변</option>
														  <option value="unReply" ${isReply == 'unReply' ? 'checked' : null }>미답변</option>										  
														</select>										
													</div>
													<div class="col-8"></div>															
													
													<div class="col pt-2 pe-4 text-end" >
														<div class="row pe-2" style="font-size:0.9em;">
															<div id="getOnlineConsultingListLatest" onclick="reloadOnlineConsultingList(shared_isReply,'latest',searchCategory.value,searchContents.value, currentPageNum.value)" class="col pe-0">
																<span onmouseover="cursorChangeLikeLink(this)">최신순</span>
															</div>
															<div id="getOnlineConsultingListEarliest" onclick="reloadOnlineConsultingList(shared_isReply,'earliest',searchCategory.value,searchContents.value, currentPageNum.value)" class="col pe-0">
																<span onmouseover="cursorChangeLikeLink(this)">오래된순</span>
															</div>
														</div>
													</div>
												</div>
				
											</div>
									  </div>
									
									
									<div class="row  border border-secondary-subtle">
										<div class="col">
											<div class="row border" style="align-items:center;">
											
												
											
												
												
												<div class="col">					
													<select id="searchCategory" class="ps-0 form-select" aria-label="Default select example" style="border:none; outline:none; font-size:0.9em;">
													  <option value="all">선택</option>
													  <option value="student_name">학생 이름</option>
													  <option value="online_consulting_pk">신청번호</option>
													</select>							
												</div>
												<div class="col-10">
													<div class="row">
														<div class="col-11">
															<input id="searchContents" type="text" style="border:none; outline:none; width:100%; font-size:0.7em;">
														</div>								
														<div class="col-1 text-right pe-2" style="display:flex; align-items:end; justify-content:end;">
															<button onclick="reloadOnlineConsultingList(shared_isReply,shared_sortby,searchCategory.value,searchContents.value, currentPageNum.value)"  style="border:none; background:none; cursor:pointer;"><i class="bi bi-search"></i>
															</button>
														</div>
				
													</div>									
												</div>										
				
																	
											</div>
				
										</div>
									</div>
									
									<div class="row mt-5 row py-2 border-bottom border-2 border-secondary text-center" >
										<div class="col">
											<div class="row fw-bold">
												<div class="col">
													No.
												</div>
												<div class="col">
													학생 이름
												</div>
												<div class="col">
													상담 날짜
												</div>
												<div class="col">
													응답여부
												</div>
												<div class="col">
													상세 정보
												</div>								
											</div>
										</div>
									</div>
									
									<%--붙이는 위치 --%>
									<div class="row border-top border-bottom border-secondary-subtle text-center">
										<div id="viewListLocation" class="col">
				
										</div>
									</div>
									
									
	
									
									<%--페이징 --%>
									<div class="row text-center mt-5">
										<div class="col-2"></div>
										<div class="col">						
										  <div class="btn-group me-2" role="group" aria-label="First group">
											<button id="pagingLeft" onclick="reloadOnlineConsultingList(shared_isReply,shared_sortby,searchCategory.value,searchContents.value, currentPageNum.value)" type="button" class="btn btn-outline-dark">&lt;</button>
										    <div class="row">
										    	<div class="col pagingWrapper">							    		
										    	</div>
										    </div>									    
										    <button id="pagingRight" onclick="reloadOnlineConsultingList(shared_isReply,shared_sortby,searchCategory.value,searchContents.value, currentPageNum.value)" type="button" class="btn btn-outline-dark">></button>
										  </div>
									  </div>
									  <div class="col-2 ">
										<a href="../common/staffMainPage">
											<button type="button" class="btn btn-primary">메인페이지로</button>
										</a>
									  </div>									  
									</div>					
														
					
								 </div>
								<div class="col-2"></div>															 
								</div>
							</div>
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








<%-- 템플릿 --%>
<!-- 리스트 템플릿 -->
<div id="templete" class="d-none">							
	<div class="row py-2 border-bottom border-secondary-subtle wrapper" style="align-items:center;">
			<div class="col wrapper_pk fw-bold" style="font-size:1em;">
				
			</div>
			<div class="col wrapper_name" style="font-size:1em;">
				
			</div>
			<div class="col wrapper_date" style="font-size:1em;">
			</div>
			<div class="col wrapper_isAnswered fw-bold" style="font-size:1em;">			
			</div>	
			<div class="col wrapper_link" >
				<div class="row modalWrapper">
					<div class="col">
					
						<button onclick="manageOnlineConsulting(this.value)" value="" type="button" class="privewModalLink btn btn-light" data-bs-toggle="modal" data-bs-target="#modal_Link">
							<i class="bi bi-info-square" style="font-size:1.5em;"></i>
						</button>
					
					
						<div class="modal fade modal_Link" id="modal_Link" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h1 class="modal-title fs-5" id="exampleModalLabel">온라인 상담 관리</h1>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body modal_body">
						      
			
			
									<div class="row mt-3">
										<div class="modal_is_Answered col">
											
										</div>
									</div>
									
									<div class="row">
										<div class="col">
											<div class="row py-1">
				
											</div>
											<div class="row py-1">
												<div class="col" >
													<div class="row">
														<div class="col">
															<span style="font-size:0.8em;">상담자</span>
														</div>
														<div class="col">
															<span class="fw-bold modal_student_name" style="font-size:1em;"></span>
														</div>		
														<div class="col-8"></div>												
													</div>  													
												</div>																							
											</div>
											<div class="row py-1">																															
												<div class="col" >
													<div class="row">
														<div class="col-2 text-start">
															<span class="ps-3" style="font-size:0.8em;">학번</span>
														</div>
														<div class="col-4 text-start">
															 <span class="fw-bold modal_student_id"></span>
														</div>
														<div class="col modal_date text-secondary text-end" style="font-size:0.9em;">
														
														</div>																											
													</div>  													
												</div>
												
											</div>											
											<div class="row ms-1 mt-3 pt-3 border-top border-black">
												<div class="text-start py-2 consulting_contents col fw-bold" style="font-size:1em;">
													상담내용
												</div>

											</div>
											<div class="row ms-1 px-2 py-2 pb-2 border-bottom border-black">
												<div class="col modal_contents text-start ps-0 pb-2">
													<textarea class="modal_textarea py-3 border border-black text-start" rows="20" cols="60" placeholder="답변입력"></textarea>

												</div>
											</div>														
										</div>
									</div>
									
									
									<div class="row mt-4 pt-3 border-top">
										<div class="col modal_answer">					
										</div>
									</div>
			
			
			
			
			
			
			
			
			
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="modal_cancel btn btn-secondary" data-bs-dismiss="modal">취소</button>
						        <button onclick="insertOnlineConsultingReply(this.value)" value="" type="button" class="modal_insert btn btn-primary"  data-bs-dismiss="modal">등록</button>
						      </div>
						    </div>
						  </div>
						</div>	
						
							
					</div>
				</div>
			</div>
	</div>
</div>	

<!-- 페이징 템플릿 -->
<div id="templetePaging" class="d-none">
 <button value="" onclick="reloadOnlineConsultingList(shared_isReply,shared_sortby,searchCategory.value,searchContents.value, this.value)" type="button" id="pagingNumber" class="btn btn-outline-dark"></button>
</div>	


<!-- 모달 템플릿 -->
<div id="templeteModal" class="d-none">


	<!-- Button trigger modal -->

	
	<!-- Modal -->


</div>
																											
									

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>