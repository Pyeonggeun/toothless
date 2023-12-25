<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>       
<!DOCTYPE html>
<html>
    <head>
        <script src="../../resources/js/hn/topBanner.js"></script>
    
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <title>교육 학생 메인</title>
    </head>
    <body>
    <jsp:include page="../../another/commons/studentNaviLogo.jsp"></jsp:include>
    <jsp:include page="../commonJsp/studentTopBanner.jsp"></jsp:include>
        <div class="container-fluid">
			
			<!-- 메인 사진      
			<div class="row">
           		<div class="col px-0">
               		<img class="img-fluid" src="../../resources/img/healthRoom/mainPage/adhy-savala-zbpgmGe27p8-unsplash.jpg"
               		style="height: 14vh; width: 100%; object-fit: cover; object-position: 70% 90%;">
               		
	            </div>
	        </div>-->   
	        	
        	
			<div class="row mt-4">
				<div class="col"></div>
				<div class="col-8"> <!--교육목록-->
					<div class="row">
						<div class="col">
						</div>
						<div class="col text-center fw-bold" style="font-size: 1.5em;">
							보건 교육프로그램
						</div>
						<div class="col-4">
							
						</div>
					</div>
					
					<div class="row">
						<div class="col justify-content-end">
							<form action="./eduMainPageForStudent" method="get">
							<div class="row mt-3 text-end"><!-- 검색  -->
								<div class="col-8"></div>
								<div class="col">
									<div class="row justify-content-end">
										<div class="col-1"></div>
										<div class="col-4 px-1 text-end">
											<select name="searchType" class="form-select form-select-sm">
												<option value="eduName" selected>프로그램명</option>
												<option value="name">작성자</option>
												<option value="content">내용</option>
											</select>
										</div>
										<div class="col px-1">
											<div class="row justify-content-end">
												<div class="col-11 text-end">
													<input  name="searchWord" 
													type="text" 
													class="form-control form-control-sm">
												</div>
												<div class="col text-start p-0 ">
													<button type="submit" 
													class="p-0 btn btn-white btn-sm w-10">
														<i class="bi bi-search-heart"
														style="font-size: 18px;"></i>
													</button>
												</div>
											</div>
										</div>	
									</div>
								</div>
							</div>
							</form>
						</div>
					</div>
					
					<div class="row mt-3">
						<div class="col">
							<div class="row fw-bold pb-1 border-bottom border-dark">
								
							</div>
							
							<c:forEach items="${list }" var="map">
							<div class="row my-0 border-bottom">
								<%-- <div class="col-1 align-self-center text-center"><!--글번호 -->
									${map.eduDto.edu_pk }
								</div> --%>
								
								<div class="col-2 align-self-center fw-bold" ><!-- 이미지 -->
									
									<a href="./readEduProgPageForStudent?edu_pk=${map.eduDto.edu_pk}">
										<img class="img img-fluid"
										src=" /uploadFiles/eduImage/${map.eduDto.img_link }"
										style="max-height: 200px; width: 160px;" >
									</a>	

								</div>

								<!-- 프로그램 간단 정보 -->
								<div class="col my-4 ps-5">

									<div class="row">
										<div class="col">
											<h5>
												<span class="badge px-3 text-white" 
												style="background-color: #023048;">진행중
												</span>
												<span class="badge px-3 text-white" 
												style="background-color: #FFB604;">학생
												</span>
											</h5>
										</div>
									</div>

									<div class="row">
										<div class="col">
											
											<span class="badge px-3 text-white" 
											style="background-color: #229EBD; font-size: 14px;
											border-radius: 100%;">
											중앙
											</span>
											
											<span class="col fw-bold" style="font-size: 20px;">
												<a href="./readEduProgPageForStudent?edu_pk=${map.eduDto.edu_pk}"
												style="text-decoration: none;"
												class="text-black">
												${map.eduDto.name }
												</a>
											</span>
											
										</div>
									</div>

									
									
									<div class="row mt-2">
										<div class="col align-self-center text-start"
										style="font-size: 16px; color: #535D66;">
											<span>신청기간</span>
											<span class="fw-bold ms-2"><fmt:formatDate
											value="${map.eduDto.apply_start_date}"
											pattern="yy년 MM월 dd일"/></span>
											~
											<span class="fw-bold"><fmt:formatDate
											value="${map.eduDto.apply_end_date}"
											pattern="yy년 MM월 dd일"/></span>
										</div>
									</div>
									
									<div class="row">
										<div class="col align-self-center text-start"
										style="font-size: 16px; color: #535D66;">
											<span>교&nbsp;육&nbsp;&nbsp;일</span>
											<span class="fw-bold ms-2"><fmt:formatDate
											value="${map.eduDto.edu_date}"
											pattern="yy년 MM월 dd일"/></span>
										</div>
									</div>
									
									<div class="row">
										<div class="col align-self-center text-start"
										style="font-size: 16px; color: #535D66;">
											<span>모집인원</span>
											<span class="fw-bold ms-2">
											${map.eduDto.capacity }명
											</span>
										</div>
									</div>

									<!-- <div class="row">
										<div class="col align-self-center text-start"
										style="font-size: 16px; color: #535D66;">
											<span>조&nbsp;회&nbsp;&nbsp;수</span>
											<span class="fw-bold ms-2">
											10
											</span>
										</div>
									</div> -->
									
									


								</div>

								<div class="col-2 align-self-center text-center">
									<a href="./readEduProgPageForStudent?edu_pk=${map.eduDto.edu_pk}">
										<img class="img-fluid" src="../../resources/img/healthRoom/edu/상세보기캡쳐.JPG"
										style="max-height: 130px; width: 130px;"
										>
									</a>	
								</div>



								
							</div>
							</c:forEach>
						</div>
					</div>
				</div> <!--교육목록 끝-->
				
				<div class="col"></div>
			</div>
			
			<div class="row my-5"></div>
		
			
			
			
			
            <!-- 푸터 시작 -->
             <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>

            <!-- 푸터 끝 -->
                    
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>