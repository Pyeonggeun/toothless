<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
                            <img src="../resources/img/another/logo_black.png" alt="" style="height: 4em;">
                        </div>
                        <div class="col-3 ps-0 fw-bold fs-1 text-start ">
                            MK University<span class="fs-6"> | </span> <span class="fs-5">학생포털사이트</span> 
                        </div>
                        <div class="col-2"></div>
                        <div class="col-1 border-end border-secondary text-end text-secondary mt-5" style="font-size: small">
                            포털이용안내
                        </div>
                        <div class="col-1 text-start text-secondary mt-5 "style="font-size: small">
                            로그아웃
                        </div>
                    </div>
                </div>
            </div>
            <div class="row text-center py-1 fw-bold text-light" style="background-color: #133369">
                <div class="col-2"></div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./mainpage">현장실습 지원 센터</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./mainpage">취업<i class="bi bi-dot"></i>창업 지원 센터</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="../tl_e/commons/staffCounselMainPage">상담 센터</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./mainpage">생활관 관리 센터</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="../tl_b_views/common/studentMainPage">보건 센터</a>
                </div>
                <div class="col-3">    
                    <form class="d-flex ps-5" role="search">
                        <input class="form-control me-2 py-0" type="search" placeholder="검색어 입력" aria-label="Search">
                        <button class="btn btn-outline-light py-0" type="submit">Search</button>
                    </form>    
                </div>
                <div class="col-1"></div>
            </div>
             <div class="row mt-5">
                <div class="col ms-5">
                    <div class="row">
                        <form action="./studentRegisterProcess" method="get" >
                            <div class="col border border-2 align-self-center py-3 px-3 text-end">
                                <div class="row">
                                    <div class="col fs-3 fw-bold text-center">
                                        학생 등록
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-3 fw-bold ">
                                        학과명:
                                    </div>
                                    <div class="col">
                                        <select name="department_pk" class="form-select form-select-sm border-black" aria-label=".form-select-sm example">
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
                                        <select name="professor_pk" class="form-select form-select-sm border-black" aria-label=".form-select-sm example">
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
                                        <input class="form-control border-black py-0" name="student_id" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        PW:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="password" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        이름:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="name" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        학년:
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control border-black py-0" name="semester_count" type="number" min="1" max="4"> 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        평균 학점:
                                    </div>
                                    <div class="col-4">
                                        <input class="form-control border-black py-0" name="scoreAVG" type="number" step="0.5" min="0" max="4.5"> 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        주민번호:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="resident_id" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        생년월일: 
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="birth" type="date" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        성별: 
                                    </div>
                                    <div class="col text-center">
                                        <input name="gender" type="radio" value="M"> 남  
                                    </div>
                                    <div class="col text-center">
                                        <input name="gender" type="radio" value="F"> 여
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        주소:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="address" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        전화번호:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="phone" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        e-mail:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="email" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-5">
                                    <div class="col-3 fw-bold">
                                        졸업여부:
                                    </div>
                                    <div class="col text-start">
                                        <input name="graduation" type="checkbox" value="1" ><span class="text-danger"> *</span> 필요한 경우만  체크
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-2"></div>
                                    <div class="col">
                                        <button class="btn btn-primary form-control">등록</button>
                                    </div>
                                    <div class="col-2"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <form action="./staffRegisterProcess">
                            <div class="col border border-2 align-self-center py-3 px-3 text-end">
                                <div class="row">
                                    <div class="col fs-3 fw-bold text-center">
                                        교직원 등록
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-3 fw-bold ">
                                        센터명:
                                    </div>
                                    <div class="col">
                                          <select name="center_pk" class="form-select form-select-sm border-black" aria-label=".form-select-sm example">
                                                <option selected>직책 선택</option>
                                                <c:forEach items="${listMap.centerList }" var="center">
                                      	          	<option value="${center.center_pk }">${center.position}</option>
                                                </c:forEach>
                                         </select>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        ID(사번): 
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="staff_id" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        PW:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="password" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        이름:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="name" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        주민번호:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="resident_id" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        생년월일: 
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="birth" type="date" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        성별: 
                                    </div>
                                    <div class="col text-center">
                                        <input name="gender" type="radio" value="M"> 남  
                                    </div>
                                    <div class="col text-center">
                                        <input name="gender" type="radio" value="F"> 여
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        주소:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="address" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        전화번호:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="phone" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        e-mail:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="email" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-2"></div>
                                    <div class="col">
                                        <button class="btn btn-primary form-control">등록</button>
                                    </div>
                                    <div class="col-2"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col me-5">
                    <div class="row">
                        <form action="./professorRegisterProcess">
                            <div class="col border border-2 align-self-center py-3 px-3 text-end">
                                <div class="row">
                                    <div class="col fs-3 fw-bold text-center">
                                        교수 등록
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-3 fw-bold ">
                                        학과명:
                                    </div>
                                    <div class="col">
                                         <select name="department_pk" class="form-select form-select-sm border-black" aria-label=".form-select-sm example">
                                               <option selected>학과 선택</option>
                                                <c:forEach items="${listMap.departmentList }" var="department">
                                      	          	<option value="${department.department_pk }">${department.name}</option>
                                                </c:forEach>
                                         </select>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        ID(사번): 
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="professor_id" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        PW:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="password" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        이름:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="name" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        주민번호:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="resident_id" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        생년월일: 
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="birth" type="date" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        성별: 
                                    </div>
                                    <div class="col text-center">
                                        <input name="gender" type="radio" value="M"> 남  
                                    </div>
                                    <div class="col text-center">
                                        <input name="gender" type="radio" value="F"> 여
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        주소:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="address" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        전화번호:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="phone" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3 fw-bold">
                                        e-mail:
                                    </div>
                                    <div class="col">
                                        <input class="form-control border-black py-0" name="email" type="text" > 
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-2"></div>
                                    <div class="col">
                                        <button class="btn btn-primary form-control">등록</button>
                                    </div>
                                    <div class="col-2"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>