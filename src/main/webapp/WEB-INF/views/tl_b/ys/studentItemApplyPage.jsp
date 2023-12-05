<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row mb-3">
		    <div class="col">
		        <div class="row">
		            <div class="col py-2 fw-bold text-white" style="background-color: #014195">
		                <a href="../common/studentMainPage" class="link-underline link-underline-opacity-0 link-dark">
		                	<img class="img-fluid" src="../../resources/img/another/logo_black.png" style="width: 4%;">
		                </a>	
		                	<span style="font-size: 1em; word-spacing: -0.25em">MK University</span>&nbsp;|<span style="font-size: 1em"> 보건센터</span>&nbsp;|<span style="font-size: 1em"> 물품목록</span>&nbsp;|<span style="font-size: 1em"> 물품신청</span>    
		               
	            	</div>
	        	</div>
	    	</div>
		</div>
		<div class="row mt-5 mb-5" style="margin-left: 16%; margin-right: 16%;">
			<div class="col text-primary" style="font-size: x-large;">
				<span>보건소물품신청</span>
			</div>
		</div>
		<div class="row mt-1 mb-5" style="margin-left: 16%; margin-right: 16%;">
			<div class="col">
				<div class="row mt-2">
					<div class="col">
						<form action="./studentItemApplyProcess" method="get">
						<div class="row mt-2 ms-2 me-1 border-1" style="background-color: #DEF4F5; border-style: solid; border-color: #454545;">
				            <input type="hidden" name="student_pk" value=${sessionStudentInfo.student_pk }>
				            <input type="hidden" name="item_pk" value=${getItem.item_pk }>
				            <div class="col">
				                <div class="row mt-4 me-0">
				                    <div class="col-2"></div>  
				                    <div class="col-1 ps-1 pe-0 fw-bold">대여사유</div>
				                    <div class="col-4 ps-4">
				                        <input name="reason" type="text">
				                    </div>
				                    <div class="col-2"></div>
				                </div>
				                <div class="row mt-3 mb-3">
				                    <div class="col-2"></div>
				                    <div class="col-1 ps-1 pe-0 fw-bold">
				                        <span>대여기간</span>
				                    </div>
				                    <div class="col ps-4 pe-5">
				                       	<input name="rental_date" type="date">&nbsp;~
				                        <input name="return_date" type="date">
				                    </div>
				                    <div class="col-1"></div>
				                </div>
				            </div>
				        </div>
				        <div class="row mt-2">
						     <div class="col-11"></div>
						     <div class="col ps-4">
						         <input type="submit" value="등록">
						     </div>
						 </div>
				        </form>
					</div>
				</div>
			</div>
        </div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>