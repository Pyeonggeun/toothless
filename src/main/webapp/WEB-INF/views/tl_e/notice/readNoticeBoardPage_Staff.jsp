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
<style>
	*{
	/* font-family: 'Dongle', sans-serif; */
	font-family: 'Gowun Dodum', sans-serif;
	/* font-family: 'Quicksand', sans-serif; */
	}
    .icon-button {
        background: none;
        border: none;
        padding: 0;
        cursor: pointer;
        outline: none;
    }
    #headerSize {
    	font-size: 0.8em;
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

<script>

	const notice_id = ${list.noticeBoardDto.id};

	function handleClick() {
	}
	
	function reloadCommentList(){
		
		const url ="./getCommentList?notice_id=" + notice_id;
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const commentListBox = document.getElementById("commentListBox");
			commentListBox.innerHTML = "";
			
			for(e of response.data){
				// templete호출
				const commentWrapper = document.querySelector("#templete .commentWrapper").cloneNode(true);
				// 닉네임 호출
				const commentNickname = commentWrapper.querySelector(".commentNickname");
				commentNickname.innerText = e.studentInfoDto.name;
				// 날짜 호출
				const commentDate = commentWrapper.querySelector(".commentDate");
				// 날짜 원하는대로 출력 pattern(yy-MM-dd)
				const date = new Date(e.noticeCommentDto.created_at);
				const day = date.getDate() < 10 ? '0' + date.getDate() : date.getDate();
				commentDate.innerText = date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate();
				// 댓글 내용 호출
				const commentText = commentWrapper.querySelector(".commentText");
				commentText.innerText = e.noticeCommentDto.text;
								
				commentListBox.appendChild(commentWrapper);
			}
			
		});
	}
	
	function reloadNoticeList(){
		
		const url = "./getNoticeList";
		
		fetch(url)
		.then(response => response.json())
		.then(response => {
			
			const noticeListBox = document.getElementById("noticeListBox");
			noticeListBox.innerHTML = "";
			
			for(e of response.data){
				
				const noticeWrapper = document.querySelector("#templeteNoticeList .noticeWrapper").cloneNode(true);
				
				const noticePk = noticeWrapper.querySelector(".noticePk");
				noticePk.innerText = e.noticeBoardDto.id;
				
				const noticeTitle = noticeWrapper.querySelector(".noticeTitle");
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
				dislikeSpan.innerText = "[" + "비추천" + e.disLikeCount + "]";
				
				const noticeNickname = noticeWrapper.querySelector(".noticeNickname");
				noticeNickname.innerText = e.staffInfoDto.name;
				
				const noticeReadCount = noticeWrapper.querySelector(".noticeReadCount");
				noticeReadCount.innerText = e.noticeBoardDto.read_count;
				
				const noticeDate = noticeWrapper.querySelector(".noticeDate");
				const date = new Date(e.noticeBoardDto.created_at);
				const day = date.getDate() < 10 ? '0' + date.getDate() : date.getDate();
				noticeDate.innerText = date.getFullYear() + "." + (date.getMonth() + 1) + "." + day;
				
				noticeListBox.appendChild(noticeWrapper);
				
			}
			
		});
	}
	
	// 해당 jsp화면이 열리면? 실행되야하는 함수
	window.addEventListener("DOMContentLoaded", () => {
		reloadCommentList()
		reloadNoticeList()
	});
	
	
</script>
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
		<div class="row">
			<div class="col-1"></div>
			<div class="col">
				<!-- 공지사항 제목 -->
				<div class="row">
					<div class="col ">
						<div class="row mt-3">
							<div class="col-1 mb-1 border-top fs-5">제목 &nbsp;&nbsp;</div>
							<div class="col mb-1 border-top fs-5">${list.noticeBoardDto.title }</div>
							<c:if test="${!empty sessionStaffInfo&&sessionStaffInfo.staff_pk==list.noticeBoardDto.staff_pk}">	
								<div class="col-1 border-top">
									<div class="row">
										<div class="col mt-1" style="font-size: 1em;">
											<a class="link-offset-2 link-underline link-underline-opacity-0" style="color: red" href="./deleteNoticeArticleProcess?id=${list.noticeBoardDto.id }">삭제</a>
										</div>
									</div>
								</div>
								<div class="col-1 border-top">
									<div class="row">
										<div class="col mt-1" style="font-size: 1em;">
											<a class="link-offset-2 link-underline link-underline-opacity-0" style="color: black" href="./updateNoticeArticlePage?id=${list.noticeBoardDto.id }">수정</a>
										</div>
									</div>
								</div>
							</c:if>
							<div class="col-1 border-top mb-0 d-flex align-items-center justify-content-center" style="font-size: 0.8em"><fmt:formatDate value="${list.noticeBoardDto.created_at }" pattern="yyyy-MM-dd"/></div>
						</div>
					</div>
				</div>
				<!-- 공지사항 사진 -->
				<div class="row border-top">
					<c:forEach items="${list.noticeImageList }" var="list">
						<div class="col-3"></div>
						<div class="col-6 ">
							<div style="overflow: hidden;">
								<img class="img-fluid mt-2" src="/uploadFiles/detailImage/${list.notice_image_link }" style="width: 30em">
							</div>		
						</div>
						<div class="col-3"></div>
					</c:forEach>
				</div>	
				<!-- 공지사항 내용 -->
				<div class="row">
					<div class="col">
						<div class="row">&nbsp;</div>
						<div class="row">&nbsp;</div>
						<div class="row">
							<div class="col">
								${list.noticeBoardDto.text }
							</div>
						</div>
					</div>
				</div>
				<!-- 공지사항에 사진이 없다면 공백 -->
				<c:if test="${empty list.noticeImageList }">
					<div class="row" style="height: 100px"></div>
				</c:if>
				<!-- 추천 비추천 -->
				<div class="row">
					<div class="col"></div>
					<div class="col"></div>
					<c:if test="${likeCheck == 0 }">
						<div class="col">
							<a href="./insertNoticeLike?notice_id=${list.noticeBoardDto.id }&student_pk=${sessionStudentInfo.student_pk }&notice_like=1&notice_dislike=0"><i class="bi bi-hand-thumbs-up fs-1" style="color: black"></i></a>
						</div>
						<div class="col">
							<a href="./insertNoticeLike?notice_id=${list.noticeBoardDto.id }&student_pk=${sessionStudentInfo.student_pk }&notice_like=0&notice_dislike=1"><i class="bi bi-hand-thumbs-down fs-1" style="color: black"></i></a>
						</div>
					</c:if>
					<c:if test="${upThumbCheck == 1 }">
						<div class="col">
							<a href="./deleteNoticeLike?notice_id=${list.noticeBoardDto.id }&student_pk=${sessionStudentInfo.student_pk }"><i class="bi bi-hand-thumbs-up-fill fs-1" style="color: black"></i></a>
						</div>
						<div class="col">
							<button class="icon-button" type="button" onclick="handleClick()">
							    <i class="bi bi-hand-thumbs-down fs-1" style="color: black"></i>
							</button>
						</div>
					</c:if>
					<c:if test="${downThumbCheck == 1 }">
						<div class="col">
							<button class="icon-button" type="button" onclick="handleClick()">
								<i class="bi bi-hand-thumbs-up fs-1" style="color: black"></i>
							</button>
						</div>
						<div class="col">
							<a href="./deleteNoticeDisLike?notice_id=${list.noticeBoardDto.id }&student_pk=${sessionStudentInfo.student_pk }"><i class="bi bi-hand-thumbs-down-fill fs-1" style="color: black"></i></a>
						</div>
					</c:if>
		
					<div class="col"></div>
					<div class="col"></div>
				</div>
				<div class="row">
					<div class="col text-end">
						<a class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;" href="./noticeMainPage_Staff"><i class="bi bi-card-list" style="color: red"></i>&nbsp;&nbsp;목록</a>
					</div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>		
	</div>
	<!-- 댓글 -->
	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col">
				<div class="row">
					<div class="col">댓글&nbsp;(${commentCount })</div>
				</div>
				<div id="commentListBox" class="row">
					<div class="col">

					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-1"></div>
			<div class="col">
				<div class="row">
					<div class="col fw-bold">공지사항</div>
					<div class="col"></div>
					<div class="col"></div>
				</div>
				<div class="row fw-bold">
					<div id="headerSize" class="col-1"><i class="bi bi-chat-square-text-fill"></i>&nbsp;&nbsp;글번호</div>
					<div id="headerSize" class="col-8"><i class="bi bi-emoji-expressionless-fill"></i>&nbsp;&nbsp;제목</div>
					<div id="headerSize" class="col-1"><i class="bi bi-emoji-heart-eyes-fill"></i>&nbsp;&nbsp;작성자</div>
					<div id="headerSize" class="col-1"><i class="bi bi-person-arms-up"></i>&nbsp;&nbsp;조회수</div>
					<div id="headerSize" class="col-1"><i class="bi bi-calendar-heart-fill"></i>&nbsp;&nbsp;작성일</div>
				</div>
				<div id="noticeListBox" class="row">
					<div class="col">
						
					</div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	
	<!-- footer start -->
	<div class="row mt-5" style="background-color: #686868; height: 11.3em;">
		<div class="col-1"></div>
		<div class="col">
			<div class="row" style="height: 2.5em;"></div>
			<div class="row">
				<div class="col">
					<span style="font-size: 1.1em; color: #FF8200; font-weight: 500;">개인정보처리방침</span>
					<span style="font-size: 0.9em; color: white; font-weight: 500;">▪</span>
					<span style="font-size: 0.9em; color: white; font-weight: 500;">이메일무단수집거부</span>
				</div>
			</div>
			<div class="row pt-4">
				<div class="col">
					<div style="color:#d2d2d2; font-size: 0.9em;">서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층) / 대표자:정현경 / 사업자등록번호:220-90-07535 / 통신판매번호:제 강남-8062호 / TEL:02-561-1911 / FAX:02-538-2613</div>
				</div>
			</div>
			<div class="row pt-2">
				<div class="col">
					<div style="color:#d2d2d2; font-size: 0.9em;">©2023 MK NATIONAL UNIVERSITY. ALL RIGHTS RESERVED.</div>
				</div>
			</div>
		</div>
		<div class="col-1"></div>
	</div>
	<!-- footer end -->
	
	<div id="templete" class="d-none">
		<div class="commentWrapper row">
			<div class="col-1 border-bottom"><i class="bi bi-chat-dots-fill" style="color: orange;"></i></div>
			<div class="commentText col border-bottom"></div>
			<div class="commentNickname col-2 border-bottom"></div>
			<div class="commentDate col-2 border-bottom"></div>
		</div>		
	</div>
	<div id="templeteNoticeList" class="d-none">
		<div class="noticeWrapper row">
			<div class="noticePk col-1"></div>
			<div class="noticeTitle col-8">
				<div class="row">
					<div class="col-9">
						<a class="titleUrl link-offset-2 link-underline link-underline-opacity-0 ps-2" style="color: black"></a>
						<span class="titleSpan fw-bold text-danger" style="font-size:0.7em;"></span>
						<span class="imageSpan"></span>
					</div>
					<div class="col pe-0 text-end">
						<span class="likeSpan fw-bold" style="font-size:0.7em;"></span>
					</div>
					<div class="col ps-0 pe-4 text-end">
						<span class="dislikeSpan fw-bold" style="font-size:0.7em;"></span>
					</div>
				</div>
			</div>
			<div class="noticeNickname col-1 text-end pe-1"></div>
			<div class="noticeReadCount col-1 text-end pe-4"></div>
			<div class="noticeDate col-1 text-center ps-4 pe-0"></div>
		</div>
	</div>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>