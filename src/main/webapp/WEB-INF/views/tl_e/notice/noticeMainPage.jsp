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


<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-10">
				<div class="row">
					<div class="col-1"></div>
					<div class="col"><div class="title-font" style="font-size:3em;">공지사항</div></div>
					<div class="col-1">
						<div class="row text-end">
							<c:choose>
								<c:when test="${!empty sessionStaffInfo }">
									<div class="col mt-3 fs-6">${sessionStaffInfo.name }님</div>
								</c:when>
								<c:otherwise>
									<div class="col mt-3 fs-6">${sessionStudentInfo.name }님</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="col-2">
						<div class="row">
							<c:choose>
								<c:when test="${!empty sessionStaffInfo }">
									<div class="col mt-3 fs-6"><a href="./staffReturnToMainPage"><i class="bi bi-chevron-double-left"></i></a></div>
								</c:when>
								<c:otherwise>
									<div class="col mt-3 fs-6"><a href="./studentReturnToMainPage"><i class="bi bi-chevron-double-left"></i></a></div>
								</c:otherwise>
							</c:choose>
							<div class="col mt-3 fs-6"><a href="./logoutProcess"><i class="bi bi-box-arrow-right"></i></a></div>
							<c:if test="${!empty sessionStaffInfo }">
								<div class="col mt-3 fs-6">
									<a href="./writeNoticeArticlePage">글쓰기</a>
								</div>
							</c:if>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-2 border-top">
				<div class="row mb-2 ms-3">
					<div class="col" style="font-size: 2em">상담관리</div>
				</div>
				<div class="row mb-2 ms-3">
					<div class="col" style="font-size: 1em">온라인 상담</div>
				</div>
				<div class="row mb-2 ms-3">
					<div class="col" style="font-size: 1em">오프라인 상담</div>
				</div>
				<div class="row mb-2 ms-3">
					<div class="col" style="font-size: 1em">집단 상담</div>
				</div>
				<div class="col border-top"></div>
				<div class="row mb-2 ms-3">
					<div class="col" style="font-size: 2em">상담원 관리</div>
				</div>
				<div class="row mb-2 ms-3">
					<div class="col" style="font-size: 1em">상담원 등록</div>
				</div>
				<div class="row mb-2 ms-3">
					<div class="col" style="font-size: 1em">상담원 조회</div>
				</div>
				<div class="col border-top"></div>
				<div class="row mb-2 ms-3">
					<div class="col" style="font-size: 1em">공지사항</div>
				</div>
				<div class="row mb-2 ms-3">
					<div class="col" style="font-size: 1em">문의사항</div>
				</div>
			</div>
			<div class="col">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<form action="./noticeMainPage" method="get">
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
						<div id="tableHeader" class="row fw-bold py-2 bg-secondary-subtle text-black-50 bg-white">
							<div class="col-1"><i class="bi bi-caret-right-fill"></i>&nbsp;&nbsp;글번호</div>
							<div class="col-8"><i class="bi bi-book-fill"></i>&nbsp;&nbsp;제목</div>
							<div class="col-1"><i class="bi bi-person-arms-up"></i>&nbsp;&nbsp;작성자</div>
							<div class="col-1"><i class="bi bi-mouse-fill"></i>&nbsp;&nbsp;조회수</div>
							<div class="col-1"><i class="bi bi-calendar-fill"></i>&nbsp;&nbsp;작성일</div>
						</div>
						<c:forEach items="${bList }" var="bList">
							<div class="row py-1">
								<div id="numberSize" class="col-1"><i class="bi bi-caret-right-fill"></i>${bList.ID }</div>
								<div class="col-8">
									<div class="row">
										<div class="col-1"><i class="bi bi-star-fill" style="color: silver;"></i></div>
										<div class="col fs-5"><a class="link-offset-2 link-underline link-underline-opacity-0" href="./readNoticeBoardPage?id=${bList.ID }" style="color: black">${bList.TITLE }</a></div>
									</div>
								</div>
								<div id="numberSize" class="col-1">${bList.NAME }</div>
								<div id="numberSize" class="col-1">${bList.READ_COUNT }</div>
								<div id="numberSize" class="col-1"><fmt:formatDate value="${bList.CREATED_AT }" pattern="yy-MM-dd"/></div>
							</div>
						</c:forEach>
						<c:forEach items="${list }" var="list">
							<div class="row py-1">
								<div id="numberSize" class="col-1"><i class="bi bi-caret-right-fill"></i>${list.noticeBoardDto.id }</div>
								<div class="col-8">
									<div class="row">
										<div class="col-10">
											<a class="link-offset-2 link-underline link-underline-opacity-0 fs-5" href="./readNoticeBoardPage?id=${list.noticeBoardDto.id }" style="color: black">${list.noticeBoardDto.title }</a>
											<c:if test="${list.commentCount > 0 }">
												<span style="font-size: 0.7em; color: red; font-weight: bold;">[${list.commentCount }]</span> 
											</c:if>
											<c:if test="${list.imageCount > 0 }">
												<i class="bi bi-card-image"></i>
											</c:if>
										</div>
										<div class="col-1">
											<span class="badge text-bg-light" style="font-size: 0.7em; color: red;">추천[${list.likeCount }]</span>
										</div>
										<div class="col-1">
											<span class="badge text-bg-light" style="font-size: 0.7em;">비추[${list.disLikeCount }]</span>
										</div>
									</div>
								</div>
								<div id="numberSize" class="col-1">${list.staffInfoDto.name }</div>
								<div id="numberSize" class="col-1">${list.noticeBoardDto.read_count }</div>
								<div id="numberSize" class="col-1"><fmt:formatDate value="${list.noticeBoardDto.created_at }" pattern="yy-MM-dd"/></div>
							</div>
						</c:forEach>
						<div class="row">
							<div class="col">
								<div>여기엔 뭘 넣을까요</div>
							</div>
						</div>	
						<div class="row">
							<div class="col">
								<div>여기엔 뭘 넣을까요</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div>여기엔 뭘 넣을까요</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div>여기엔 뭘 넣을까요</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div>여기엔 뭘 넣을까요</div>
							</div>
						</div>	
					</div>	
					<div class="col-1"></div>	
				</div>
			</div>
		</div>
		
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>