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
	
	#topBannerCol
	{	
		background-image: url("/toothless/resources/img/counselCenterStaff/topBanner01.jpg");
		background-position: center;
		background-size: cover;
		height: 14em;
		background-repeat: no-repeat;
		
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
	
	<jsp:include page="../commons/staffTopArea.jsp"></jsp:include>
	
	<!-- 상단 배너 이미지 -->
	<div class="row">
		<div id="topBannerCol" class="col">
			<div class="row mt-3">
				<div class="col ms-5">
					<span class="fs-1 fw-bold text-white">Management</span>
				</div>
			</div>				
		</div>
	</div>

	<div class="container">
		<div class="row">&nbsp;</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10">
				<div class="row">
					<div class="col-1"></div>
					<div class="col-10">
						<div class="row">
							<div class="col fs-1 fw-bold text-center">공지사항 수정</div>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
				<div class="row">&nbsp;</div>
				<div class="row">
					<div class="col-11">
						<div class="row border">
							<div class="col">
								<form action="./updateNoticeArticleProcess" method="post">
									<input name="id" type="hidden" value="${list.noticeBoardDto.id }">
									<input name="staff_pk" type="hidden" value="${sessionStaffInfo.staff_pk }">
									<div class="row">
										<div class="col">
											<div class="row mb-1">
												<div class="col">제목</div>
											</div>
											<div class="row">
												<div class="col"><input class="form-control" name="title" type="text" value="${list.noticeBoardDto.title }"></div>
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
														<textarea class="form-control" name="text" rows="10" cols="60">${list.noticeBoardDto.text }</textarea>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="row">&nbsp;</div>
									<div class="row">
										<div class="col-8"></div>
										<div class="col">
											<div class="row">
												<div class="col text-end pe-0">
													<a class="link-offset-2 link-underline link-underline-opacity-0 btn btn-light" style="color: black;" href="./noticeMainPage_Staff"><i class="bi bi-card-list" style="color: red"></i>&nbsp;&nbsp;목록</a>
												</div>
												<div class="col text-center">
													<a class="link-offset-2 link-underline link-underline-opacity-0 btn btn-light" style="color: black;" href="readNoticeBoardPage_Staff?id=${list.noticeBoardDto.id }">뒤로가기</a>
												</div>
												<div class="col text-center">
													<button type="submit" class="btn btn-light">글수정</button>
												</div>
											</div>		
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