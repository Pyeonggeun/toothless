<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <div class="row">
                <div class="col bg-white pb-3">
                    <div class="container">
                        <div class="row">
                            <div class="col text-end" style="font-size: 0.75em;">
                                로그아웃
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div onmouseleave="hideMenu()" class="row">
                <div class="col">
                    <div class="row">
                        <div class="col py-1 text-white" style="background-color: #133369;">
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
                                    <div class="container text-white">
                                        <div class="row">
                                            <div class="col text-center fw-semibold" style="font-size: 0.9em;">
                                                <div class="row">
                                                    <div onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1">
                                                        보건소 소개
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1">오시는 길</div>
                                                </div>
                                            </div>
                                            <div class="col text-center fw-semibold" style="font-size: 0.9em;">
                                                <div class="row">
                                                    <div onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1">물품신청 안내</div>
                                                </div>
                                                <div class="row">
                                                    <div onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1">물품신청</div>
                                                </div>
                                            </div>
                                            <div class="col"></div>
                                            <div class="col"></div>
                                            <div class="col text-center fw-semibold" style="font-size: 0.9em;">
                                                <div class="row">
                                                    <div onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1">
                                                        고혈압
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1">
                                                        당뇨
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div onmouseover="color(this)" onmouseout="removeColor(this)" class="col py-1">
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