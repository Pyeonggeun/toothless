<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   


    <div class="col-2 p-0 border-end">
            <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-1" aria-expanded="false" aria-controls="flush-collapseOne">
                        <i class="ms-3 fs-5 bi bi-hourglass-bottom"></i> &nbsp; 이전년도 조회
                    </button>
                  </h2>
                  <div id="flush-1" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body d-grid p-0">
                    	<!-- 이전년도 반복문 돌곳 -->
                        <div class="row ps-5 ms-1">
                        	<div class="col-2 btn-group dropend">
							  <button type="button" class="btn text-start" data-bs-toggle="dropdown" aria-expanded="false">
							    2021
							  </button>
							  <ul class="dropdown-menu">
							    <li><a class="dropdown-item text-center" href="#">1학기</a></li>
							    <li><a class="dropdown-item text-center" href="#">여름학기</a></li>
							    <li><a class="dropdown-item text-center" href="#">2학기</a></li>
							    <li><a class="dropdown-item text-center" href="#">겨울학기</a></li>
							  </ul>
							</div>
                        </div>
                        <div class="row ps-5 ms-1">
                        	<div class="col-2 btn-group dropend">
							  <button type="button" class="btn text-start" data-bs-toggle="dropdown" aria-expanded="false">
							    2022
							  </button>
							  <ul class="dropdown-menu">
							    <li><a class="dropdown-item text-center" href="#">1학기</a></li>
							    <li><a class="dropdown-item text-center" href="#">여름학기</a></li>
							    <li><a class="dropdown-item text-center" href="#">2학기</a></li>
							    <li><a class="dropdown-item text-center" href="#">겨울학기</a></li>
							  </ul>
							</div>
                        </div>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-2" aria-expanded="false" aria-controls="flush-collapseTwo">
                        <i class="ms-3 fs-5 bi bi-buildings"></i> &nbsp; 기숙사 관리
                    </button>
                  </h2>
                  <div id="flush-2" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body d-grid p-0">
                        <div class="row ps-5 ms-1 my-2">
                            <a class="btn text-start my-1" href="#" role="button">1학기</a>
                            <a class="btn text-start my-1" href="#" role="button">여름학기</a>
                            <a class="btn text-start my-1" href="#" role="button">2학기</a>
                            <a class="btn text-start my-1" href="#" role="button">겨울학기</a>
                        </div>
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
                            <a class="btn text-start my-1" href="#" role="button">학년도 추가</a>
                            <a class="btn text-start my-1" href="#" role="button">학기 추가</a>
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
                            <i class="bi bi-box-arrow-up-right" style="font-size: 0.7rem;"></i></li>
                        <li class="my-2" style="font-size: 0.8rem;">대학정보공시
                            <i class="bi bi-box-arrow-up-right" style="font-size: 0.7rem;"></i></li>
                        <li class="my-2" style="font-size: 0.8rem;">뭐라도 넣겠찌?
                            <i class="bi bi-box-arrow-up-right" style="font-size: 0.7rem;"></i></li>
                    </ul>
                </div>
            </div>
            <div class="row mt-3 ps-2">
                <div class="col">
                    <ul style="list-style: none;">
                        <li class="my-2 text-body-secondary" style="font-size: 0.7rem;">기타서비스</li>
                        <li class="my-2" style="font-size: 0.8rem;">모바일 앱 다운로드
                            <i class="bi bi-box-arrow-up-right" style="font-size: 0.7rem;"></i></li>
                        <li class="my-2" style="font-size: 0.8rem;">그림그림뭐라도넣겠지</li>
                    </ul>
                </div>
            </div>

            <pre>
               
            </pre>

		</div>