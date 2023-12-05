<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <script>
        	function checkStudentId(){
        		
        		const inputStudentIdValue = document.querySelector("#inputStudentId").value;
        		const url = "./existsStudentId?student_id="+inputStudentIdValue;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then((response) => {
        			
        			if(response.data == true){
        				const studentIdResultBox = document.getElementById("studentIdResultBox");
        				studentIdResultBox.innerText = "이미 존재하는 아이디입니다.";
        				studentIdResultBox.style.color = "red";
        				
        			}else{
        				const studentIdResultBox = document.getElementById("studentIdResultBox");
        				studentIdResultBox.innerText = "사용가능한 아이디입니다.";
        				studentIdResultBox.style.color = "green";
        			}
        		});
        	
        	}
			function checkStaffId(){
        		
        		const inputStaffIdValue = document.querySelector("#inputStaffId").value;
        		const url = "./existsStaffId?staff_id="+inputStaffIdValue;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then((response) => {
        			
        			if(response.data == true){
        				const staffIdResultBox = document.getElementById("staffIdResultBox");
        				staffIdResultBox.innerText = "이미 존재하는 아이디입니다.";
        				staffIdResultBox.style.color = "red";
        				
        			}else{
        				const staffIdResultBox = document.getElementById("staffIdResultBox");
        				staffIdResultBox.innerText = "사용가능한 아이디입니다.";
        				staffIdResultBox.style.color = "green";
        			}
        		});
        	
        	}
			
			function checkProfessorId(){
        		
        		const inputProfessorIdValue = document.querySelector("#inputProfessorId").value;
        		const url = "./existsProfessorId?professor_id="+inputProfessorIdValue;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then((response) => {
        			
        			if(response.data == true){
        				const professorIdResultBox = document.getElementById("professorIdResultBox");
        				professorIdResultBox.innerText = "이미 존재하는 아이디입니다.";
        				professorIdResultBox.style.color = "red";
        				
        			}else{
        				const professorIdResultBox = document.getElementById("professorIdResultBox");
        				professorIdResultBox.innerText = "사용가능한 아이디입니다.";
        				professorIdResultBox.style.color = "green";
        			}
        		});
        	
        	}
			
			
            function reloadStudentList(){
            	
                const url = "./getStudentInfoList?pageNum="+pageNum;
                fetch(url)
                .then(response => response.json())
                .then((response) => {
                    for(e of response.data){
                        const studentListBox = document.getElementById("studentListBox");

                        const studentListWrapper = document.querySelector("#templete .studentListWrapper").cloneNode(true);
                    
                        const student_id = studentListWrapper.querySelector(".student_id");
                        student_id.innerText = e.studentInfoDto.student_id;

                        const student_name = studentListWrapper.querySelector(".student_name");
                        student_name.innerText = e.studentInfoDto.name;

                        const student_department = studentListWrapper.querySelector(".student_department");
                        student_department.innerText = e.departmentName;

                        const student_studentYear = studentListWrapper.querySelector(".student_studentYear");
                        student_studentYear.innerText = e.studentYear;

                        const student_professorName = studentListWrapper.querySelector(".student_professorName");
                        student_professorName.innerText = e.professorInfoDto.name;
						
                        studentListBox.appendChild(studentListWrapper);

                    }
                    const loaded = document.querySelector("#loaded");
                    if(loaded != null){
                    	loaded.remove();	
                    }
                	
                    	
                });
            }
          
          
          
            window.onscroll = () => {
                if (window.innerHeight + window.scrollY >= document.body.offsetHeight) {
                    pageNumb += 1;
                    console.log(pageNumb);
                    reloadStudentList();
                }
            };
            
            
            
            function showStudentInsertModal() {
            	
            	const modal = bootstrap.Modal.getOrCreateInstance("#insertStudentModal");
            	
            	
            	
            	modal.show();	
			}
            function hideStudentInsertModal() {
            	const modal = bootstrap.Modal.getOrCreateInstance("#insertStudentModal");
                modal.hide();
			}
            function insertStudent(){
            
            	const inputDepartmentPk = document.querySelector("#inputDepartmentPk");
            	const inputProfessorPk = document.querySelector("#inputProfessorPk");
                const inputStudentId = document.querySelector("#inputStudentId");
            	const inputPassword = document.querySelector("#inputPassword");
                const inputName = document.querySelector("#inputName");
                const inputSemesterCount = document.querySelector("#inputSemesterCount");
                const inputScoreAVG = document.querySelector("#inputScoreAVG");
                const inputResidentId = document.querySelector("#inputResidentId");
                const inpiutBirth = document.querySelector("#inpiutBirth");
                const inputAddress = document.querySelector("#inputAddress");
                const inputPhone = document.querySelector("#inputPhone");
                const inputEmail = document.querySelector("#inputEmail");
                const inputGraduation = document.querySelector('#graduationCheckbox');
                const inputGraduationValue = inputGraduation.checked;
            	const inputGender = document.querySelector('input[name="inputGender"]:checked');
            	
            	
                const url = "./studentRegisterProcess";
            	fetch(url, {
            		method: "post",
            		headers: {
            			"Content-Type": "application/x-www-form-urlencoded"
            		},
            		body: "department_pk="+inputDepartmentPk.value+"&professor_pk="+inputProfessorPk.value
                        +"&student_id="+inputStudentId.value+"&password="+inputPassword.value+"&name="+inputName.value
                        +"&semester_count="+inputSemesterCount.value+"&scoreAVG="+inputScoreAVG.value
                        +"&resident_id="+inputResidentId.value+"&birth="+inpiutBirth.value+"&address="+inputAddress.value
                        +"&phone="+inputPhone.value+"&email="+inputEmail.value+"&graduation="+inputGraduationValue
                        +"&gender="+inputGender.value
            	})
                .then(response => response.json())
                .then((response) =>{
                	//이전 html 초기화
                	const studentListBox = document.getElementById("studentListBox");
                    studentListBox.innerHTML = "";
                    reloadStudentList();
                    //모달 창 초기화
                    inputDepartmentPk.value="";
                    inputProfessorPk.value="";
                    inputStudentId.value="";
                    inputPassword.value="";
                    inputName.value="";
                    inputScoreAVG.value="";
                    inputSemesterCount.value="";
                    inputResidentId.value="";
                    inpiutBirth.value="";
                    inputAddress.value="";
                    inputPhone.value="";
                    inputEmail.value="";
                    inputGraduation.value="";
                    inputGender.value="";
                    const studentIdResultBox = document.getElementById("studentIdResultBox");
                    studentIdResultBox.innerText = "";
                    uncheckedBox();
                    
                    hideStudentInsertModal();
                    
                    
                })
                ;
            }
            function uncheckedBox() {
                var obj = document.getElementsByClassName('checkbox');
         
                for (var i = 0; i < obj.length; i++) {
                    obj[i].checked = false;
                }
            }
            
            
            
            


            window.addEventListener("DOMContentLoaded", () =>{
                reloadStudentList();
            })
            ;
			
            
        
        
        
        </script>
        
        
        
        
        <style>
             @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;800&family=Roboto+Mono:wght@700&display=swap');
            .body{
                font-family: 'Noto Sans KR', sans-serif;
                font-family: 'Roboto Mono', monospace;
            }
            .bg-main{
                background-color: #133369;
            }
            .text-main{
                color: rgb(0, 0, 255);
            }
            .fs-s{
                font-size: small;
            }
            .fs-xs{
                font-size: x-small;
            }
            .bg-gray{
                background-color: rgb(241, 240, 237);
            }
            .border-main{
                border-color: #133369;
            }

        </style>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <div class="row text-center">
                        <div class="col-4"></div>
                        <div class="col-1 pe-2 text-end">
                            <img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
                        </div>
                        <div class="col-3 ps-0 fw-bold fs-1 text-start ">
                            MK University<span class="fs-6"> | </span> <span class="fs-5">학생포털사이트</span> 
                        </div>
                        <div class="col-2"></div>
                        <div class="col-1 border-end border-secondary text-end text-secondary mt-5" style="font-size: small">
                            포털이용안내
                        </div>
                        <div class="col-1 text-start text-secondary mt-5 "style="font-size: small">
                            <a class="navbar-brand" href="./logoutProcess">로그아웃</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row text-center py-1 fw-bold text-light" style="background-color: #133369">
                <div class="col-2"></div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./anotherStudentManagerPage">학생 정보 관리</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./anotherMainPage">교직원 정보 관리</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./anotherMainPage">교수 정보 관리</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./anotherMainPage">외부 사용자 등록 현황</a>
                </div>
                <div class="col-3">    
                    <form class="d-flex ps-5" role="search">
                        <input class="form-control me-2 py-0" type="search" placeholder="검색어 입력" aria-label="Search">
                        <button class="btn btn-outline-light py-0" type="submit">Search</button>
                    </form>    
                </div>
                <div class="col-1"></div>
            </div>
            <div class="row mt-5 fs-3 text-center fw-bold">
                <div class="col">
                    학생 정보
                </div>
            </div>
            <div class="row mt-3 ">
                <div class="col-2"></div>
            	<div class="col">
            		<div class="row fw-bold border-bottom border-black">
            			<div class="col">
            				학번
            			</div>
            			<div class="col">
            				이름
            			</div>
            			<div class="col">
            				학과 
            			</div>
            			<div class="col">
            				학년
            			</div>
            			<div class="col">
            				지도교수 
            			</div>
            		</div>
            	</div>
                <div class="col-2"></div>
            </div>
           <div class="row mt-3">
                <div id="studentListBox" class="col text-center">
					<div id="loaded"class="spinner-border text-primary" role="status">
 						 <span class="visually-hidden">Loading...</span>
					</div>
                </div>
           </div>
           <div class="row">
           		<div class="col-2"></div>
           		<div id="loading"class="col text-end">
           			<input onclick="showStudentInsertModal()" type="button" class="btn btn-primary" value ="등록하기">
           		</div>
           		<div class="col-2"></div>
           		
           </div>
 				<pre>
      
           	
           	
           	
           	
           	
           	
           	
           	
           	
           	
           	
           	
           	
           	
           	
           	
           	
           	</pre>
        </div>

        <div id="templete" class="d-none">
            <div class="row studentListWrapper">
                <div class="col-2"></div>
                <div class="col">
                    <div class="row mt-2 border-bottom">
                        <div  class="col student_id">
                            학번
                        </div>
                        <div class="col student_name">
                            이름
                        </div>
                        <div class="col student_department">
                            학과 
                        </div>
                        <div class="col student_studentYear">
                            학년
                        </div>
                        <div class="col student_professorName">
                            지도교수 
                        </div>
                    </div>
                </div>
                <div class="col-2"></div>
            </div>
           
        </div>
        
        <div id="insertStudentModal" class="modal" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title fw-bold fs-3">학생 등록</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                 	<div class="col border border-2 align-self-center py-3 px-3 text-end">
                        <div class="row mt-3">
                            <div class="col-3 fw-bold">
                                학과명:
                            </div>
                            <div class="col">
                                <select id="inputDepartmentPk" class="form-select form-select-sm border-black" aria-label=".form-select-sm example">
                                        <option selected>학과 선택</option>
                                        <c:forEach items="${listMap.departmentList }" var="department">
                              	          	<option value="${department.department_pk }">${department.name}</option>
                                        </c:forEach>
                                 </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-3 fw-bold">
                                지도교수:
                            </div>
                            <div class="col">
                                <select id="inputProfessorPk" class="form-select form-select-sm border-black" aria-label=".form-select-sm example">
                                    <option selected>지도교수 선택</option>
                                    <c:forEach items="${listMap.professorList }" var="professor">
                              	          	<option value="${professor.professor_pk }">${professor.name}</option>
                                        </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-3 fw-bold">
                                ID(학번): 
                            </div>
                            <div class="col">
                                <input id="inputStudentId" onblur="checkStudentId()" class="form-control border-black py-0" type="text" > 
                            </div>
                        </div>
                        <div class="row" >
                        	<div id="studentIdResultBox" class="col"></div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-3 fw-bold">
                                PW:
                            </div>
                            <div class="col">
                                <input id="inputPassword" class="form-control border-black py-0" type="text" > 
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-3 fw-bold">
                                이름:
                            </div>
                            <div class="col">
                                <input class="form-control border-black py-0" id="inputName" type="text" > 
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-3 fw-bold">
                                학년:
                            </div>
                            <div class="col-4">
                                <input class="form-control border-black py-0" id="inputSemesterCount" type="number" min="1" max="4"> 
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-3 fw-bold">
                                평균 학점:
                            </div>
                            <div class="col-4">
                                <input class="form-control border-black py-0" id="inputScoreAVG" type="number" step="0.5" min="0" max="4.5"> 
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-3 fw-bold">
                                주민번호:
                            </div>
                            <div class="col">
                                <input class="form-control border-black py-0" id="inputResidentId" type="text" > 
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-3 fw-bold">
                                생년월일: 
                            </div>
                            <div class="col">
                                <input class="form-control border-black py-0" id="inpiutBirth" type="date" > 
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-3 fw-bold">
                                성별: 
                            </div>
                            <div class="col text-center">
                                <input class="checkbox" name="inputGender" type="radio" value="M"> 남  
                            </div>
                            <div class="col text-center">
                                <input class="checkbox" name="inputGender" type="radio" value="F"> 여
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-3 fw-bold">
                                주소:
                            </div>
                            <div class="col">
                                <input class="form-control border-black py-0" id="inputAddress" type="text" > 
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-3 fw-bold">
                                전화번호:
                            </div>
                            <div class="col">
                                <input class="form-control border-black py-0" id="inputPhone" type="text" > 
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-3 fw-bold">
                                e-mail:
                            </div>
                            <div class="col">
                                <input class="form-control border-black py-0" id="inputEmail" type="text" > 
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col-3 fw-bold">
                                졸업여부:
                            </div>
                            <div class="col text-start">
                                <input class="checkbox" id="graduationCheckbox" type="checkbox" value="off"><span class="text-danger"> *</span> 필요한 경우만  체크
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                  <button onclick="insertStudent()" type="button" class="btn btn-primary">저장하기</button>
                </div>
              </div>
            </div>
        </div>

        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>