<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
		    <div class="col">
		        <div class="row">
		            <div class="col py-2 fw-bold text-white" style="background-color: #014195">
		                <a href="../common/studentMainPage" class="link-underline link-underline-opacity-0 link-dark">
		                	<img class="img-fluid" src="../../resources/img/another/logo_black.png" style="width: 4%;">
		                </a>	
		                	<span style="font-size: 1em; word-spacing: -0.25em">MK University</span>&nbsp;|<span style="font-size: 1em"> 보건센터</span>&nbsp;|<span style="font-size: 1em"> 물품목록</span>    
		               
	            	</div>
	        	</div>
	    	</div>
		</div>
		<div class="row mt-4 mb-5" style="margin-left: 16%; margin-right: 16%;">
			<c:forEach items="${itemList }" var="e">
				<div class="col-3 pt-5 ps-3">
					<img class="img-fluid" src="/uploadFiles/mainImage/${e.itemDto.img_link}">	
					<div class="row mt-1">
						<div class="col fw-bold"> 
							카테고리명: ${e.itemCatDto.name }
							<div class="row mt-1">
								<div class="col fw-bold">
									물품명: ${e.itemDto.name }
									<div class="row mt-1">
										<div class="col fw-bold">
										<div class="row mt-5">
											<div class="col-6"></div>
											<div class="col">
												<c:choose>
													<c:when test="${e.status eq 'N' or empty e.status  }">
														<a href="./studentItemApplyPage?item_pk=${e.itemDto.item_pk }" class="btn text-white" style="background-color: #014195">신청하기</a>
													</c:when>
													<c:when test="${e.status eq 'Y' }">
														<button disabled="disabled" class="btn text-white" style="background-color: #014195">대여중</button>
													</c:when>
												</c:choose>
											</div>
										</div>
										</div>
									</div>
								</div>
							</div>
						</div> 
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>