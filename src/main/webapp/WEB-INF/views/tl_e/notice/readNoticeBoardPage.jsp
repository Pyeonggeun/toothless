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
<script>

	const notice_id = ${list.noticeBoardDto.id};

	function handleClick() {
	}
	
	function formSubmit() {
		const frm = document.getElementById("frm");
		const inputComment = document.getElementById("inputComment");
		
		if(inputComment.value == ''){
			alert("값을 입력해야 합니다.");
			inputComment.focus();
			return ;
		}
		
		frm.submit();
	}
	
	function writeComment() {
		
		const inputComment = document.getElementById("inputComment");
		const commentValue = inputComment.value;
		
		const url = "./writeComment"
		
		fetch(url, {
			method: "post",
			headers: {	// post 방식일때
				"Content-Type": "application/x-www-form-urlencoded"
			},
			body: "text=" + commentValue + "&notice_id=" + notice_id	// 값을 보내는곳
		})
		.then(response => response.json())
		.then(response => {
			inputComment.value = "";
			reloadCommentList();
		});
		
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
				commentDate.innerText = e.noticeCommentDto.created_at;
				// 날짜 원하는대로 출력 pattern(yy.MM.dd)
				const date = new Date(e.noticeCommentDto.created_at);
				commentDate.innerText = date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate();
				// 댓글 내용 호출
				const commentText = commentWrapper.querySelector(".commentText");
				commentText.innerText = e.noticeCommentDto.text;
			
				const commentDelete = commentWrapper.querySelector(".commentDelete");
				commentDelete.setAttribute("onclick", "deleteComment("+e.noticeCommentDto.id+")");
				
				if(${sessionStudentInfo == null} || ${sessionStudentInfo.student_pk} != e.studentInfoDto.student_pk){
					commentDelete.remove();
				}

				commentListBox.appendChild(commentWrapper);
				
			}
			
		});
	}
	
	function deleteComment(id){
		const url = "./deleteComment?id=" + id;
		fetch(url)
		.then(response => response.json())
		.then(response => {
			reloadCommentList();
		});
	}

	
	// 해당 jsp화면이 열리면? 실행되야하는 함수
	window.addEventListener("DOMContentLoaded", () => {
		reloadCommentList();
		
	});
	
	
</script>
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
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-1"></div>
			<div class="col">
				<div class="row">
					<div class="col-1 mt-3 mb-1 fw-bold">공지사항</div>
					<div class="col"></div>
					<c:if test="${!empty sessionStaffInfo }">
						<div class="col-1 mt-3 mb-1 fw-bold">${sessionStaffInfo.name }님</div>
					</c:if>
					<c:if test="${!empty sessionStudentInfo }">
						<div class="col-1 mt-3 mb-1 fw-bold">${sessionStudentInfo.name }님</div>
					</c:if>
				</div>
				<!-- 공지사항 제목 -->
				<div class="row">
					<div class="col ">
						<div class="row mt-3">
							<div class="col-1 mb-1 border-top fs-5">제목 &nbsp;&nbsp;</div>
							<div class="col mb-1 border-top fs-5">${list.noticeBoardDto.title }</div>
							<c:if test="${!empty sessionStaffInfo&&sessionStaffInfo.staff_pk==list.noticeBoardDto.staff_pk}">	
								<div class="col-1 border-top">
									<div class="row">
										<div class="col" style="font-size: 0.8em;">
											<a class="link-offset-2 link-underline link-underline-opacity-0" style="color: black" href="./deleteNoticeArticleProcess?id=${list.noticeBoardDto.id }">삭제</a>
										</div>
									</div>
								</div>
								<div class="col-1 border-top">
									<div class="row">
										<div class="col" style="font-size: 0.8em;">
											<a class="link-offset-2 link-underline link-underline-opacity-0" style="color: black" href="./updateNoticeArticlePage?id=${list.noticeBoardDto.id }">수정</a>
										</div>
									</div>
								</div>
							</c:if>
							<div class="col-1 mb-1 border-top" style="font-size: 0.8em"><fmt:formatDate value="${list.noticeBoardDto.created_at }" pattern="yyyy-MM-dd"/></div>
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
					<div class="col">
						<a class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;" href="./noticeMainPage"><i class="bi bi-card-list"></i>&nbsp;&nbsp;목록</a>
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
				<c:if test="${!empty sessionStudentInfo }">
					<!--  
					<form id="frm" action="./writeNoticeCommentProcess" method="post">
						<div class="row mt-3">
							<div class="col-9">
								<input id="inputComment" name="text" type="text" style="width:100%; height: 2em">
								<input name="notice_id" type="hidden" value="${list.noticeBoardDto.id }">
								<input name="student_pk" type="hidden" value="${sessionStudentInfo.student_pk }">
							</div>
							<div class="col">
								<input type="button" onclick="formSubmit()" style="width:100%; height: 2em" value="댓글띠">
							</div>
						</div>
					</form>
					-->
					<div class="row mt-3">
						<div class="col-9">
							<input id="inputComment" name="text" type="text" style="width:100%; height: 2em">
						</div>
						<div class="col d-grid">
							<button onclick="writeComment()" style="width:100%; height: 2em">댓글띠</button>
						</div>
					</div>
				</c:if>
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row mt-3">
			<div class="col-1"></div>
			<div class="col">
				<div class="row fw-bold" style="background-color: silver;">
					<div id="headerSize" class="col-1 border"><i class="bi bi-caret-right-fill"></i>&nbsp;&nbsp;글번호</div>
					<div id="headerSize" class="col-8 border"><i class="bi bi-book-fill"></i>&nbsp;&nbsp;제목</div>
					<div id="headerSize" class="col-1 border"><i class="bi bi-person-arms-up"></i>&nbsp;&nbsp;작성자</div>
					<div id="headerSize" class="col-1 border"><i class="bi bi-mouse-fill"></i>&nbsp;&nbsp;조회수</div>
					<div id="headerSize" class="col-1 border"><i class="bi bi-calendar-fill"></i>&nbsp;&nbsp;작성일</div>
				</div>
				<div class="row">
					<c:forEach items="${mainList }" var="mainList">
						<div id="headerSize" class="col-1 border"><i class="bi bi-caret-right-fill"></i>${mainList.noticeBoardDto.id }</div>
						<div class="col-8 border">
							<div class="row">
								<div class="col-10">
									<a class="link-offset-2 link-underline link-underline-opacity-0" style="color: black" href="./readNoticeBoardPage?id=${mainList.noticeBoardDto.id }">${mainList.noticeBoardDto.title }</a>
									<c:if test="${mainList.commentCount > 0 }">
										<span style="font-size: 0.7em; color: red; font-weight: bold;">[${mainList.commentCount }]</span> 
									</c:if>
									<c:if test="${mainList.imageCount > 0 }">
										<i class="bi bi-card-image"></i>
									</c:if>
								</div>
								<div class="col-1">
									<span class="badge text-bg-light" style="font-size: 0.7em; color: red;">추천[${mainList.likeCount }]</span>
								</div>
								<div class="col-1">
									<span class="badge text-bg-light" style="font-size: 0.7em;">비추[${mainList.disLikeCount }]</span>
								</div>
							</div>
						</div>
						<div id="headerSize" class="col-1 border">${mainList.staffInfoDto.name }</div>
						<div id="headerSize" class="col-1 border">${mainList.noticeBoardDto.read_count }</div>
						<div id="headerSize" class="col-1 border"><fmt:formatDate value="${mainList.noticeBoardDto.created_at }" pattern="yy-MM-dd"/></div>
					</c:forEach>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	<div id="templete" class="d-none">
		<div class="commentWrapper row">
			<div class="col border-bottom"><i class="bi bi-chat-dots"></i></div>
			<div class="commentText col border-bottom">댓글내용</div>
			<div class="commentNickname col border-bottom">댓글작성자</div>
			<div class="commentDate col border-bottom">작성일</div>
			<div class="commentDelete">삭제</div>
		</div>		
	</div>
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>