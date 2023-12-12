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
<script>
	function handleClick() {
	}
</script>
<style>
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
				<c:forEach items="${cList }" var="cList">
					<div class="row">
						<div class="col border-bottom"><i class="bi bi-chat-dots"></i></div>
						<div class="col border-bottom">${cList.noticeCommentDto.text }</div>
						<div class="col border-bottom">${cList.studentInfoDto.name }</div>
						<div class="col border-bottom"><fmt:formatDate value="${cList.noticeCommentDto.created_at }" pattern="yy-MM-dd hh-mm"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<c:if test="${sessionStudentInfo.student_pk==cList.noticeCommentDto.student_pk }">
								<a class="link-offset-2 link-underline link-underline-opacity-0" style="color: black" href="./deleteNoticeArticleCommentProcess?id=${cList.noticeCommentDto.id }&notice_id=${cList.noticeCommentDto.notice_id}">삭제</a>
							</c:if>
						</div>
					</div>
				</c:forEach>
				<c:if test="${!empty sessionStudentInfo }">
					<form action="./writeNoticeCommentProcess" method="post">
						<div class="row mt-3">
							<div class="col-9">
								<input name="text" type="text" style="width:100%; height: 2em">
								<input name="notice_id" type="hidden" value="${list.noticeBoardDto.id }">
								<input name="student_pk" type="hidden" value="${sessionStudentInfo.student_pk }">
							</div>
							<div class="col">
								<input type="submit" style="width:100%; height: 2em" value="댓글띠">
							</div>
						</div>
					</form>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>