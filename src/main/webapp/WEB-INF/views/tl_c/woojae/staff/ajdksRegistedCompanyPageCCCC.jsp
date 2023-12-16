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
<title> AJDKS TEMPLATE FOR STAFF </title>
<style>
	/*교직원좌측메뉴바설정*/
	.staffleftmenubar input {
	    display: none;
	}
	
	.staffleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.staffleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.staffleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.staffleftmenubar input + label + .content {
	    display: none;
	}
	
	.staffleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

</style>

<script>
	
	
	
	
	// 카테고리 리스트 체크박스
	
	function companyCategoryList(){
		
		const url = "./companyCategoryList";
		
		fetch(url)
		.then(response => response.json())
		.then(response =>{
			
			const catBox = document.getElementById("catBox");
			
			for(e of response.data){
				// 체크박스 생성
                const checkBox = document.createElement("input");
                checkBox.setAttribute("type", "checkbox");
                checkBox.classList.add("sType");
                checkBox.setAttribute("value", e.company_category_pk);
                catBox.appendChild(checkBox);
                
                // span 같은거
                const textNode = document.createTextNode(e.company_category_name + " ");
                catBox.appendChild(textNode);

                console.log(e.company_category_pk);
                console.log(catBox);
			}
			
			
		});
		
	}
	
	// 전체리스트
	function registedCompanyList(){
		
		const url = "./registedCompanyList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const companyListBox = document.getElementById("companyListBox");
			
			for(e of response.data){
				
				const companyListWrapper = document.querySelector("#templete .companyListWrapper").cloneNode(true);
				
				const companyPk = companyListWrapper.querySelector(".companyPk");
				companyPk.innerText = e.ajdksCompanyInfoDto.company_pk;
				
				const companyCategoryName = companyListWrapper.querySelector(".companyCategoryName");
				companyCategoryName.innerText = e.ajdksCompanyCategoryDto.company_category_name;
				
				const companyName = companyListWrapper.querySelector(".companyName");
				companyName.innerText = e.ajdksCompanyInfoDto.company_name;
				
				const ceoName = companyListWrapper.querySelector(".ceoName");
				ceoName.innerText = e.ajdksCompanyInfoDto.ceo_name;
				
				const compamyAddress = companyListWrapper.querySelector(".compamyAddress");
				compamyAddress.innerText = e.ajdksCompanyInfoDto.address;
				
				const companyPhone = companyListWrapper.querySelector(".companyPhone");
				companyPhone.innerText = e.ajdksCompanyInfoDto.phone;
				
				companyListBox.appendChild(companyListWrapper);
			}
			
		});
	}
	
	
	
	
	// 카테고리 + 검색 리스트
	function categorizedCompanyList(searchType, searchWord){
		
		
		const searchWordValue = document.getElementById("searchWord").value;
		console.log(searchWordValue);
		
		const checkBoxv = checkbox.value;
		console.log(checkBoxv);
		
		const sType = document.querySelector(".sType");
		const sTypeValue = sType.value;
		console.log(sTypeValue);
		
		const url = "./categorizedCompanyList?searchType=" + sTypeValue + "&searchWord=" + searchWordValue;
		
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			
			
			const companyListBox = document.getElementById("companyListBox");
			
			for(e of response.data){
				
				const companyListWrapper = document.querySelector("#templete .companyListWrapper").cloneNode(true);
				
				const companyPk = companyListWrapper.querySelector(".companyPk");
				companyPk.innerText = e.company_pk;
				
				const companyCategoryName = companyListWrapper.querySelector(".companyCategoryName");
				companyCategoryName.innerText = e.company_category_name;
				
				const companyName = companyListWrapper.querySelector(".companyName");
				companyName.innerText = e.company_name;
				
				const ceoName = companyListWrapper.querySelector(".ceoName");
				ceoName.innerText = e.ceo_name;
				
				const compamyAddress = companyListWrapper.querySelector(".compamyAddress");
				compamyAddress.innerText = e.address;
				
				const companyPhone = companyListWrapper.querySelector(".companyPhone");
				companyPhone.innerText = e.phone;
				
				companyListBox.appendChild(companyListWrapper);
				
				
			}
			
		});
	}
	
	
	
	
	
	
	
	window.addEventListener("DOMContentLoaded", () =>{
		companyCategoryList();
		registedCompanyList();
	})



</script>
</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<div class="row">
	<div class="col">
		<jsp:include page="../../common/ajdksHighestMenubarForStaff.jsp"></jsp:include>
	</div>
</div>
<div class="row">

	<!-- 좌측메뉴바 -->
	<jsp:include page="../../common/ajdksSideMenubarForStaff.jsp"></jsp:include>
	
	<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
	<div class="col">
		<div class="row">
			<div class="col mx-4">
			
			<!-- 본문작성공간 -->
				<div class="row mt-5">
					<div class="col fw-bold">
						산업체 등록 내역
					</div>
				</div>
				<div class="row mt-3">
					<div class="col border border-2"></div>
				</div>
				<form action="./ajdksRegistedCompanyPageCCCC" method="get">
				<div class="row mt-5">
					<div id="catBox" class="col mt-2">
						<%-- <c:forEach items="${categoryList}" var="CL"> --%>
							 <!-- <input name="searchType" type="checkbox"> -->
						<%-- </c:forEach> --%>
					</div>
					<div class="col-4">
						<input id="searchWord" type="text" class="form-control">
					</div>
					<div class="col-1 d-grid">
						<button onclick="categorizedCompanyList(catBox, this.value)" class="btn btn-secondary">검색</button>
					</div>
					<div class="col-1"></div>
				</div>
				</form>
				<div class="row mt-4">
					<div class="col border border-1 border-dark"></div>
				</div>
				<div class="row mt-3 pb-3 border-bottom border-2 text-center fw-bold" style="font-size: 0.9em;">
					<div class="col-1">No</div>
					<div class="col-2">카테고리</div>
					<div class="col-2">업체명</div>
					<div class="col-1">대표</div>
					<div class="col">주소</div>
					<div class="col-2">전화번호</div>
				</div>
				<div class="row mt-1">
					<div id="companyListBox" class="col"></div>
				</div>
				<%-- <c:choose>
					<c:when test="${empty catSearch}">
						<c:forEach items="${registedCompanyList}" var="cList">
							 <div class="row mt-3 pb-3 border-1 text-center">
						 		<div class="col-1">${cList.ajdksCompanyInfoDto.company_pk}</div>
								<div class="col-2">${cList.ajdksCompanyCategoryDto.company_category_name}</div>
								<div class="col-2">${cList.ajdksCompanyInfoDto.company_name}</div>
								<div class="col-1">${cList.ajdksCompanyInfoDto.ceo_name}</div>
								<div class="col">${cList.ajdksCompanyInfoDto.address}</div>
								<div class="col-2">${cList.ajdksCompanyInfoDto.phone}</div>
							 </div>
							 <div class="row mt-1">
								<div id="companyListBox" class="col border-bottom border-secondary-subtle"></div>
							</div>
						</c:forEach> 
					</c:when>
					<c:otherwise>
						<c:forEach items="${catSearch}" var="cs">
							 <div class="row mt-3 pb-3 border-1 text-center">
						 		<div class="col-1">${cs.COMPANY_PK}</div>
								<div class="col-2">${cs.COMPANY_CATEGORY_NAME}</div>
								<div class="col-2">${cs.COMPANY_NAME}</div>
								<div class="col-1">${cs.CEO_NAME}</div>
								<div class="col">${cs.ADDRESS}</div>
								<div class="col-2">${cs.PHONE}</div>
							 </div>
							 <div class="row mt-1">
								<div id="companyListBox" class="col border-bottom border-secondary-subtle"></div>
							</div>
						</c:forEach> 
					</c:otherwise>
				</c:choose> --%>
					
				<div class="row mt-2">
					<div class="col"></div>
					<div class="col-1">
						<a class="btn btn-secondary" href="./ajdksStaffMainPage">메인</a>
					</div>
				</div>
				
						 
		
				
			</div>
		</div>
	</div>
	
</div>

</div><!-- 전체 container 출구 -->
				
			<!-- 체크박스 리스트 -->
			<div class="row">
				<div class="col"></div>
			</div>				
				
				
				
				<div id="templete" class="d-none">
					<div class="companyListWrapper row">
						<div class="col">
							<div class="row mt-3 text-center" style="font-size: 0.8em;">
								<div class="companyPk col-1">ㄹ먀ㅐㄷㄹ매ㅑㅗ래ㅑㅁㄷ졸</div>
								<div class="companyCategoryName col-2">ㅁ랴더ㅑㅁ러댜ㅓㄹ</div>
								<div class="companyName col-2">ㄹ매댜저래ㅑ덜</div>
								<div class="ceoName col-1">이름 나오는 공간</div>
								<div class="compamyAddress col">주소...</div>
								<div class="companyPhone col-2">ㄹ댜댜댜더ㅓ러</div>
							</div>
							<div class="row mt-3">
								<div class="col border border-secondary-subtle"></div>
							</div>
						</div>
					</div>
				</div> 


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>

<%--
	<c:if test="${!empty sessionStaffInfo}">
	
	</c:if>
 --%>