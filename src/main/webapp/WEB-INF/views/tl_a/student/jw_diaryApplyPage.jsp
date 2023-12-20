<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            		<div class="col fw-bold fs-5 my-4 text-center">
            			임 원 일 지 양 식
            		</div>
            	</div>
            	<form action="./jw_diaryApplyProcess" method="post" onsubmit="alert('일지 작성이 완료되었습니다!');">
            	<div class="row">
            		<div class="col">
            			<div class="row text-center border border-black ">
            				<div class="col py-3 border-end border-black" style="background:#eeeeee;">
            					담당 부서
            				</div>
            				<div class="col py-3 border-end border-black">
            					생활관관리센터 팀
            				</div>
            				
            				<div class="col py-3 border-end border-black" style="background:#eeeeee;">
            					담당자 연락처
            				</div>
            				<div class="col py-3 border-end border-black">
            					010-7630-1172
            				</div>
            			</div>
            			<div class="row text-center border border-top-0 border-black">
            				<div class="col py-3 border-end border-black" style="background:#eeeeee;">
            					작성자
            				</div>
            				<input type="hidden" name="executive_pk" value="${executiveDto.executive_pk}">
            				<div class="col py-3 border-end border-black">
            					<input class="form-control text-center" type="text" placeholder="${sessionStudentInfo.name}" style="border:none;" readonly >
            				</div>
            				<div class="col py-3 border-end border-black" style="background:#eeeeee;">
            					작성시간
            				</div>
            				<div class="col py-3 border-end text-secondary border-black">
            					자동저장
            				</div>
            			</div>
            			<div class="row text-center border border-top-0 border-black">
            				<div class="col py-3 border-end border-black" style="background:#eeeeee;">
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
							<div class="col-2 d-grid py-3 fw-bold" style="font-size: 1.1rem;">
								<input type="submit" class="btn btn-primary rounded-0" value="작성">
							</div>
                        </div>
            			
            		</div>
            	</div>
            	</form>
            	
              </div>
              <pre></pre>
              <pre></pre>
              <pre></pre>
                <!-- 공고 끝 -->
            </div>
        </div>
        

<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>

   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>