<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>       
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <title>교육 학생 메인</title>
    </head>
    <body>
        <div class="container-fluid">
        	<jsp:include page="../hs/eduStudentTopBanner.jsp"></jsp:include>
            <div class="row">
				<div class="col">
					<div class="row">
						<div class="col"></div>
						<div class="col-8 text-start">
							<a href="./eduMainPageForStudent" class="btn btn-sm fw-bold" 
							style="color: #4c4a4c;">메인페이지</a>
							<a href="./eduMyPageForStudent" class="btn btn-sm fw-bold"
							style="color: #4c4a4c;">마이페이지</a>
						</div>
						<div class="col"></div>
					</div>
				</div>
			</div> 
			<div class="row">
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
							<div class="row py-1 border-bottom">
								<div class="col-1 align-self-center text-center"><!--글번호 -->
									${map.eduDto.edu_pk }
								</div>
								
								<div class="col-2 align-self-center fw-bold" ><!-- 이미지 -->
									
									<a href="./readEduProgPageForStudent?edu_pk=${map.eduDto.edu_pk}">
										<img class="img img-fluid"
										src="../../resources/img/healthRoom/edu/${map.eduDto.img_link }"
										style="max-height: 220px; width: 180px;" >
									</a>	

								</div>

								<!-- 프로그램 간단 정보 -->
								<div class="col my-5 ps-5">

									<div class="row">
										<div class="col">
											<h5>
												<span class="badge px-3 text-white" 
												style="background-color: #133369;">진행중
												</span>
												<span class="badge px-3 text-white" 
												style="background-color: #F3AD12;">학생
												</span>
											</h5>
										</div>
									</div>

									<div class="row">
										<div class="col">
											
											<span class="badge px-3 text-white" 
											style="background-color: #007141; font-size: 14px;
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

									
									
									<div class="row">
										<div class="col fw-bold align-self-center text-start"
										style="font-size: 16px; color: #535D66;">
											<span>신청기간</span>
											<span><fmt:formatDate
											value="${map.eduDto.apply_start_date}"
											pattern="yy. MM. dd"/></span>
											~
											<span><fmt:formatDate
											value="${map.eduDto.apply_end_date}"
											pattern="yy. MM. dd"/></span>
										</div>
									</div>
									
									<div class="row">
										<div class="col fw-bold align-self-center text-start"
										style="font-size: 16px; color: #535D66;">
											<span>교&nbsp;육&nbsp;&nbsp;일</span>
											<span><fmt:formatDate
											value="${map.eduDto.edu_date}"
											pattern="yy. MM. dd"/></span>
										</div>
									</div>
									
									<div class="row">
										<div class="col fw-bold align-self-center text-start"
										style="font-size: 16px; color: #535D66;">
											<span>모집인원</span>
											<span>${map.eduDto.capacity }</span>
										</div>
									</div>

									<div class="row">
										<div class="col fw-bold align-self-center text-start"
										style="font-size: 16px; color: #535D66;">
											<span>조&nbsp;회&nbsp;&nbsp;수</span>
											<span>10</span>
										</div>
									</div>
									
									


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
		
			<pre>
			
			
			
			
			
			</pre>
			
            <!-- 푸터 시작 -->
            <div class="row">
                <div class="col">
                    <div class="row">
                        <div class="col py-4" style="background-color: #F2F2F2;">
                            <div class="row" style="margin-left: 16%; margin-right: 16%;">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-1 my-auto">
                                            <img class="img-fluid" src="../../resources/img/another/logo_black.png">
                                        </div>
                                        <div class="col-3 ps-0 my-auto" style="font-size: x-large">
                                            MK University | 보건센터
                                        </div>
                                        <div class="col text-body-tertiary my-auto" style="font-size: small;">
                                            <p class="my-0">서울특별시 강남구 테헤란로7길 7 에스코빌딩 6~7층&emsp;전화 : 02&#41;561-1911&emsp;팩스 : 02&#41;561-1911</p>
                                            <p class="my-0">COPYRIGHT&#40;C&#41; University of Seoul ALL RIGHTS RESERVED.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 푸터 끝 -->
                    
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>