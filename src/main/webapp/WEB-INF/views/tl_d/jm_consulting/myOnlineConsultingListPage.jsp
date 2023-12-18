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



	function reloadMyOnlineConsultingList(isReply){
		
		const url = "./reloadMyOnlineConsultingList?isReply=" + isReply;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const myOnlineConsultingList = document.getElementById("myOnlineConsultingList");
			myOnlineConsultingList.innerHTML ="";
			myOnlineConsultingList.innerText ="";
			myOnlineConsultingList.classList.add("col");
			
			//아직 상담목록 없으면
			if(response.data.length==0){
				
				const myOnlineConsultingList = document.querySelector("#myOnlineConsultingList"); 
				const spanElement = document.createElement('span');
	
				myOnlineConsultingList.classList.add('text-center','py-3');
				spanElement.classList.add('fw-bold');

				spanElement.innerText ="아직 상담목록이 없습니다."
				
				myOnlineConsultingList.appendChild(spanElement);
				return;
				
			}
			
			//CSR - 클아이언트 사이드 렌더링
				//복사할곳을 찾아놓음, id명 myOnlineCounsultiList를 위치로잡음 
			//for문돌기전 초기화
			for(e of response.data){

				
				//각각의 값 배치				
				//템플릿 복사함 #templete의 listWrapper를 찾음 그리고 복사(cloneNode)
				const listWrapper = document.querySelector("#templete .listWrapper").cloneNode(true);
				
				
				
				//게시글번호 + 링크
				const listPk = listWrapper.querySelector(".listPk");
				//listPk.innerText = e.onlineConsultingDto.on_consulting_pk;
				
				// 새로운 a 엘리먼트를 생성합니다.
				const linkElement = document.createElement('a');
				
				// 링크의 href 속성을 설정합니다. e.onlineConsultingDto.on_consulting_pk를 사용합니다.
				linkElement.href = './myOnlineConsultingPage?on_consulting_pk=' + e.onlineConsultingDto.on_consulting_pk;
				
				// 텍스트 내용을 설정합니다.
				linkElement.innerText = e.onlineConsultingDto.on_consulting_pk;
				
				// 기존 내용을 지우고 새로운 a 엘리먼트를 추가합니다.
				listPk.innerHTML = ''; // 또는 listPk.textContent = ''; 으로 사용할 수 있습니다.
				listPk.appendChild(linkElement);

				
				//날짜
				const listDate = listWrapper.querySelector(".listDate");
				//날짜 추가사항
				const date = new Date(e.onlineConsultingDto.created_at);
				listDate.innerText = date.getFullYear() +"." + (date.getMonth() + 1) + "." + date.getDate();
				
				//답변여부			
				const listISReply = listWrapper.querySelector(".listISReply");
				const badgeElement = document.createElement('span');
				
				// staffInfoDto가 null이면 "미답변", 그렇지 않으면 "답변완료"로 텍스트를 설정합니다.
				badgeElement.innerText = e.staffInfoDto === null ? '미답변' : '답변완료';
				
				// 필요한 클래스를 추가합니다.
				badgeElement.classList.add('badge', e.staffInfoDto === null ? 'text-bg-danger' : 'text-bg-primary');
				
				// 기존 내용을 지우고 새로운 span 엘리먼트를 추가합니다.
				listISReply.innerHTML = '';
				listISReply.appendChild(badgeElement);
				
				
				//스태프이름
				const listStaffName = listWrapper.querySelector(".listStaffName");
				if(e.staffInfoDto==null){
					listStaffName.innerText = "";
					
					}
				else{
					listStaffName.innerText = e.staffInfoDto.name;				
					}				
				
				
				
				
				//복사한걸 붙임
				//위에서 선언한 변수 myOnlineConsultingList의 자식에 listWrapper를 박음
				myOnlineConsultingList.appendChild(listWrapper);

			}
					
		}); //리로드 함수끝
				
	}


//우선실행
window.addEventListener("DOMContentLoaded", () => {
	reloadMyOnlineConsultingList();

	
	
});
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
				<div class="col-2">
					<jsp:include page="../common/staffMenu.jsp"></jsp:include>
				</div>			
				<div class="col-1 border-start"></div>					
				<div class="col">
					<%--
					<div class="row my-5">
						<div class="col fw-bold" style="font-size:1.2em;">
							내 온라인 상담 내역
						</div>
					</div>
					 --%>
					
					<div class="row mt-4 py-2 border-bottom border-top" >
					
						<div class="col-8 fw-bold" style="font-size:1.4em;">
							 내 온라인 상담내역   							 																					
						</div>
	
						<div class="col-4">
						
													
								<div class="row">								
														
									<div class="col">									
										<select class="form-select" aria-label="Default select example" onchange="reloadMyOnlineConsultingList(this.value)">
										  <option value="all" ${isReply == 'all' ? 'checked' : null }>전체</option>
										  <option value="Reply" ${isReply == 'Reply' ? 'checked' : null }>답변</option>
										  <option value="unReply" ${isReply == 'unReply' ? 'checked' : null }>미답변</option>										  
										</select>										
									</div>
																
								</div>
								
						</div>					
	
								
					</div><!-- 검색창까지 -->
					
					<div class="row border mt-4">
						<div class="col">
							<div class="row fw-bold border-bottom bg-light border-2">
								<div class="col py-2 border-end">
								글번호
								</div>
								<div class="col py-2  border-end">
								문의 날짜
								</div>
								<div class="col py-2  border-end">
								답변 여부
								</div>
								<div class="col py-2 ">
								교직원 이름
								</div>
							</div>
							
							<%--포문위치 --%>							
							<div class="row">
								<div id="myOnlineConsultingList" class="col">
			
								</div>
							</div>							

								 
								 
							
							
						</div>
					</div><!-- 게시판끝 -->
					
					<div class="row mt-5" >
					
						<div class="col-2 ps-0">
						<a href="./hopeJobConsultingPage"><button type="button" class="btn btn-primary">목록으로</button></a>
						</div>
						
					
						<div class="col d-flex justify-content-center">
							<div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
							  <div class="btn-group" role="group" aria-label="First group">
							    <button type="button" class="btn btn-primary">&lt;</button>
							    <button type="button" class="btn btn-primary">1</button>
							    <button type="button" class="btn btn-primary">미</button>
							    <button type="button" class="btn btn-primary">구</button>
							    <button type="button" class="btn btn-primary">현</button>
							    <button type="button" class="btn btn-primary">5</button>
							    <button type="button" class="btn btn-primary">></button>
							  </div>
							</div>	
						</div>	
						
						<div class="col-2">
						
						</div>		
					</div>
					
				
					
				</div>
				<div class="col-2"></div>
			</div>
		</div>
	</div><!-- 첫로우 -->
	
	


</div><!-- 컨테이너 -->


<%-- 리스트용 템플릿 --%>
<div id ="templete" class="d-none">
	<div class="listWrapper row">
		<div class="listPk col py-2 border-end border-bottom">
			게시글번호
		</div>
		<div class="listDate col py-2 border-end border-bottom">
			날짜값
		</div>
		<div class="listISReply col py-2 border-end border-bottom">
			답변여부
		</div>
		<div class="listStaffName col py-2 border-bottom">
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