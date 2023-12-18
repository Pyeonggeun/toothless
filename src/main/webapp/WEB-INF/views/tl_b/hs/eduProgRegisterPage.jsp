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
        <script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>
        <title>교육 교직원 글 등록</title>
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
                                <div class="col pb-5">
                                    <!-- 여기 안에만 사용하면 됨 -->
                                    <div class="row mt-4">
                                        <div class="col">
                                            <div class="row">
                                                
                                                <div class="col"></div>
                                                <div class="col-10 fw-bold pb-2" style="font-size: 1.7em;  border-bottom-color: #014195;   border-bottom-style: solid; border-bottom-width: 0.12em;">
                                                    교육프로그램 등록
                                                </div>
                                                <div class="col"></div>
                                                
                                            </div>

                                            <form action="./eduProgRegisterProcess" method="get">
                                            
                                             <div class="row">
                                             	<div class="col"></div>
                                                <div class="col-10">
                                                
                                                    

                                                    
                    
                                                    <div class="form-group mt-4">
                                                        <label for="name" class="form-label">프로그램명</label>
                                                        <input type="text" class="form-control" id="name" name="name" placeholder="프로그램명을 입력하세요" required>
                                                    </div>
                    
                                                    <div class="form-group mt-4">
                                                        <label for="content" class="form-label">내용</label>
                                                        <textarea class="form-control" id="content" name="content" rows="15" cols="10" placeholder="신청방법, 강사 상세교육 내용을 입력하세요" required></textarea>
                                                    </div>
                                                
                                                    <div class="form-group mt-4">
                                                        <label for="img_link" class="form-label">포스터</label>
                                                        <input type="file" class="form-control-file"
                                                        id="img_link" name="img_link"
                                                        accept="image/*" multiple required>
                                                    </div>

                                                    
                                                    <div class="row mt-3">
                                                        <div class="col-2">
                                                            <div class="form-group">
                                                                <label for="apply_start_date" class="form-label">신청기간</label>
                                                                <input type="date" class="form-control" id="apply_start_date" name="apply_start_date" required>
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="col-2 mt-2">
                                                            <div class="form-group">
                                                                <label for="apply_end_date" class="form-label"></label>
                                                                <input type="date" class="form-control" id="apply_end_date" name="apply_end_date" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-3">
                                                        <div class="col-2">
                                                            <div class="form-group">
                                                                <label for="edu_date" class="form-label">교육일</label>
                                                                <input type="date" class="form-control" id="edu_date" name="edu_date" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                            
                                                    
                                                    <div class="row mt-3">
                                                        <div class="col-2">
                                                            <div class="form-group">
                                                                <label for="capacity" class="form-label">모집인원</label>
                                                                <input type="number" class="form-control"
                                                                id="capacity" name="capacity" 
                                                                value="10" min="1"
                                                                placeholder="작성자 이름을 입력하세요" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="row mt-3">
                                                        <div class="col-4">
                                                            <div class="form-group">
                                                                <label for="place" class="form-label">장소</label>
                                                                <input type="text" class="form-control" id="place" name="place" placeholder="장소를 입력하세요" required>
                                                            </div>
                                                        </div>
                                                    </div>
                        
                                                    <div class="row mt-5">
                                                        <div class="form-group">
                                                            <span>작성자</span>
                                                            ${sessionStaffInfo.name}
                                                            <!-- <label for="title" class="form-label">작성자</label>
                                                            <input type="text" class="form-control" id="title" name="title" placeholder="게시글 제 입력하세요" required> -->
                                                        </div>
                                                    </div>
                    
                                                    <div class="row my-5">
                                                        <div class="col-5"></div>
                                                        <div class="col-2 text-center">
                                                            <button type="submit" class="btn text-white rounded-0" style="background-color: #014195;">
                                                                게시글 작성
                                                            </button>
                                                        </div>
                                                        <div class="col-5"></div>
                                                    </div>
                                                </div>
                                                <div class="col"></div>
                                            </div> 
                                            </form>





                                        </div>
                                    </div>
                                    
                                    
                          
							  
                               
							     
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
	                               <%--  <form action="./eduProgRegisterProcess" method="get">
										작성자: ${sessionStaffInfo.name}<br>
										제목: <input name="name" type="text"><br>
										내용:<br>
										<textarea name="content" rows="10" cols="60"></textarea><br>
										포스터: <input name="img_link" type="file" accept="image/*" multiple><br>
										신청시작일: <input name="apply_start_date" type="date"><br>
										신청종료일: <input name="apply_end_date" type="date"><br>
										교육일시: <input name="edu_date" type="date"><br>
										장소: <input name="place" type="text"><br>
										수강인원: <input name="capacity" type="number" value="10" min="1"><br>
										<input type="submit" value="등록 완료">
									</form>   --%>
									
									
									  
                                </div>
                            </div>
                        </div>
                    </div>
              		<jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>

                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>