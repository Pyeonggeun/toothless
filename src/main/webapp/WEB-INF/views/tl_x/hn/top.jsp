<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row sticky-top">
	<div class="col">
	    <div class="row">
	        <div class="col py-1" style="background-color: #f7f7f9;">
	            <div class="row" style="margin-left: 10.5%; margin-right: 10.5%;">
	                <div class="col">
	                    <img class="img-fluid" src="../../resources/img/lifeStudent/header_top_logo.png">
	                </div>
	                <div class="col d-grid justify-content-end">
	                    <button onclick="logout()" class="btn text-white bg-black rounded-pill fw-bold py-0 px-3" style="font-size: 0.75em;">로그아웃</button>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col bg-white py-2">
	            <div class="row" style="margin-left: 10.5%; margin-right: 10.5%;">
	                <div onclick="goMainPage()" class="col-auto pe-1" style="cursor: pointer;">
	                    <img class="img-fluid" src="../../resources/img/lifeStudent/logo_black.png" style="height: 3.7em;">
	                </div>
	                <div onclick="goMainPage()" class="mkmk col ps-0 my-auto" style="font-size: 2em; font-weight: 600; cursor: pointer;">
	                    MK<span style="color: #4a3187;">평생교육원</span>
	                </div>
	                <div class="col-3 my-auto fw-semibold" style="font-size: 1.3em;">
	                    <div class="row">
	                        <div class="col text-end pe-0">
	                            <a onclick="goApplyPage()" class="link-underline link-underline-opacity-0 text-black text-opacity-75" href="#">수강신청</a>
	                        </div>
	                        <div class="col text-end ps-0">
	                            <a onclick="goMyPage()" class="link-underline link-underline-opacity-0" href="#" style="color: #7844ae;">
	                                <i class="fa-solid fa-graduation-cap" style="font-size: 1.2em; color: #f7a505;"></i><span class="ps-1">나의 강의실</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>