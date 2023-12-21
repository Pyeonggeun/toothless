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
	
	.titleUrl:hover{
		opacity: 0.5
	}
	
	@keyframes colorChange {
	  0% {
	    transform: rotate(0deg);
	    color: DodgerBlue;
	  }
	  25% {
	    transform: rotate(90deg);
	    color: Tomato;
	  }
	  50% {
	    transform: rotate(180deg);
	    color: Gold;
	  }
	  75% {
	    transform: rotate(270deg);
	    color: LimeGreen;
	  }
	  100% {
	    transform: rotate(360deg);
	    color: DodgerBlue;
	  }
	}
	
	.rotate-icon {
		animation: colorChange 2s linear infinite;
		color: DodgerBlue;
		display: inline-block;
	}
	
</style>
<title>Insert title here</title>
<script>
	// 리스트 출력 templete
	function temp(listData){
		
		const noticeListBox = document.getElementById("noticeListBox");
		noticeListBox.innerHTML = "";
		
		for(e of listData){
			
			const noticeListWrapper = document.querySelector("#templete .noticeListWrapper").cloneNode(true);
			
			const noticePk = noticeListWrapper.querySelector(".noticePk");
			noticePk.innerText = e.noticeBoardDto.id;
			
			const noticeTitle = noticeListWrapper.querySelector(".noticeTitle");
			const titleUrl = noticeTitle.querySelector(".titleUrl");
			
			if(e.commentCount > 0){
				const titleSpan = noticeTitle.querySelector(".titleSpan");					
				titleSpan.innerText = "[" + e.commentCount + "]";
			}
			/* else{
				const titleSpan = noticeTitle.querySelector("#titleSpan");
				titleSpan.innerHTML = "";
			} */
			
			if(e.imageCount > 0){
				const imageSpan = noticeTitle.querySelector(".imageSpan");
				const iTag = document.createElement("i");
				iTag.setAttribute("class", "bi bi-card-image");
				
				imageSpan.appendChild(iTag);
			}
			
			titleUrl.setAttribute("href", "./readNoticeBoardPage_Student?id=" + e.noticeBoardDto.id);				
			titleUrl.innerText = e.noticeBoardDto.title;
			
			const likeSpan = noticeTitle.querySelector(".likeSpan");
			likeSpan.innerText = "[" + "추천" + e.likeCount + "]";
			const dislikeSpan = noticeTitle.querySelector(".dislikeSpan");
			dislikeSpan.innerText = "[" + "비추" + e.disLikeCount + "]";
			
			const noticeRead_Count = noticeListWrapper.querySelector(".noticeRead_Count");
			noticeRead_Count.innerText = e.noticeBoardDto.read_count;
			
			const noticeNickname = noticeListWrapper.querySelector(".noticeNickname");
			noticeNickname.innerText = e.staffInfoDto.name;
			
			const noticeDate = noticeListWrapper.querySelector(".noticeDate");
			const date = new Date(e.noticeBoardDto.created_at);
			const day = date.getDate() < 10 ? '0' + date.getDate() : date.getDate();
			noticeDate.innerText = date.getFullYear() + "." + (date.getMonth() + 1) + "." + day;
			
			noticeListBox.appendChild(noticeListWrapper);
		}
	}
	// 검색
	function formSubmit() {

		const frm = document.getElementById("frm");
		const searchType = document.getElementById("searchType").value;
		const searchWord = document.getElementById("searchWord").value;
		const url = "./getNoticeList?searchType="+searchType+"&searchWord="+searchWord;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			temp(response.data);
		});
	}
	// 게시판 리스트 출력
	function reloadNoticeList(){
		
		const url = "./getNoticeList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			temp(response.data);
		});
	}
	// 게시글 추가
	function writeSubmit() {
		
		const modalWrite = document.getElementById("modalWrite");
		const articleTitle = document.getElementById("articleTitle").value;
		const articleText = document.getElementById("articleText").value;
		const staff_pk = document.getElementById("staff_pk").value
		
		const imageFilesLink = document.getElementById("imageFilesLink");
		imageFilesLink.addEventListener("change", function() {
		    console.log(imageFilesLink.files); // 파일이 선택되었는지 확인
		});
		const imageFiles = imageFilesLink.files;
		console.log(imageFiles); // 파일이 선택되었는지 확인
		
		const formData = new FormData();
		formData.append("title", articleTitle);
		formData.append("text", articleText);
		formData.append("staff_pk", staff_pk);
		
	    if (imageFiles.length > 0) {
	        for (let i = 0; i < imageFiles.length; i++) {
	            formData.append("imageFiles", imageFiles[i]);
	        }
	    }
	    console.log(articleTitle, articleText, staff_pk, imageFiles);
	    console.log(formData); // FormData 내용 확인
	    
		const url = "./writeNotice";
		
		fetch(url, {
			method: "POST",
			body: formData
		})
		.then(response => response.json())
		.then(response => {
			reloadNoticeList();
		});
	}
	
	window.addEventListener("DOMContentLoaded", () => {
		reloadNoticeList()
	});
	
	
	
</script>
</head>
<body>
	
	<jsp:include page="../commons/studentTopArea.jsp"></jsp:include>

	<div class="row">
		<div class="col mx-0 px-0" style="height: 35em;">
			<img class="banner img-fluid" src="/toothless/resources/img/groupCounsel/fff.jpg" style="width:100%; height: 100%;">
		
			<div style="background-color: #a0a0a0; opacity: 0.4; width: 100%; height:100%; position: relative; bottom: 100%;"></div>
			<!-- 
			<div class="title-text fw-bold" style="font-size: 3.5em; color: white; top: 70%;">Mk University | 상담센터</div>
			<!--<div class="title-text" style="font-size: 1.5em; color: white; top: 42%;"></div> -->
			<div style="color: white; position: relative; font-size: 4em; bottom: 148%; transform: translate(-50%, -50%); text-align: center; left: 20.5%;">MKU 공지사항</div>
			<div style="color: white; position: relative; font-size: 5em; bottom: 154%; transform: translate(-50%, -50%); text-align: center; left: -18%; border-top:1px; border-top-style: solid; border-top-color: white;"></div>
			<div style="color: white; position: relative; font-size: 1.4em; bottom: 148%; transform: translate(-50%, -50%); text-align: center; left: 19.6%;">너와 나 그리고 우리를 위한 마음을 위한 치료</div>
			<div style="color: white; position: relative; font-size: 1.4em; bottom: 147%; transform: translate(-50%, -50%); text-align: center; left: 24.3%;">마음도 관리가 필요합니다</div>		
			<div style="height:13em; width:14em; border-radius: 0px 50px 0px 0px; background-color: #679467; opacity:0.9; position: relative; font-size: 1.4em; bottom: 155.2%; transform: translate(-50%, -50%); text-align: center; left: 86.7%;"></div>				
			<div style="font-weight:900; color: #464646; position: relative; font-size: 1.5em; bottom: 225%; transform: translate(-50%, -50%); text-align: center; left: 84%;">Contact Us</div>
			<div style="font-weight:900; color: white; position: relative; font-size: 2.8em; bottom: 212%; transform: translate(-50%, -50%); text-align: center; left: 86.3%;">1544-3054</div>
			<div style="color: white; position: relative; font-size: 0.9em; bottom: 215%; transform: translate(-50%, -50%); text-align: center; left: 85.5%;">E-mail. mkmk@naver.com</div>
			<div style="color: white; position: relative; font-size: 0.9em; bottom: 214%; transform: translate(-50%, -50%); text-align: center; left: 84.5%;">Tel. 010-4097-3054</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-3 mt-2">
				<div class="row">
					<div class="col text-start">
						<span><i class="bi bi-house"></i> &gt; </span>
						<span>상담 지원 센터 &gt; </span>
						<span>공지사항</span>
					</div>
				</div>
			</div>
			<div class="col mt-2">
				<div id=frm>
					<div class="row">
						<div class="col-2">
							<select id="searchType" name="searchType" class="form-select">
								<option value="title" selected>제목</option>
								<option value="text">내용</option>
								<option value="name">작성자</option>
							</select>
						</div>
						<div class="col">
							<input id="searchWord" name="searchWord" type="text" class="form-control">
						</div>
						<div class="col-2 d-grid">
							<input type="button" class="btn btn-light" onclick="formSubmit()" value="검색" ></input>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-2 mt-2">
				<div class="row">
					<div class="col">
						<div class="row">
							<div class="col pe-3">
								<div class="dropdown d-grid">
									<button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
								    	상담 안내
								  	</button>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="../onlineCounsel/onlineCounselMainPage">온라인 상담</a></li>
										<li><a class="dropdown-item" href="../offlineCounsel/selectCounselorPage">오프라인 상담</a></li>
										<li><a class="dropdown-item" href="../groupcounsel/student/groupCounselListPage">집단 상담</a></li>
										<li><a class="dropdown-item" href="../freeboardCounsel/freeboardCounselPage">자유 게시판</a></li>
									</ul>
								</div>
								
								<div class="row">&nbsp;</div>
								<div class="row">&nbsp;</div>
								<div class="row">&nbsp;</div>
								<div class="row">&nbsp;</div>
								<div class="row">&nbsp;</div>
								<div class="row">
									<div class="col">
										<div class="col pt-5">
											<img src="../../resources/img/onlineCounsel/doctor.png" width="100%" height="auto" style="border-radius: 10px;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	
			</div>
			<div class="col ps-4 mt-2">
				<div class="row">
					<div class="col mt-2">
						<div class="row fw-bold fs-6">
							<div class="col"><i class="bi bi-chat-square-text-fill"></i>&nbsp;글번호</div>
							<div class="col-7 ps-0 pe-5"><i class="bi bi-emoji-expressionless-fill"></i>&nbsp;제목</div>
							<div class="col ps-3 pe-0"><i class="bi bi-emoji-heart-eyes-fill"></i>&nbsp;조회수</div>
							<div class="col ps-2 pe-0"><i class="bi bi-person-arms-up"></i>&nbsp;작성자</div>
							<div class="col ps-2 pe-0"><i class="bi bi-calendar-heart-fill"></i>&nbsp;작성일</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col" style="overflow-y: auto; max-height: 600px;">
						<div id="noticeListBox" class="row">
							<div class="col">
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 풋터 -->
	<div class="row mt-5" style="background-color: #5a5a5a;">
		<div class="col-1"></div>
		<div class="col">
			<div class="row" style="height: 4em;"></div>
			<div class="row">
				<div class="col">
					<span style="font-size: 1.4em; color: #FF8200; font-weight: 500;">개인정보처리방침</span>
					<span style="font-size: 1.2em; color: white; font-weight: 500;">▪</span>
					<span style="font-size: 1.2em; color: white; font-weight: 500;">이메일무단수집거부</span>
				</div>
			</div>
			<div class="row pt-4">
				<div class="col">
					<div class="fw-bold" style="color:#d2d2d2; font-size: 0.9em;">서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층) / 대표자:정현경 / 사업자등록번호:220-90-07535 / 통신판매번호:제 강남-8062호 / TEL:02-561-1911 / FAX:02-538-2613</div>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col">
					<div class="fw-bold" style="color:#d2d2d2; font-size: 0.9em;">©2023 MK NATIONAL UNIVERSITY. ALL RIGHTS RESERVED.</div>
				</div>
			</div>
			<div class="row pt-4" style="border-bottom-style: solid; border-bottom-color: gray; border-bottom-width: 1px;"></div>
		</div>
		<div class="col-1"></div>
	</div>
	
	<div id="templete" class="row">
		<div class="col">
			<div class="noticeListWrapper row mt-2 mb-2 ps-4 pe-0">
				<div class="noticePk col-1"></div>
				<div class="noticeTitle col-8 border-bottom">
					<div class="row">
						<div class="col-9">
							<a class="titleUrl link-offset-2 link-underline link-underline-opacity-0 fs-5 ps-2" style="color: black"></a>
							<span class="titleSpan fw-bold text-danger" style="font-size:0.7em;"></span>
							<span class="imageSpan"></span>
						</div>
						<div class="col">
							<span class="likeSpan fw-bold" style="font-size:0.7em;"></span>
						</div>
						<div class="col">
							<span class="dislikeSpan fw-bold" style="font-size:0.7em;"></span>
						</div>
					</div>
				</div>
				<div class="noticeRead_Count col-1"></div>
				<div class="noticeNickname col-1"></div>
				<div class="noticeDate col-1"></div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>