<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    	<jsp:include page="../commons/student/leftButtons4.jsp"></jsp:include>
    	<div class="col">
    		<div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">기숙사 자유게시판</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙사 커뮤니티 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 기숙사 자유게시판</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                    </div>
			</div>
    		<div class="row">
				<div class="col-1">
					제목:
				</div>
				<div class="col-11">	
					${qwer.dormFreeboardDto.title}
				</div>
			</div>
				<div class="row">
				<div class="col-1">
					내용:
				</div>
				<div class="col-6">
					${qwer.dormFreeboardDto.content}		
				</div>
			</div>

				<div class="row my-4">
					<div class="col-2 d-grid">
						<a class="btn" style="background-color:#504528; color:#FFFFFF;" href="./mainGaesipan">목록으로</a>
					</div>
					<c:if test="${!empty sessionStudentInfo && sessionStudentInfo.student_pk == qwer.dormFreeboardDto.student_pk }">
					<div class="ms-auto col-auto d-grid">
						<a class="btn btn-danger" href="./deleteGasipanProcess?id=${qwer.dormFreeboardDto.dorm_freeboard_pk }">삭제</a>
					</div>
					<div class="col-auto d-grid">
						<a class="btn" style="background-color:#504528; color:#FFFFFF;"href="./updateDorm?id=${qwer.dormFreeboardDto.dorm_freeboard_pk }">수정</a>
					</div>
					</c:if>
				</div>
			</div>
		</div>
    	</div>
    </div>
	
		
		
	</div>



	<pre>
	
	
	
	
	
	
	
	
	
	
	
	</pre>


<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>
	


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    

</body>
</html>