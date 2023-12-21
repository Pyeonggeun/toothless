<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="col">
			<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
		</div>
	</div>
	<div class="row">
		<div class="col-3">
			<div class="row">
				<div class="col">
					<jsp:include page="../common/staffMenu.jsp"></jsp:include>				
				</div>
			</div>
		</div>
		
		<div class="col-9">
			<div class="row border pt-2 mt-5">
				<div class="col">				
					<div class="row " style="font-size:1.2em;">
						<div class="col fw-bold">
							만족도 조사 답변
						</div>		
						<div class="col text-right" style="font-size:0.7em; text-align:right">
							<fmt:formatDate value="${detailHJFInfo.hopeJobFeedbackDto.created_at}" pattern="yyyy-MM-dd"/>
						</div>										
					</div>
					<div class="row mt-3 pt-2 border-top">
						<div class="col-3 fw-bold border-end">
							응답 번호
						</div>	
						<div class="col-9">
							${detailHJFInfo.hopeJobFeedbackDto.hope_job_feedback_pk }
						</div>																		
					</div>
					<div class="row mt-3">
						<div class="col-3 fw-bold border-end">
							이름
						</div>	
						<div class="col-9">
							${detailHJFInfo.studentInfoDto.name }
						</div>												
					</div>
					<div class="row mt-3">
						<div class="col-3 fw-bold border-end">
							점수
						</div>	
						<div class="col-9">
							${detailHJFInfo.hopeJobFeedbackDto.hjf_score }
						</div>												
					</div>
					<div class="row mt-3">
						<div class="col-3">
							<div class="row pt-3">
								<div class="col fw-bold">
									기타사항
								</div>
							</div>
							<div class="row pt-4">
								<div class="col">
									${detailHJFInfo.hopeJobFeedbackDto.hjf_comment}
								</div>
							</div>							
						</div>	
											
					</div>		
																															
				</div>
			</div>
			
			<div class="col mt-5">
				<a class="navbar-brand" href="./FeedbackListPage">목록으로</a>
			</div>				
			
			

			
		</div>		
	</div>
	<div class="row mb-5 pb-5"><div class="col mb-5 pb-5"></div></div>
	<!-- futter -->
	<div class="row">
		<div class="col">
			<jsp:include page="../common/futter.jsp"></jsp:include>
		</div>
	</div>	
</div>











<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>