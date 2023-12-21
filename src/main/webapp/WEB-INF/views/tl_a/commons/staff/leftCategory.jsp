<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

	<script>
	
		// 기숙사 관리 탭(등록된 학기정보들만 나오게)
		function manageThisSemester() {

			const thisSemesterListBox = document.getElementById("thisSemesterListBox");
			thisSemesterListBox.innerHTML = "";
			const semesterTemplate = document.querySelector(".semesterTemplate");

			fetch("./getThisYearAllSemester")
			    .then(response => response.json())
			    .then(response => {
			        const thisYearSemesterList = response.data.thisYearSemesterList;

			        for (e of thisYearSemesterList) {
			         
			            const semesterButton = semesterTemplate.cloneNode(true);
			            semesterButton.classList.remove("d-none");
			            semesterButton.innerText = e.SEME; // 각 학기의 이름 설정
			            
			            if(e.STATE == 'Y'){
			            	semesterButton.href = "./mj_readApplyDormInfoPage";
			            }else{
			            	semesterButton.href = "./mj_readBeforeInfoPage";
			            }
			            

			            thisSemesterListBox.appendChild(semesterButton);
			        }
			    });
		}
		
		// **** 추후 수정... 아래 대충해놓음
		// 이전년도 조회 탭(등록된 학기정보들만 나오게)
		function readBeforeYearInfo() {
			
			location.href = "./mj_readBeforeInfoPage"	

	        const beforeYearListBox = document.querySelector("#beforeYearListBox");
	        beforeYearListBox.innerHTML = "";
	
		        fetch("./getBeforeYearAllSemester")
		            .then(response => response.json())
		            .then(response => {
		            	const beforeYears = response.data.beforeYearList;
	
		            	for (e of beforeYears) {
		            	    const beforeYearWrapper = document.querySelector(".beforeYearWrapper").cloneNode(true);
		            	    beforeYearWrapper.querySelector(".yearTemplate").innerText = e.YEARS;
	
		            	    beforeYearListBox.appendChild(beforeYearWrapper); 
		                }
	            });
	    }
		
		
	
	</script>

   		 <div class="col-2 p-0 border-end">
            <div class="accordion accordion-flush" id="accordionFlushExample">
            	<div class="accordion-item">
                  <h2 class="accordion-header">
                    <button onclick="location.href='./mj_mainPage'" class="accordion-button collapsed" type="button">
                        <i class="ms-3 fs-4 bi bi-house"></i> &nbsp; 홈
                    </button>
                  </h2>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button onclick="readBeforeYearInfo()" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-1" aria-expanded="false" aria-controls="flush-collapseOne">
                        <i class="ms-3 fs-5 bi bi-hourglass-bottom"></i> &nbsp; 이전년도 조회
                    </button>
                  </h2>
                  <div id="flush-1" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                    <div id="beforeYearListBox" class="accordion-body d-grid p-0">
                    	<!-- 이전년도 반복문 돌곳 -->
                    	
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button onclick="manageThisSemester()" class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-2" aria-expanded="false" aria-controls="flush-collapseTwo">
                        <i class="ms-3 fs-5 bi bi-buildings"></i> &nbsp; 기숙사 관리
                    </button>
                  </h2>
                  <div id="flush-2" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                    <div id="thisSemesterListBox" class="accordion-body d-grid p-0">
                        <!-- 학기 반복문 돌곳 -->
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-3" aria-expanded="false" aria-controls="flush-collapseThree">
						<i class="ms-3 fs-5 bi bi-calendar-check"></i>  &nbsp; 단위기간 관리
                    </button>
                  </h2>
                  <div id="flush-3" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body d-grid p-0">
                        <div class="row ps-5 ms-1 my-2">
                            <a class="btn text-start my-1" href="./mj_manageYearPage" role="button">학년도/학기 관리</a>
                            <a class="btn text-start my-1" href="./mj_registerYearPage" role="button">학년도/학기 추가</a>
                        </div>
                    </div>
                  </div>
                </div>
            </div>
            <div class="row mt-5 ps-2">
                <div class="col">
                    <ul style="list-style: none;">
                        <li class="my-2 text-body-secondary" style="font-size: 0.7rem;">관련사이트</li>
                        <li class="my-2" style="font-size: 0.8rem;">기숙사 홈페이지
                           <a href="../student/jw_mainPage" class="navbar-brand"> <i class="bi bi-box-arrow-up-right ps-1" style="font-size: 0.7rem;" ></i></a>
                        </li>
                        <li class="my-2" style="font-size: 0.8rem;">대학메인 포털 로그인
                            <a href="../../another/student/loginPage" class="navbar-brand"><i class="bi bi-box-arrow-up-right ps-1" style="font-size: 0.7rem;"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row mt-3 ps-2">
                <div class="col">
                    <ul style="list-style: none;">
                        <li class="my-2 text-body-secondary" style="font-size: 0.7rem;">기타서비스</li>
                        <li class="my-2" style="font-size: 0.8rem;">모바일 앱 다운로드
                            <i class="bi bi-box-arrow-up-right ps-1" style="font-size: 0.7rem;"></i>
                        </li>
                    </ul>
                </div>
            </div>

            <pre>
               
            </pre>

		</div>
		
		<!-- 이전년도 조회 템플릿 -->
		<div id="listContainer" class="d-none">
		    <div class="beforeYearWrapper row ps-5 ms-1">
		        <div class="col-2 btn-group dropend">
		            <button type="button" class="btn text-start" data-bs-toggle="dropdown" aria-expanded="false">
		                <span class="yearTemplate">2021</span>
		            </button>
		            
		          <!--   <ul class="dropdown-menu">
		                <li><a class="dropdown-item text-center" href="#">1학기</a></li>
		                <li><a class="dropdown-item text-center" href="#">여름학기</a></li>
		                <li><a class="dropdown-item text-center" href="#">2학기</a></li>
		                <li><a class="dropdown-item text-center" href="#">겨울학기</a></li>
		            </ul> -->
		            
		        </div>
		    </div>
		</div> 
		
		<!-- 이번학기 템플릿 -->
		<div id="thisSemesterList" class="d-none row ms-1 my-2">
        	<a class="semesterTemplate btn text-start ps-5 ms-4 my-1" href="#" role="button">1학기</a>
      	</div>
		