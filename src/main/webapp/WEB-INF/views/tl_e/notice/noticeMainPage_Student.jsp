<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	#tableHeader {
		font-size: 0.8em;
	}
	
	#numberSize {
		font-size: 0.8em;
	}
</style>
<script>

	function reloadNoticeList(){
		
		const url = "./getNoticeList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const noticeListBox = document.getElementById("noticeListBox");
			noticeListBox.innerHTML = "";
			
			for(e of response.data){
				// templete호출
				const noticeListWrapper = document.querySelector("#templete .noticeListWrapper").cloneNode(true);
				// 닉네임호출
				const noticeNickname = noticeListWrapper.querySelector(".noticeNickname");
				noticeNickname.innerText = e.staffInfoDto.name;
				// 날짜호출
				const noticeDate = noticeListWrapper.querySelector(".noticeDate");
				noticeDate.innerText = e.noticeBoardDto.created_at;
				// 날짜패턴
				const date = new Date(e.noticeBoardDto.created_at);
				noticeDate.innerText = date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate();
				// 공지사항 호출
				const noticePk = noticeListWrapper.querySelector(".noticePk");
				noticePk.innerText = e.noticeBoardDto.id;
				const noticeTitle = noticeListWrapper.querySelector(".noticeTitle");
				const detailPage = document.createElement("a");
				
				detailPage.setAttribute("href", "./readNoticeBoardPage_Student?id=" + e.noticeBoardDto.id);
				detailPage.innerText = e.noticeBoardDto.title;
				detailPage.style.color = "black";
				detailPage.style.textDecoration = "none";
				
				noticeTitle.appendChild(detailPage);
				
				const noticeRead_Count = noticeListWrapper.querySelector(".noticeRead_Count");
				noticeRead_Count.innerText = e.noticeBoardDto.read_count;
				
				noticeListBox.appendChild(noticeListWrapper);
			}
		});
	}
	
	window.addEventListener("DOMContentLoaded", () => {
		reloadNoticeList()
	});

</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<form action="./noticeMainPage_Student" method="get">
							<div class="row mb-3">
								<div class="col-2">
									<select name="searchType" class="form-select">
										<option value="title" selected>제목</option>
										<option value="text">내용</option>
										<option value="name">작성자</option>
									</select>
								</div>
								<div class="col-8">
									<input name="searchWord" type="text" class="form-control">
								</div>
								<div class="col-2 d-grid">
									<button class="btn btn-light">검색</button>
								</div>
							</div>
						</form>
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col">
										<div class="row">
											<div class="col-1">글번호</div>
											<div class="col-8">제목</div>
											<div class="col-1">작성자</div>
											<div class="col-1">조회수</div>
											<div class="col-1">작성일</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div id="noticeListBox" class="col">
									
									</div>
								</div>
							</div>
						</div>
					</div>	
					<div class="col-1"></div>	
				</div>
			</div>
		</div>
	</div>
	<div id="templete" class="d-none">
		<div class="noticeListWrapper row">
			<div class="noticePk col-1"></div>
			<div class="noticeTitle col-8"></div>
			<div class="noticeNickname col-1"></div>
			<div class="noticeRead_Count col-1"></div>
			<div class="noticeDate col-1"></div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>