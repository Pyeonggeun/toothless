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

//일단 var로 선언, 무조건 "all"로가보자
var isReply = "all"



	function myOnlineConsultingList(){
		
		const url = "./reloadMyOnlineConsultingList?isReply="+ isReply;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			console.log(response);
			
			//CSR - 클아이언트 사이드 렌더링
			
			for(e of response.data){
				
				//복사할곳을 찾아놓음, id명 myOnlineCounsultiList를 위치로잡음 
				const myOnlineConsultingList = document.getElementById("myOnlineConsultingList");;
				
				
				//템플릿 복사함 #templete의 listWrapper를 찾음 그리고 복사(cloneNode)
				const listWrapper = document.querySelector("#templete .listWrapper").cloneNode(true);
				
				//각각의 값 배치
				
				//게시글번호
				const listPk = listWrapper.querySelector(".listPk");
				listPk.innerText = e.onlineConsultingDto.on_consulting_pk;
				//날짜
				const listDate = listWrapper.querySelector(".listDate");
				listDate.innerText = e.onlineConsultingDto.on_consulting_pk;
				//답변여부
				const listISReply = listWrapper.querySelector(".listISReply");
				listISReply.innerText = e.onlineConsultingDto.on_consulting_pk;
				//스태프이름
				const listStaffName = listWrapper.querySelector(".listStaffName");
				listStaffName.innerText = e.onlineConsultingDto.on_consulting_pk;
				
				
				//복사한걸 붙임
				myOnlineConsultingList.appendChild(listWrapper);
				<%--
				<div class="listPk col">
				게시글번호
			</div>
			<div class="listDate col">
				날짜값
			</div>
			<div class="listISReply col">
				답변여부
			</div>
			<div class="listStaffName col">
			--%>
			}
			

			
		});
		
		
	}

</script>






</head>
<body>
<div class="container">


	<div class="row">
		<div class="col">
			<div class="row">
				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			</div>			
		</div>
	</div>
	
	<div class="row">
		<div class="col">
			<div class="row">
				<div class="col-3">
					<jsp:include page="../common/staffMenu.jsp"></jsp:include>
				</div>								
				<div class="col">
					<div class="row my-5">
						<div class="col fw-bold" style="font-size:1.2em;">
							내 온라인 상담 내역
						</div>
					</div>
					
					<div class="row border-top mt-4 py-2" >
					
						<div class="col">
							    							 																					
						</div>
	
						<div class="col">
						
								<form action="myOnlineConsultingListPage" method="post">						
								<div class="row">								
									
									<div class="col-8">
									
									</div>
									<div class="col">									
										<select class="form-select" aria-label="Default select example">
										  <option value="all" ${isReply == 'all' ? 'checked' : null }>전체</option>
										  <option value="Reply" ${isReply == 'Reply' ? 'checked' : null }>답변</option>
										  <option value="unReply" ${isReply == 'unReply' ? 'checked' : null }>미답변</option>										  
										</select>										
									</div>
									
									
								
									<%--
									
									<div class="col px-1 mx-0 text-center" ">
										<input type="radio" name="isReply" value="all"
										${isReply == 'all' ? 'checked' : null }
										> 전체
									</div>										
								
									<div class="col px-1 mx-0 text-center">
										<input type="radio" name="isReply" value="Reply"
										${isReply == 'Reply' ? 'checked' : null }
										> 답변 완료
									</div>
									<div class="col px-1 mx-0 text-center">
										<input type="radio" name="isReply" value="unReply"
										${isReply == 'unReply' ? 'checked' : null }
										> 미답변
									</div>
									<div class="col" style="text-size:0.7em; width:0.8em;">
										<button type="submit" style="border:none; background:none; cursor:pointer;"><i class="bi bi-search"></i></button>
									</div>	
									 --%>								
								</div>
								</form>
						</div>					
	
								
					</div>
					
					<div class="row border-top">
						<div class="col">
							<div class="row">
								<div class="col">
								번호
								</div>
								<div class="col">
								날짜
								</div>
								<div class="col">
								답변여부
								</div>
								<div class="col">
								교직원이름
								</div>
							</div>
							
							<%--포문위치 --%>							
							<div class="row">
								<div id="myOnlineConsultingList" class="col">
			
								</div>
							</div>							
							<%--
								<table class="table" style="align-items:center; justify-content: center;">
								  <thead>
								    <tr class="table-info">
								      <th scope="col">번호
								      <th scope="col">날짜</th>
								      <th scope="col">답변여부</th>
								      <th scope="col">교직원이름</th>
								    </tr>
								  </thead>
								  
								  
								  <c:forEach items="${list}" var="e">
								  
								  
								  </c:forEach>
								  
								  <tbody id="listBox">
								  
								  
								  </tbody>
								
								<c:forEach items="${list}" var="e">  
								  <tbody>
								    <tr>								    
								      <th scope="row" class="py-4"><a href="./myOnlineConsultingPage?on_consulting_pk=${e.onlineConsultingDto.on_consulting_pk}" style="color:black; ext-decoration: none;">${e.onlineConsultingDto.on_consulting_pk}</a></th>
								      <td class="py-4"><a href="./myOnlineConsultingPage?on_consulting_pk=${e.onlineConsultingDto.on_consulting_pk}" style="color:black; ext-decoration: none;"><fmt:formatDate  value="${e.onlineConsultingDto.created_at}" pattern="yyyy-MM-dd"/></a></td>
								      <td>
										<c:choose>								
											<c:when test="${e.onlineConsultingReplyDto==null}">								
											<div class="col py-3">
												<span class="badge text-bg-danger ms-2"> 미답변 </span>
											</div>										
											</c:when>
										
											<c:otherwise>

											<div class="col py-3">
												<span class="badge text-bg-primary ms-2"> 답변등록</span>
											</div>								
											</c:otherwise>										
										</c:choose>	
									  </td>
									  <td>
										<c:choose>
											<c:when test="${e.onlineConsultingReplyDto==null}">
											<div class="col py-3">
												<span>미배정</span>												
											</div>		
											</c:when>
										
											<c:otherwise>
											<div class="col py-3">
												<span>${e.staffInfoDto.name}</span>												
											</div>		
											</c:otherwise>
										</c:choose>										
										</td>
								    </tr>
								  </tbody>
								   
						  
								  </c:forEach>
								  
								   
								   
								   
								   
								</table>								
								 --%>
								 
								 
							
							
						</div>
					</div>
					
					<div class="row">
						<div class="col">
							<a href="./hopeJobConsultingPage"><button type="button" class="btn btn-primary">목록으로</button></a>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	


</div>


<%-- 리스트용 템플릿 --%>
<div id ="templete" class="d-none">
	<div class="listWrapper row">
		<div class="listPk col">
			게시글번호
		</div>
		<div class="listDate col">
			날짜값
		</div>
		<div class="listISReply col">
			답변여부
		</div>
		<div class="listStaffName col">
			담당자
		</div>						
	</div>
</div>


<%--
<div id ="templete" class="d-none">
<!-- 절대 여기 밑엔 아이디 잡기  --!>

    <tr class="listWrapper">								    
      <th scope="row" class="on_consulting_pk py-4"><a href="./myOnlineConsultingPage?on_consulting_pk=${e.onlineConsultingDto.on_consulting_pk}" style="color:black; ext-decoration: none;">${e.onlineConsultingDto.on_consulting_pk}</a></th>
      <td class="created_at py-4"><a href="./myOnlineConsultingPage?on_consulting_pk=${e.onlineConsultingDto.on_consulting_pk}" style="color:black; ext-decoration: none;"><fmt:formatDate  value="${e.onlineConsultingDto.created_at}" pattern="yyyy-MM-dd"/></a></td>
      <td>
		<c:choose>								
			<c:when test="${e.onlineConsultingReplyDto==null}">								
			<div class="col py-3">
				<span class="badge text-bg-danger ms-2"> 미답변 </span>
			</div>										
			</c:when>
		
			<c:otherwise>

			<div class="col py-3">
				<span class="badge text-bg-primary ms-2"> 답변등록</span>
			</div>								
			</c:otherwise>										
		</c:choose>	
	  </td>
	  <td>
		<c:choose>
			<c:when test="${e.onlineConsultingReplyDto==null}">
			<div class="col py-3">
				<span>미배정</span>												
			</div>		
			</c:when>
		
			<c:otherwise>
			<div class="staffName col py-3">
				<span>${e.staffInfoDto.name}</span>												
			</div>		
			</c:otherwise>
		</c:choose>										
		</td>
    </tr>

</div>
 --%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>