<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <style>
        .customColor {
            border-radius: 0%;
            color: white;
            background-color: #014195;
            }
   	</style>
    
    <script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>
    
    <script>
    
	    let loginStaffInfo = null;
		
		function getStaffInfo(){		
			fetch("./restStaffInfo")
			.then(response => response.json())
			.then(response => {
				
				const staffLoginPageUrl = "http://localhost:8181/toothless/another/staff/loginPage";
				
				loginStaffInfo = response.data;
				
				if(loginStaffInfo == null){
					
					window.location.href = staffLoginPageUrl;
					
				}
			});		
		}	
    
	    function formModify(event){
			
			const frm = document.getElementById("frm");
			const inputCategory = document.getElementById("inputCategory");
			const inputName = document.getElementById("inputName");
			const inputText = document.getElementById("inputText");
			const inputFile = document.getElementById("inputFile");
			
			event.preventDefault();
			
			if(inputCategory.value == '' || inputCategory.value == '---선택해주세요---'){
				alert("카테고리를 입력해주셔야 합니다.");
				inputCategory.focus();
				return;
			}
			
			if(inputName.value == ''){
				alert("상품명을 입력해주셔야 합니다.");
				inputName.focus();
				return;
				
			}
			
			if(inputText.value == ''){
				alert("상품설명서를 입력해주셔야 합니다.");
				inputText.focus();
				return;
				
			}
			
			if(inputFile.files.length == 0){
				alert("파일를 선택해주셔야 합니다.");
				inputFile.focus();
				return;
				
			}
			
			frm.submit();
		}
	    
	    window.addEventListener("DOMContentLoaded", () => {
				
			getStaffInfo();
		
	    });
    </script>
        
</head>
<body>

        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <jsp:include page="../commonJsp/staffTopBanner.jsp"></jsp:include>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <jsp:include page="../commonJsp/staffSideBar.jsp"></jsp:include>
                                <div class="col">
                                    <div class="row">
                                		<div class="col-4">
		                                   <div class="row mt-5 ms-2">
		                                        <div class="col-1 vr px-0" style="border-width:0.1em; border-style: solid; border-color: #0000FF;"></div>
		                                        <div class="col-3 ps-1 fw-bold">
		                                            물품수정    
		                                        </div>  
		                                    </div>
		                                    <div class="row mt-3 ms-2">
		                                    	<div class="col ps-0 fw-bold">
		                                    		<span style="color: red">＊</span>등록된 이미지
		                                    	</div>
		                                    </div>
		                                    <div class="row mt-3 ms-2">
		                                        <div class="col ps-0">
		                                            <img class="img shadow" src="/uploadFiles/mainImage/${getItem.img_link}" style="max-width: 100%; height: auto%;">
		                                        </div>
		                                    </div>
                               			 </div>
                               			<div class="col-1"></div>
		                                <div class="col">   
		                                	<div class="row mt-5"> 
		                                        <div class="col">
		                                        
		                                        	<form id="frm" action="./itemUpdateProcess" method="post" enctype="multipart/form-data">
		                                          
		                                            <div class="row mt-5">
		                                                <div class="col">
		                                                    <div class="row mt-3">
		                                                        <div class="col">
		                                                            <div class="row mt-3">
		                                                                <div class="col text-center fw-bold">
		                                                                    <span style="color: red">＊</span>물품카테고리
		                                                                </div>
		                                                             </div>
		                                                             <div class="row mt-1">
		                                                                <div class="col">
		                                                                    <select id="inputCategory" name="item_cat_pk" class="form-select form-select-sm d-grid rounded-0 form-control" aria-label="Small select example" style="border-color: black;">
						                                                        <option class="text-center" selected>---선택해주세요---</option>
						                                                        <c:forEach items="${itemCategoryList }" var="itemCategory">
						                                                        <option value="${itemCategory.item_cat_pk }">${itemCategory.name }</option>
						                                                        </c:forEach>
						                                                    </select> 
		                                                                </div>
		                                                             </div> 	
		                                                        </div>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                            <div class="row">
		                                                <div class="col">
		                                                	<input type="hidden" name="item_pk" value="${getItem.item_pk }">
		                                                </div>
		                                            </div>
		                                            <div class="row mt-3">
		                                                <div class="col fw-bold text-center">
		                                                    <span style="color: red">＊</span>물품명
		                                                </div>
		                                            </div>
		                                            <div class="row mt-1">   
		                                                <div id="inputName" class="col">
		                                                    <input type="text" name="name" class="form-control" value="${getItem.name }">
		                                                </div>
		                                            </div>
		                                            <div class="row mt-3">
		                                                <div class="col fw-bold text-center">
		                                                    <span style="color: red">＊</span>물품설명서
		                                                </div>
		                                            </div>
		                                            <div class="row mt-1">    
		                                                <div id="inputText" class="col ">
		                                                    <textarea name="content" class="form-control">${getItem.content }</textarea>
		                                                </div>
		                                            </div>
		                                            <div class="row mt-3">
		                                                <div class="col fw-bold text-center">
		                                                    <span style="color: red">＊</span>물품이미지
		                                                </div>
		                                            </div>
		                                            <div class="row mt-1">
		                                                <div  class="col">
		                                                    <input id="inputFile" type="file" class="form-control" name="mainImage" accept="image/*">
		                                                </div>
		                                            </div>    
		                                            <div class="row mt-5">
		                                                 <div class="col text-end pe-2">
		                                                      <button  onclick="formModify(event)" class="btn btn-secondary customColor">수정</button>
		                                                 </div>
		                                            </div>
		                                            </form>
		                                        </div>
		                                    </div>
		                                </div>
                   						
                                	</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col py-4" style="background-color: #F2F2F2;">
                                    <div class="row" style="margin-left: 16%; margin-right: 16%;">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1 my-auto">
                                                    <img class="img-fluid" src="../../resources/img/another/logo_black.png">
                                                </div>
                                                <div class="col-3 ps-0 my-auto" style="font-size: x-large">
                                                    MK University | 보건센터
                                                </div>
                                                <div class="col text-body-tertiary my-auto" style="font-size: small;">
                                                    <p class="my-0">서울특별시 강남구 테헤란로7길 7 에스코빌딩 6~7층&emsp;전화 : 02&#41;561-1911&emsp;팩스 : 02&#41;561-1911</p>
                                                    <p class="my-0">COPYRIGHT&#40;C&#41; University of Seoul ALL RIGHTS RESERVED.</p>
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
