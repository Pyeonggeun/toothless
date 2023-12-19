<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    	
    	    <script>
            function formSubmit(){
                const frm = document.getElementById("frm");

                
                const inputTitle =document.getElementById("inputTitle");

	                if(inputTitle.value =='' ){
	                    alert("제목을 입력해주세요.");
	                    inputTitle.focus();
	                    return;
	                }
               
	                const inputText = document.getElementById("inputText")
	                if(inputText.value == ''){
	                    alert("내용을 입력해주세요.")
	                    inputText.focus();
	                    return;
	                }
	                
                frm.submit();
            }
    
    
    
    
    
    
    
    
    
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
                                <div class="col"></div>
                                <div class="col-8">
                                    <form id="frm" action="./noticeUpdateProcess" method="post" enctype="multipart/form-data" >
                                 <div class="row mt-3">
                                    <div class="col border-bottom border-3 fw-bold fs-3">공지사항 글 수정</div>
                                 </div>
                                 <div class="row mt-5">
                                    <div class="col">
                                        작성자: ${sessionStaffInfo.name }
                                    </div>
                                 </div>
                                 <div class="row mt-3">
                                    <div class="form-floating">
                                        <textarea id="inputTitle" name="title" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 30px;"></textarea>
                                        <label for="floatingTextarea2">${update.noticeboardDto.title }</label>
                                    </div>
                                 </div>
                                 <div class="row  mt-3">
                                    <div class="col">
                                        <div class="form-floating">
                                            <textarea id="inputText" name="content" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 300px"></textarea>
                                            <label for="floatingTextarea2">${update.noticeboardDto.content }</label>
                                        </div>
                                    </div>
                                 </div>
                                 <div class="row mt-3">
                                    <div class="col text-start">
                                        대표이미지 등록: <input name="imageFile" type="file" accept="image/*" enctype="multipart/form-data">
                                    </div>
                                 </div>
                                 <div class="row mt-1">
                                    <div class="col text-start">
                                        상세이미지 등록: <input name="imageFiles" type="file" accept="image/*" multiple="multiple">
                                    </div>
                                    <div class="col mt-2 text-end">
                                        <input type="button" onclick="formSubmit()" class="btn btn-outline-primary" value="등록">
                                    	<a href="./staffBoardPage">
                                    		<input type="button" class="btn btn-outline-primary" value="취소">
                                    	</a>
                                    </div>
                                 </div>
                                    </form>  
                                </div>
                                <div class="col"></div>
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
                                                <div class="col-4 my-auto">
                                                    <img class="img-fluid" src="./img/health/health_ci.gif">
                                                </div>
                                                <div class="col text-body-tertiary" style="font-size: small;">
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
