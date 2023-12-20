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
	
	.rotate-icon.bi-emoji-smile-fill {
		animation: colorChange 2s linear infinite;
		font-size: 2rem;
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
			
			titleUrl.setAttribute("href", "./readNoticeBoardPage_Staff?id=" + e.noticeBoardDto.id);				
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
	<jsp:include page="../commons/staffTopArea.jsp"></jsp:include>

	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<div class="row">
					<div class="col">
						<div class="row">
							<div class="col-1"></div>
							<div class="col">
								<div id=frm>
									<div class="row mt-5">
										<div class="col-4 mt-3">
											<span>HOME &gt; </span>
											<span>상담 지원 센터 &gt; </span>
											<span>공지사항</span>
										</div>
										<div class="col-2">
											<select id="searchType" name="searchType" class="form-select">
												<option value="title" selected>제목</option>
												<option value="text">내용</option>
												<option value="name">작성자</option>
											</select>
										</div>
										<div class="col-4">
											<input id="searchWord" name="searchWord" type="text" class="form-control">
										</div>
										<div class="col-2 d-grid">
											<input type="button" class="btn btn-light" onclick="formSubmit()" value="검색" ></input>
										</div>
									</div>	
								</div>
								<div class="row">
									<div class="col"></div>
									<div class="col-2 d-grid mt-2">
										<!-- Button trigger modal -->
										<button type="button" class="btn btn-light text-center" data-bs-toggle="modal" data-bs-target="#exampleModal">
									  		<i class="bi bi-pencil-fill"></i>글쓰기
										</button>
										
										<!-- Modal -->
										<div class="row">
											<div class="col fw-bold">
												<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div id="modalWrite" class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
														<div class="modal-content">
															<div class="modal-header row">
																<div class="col-8 fs-3 text-start">
																	<div>공지사항 쓰기</div>
																</div>
																<div class="col">
																	<div class="row">
																		<div class="col me-0 text-end"><i class="bi bi-emoji-smile-fill rotate-icon"></i></div>
																		<div class="col mt-3 ms-0">${sessionStaffInfo.name }님 글쓰는중</div>
																	</div>
																</div>
															</div>
														    <div class="modal-body">
														    	<div class="row">
														    		<div class="col-1"></div>
														    		<div class="col">
														    			<div class="row">
																			<div class="col-1">제목</div>
																			<div class="col"></div>
																		</div>	
																		<div class="row">
																			<div class="col"><input id="articleTitle" type="text" class="form-control" name="title" placeholder="제목입력" aria-label="Username" aria-describedby="basic-addon1"></div>
																		</div> 
																		<div class="row">
																			<div class="col-1">내용</div>
																			<div class="col"></div>
																		</div> 
																		<div class="row">
																			<div class="col"><textarea id="articleText" class="form-control" name="text" rows="10" cols="60" placeholder="내용입력" id="floatingTextarea2"></textarea></div>
																		</div>
																		<div class="row">
																			<input id="staff_pk" type="hidden" value="${sessionStaffInfo.staff_pk }">
																		</div>
														    		</div>
														    		<div class="col-1"></div>
														    	</div>
														    </div>
														    <div class="modal-footer">
													    		<div class="col text-start">
													    			<input id="imageFilesLink" class="btn btn-light" name="imageFiles" type="file" accept="image/*" multiple="multiple">
													    		</div>
													    		<div class="col-1">
													    			<input type="button" class="btn btn-secondary" data-bs-dismiss="modal" value="취소">
													    		</div>
													    		<div class="col-1">
													    			<input type="button" onclick="writeSubmit()" class="btn btn-primary" data-bs-dismiss="modal" value="글 작성">
													    		</div>
														    </div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row fw-bold mt-2">
									<div class="col-1"><i class="bi bi-chat-square-text-fill"></i>&nbsp;글번호</div>
									<div class="col-8"><i class="bi bi-emoji-expressionless-fill"></i>&nbsp;제목</div>
									<div class="col-1"><i class="bi bi-emoji-heart-eyes-fill"></i>&nbsp;조회수</div>
									<div class="col-1"><i class="bi bi-person-arms-up"></i>&nbsp;작성자</div>
									<div class="col-1"><i class="bi bi-calendar-heart-fill"></i>&nbsp;작성일</div>
								</div>
								<div id="noticeListBox" class="row">
									<div class="col">
										
									</div>
								</div>
							</div>
							<div class="col-1"></div>
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
			<div class="noticeListWrapper row mt-2 mb-2">
				<div class="noticePk col-1"></div>
				<div class="noticeTitle col-8 border-bottom">
					<div class="row">
						<div class="col-10">
							<a class="titleUrl link-offset-2 link-underline link-underline-opacity-0" style="color: black"></a>
							<span class="titleSpan fw-bold text-danger" style="font-size:0.7em;"></span>
							<span class="imageSpan"></span>
						</div>
						<div class="col-1">
							<span class="likeSpan fw-bold" style="font-size:0.7em;"></span>
						</div>
						<div class="col-1">
							<span class="dislikeSpan fw-bold" style="font-size:0.7em;"></span>
						</div>
					</div>
				</div>
				<div class="noticeRead_Count col-1 text-center"></div>
				<div class="noticeNickname col-1 text-center"></div>
				<div class="noticeDate col-1 text-center"></div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>