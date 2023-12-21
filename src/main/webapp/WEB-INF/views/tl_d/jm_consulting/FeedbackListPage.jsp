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
var shared_sortHJFScore;


	function reloadlist(sortHJFScore){
				

		url = "./FeedbackList?sortHJFScore=" + sortHJFScore ;
		
		fetch(url)
		.then(response => response.json())
		.then(response =>{
			
			//붙일곳 소환
			const listOutput = document.querySelector("#listOutput");
			console.log(response,"eee");
			//예외처리

			
			listOutput.innerHTML="";
			listOutput.innerText="";
			for(e of response.data){
				//템플릿 소환
				const listWrapper = document.querySelector("#listTemplete .listWrapper").cloneNode(true);
				
				
				const list_pk = listWrapper.querySelector(".list_pk");
				const list_pk_value = e.hopeJobFeedbackDto.hope_job_feedback_pk;
				list_pk.innerText = list_pk_value;
				
				const list_name = listWrapper.querySelector(".list_name");
				const list_name_value = e.studentInfoDto.name;
				list_name.innerText = list_name_value;
				
				const list_score = listWrapper.querySelector(".list_score");
				const list_score_value = e.hopeJobFeedbackDto.hjf_score;
				list_score.innerText = list_score_value;
				
				const list_date = listWrapper.querySelector(".list_date");
				const date = new Date(e.hopeJobFeedbackDto.created_at);
				list_date.innerText = date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate();
				
				
				//모달
				
				const iconElement = document.createElement('i');
				iconElement.classList.add('bi','bi-info-lg');
				const modal_link_button = listWrapper.querySelector(".modal_link_button");
				modal_link_button.classList.add('btn','btn-light');
				modal_link_button.value = e.hopeJobFeedbackDto.hope_job_feedback_pk;
				modal_link_button.appendChild(iconElement);
				listOutput.appendChild(listWrapper);
				}
							
			});	
			


			
		}
		
		
	
	
	//모달 눌렀을때
	function detailFeedback(hjf_pk){
		
		url = "./detailFeedback?hjf_pk=" + hjf_pk ;
		
		fetch(url)
		.then(response => response.json())
		.then(response =>{
			
			var e = response.data;
			const modal_link = document.querySelector("#modal_link");
			const detail_feedback_date = modal_link.querySelector(".detail_feedback_date");
			const detail_feedback_pk = modal_link.querySelector(".detail_feedback_pk");
			const detail_feedback_name = modal_link.querySelector(".detail_feedback_name");
			const detail_feedback_score = modal_link.querySelector(".detail_feedback_score");
			const detail_feedback_comment = modal_link.querySelector(".detail_feedback_comment");
			

			
			
			const date = new Date(e.hopeJobFeedbackDto.created_at);
			detail_feedback_date.innerText = date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate();
			
			detail_feedback_pk.innerText = e.hopeJobFeedbackDto.hope_job_feedback_pk ;
			detail_feedback_name.innerText = e.studentInfoDto.name ;
			detail_feedback_score.innerText = e.hopeJobFeedbackDto.hjf_score ;
			detail_feedback_comment.innerText = e.hopeJobFeedbackDto.hjf_comment ;
			
			
		});
							
				
		
	}
		
	
	window.addEventListener("DOMContentLoaded", () => {
		reloadlist(shared_sortHJFScore);
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
				<div class="col ps-3" style="font-size:0.8em;">
					<div class="row">
						<div class="col-1"></div>
						<div class="col">
							<div class="row mb-2 mt-5 border-bottom border-3 border-bs-border pb-3 mb-3 fw-bold fs-4">
								<div class="col fw-bold">
									학생 만족도 조사 리스트
								</div>
							</div>
							<div class=" border-secondary-subtle row mt-5 border py-3" style="font-size:1.1em;">

								<div class="col pe-0" style="text-align:start">
									<c:choose>
										<c:when test="${avgScore==null }">
											평균 평점 <span class="fw-bold text-danger">- 점</span>
										</c:when>
										
										<c:otherwise>
											평균 평점 <span class="fw-bold text-danger">${avgScore}점</span>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col"></div>
								<div class="col-7">
									<div class="row">
										<div class="col-6"></div>
										<div class="col">
											<input onclick="reloadlist(this.value)" type="radio" name="sortHJFScore" value="sortLow"${sortHJFScore == 'sortLow' ? 'checked' : null }>&nbsp;평점 낮은순
										</div>
										<div class="col"> 
											<input onclick="reloadlist(this.value)" type="radio" name="sortHJFScore" value="sortHigh" ${sortHJFScore == 'sortHigh' ? 'checked' : null }>&nbsp;평점 높은순
										</div>															
									</div>
								</div>																		
							</div>
							
							<div class="row mt-5 pb-0" style="font-size:1.2em;">
								<div class="col">
									<div class="row border-bottom border-2 border-secondary fw-bold py-2 text-center">
										<div class="col">
											만족도조사 번호			
										</div>
										<div class="col">
											학생 이름			
										</div>
										<div class="col">
											점수			
										</div>
										<div class="col">
											설문일			
										</div>
										<div class="col">
											설문 내용
										</div>																															
									</div>
									
									<div class="row">
										<div id="listOutput" class="col"><%--여기에 복붙 --%>
										
										
										
										</div>
									</div>
		
																	
								</div>
							</div>	
							
							<div class="row mt-4">
								<div class="col text-end">
									<a class="navbar-brand" href="../common/staffMainPage">
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

<%-- 리스트 템플릿 --%>
<div id="listTemplete" class="d-none">

			<div class="row listWrapper d-flex align-items-center border-bottom border-secondary-subtle">
				<div class="col list_pk py-2 text-center fw-bold">

				</div>
				<div class="col list_name py-2 text-center">
					
				</div>
				<div class="col list_score py-2 text-center">
					
				</div>
				<div class="col list_date py-2 text-center">
					
				</div>
				<div class="col list_link py-2 text-center">
					<!-- Button trigger modal -->
					<button value="" onclick="detailFeedback(this.value);" type="button" class="btn btn-primary modal_link_button" data-bs-toggle="modal" data-bs-target="#modal_link">
					  
					</button>
					
					<!-- Modal -->
					<div class="modal fade modal_link" id="modal_link" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">설문 내용</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body detail_feedback">
					        
							<div class="row">
								<div class="col">				
									<div class="row" style="font-size:1.2em;">
										<div class="col fw-bold">
											만족도 조사 답변
											
										</div>		
										<div class="col text-right detail_feedback_date" style="font-size:0.7em; text-align:right">
										</div>										
									</div>
									<div class="row mt-3">
										<div class="col-3 fw-bold my-2 border-end">
											응답 번호
										</div>	
										<div class="col-9 detail_feedback_pk">
											${detailHJFInfo.hopeJobFeedbackDto.hope_job_feedback_pk }
										</div>																		
									</div>
									<div class="row">
										<div class="col-3 fw-bold my-2 border-end">
											이름
										</div>	
										<div class="col-9 detail_feedback_name">
											${detailHJFInfo.studentInfoDto.name }
										</div>												
									</div>
									<div class="row">
										<div class="col-3 fw-bold my-2 border-end">
											점수
										</div>	
										<div class="col-9 detail_feedback_score">
											${detailHJFInfo.hopeJobFeedbackDto.hjf_score }
										</div>												
									</div>
									<div class="row mt-5">
										<div class="col">
											<div class="row fw-bold py-2 border-bottom text-start">
												<div class="col ms-3">
													기타사항
												</div>
											</div>
											<div class="row mt-3">
												<div class="col ms-3 detail_feedback_comment text-start">
													<textarea rows="20" cols="55"></textarea>
												</div>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>