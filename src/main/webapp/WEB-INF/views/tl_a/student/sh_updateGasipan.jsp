<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="row my-4">
			<div class="col fs-3 fw-bold">게시글 수정</div>
		</div>
		<div class="row my-2">
			<div class="col"><span class="text-secondary" style="font-size:0.8em">작성자</span><span class="fw-bold"> ${sessionStudentInfo.name }</span></div>
		</div>
		<form class="row my-2" action="./updateGasipanProcess" method="post">
			<div class="col">
			
				<div class="row my-2">
					<div class="col" style="font-size:0.8em">음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다. [저작권법 안내] [게시물 활용 안내]
					</div>
				</div>
			
			
				<div class="row my-2">
					<div class="col">
						<input class="form-control" name="title" type="text" value="${qwer.dormFreeboardDto.title }" placeholder="제목을 입력하여주세요">
					</div>
				</div>
				<div class="row my-2">
					<div class="col">
						<textarea rows="15" name="content" class="form-control" placeholder="내용을 입력해주세요">${qwer.dormFreeboardDto.content }</textarea>
						<input name="id" type="hidden" value="${qwer.dormFreeboardDto.dorm_freeboard_pk }">
					</div>
				</div>
				<div class="row my-2">
					<div class="col d-grid">
						<input type="submit" class="btn btn-primary" value="글 수정">
					</div>
				</div>
			</div>
		</form>
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