<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    
    <script>
    
    function reloadExecutiveManagementList(){
    	
    	const url = "./restExecutiveManagementList";
    	
    	fetch(url)
    	.then(response => response.json())
    	.then(response => {
    		
    		const managementDormStudentListBox = document.getElementById("managementDormStudentListBox");
    		const listTitleBar = document.getElementById("listTitleBar");
    		managementDormStudentListBox.innerHTML = "";
    		managementDormStudentListBox.appendChild(listTitleBar);
    		for(e of response.data){
    			
    			const managementDormStudentListWrapper = document.querySelector("#managementDormStudentTemplete .managementDormStudentListWrapper").cloneNode(true);
    			
    			const studentNameSpace = managementDormStudentListWrapper.querySelector(".studentNameSpace");
    			studentNameSpace.innerText = e.studentInfoDto.name;
    			
    			const buildingNameSpace = managementDormStudentListWrapper.querySelector(".buildingNameSpace");
    			buildingNameSpace.innerText = e.dormBuildingDto.name;
    			
    			const roomNameSpace = managementDormStudentListWrapper.querySelector(".roomNameSpace");
    			roomNameSpace.innerText = e.dormRoomDto.room_name;
    			
   				const absenceSpace = managementDormStudentListWrapper.querySelector(".absenceSpace");
   				absenceSpace.classList.add("d-grid")
   				
				const button = document.createElement('button');
				button.type = "button";
				button.classList.add("fw-bold", "rounded-0", "btn", "btn-sm", "mx-2");
				
    			if(e.checkCallAbsence == 0){
    				button.innerText = "불참"
   					button.classList.add("btn-danger");
   					button.setAttribute("onclick", "registerCallAbsence("+e.executiveManagementDto.executive_management_pk+")");
   					absenceSpace.appendChild(button);
    			} else{
    				button.innerText = "불참 취소"
   					button.classList.add("btn-primary");
   					button.setAttribute("onclick", "deleteCallAbsence("+e.executiveManagementDto.executive_management_pk+")");
   					absenceSpace.appendChild(button);
    			}
    			
    			managementDormStudentListBox.appendChild(managementDormStudentListWrapper);
    			
    		}
    		
    	})
    	
    }
    
    function registerCallAbsence(executive_management_pk){
    	
    	const url = "./restRegisterCallAbsence?executive_management_pk=" + executive_management_pk;
    	const option = {
    			method: "post",
    			headers: {
    				"Content-Type": "application/x-www-form-urlencoded"
    			},
    			body: "executive_management_pk=" + executive_management_pk
    	}
    	
    	fetch(url, option)
    	.then(response => response.json())
    	.then(response => {
    		reloadExecutiveManagementList();
    	})
    	
    }
    
	function deleteCallAbsence(executive_management_pk){
    	
    	const url = "./restDeleteCallAbsence?executive_management_pk=" + executive_management_pk;
    	const option = {
    			method: "post",
    			headers: {
    				"Content-Type": "application/x-www-form-urlencoded"
    			},
    			body: "executive_management_pk=" + executive_management_pk
    	}
    	
    	fetch(url, option)
    	.then(response => response.json())
    	.then(response => {
    		reloadExecutiveManagementList();
    	})
    	
    }
    
    
    window.addEventListener("DOMContentLoaded", () => {
    	reloadExecutiveManagementList();
    })
    
    
    </script>
</head>
<body>
    <jsp:include page="../commons/student/topNavi.jsp"></jsp:include>
    <div class="row">
        <div class="col">
            <img src="../../resources/img/dormitory/studentMainLogo.jpg">
        </div>
    </div>


    <div class="container mt-3">
        <div class="row">
           <jsp:include page="../commons/student/leftButtons5.jsp"></jsp:include>
            <!-- 왼쪽 목차 끝 -->
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">점호 관리</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙사 커뮤니티 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;">점호 관리</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="row"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                    	<div class="row my-2 justify-content-end">
                    		<div class="col-2 py-3 fw-bold ">
                    			<span>담당임원</span>
                    		</div>
                    		<div class="col py-3 text-start" style="font-size: 1.0rem;">
                    			${sessionStudentInfo.name} <i class="bi bi-person-circle"> </i>
                    		</div>
                    	</div>
                        <div class="row my-3">
                        	<div class="col-2 fw-bold" style="font-size: 1.1rem;">
								<span>담당 사생 목록</span>
							</div>
                        </div>
                   		
                        <div class="row my-4 pb-5">
                        	<div class="col" id="managementDormStudentListBox">
								
							</div>
                        </div>
                        
                        <!-- 제목 -->
                        <div id="listTitleBar" class="row py-2 align-middle mb-0 text-center border border-bottom-1 border-start-0 border-top-1 border-end-0 text-white" style="background-color: #8C7430;">
              				<div class="col fw-bold border border-bottom-0 border-start-0 border-top-0 border-end-1">이름</div>
              				<div class="col fw-bold border border-bottom-0 border-start-0 border-top-0 border-end-1">기숙사명</div>
              				<div class="col fw-bold border border-bottom-0 border-start-0 border-top-0 border-end-1">호</div>
              				<div class="col-2 fw-bold">불참 여부</div>
              			</div>
                        
                        <!-- 반복문 rest -->
                        <div id="managementDormStudentTemplete" class="d-none">
	                        <div class="managementDormStudentListWrapper row border-bottom py-2 text-center">
	                        	<div class="studentNameSpace col border border-bottom-0 border-start-0 border-top-0 border-end-1 pt-1">이름나오는곳</div>
	                        	<div class="buildingNameSpace col border border-bottom-0 border-start-0 border-top-0 border-end-1 text-center pt-1">기숙사명나오는곳</div>
	                        	<div class="roomNameSpace col border border-bottom-0 border-start-0 border-top-0 border-end-1 text-center pt-1">호나오는곳</div>
	                        	<div class="absenceSpace col-2"></div>
	                        </div>
                        </div>
                        
                        
                    </div>
                    
                    
                    
                    
            	</div>
              </div>
                <!-- 공고 끝 -->
            </div>
        </div>
        

<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>

   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>