<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

    <div class="col-2 p-0 border-end">
            <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-1" aria-expanded="false" aria-controls="flush-collapseOne">
                        <i class="ms-3 fs-5  bi bi-building-add"></i> &nbsp; 기숙사 정보 등록
                    </button>
                  </h2>
                  <div id="flush-1" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body d-grid p-0">
                        <div class="row ps-5 ms-1 my-2">
                        	<div class="col">
							    <a href="./sj_registerDormInfo"  style="text-decoration: none;" class="text-black">
	                        	<button type="button" class="btn text-start">
	                        		동 정보
								</button>
                        		</a>	
							</div>
                        </div>
                         <div class="row ps-5 ms-1 my-2">
                        	<div class="col">
							    <a href="./sj_registerRoomInfo"  style="text-decoration: none;" class="text-black">
	                        	<button type="button" class="btn text-start">
	                        		호 정보
								</button>
                        		</a>	
							</div>
                        </div>
                        <div class="row ps-5 ms-1 my-2">
                        	<div class="col">
							    <a href="./sj_registerRoomImages"  style="text-decoration: none;" class="text-black">
	                        	<button type="button" class="btn text-start">
	                        		호실별 이미지 정보
								</button>
                        		</a>	
							</div>
                        </div>
                    </div>
                  </div>
                </div>
                <div class="accordion-item">
                  <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-2" aria-expanded="false" aria-controls="flush-collapseTwo">
						<i class="ms-3 fs-5 bi bi-gear-fill"></i> &nbsp; 기숙사 정보 관리
                    </button>
                  </h2>
                  <div id="flush-2" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                    <div class="accordion-body d-grid p-0">
                        <div class="row ps-5 ms-1 my-2">
                        	<div class="col">
							    <a href="./sj_manageDormInfo"  style="text-decoration: none;" class="text-black">
	                        	<button type="button" class="btn text-start">
	                        		동 정보
								</button>
                        		</a>	
							</div>
                        </div>
                         <div class="row ps-5 ms-1 my-2">
                        	<div class="col">
							    <a href="./sj_manageRoomInfo"  style="text-decoration: none;" class="text-black">
	                        	<button type="button" class="btn text-start">
	                        		호 정보
								</button>
                        		</a>	
							</div>
                        </div>
                        <div class="row ps-5 ms-1 my-2">
                        	<div class="col">
							    <a href="./sj_manageRoomImages"  style="text-decoration: none;" class="text-black">
	                        	<button type="button" class="btn text-start">
	                        		호실별 이미지 정보
								</button>
                        		</a>	
							</div>
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