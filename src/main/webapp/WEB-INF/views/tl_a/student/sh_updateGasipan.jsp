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


	<div class="container">
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    

</body>
</html>