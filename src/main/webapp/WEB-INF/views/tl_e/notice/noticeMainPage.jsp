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

</style>


<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col"></div>
			<div class="col"></div>
			<div class="col"><div class="title-font" style="font-size:3em;">공지사항</div></div>
			<div class="col"></div>
			<div class="col">
				<div class="row">
					<c:choose>
						<c:when test="${!empty sessionStaffInfo }">
							<div class="col mt-3 fs-6">${sessionStaffInfo.name }님</div>
						</c:when>
						<c:otherwise>
							<div class="col mt-3 fs-6">${sessionStudentInfo.name }님</div>
						</c:otherwise>
					</c:choose>
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
					<div class="col-2 border">베스트글</div>
					<div class="col-4 border">제목</div>
					<div class="col-2 border">작성자</div>
					<div class="col-2 border">조회수</div>
					<div class="col-2 border">작성일</div>
				</div>
				<div class="row">
					<c:forEach items="${bList }" var="bList">
						<div class="col-2 border">${bList.ID }</div>
						<div class="col-4 border">${bList.TITLE }</div>
						<div class="col-2 border">${bList.NAME }</div>
						<div class="col-2 border">${bList.READ_COUNT }</div>
						<div class="col-2 border">${bList.CREATED_AT }</div>
					</c:forEach>
				</div>
				<br>
				<br>
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
							<button class="btn btn-primary">검색</button>
						</div>
					</div>
				</form>
				<div class="row">
					<div class="col-2 border">글번호</div>
					<div class="col-4 border">제목</div>
					<div class="col-2 border">작성자</div>
					<div class="col-2 border">조회수</div>
					<div class="col-2 border">작성일</div>
				</div>
				<div class="row">
					<c:forEach items="${list }" var="list">
						<div class="col-2 border">${list.noticeBoardDto.id }</div>
						<div class="col-4 border">
							<a href="./readNoticeBoardPage?id=${list.noticeBoardDto.id }">${list.noticeBoardDto.title }</a>
							<span class="badge text-bg-secondary">${list.commentCount }</span>
							<span class="badge text-bg-secondary">추천[${list.likeCount }]</span>
							<span class="badge text-bg-secondary">비추[${list.disLikeCount }]</span>
						</div>
						<div class="col-2 border">${list.staffInfoDto.name }</div>
						<div class="col-2 border">${list.noticeBoardDto.read_count }</div>
						<div class="col-2 border"><fmt:formatDate value="${list.noticeBoardDto.created_at }" pattern="yyyy-MM-dd"/></div>
					</c:forEach>
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
				<div class="row">
					<div class="col">
						<div>여기엔 뭘 넣을까요</div>
					</div>
				</div>			
			</div>
		</div>
		
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>