<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      

    <div class="col-2 p-0 border-end">
            <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button onclick="location.href='./mainPage'" class="accordion-button collapsed" type="button">
                        <i class="ms-3 fs-4 bi bi-house"></i> &nbsp; 홈
                    </button>
                  </h2>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-1" aria-expanded="false" aria-controls="flush-collapseOne">
                        <i class="ms-3 fs-4 bi bi-book"></i> &nbsp; 교육과정 관리
                    </button>
                  </h2>
                  <div id="flush-1" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body d-grid p-0">
                        <div class="row ps-5 ms-1 my-2">
                            <a class="btn text-start my-1" href="./manageLecturePage" role="button">신규 교육과정 등록</a>
                            <a class="btn text-start my-1" href="./manageLecturePage2" role="button">교육과정 조회/수정</a>
                        </div>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-2" aria-expanded="false" aria-controls="flush-collapseTwo">
                        <i class="ms-3 fs-4 bi bi-journals"></i> &nbsp; 강의 관리
                    </button>
                  </h2>
                  <div id="flush-2" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                      <div class="accordion-body d-grid p-0">
                        <div class="row ps-5 ms-1 my-2">
                            <a class="btn text-start my-1" href="./manageOpenLecturePage" role="button">신규 강의 개설</a>
                            <a class="btn text-start my-1" href="./manageOpenLecturePage2" role="button">강의 조회/수정</a>
                        </div>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-3" aria-expanded="false" aria-controls="flush-collapseThree">
                        <i class="ms-3 fs-4 bi bi-person-vcard"></i> &nbsp; 강사 관리
                    </button>
                  </h2>
                  <div id="flush-3" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body d-grid p-0">
                        <div class="row ps-5 ms-1 my-2">
                            <a class="btn text-start my-1" href="./manageTeacherPage" role="button">신규 강사 등록</a>
                            <a class="btn text-start my-1" href="./manageTeacherPage2" role="button">강사 정보 조회/수정</a>
                        </div>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header">
                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-4" aria-expanded="false" aria-controls="flush-collapseThree">
                        <i class="ms-3 fs-4 bi bi-person"></i> &nbsp; 학생 관리
                      </button>
                    </h2>
                    <div id="flush-4" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body d-grid p-0">
                            <div class="row ps-5 ms-1 my-2">
                                <a class="btn text-start my-1" href="./manageStudentPage" role="button">신규 학생 등록</a>
                                <a class="btn text-start my-1" href="./manageStudentPage2" role="button">학생 정보 조회/수정</a>
                            </div>
                        </div>
                    </div>
                  </div>
                  <!-- 아코디언 끝 -->
            </div>
            
            <pre>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            </pre>
            
            <div class="row mt-5 ps-2">
                <div class="col">
                    <ul style="list-style: none;">
                        <li class="my-2 text-body-secondary" style="font-size: 0.7rem;">관련사이트</li>
                        
                        <li class="my-2" style="font-size: 0.8rem;">
                            <a href="../../another/staff/loginPage" class="text-black" style="text-decoration: none;">
                            MK대학교 포털 로그인<i class="bi bi-box-arrow-up-right" style="font-size: 0.7rem;"></i></a></li>
                        <li class="my-2" style="font-size: 0.8rem;">
                        	 <a href="../hn/mainPage" class="text-black" style="text-decoration: none;">
                        	평생교육원 메인포털<i class="bi bi-box-arrow-up-right" style="font-size: 0.7rem;"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="row mt-3 ps-2">
                <div class="col">
                    <ul style="list-style: none;">
                        <li class="my-2 text-body-secondary" style="font-size: 0.7rem;">기타서비스</li>
                        <li class="my-2" style="font-size: 0.8rem;">모바일 앱 다운로드
                            <i class="bi bi-box-arrow-up-right" style="font-size: 0.7rem;"></i></li>
                    </ul>
                </div>
            </div>
			 
            <pre>
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
               
            </pre>

		</div>