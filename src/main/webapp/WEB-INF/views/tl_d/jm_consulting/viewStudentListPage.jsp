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
function reloadlist(){
	
	url='./viewStudentList'
	
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			for(e of response.data){
				
				//붙일곳
				const viewListLocation = document.querySelector("#viewListLocation");
				//불러오기
				const templeteWrapper = document.querySelector("#templeteWrapper").cloneNode(true);
				const list_pk = templeteWrapper.querySelector(".list_pk");
				const list_name = templeteWrapper.querySelector(".list_name");
				const list_id = templeteWrapper.querySelector(".list_id");
				
				//날짜
				const list_created_at = templeteWrapper.querySelector(".list_created_at");
				const date = new Date(e.hopeJobDto.created_at);
				list_created_at.innerText = date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate();
				
				
				const list_un_answered_reply = templeteWrapper.querySelector(".list_un_answered_reply");
				const list_student_info = templeteWrapper.querySelector(".list_student_info");
				
				list_pk.innerText = e.hopeJobDto.hope_job_pk;
				list_name.innerText = e.studentInfoDto.name;
				list_id.innerText = e.studentInfoDto.student_id;
				list_un_answered_reply.innerText = e.unAnsweredHJF + "건";
				
				

				list_student_info.innerHTML="";
		      	//링크이동
		      	const a_element = document.createElement('a');
		      	const button_element = document.createElement('button');
		      	a_element.href = "./viewDetailStudentInfoPage?hope_job_pk=" + e.hopeJobDto.hope_job_pk ;
		      	button_element.classList.add('btn-primary', 'btn');
		      	button_element.innerText = '이동';
		      	a_element.appendChild(button_element);
		      	list_student_info.appendChild(a_element);
		      	
		      	//붙이기
		      	viewListLocation.appendChild(templeteWrapper);
				
				
			};

		});
	
}

window.addEventListener("DOMContentLoaded", () => {
	reloadlist();
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
		<div class="col-2">
			<jsp:include page="../common/staffMenu.jsp"></jsp:include>
		</div>	
		<div class="col-1"></div>			
		<div class="col">

			<div class="row">
				<div class="col mb-2 mt-5 border-bottom border-3 border-bs-border pb-3 fw-bold fs-4">
					구직희망 학생 목록
				</div>
			</div>
			
			
			<div class="row border mt-5 py-2">

				<div class="col fw-bold">
					<div class="row">
						<div class="col">
							No.
						</div>
						<div class="col">
							학생 이름
						</div>
						<div class="col">
							학번
						</div>
						<div class="col">
							신청 날짜
						</div>
						<div class="col">
							미답변 온라인상담
						</div>	
						<div class="col">
							학생 정보
						</div>																			
					</div>
				</div>
		
			</div>
			<div class="row">
				<div id="viewListLocation" class="col">
					
				</div>
			</div>
																									
	
			<div class="row mt-2 ps-0">
				<div class="col ps-0">
					<a href="../common/staffMainPage"><button type="button" class="btn btn-primary">목록</button></a>
				</div>
			</div>	
		</div>
		<div class="col-2"></div>				

	</div>
	
	

	
</div>










<%-- 리스트 템플릿 --%>
<div id="listTemplete" class="d-none">
	<div id="templeteWrapper" class="row border">
		<div class="col">
			<div class="row py-2" style="display: flex; align-items: center; justify-content: center;">
				<div class="col border-end list_pk">No.</div>
				<div class="col border-end list_name">학생 이름</div>
				<div class="col border-end list_id">학번</div>
				<div class="col border-end list_created_at">신청 날짜</div>
				<div class="col border-end list_un_answered_reply">미답변 온라인상담</div>
				<div class="col border-end list_student_info"></div>
			</div>
		</div>
	
	</div>
</div>





							<%-- 
							<div class="row mt-5">
								<div class="col">
									<table class="table">
									  <thead class="border-black border-bottom-3">
									    <tr>
									      <th scope="col">No.</th>
									      <th scope="col">학생 이름</th>
									      <th scope="col">학번</th>
									      <th scope="col">신청 날짜</th>
									      <th scope="col">미답변 온라인상담</th>
									      <th scope="col">학생 정보</th>
									    </tr>
									  </thead>
									  <tbody>
									  	<c:forEach items="${hopeJobInfoList}" var="e">
									    <tr class="pt-3">
									      <th  class="pt-3" scope="row" style="align-items: center;">${e.hopeJobDto.hope_job_pk }</th>
									      <td class="pt-3" style="align-items: center;">${e.studentInfoDto.name }</td>
									      <td class="pt-3" style="align-items: center;">${e.studentInfoDto.student_id}</td>
									      <td  class="pt-3" style="align-items: center;"><fmt:formatDate value="${e.hopeJobDto.created_at }" pattern="yyyy-MM-dd"/></td>
									      <td  class="pt-3" style="align-items: center;"> ${e.unAnsweredHJF}건</td>
									      <td  class="pt-2" > 
									      <a  href="./viewDetailStudentInfoPage?hope_job_pk=${e.hopeJobDto.hope_job_pk}">
									    	<span style="height:50%; align-items: center; width:50%;"> <button  type="button" class=" btn btn-primary">이동</button></span>										
									      </a>
									      </td>
									     


									      
									    </tr>
									   
									    </c:forEach>
									 </tbody>
									</table>    							
								</div>
							</div>
							--%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>