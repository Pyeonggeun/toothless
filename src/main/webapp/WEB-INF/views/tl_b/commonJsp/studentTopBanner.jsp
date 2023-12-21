<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="row">
                <div class="col bg-white py-1">
                    <div class="row">
                        <div class="col text-end" style="font-size: 0.75em; margin-right: 12.2em">
                            <span id="studentName" class="fw-bold">태호띠</span> 님 | <a href="../../another/student/logoutProcess" class="link-underline link-underline-opacity-0 link-dark">로그아웃</a>
                        </div>
                    </div>
                </div>
            </div>
            <div onmouseleave="hideMenu()" class="row">
                <div class="col">
                    <div class="row">
                        <div class="col py-2 text-white" style="background-color: #133369;">
                            <div class="container">
                                <div class="row">
                                    <div onmouseover="showMenu()" class="col text-center fw-bold" style="font-size: 0.95em;">
                                        보건소 안내
                                    </div>
                                    <div onmouseover="showMenu()" class="col text-center fw-bold" style="font-size: 0.95em;">
                                        물품 신청
                                    </div>
                                    <div onmouseover="showMenu()" class="col text-center fw-bold" style="font-size: 0.95em;">
                                        교육 프로그램
                                    </div>
                                    <div onmouseover="showMenu()" class="col text-center fw-bold" style="font-size: 0.95em;">
                                        공지사항
                                    </div>
                                    <div onmouseover="showMenu()" class="col text-center fw-bold" style="font-size: 0.95em;">
                                        정보마당
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="menu" class="row d-none" style="position: absolute; width: 100%;">
                        <div class="col">
                            <div class="row">
                                <div class="col py-3" style="background-color: rgba(19, 51, 105, 0.9);">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col text-center fw-semibold" style="font-size: 0.9em;">
                                                <div class="row">
                                                    <div id="ys/healthCenterInfoPage" onclick="movePage(this)" onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1 text-white" style="cursor: pointer;">
                                                        보건소 소개
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div id="hs/healthCenterBossPage" onclick="movePage(this)" onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1 text-white" style="cursor: pointer;">
                                                        보건 센터장 인사말
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col text-center fw-semibold" style="font-size: 0.9em;">
                                                <div class="row">
                                                    <div id="ys/studentItemApplyInformationPage" onmouseover="color(this)" onclick="movePage(this)" onmouseout="removeColor(this)" class="col py-1 text-white" style="cursor: pointer;">
                                                    	물품신청 안내
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div id="ys/studentItemListPage" onmouseover="color(this)" onclick="movePage(this)" onmouseout="removeColor(this)" class="col py-1 text-white" style="cursor: pointer;">
                                                    	물품신청
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col text-center fw-semibold" style="font-size: 0.9em;">
                                            	<div class="row">
                                                    <div id="hs/eduMainPageForStudent" onclick="movePage(this)" onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1 text-white" style="cursor: pointer;">
                                                    	목록/신청
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div id="hs/eduMyPageForStudent" onclick="movePage(this)" onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1 text-white" style="cursor: pointer;">
                                                    	나의 신청/만족도 내역
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col text-center fw-semibold" style="font-size: 0.9em;">
                                            	<div class="row">
                                                    <div id="ty/studentBoardPage" onmouseover="color(this)" onclick="movePage(this)" onmouseout="removeColor(this)" class="col py-1 text-white" style="cursor: pointer;">
                                                    	공지사항
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col text-center fw-semibold" style="font-size: 0.9em;">
                                                <div class="row">
                                                    <div id="ys/informationForumPageOne" onclick="movePage(this)" onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1 text-white" style="cursor: pointer;">
                                                        고혈압
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div id="ys/informationForumPageTwo" onclick="movePage(this)" onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1 text-white" style="cursor: pointer;">
                                                        당뇨
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div id="ys/informationForumPageThree" onclick="movePage(this)" onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1 text-white" style="cursor: pointer;">
                                                        비만과 체중조절
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>