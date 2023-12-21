<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
</head>
<body>

<%
    // 현재 시간 가져오기
    Date currentDate = new Date();
    
    // 시간을 특정 형식으로 포맷팅
    SimpleDateFormat dateFormat = new SimpleDateFormat("yy.MM.dd HH:mm:ss");
    SimpleDateFormat newDateFormat = new SimpleDateFormat("yy.MM.dd");
    String formattedDate = dateFormat.format(currentDate);
    String newFormattedDate = newDateFormat.format(currentDate);
%>



    <jsp:include page="../commons/student/topNavi.jsp"></jsp:include>
    <div class="row">
        <div class="col">
            <img src="../../resources/img/dormitory/studentMainLogo.jpg">
        </div>
    </div>


    <div class="container mt-3">
        <div class="row">
           <jsp:include page="../commons/student/leftButtons5.jsp"></jsp:include>
            <!-- 왼쪽 목차 끝 -->
            <div class="col">
               <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">일지 작성</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙사 커뮤니티 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;">일지 작성</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
            	
            	<div class="row">
            		<div class="col fw-bold fs-4 my-4 text-center">
            			임 원 일 지 양 식
            		</div>
            	</div>
            	<form action="./jw_diaryApplyProcess" method="post" onsubmit="alert('일지 작성이 완료되었습니다!');">
            	<div class="row">
            		<div class="col">
            			<div class="row text-center border border-black ">
            				<div class="col py-3 border-end border-black fw-bold" style="background:#eeeeee;">
            					담당 부서
            				</div>
            				<div class="col py-3 border-end border-black">
            					생활관관리센터 팀
            				</div>
            				
            				<div class="col py-3 border-end border-black fw-bold" style="background:#eeeeee;">
            					담당자 연락처
            				</div>
            				<div class="col py-3 border-end border-black">
            					010-7630-1172
            				</div>
            			</div>
            			<div class="row text-center border border-top-0 border-black ">
            				<div class="col py-3 border-end border-black fw-bold" style="background:#eeeeee;">
            					작성자
            				</div>
            				<div class="col py-3 border-end border-black">
            					${sessionStudentInfo.name}
	            				<input type="hidden" name="executive_pk" value="${executiveDto.executive_pk}">
            				</div>
            				
            				<div class="col py-3 border-end border-black fw-bold" style="background:#eeeeee;">
            					작성시간
            				</div>
            				<div class="col py-3 border-end border-black">
            					<%= formattedDate %>
            				</div>
            			</div>
            			<div class="row text-center border border-top-0 border-black" style="background:#eeeeee;">
            				<div class="col py-3 border-end border-black fs-5 fw-bold">
            					보고사항
            				</div>
            			</div>
            			<div class="row text-center border border-top-0 border-black">
            				<div class="col py-3 border-end border-black">
            					<textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="25" placeholder="보고사항을 작성하십시오." style="border:none;"></textarea>
            				</div>
            			</div>
            			<div class="row my-3">
                        	<div class="col"></div>
							<div class="col-2 d-grid py-3 fw-bold pe-0" style="font-size: 1.1rem;">
								<input type="submit" class="btn rounded-0 px-4" style="background-color:#504528; color:#FFFFFF;" value="작성 완료">
							</div>
                        </div>
            			
            		</div>
            	</div>
            	</form>
            	
              </div>
              <pre>
              
              
              
              
              
              
              
              
              
              </pre>
                <!-- 공고 끝 -->
            </div>
        </div>
        

<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>

   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>