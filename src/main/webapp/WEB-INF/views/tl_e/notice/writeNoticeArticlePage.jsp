<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&amp;family=Gowun+Dodum&amp;family=Quicksand:wght@300&amp;display=swap" rel="stylesheet">
<style type="text/css">
	*{
		/* font-family: 'Dongle', sans-serif; */
		font-family: 'Gowun Dodum', sans-serif;
		/* font-family: 'Quicksand', sans-serif; */
	}
</style>
<script>
	function formSubmit(){
		const frm = document.getElementById("frm");
		const articleTitle = document.getElementById("articleTitle");
		const articleText = document.getElementById("articleText");
		
		if(articleTitle.value == ''){
			alert("제목을 입력해야 합니다.");
			articleTitle.focus();
			return ;
		}else if(articleText.value == ''){
			alert("내용을 입력해야 합니다.");
			articleText.focus();
			return ;
		}
		
		frm.submit();
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">
				<div class="row">
					<div class="col-1"></div>
					<div class="col-10">
						<div class="row">
							<div class="col fs-1 fw-bold text-center">공지사항 글쓰기</div>
							<div class="col-2 mt-3 text-end">${sessionStaffInfo.name } 님 글 등록중</div>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
				<div class="row">&nbsp;</div>
				<a class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;" href="./noticeMainPage"><i class="bi bi-card-list"></i>&nbsp;&nbsp;목록</a>
				<div class="row">
					<div class="col-11">
						<div class="row border">
							<div class="col">
								<form id="frm" action="./writeNoticeArticleProcess" method="post" enctype="multipart/form-data">
									<input name="staff_pk" type="hidden" value="${sessionStaffInfo.staff_pk }">
									<div class="row">
										<div class="col">
											<div class="row mb-1">
												<div class="col">제목</div>
											</div>
											<div class="row">
												<div class="col"><input id="articleTitle" type="text" class="form-control" name="title" placeholder="제목입력" aria-label="Username" aria-describedby="basic-addon1"></div>
											</div>
										</div>
									</div>
									<div class="row">&nbsp;</div>
									<div class="row">
										<div class="col">
											<div class="row mb-1">
												<div class="col">내용</div>
											</div>
											<div class="row">
												<div class="col">
													<div>
														<textarea id="articleText" class="form-control" name="text" rows="10" cols="60" placeholder="내용입력" id="floatingTextarea2"></textarea>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">&nbsp;</div>
									<div class="row">
										<div class="col-10">
											<input class="btn btn-light" name="imageFiles" type="file" accept="image/*" multiple="multiple">
										</div>
										<div class="col">
											<input type="button" onclick="formSubmit()" value="글등록">
										</div>
									</div>
									<div class="row">&nbsp;</div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-1"></div>					
				</div>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	
	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>