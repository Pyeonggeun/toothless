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
		<script>
		<%--
			function formSubmit(){
				const frm = document.getElementById("frm");
				const inputReason = document.getElementById("inputReason");
				
				if(inputReason.value == ''){
					alert("대여사유를 입력해주셔야 합니다.");
					inputReason.focus();
					return ;
				}
				
				if(inputRentalDate.value == ''){
					alert("대여시작일를 입력해주셔야 합니다.");
					inputRentalDate.focus();
					return ;
					
				}
				
				if(inputReturnDate.value == ''){
					alert("대여종료일를 입력해주셔야 합니다.");
					inputReturnDate.focus();
					return ;
					
				}
				
				frm.submit();
			}
		--%>
		
		function applyItem(){
			
			const inputStudentPk = document.getElementById("inputStudentPk");
			const studentPkValue = inputStudentPk.value;
			
			const inputItemPk = document.getElementById("inputItemPk");
			const itemPkValue = inputItemPk.value;
			
			const inputReason = document.getElementById("inputReason");
			const reasonValue = inputReason.value;
			
			const inputRentalDate = document.getElementById("inputRentalDate");
			const rentalDateValue = inputRentalDate.value;
			
			const inputReturnDate = document.getElementById("inputReturnDate");
			const returnDateValue = inputReturnDate.value;
			
			const url = "./reststudentItemApply"
		
			fetch(url,{
				method: "post",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				},
				body: "student_pk=" + studentPkValue + "&item_pk=" + itemPkValue + "&reason=" + reasonValue + "&rental_date=" + rentalDateValue + "&return_date=" + returnDateValue
			})
			.then(response => response.json())
			.then(response => {
				
				location.href="./studentItemListPage";
			})
			;
		}
		
		</script>
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
						<div class="row mt-2 ms-2 me-1 border-1" style="background-color: #DEF4F5; border-style: solid; border-color: #454545;">
				            <input type="hidden" id="inputStudentPk" value=${sessionStudentInfo.student_pk }>
				            <input type="hidden" id="inputItemPk" value=${getItem.item_pk }>
				            <div class="col">
				                <div class="row mt-4 me-0">
				                    <div class="col-2"></div>  
				                    <div class="col ps-1 pe-0 fw-bold">대여사유</div>
				                    <div class="col-4 ps-4">
				                        <input id="inputReason" type="text">
				                    </div>
				                    <div class="col-2"></div>
				                </div>
				                <div class="row mt-3 mb-3">
				                    <div class="col-2"></div>
				                    <div class="col-1 ps-1 pe-0 fw-bold">
				                        <span>대여기간</span>
				                    </div>
				                    <div class="col ps-4 pe-5">
				                       	<input id="inputRentalDate" type="date">&nbsp;~
				                        <input id="inputReturnDate" type="date">
				                    </div>
				                    <div class="col-1"></div>
				                </div>
				            </div>
				        </div>
				        <div class="row mt-2">
						     <div class="col-10"></div>
						     <div class="col ps-5 d-grid">
						         <button onclick="applyItem()" class="btn btn-primary">신청</button>
						     </div>
						 </div>
					</div>
				</div>
			</div>
        </div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>