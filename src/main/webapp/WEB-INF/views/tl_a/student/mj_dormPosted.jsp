<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .menus{
            text-align: center;
            float: inline-block;
        }
        .gold{
            color: #8C7430;
        }
        
        
 
    </style>
    <script>
        //js주석
        /*여러줄 주석*/
        
    </script>
</head>
<body>
    <jsp:include page="../commons/student/topNavi.jsp"></jsp:include>
    <div class="row">
        <div class="col">
            <img src="../../resources/img/dormitory/studentMainLogo.jpg">
        </div>
    </div>


    <div class="container mt-3">
        <div class="row">
            <div class="col-3 me-3"><!-- 여기부분은 목차부분 -->
                <div class="row rounded-1 opacity-90" style="background-color: #504528;">
                    <div class="col py-4 text-center">
                        <span class="fw-bold" style="color: white; font-size: x-large;">모집안내</span>
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.2em solid #504528;">
                    <div class="col py-3 fw-bold" style="font-size: large;">
                        <span style="color: #504528;">공고 및 입주신청</span>       
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">선발 안내</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">거리 배점표</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">납부금 안내</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">합격 조회</span>         
                    </div>
                </div>
            </div>
            <!-- 왼쪽 목차 끝 -->
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">공고 및 입주신청</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 모집안내 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;">공고 및 입주신청</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="row"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                    	<div class="row mt-2">
                    		<div class="col py-3 text-center fw-bold" style="font-size: 1.5em;">
                    			${thisSemesterJoinDormInfo.thisSemesterDto.semester_year }년도 ${thisSemesterJoinDormInfo.thisSemesterDto.semester } 기숙사 입사 신청 안내
                    		</div>
                    	</div>
                        <div class="row mt-5">
							<div class="col fw-bold" style="font-size: 1.2em;">
								제목
							</div>             
                        </div>
                        <div class="row mt-1">
							<div class="col" style="font-size: 1.1em;">
								${thisSemesterJoinDormInfo.joinDormInfoDto.title }
							</div>             
                        </div>
                        <div class="row mt-3">
							<div class="col fw-bold" style="font-size: 1.2em;">
								상세 내용
							</div>             
                        </div>
                        <div class="row mt-1">
							<div class="col" style="font-size: 1.1em;">
								${thisSemesterJoinDormInfo.joinDormInfoDto.detail_expln }
							</div>             
                        </div>
                        <div class="row mt-3">
							<div class="col fw-bold" style="font-size: 1.2em">
								신청일 
							</div>             
                        </div>
                        <div class="row mt-1">
							<div class="col" style="font-size: 1.1em;">
								<fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.apply_start_date }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.apply_end_date }" pattern="yyyy-MM-dd"/>
							</div>             
                        </div>
                        <div class="row mt-3">
							<div class="col fw-bold" style="font-size: 1.2em;">
								선발인원
							</div>             
                        </div>
                        <div class="row mt-1">
							<div class="col" style="font-size: 1.1em;">
								${thisSemesterJoinDormInfo.joinDormInfoDto.selection_amount }
							</div>             
                        </div>
                        <div class="row mt-3">
							<div class="col fw-bold" style="font-size: 1.2em;">
								합격자발표일
							</div>             
                        </div>
                        <div class="row mt-1">
							<div class="col" style="font-size: 1.1em;">
								<fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.pass_anncm_date }" pattern="yyyy-MM-dd"/>
							</div>             
                        </div>
                        <div class="row mt-3">
							<div class="col fw-bold" style="font-size: 1.2em;">
								관비납부일
							</div>             
                        </div>
                        <div class="row mt-1">
							<div class="col" style="font-size: 1.1em;">
								<fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.payment_start_date }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.payment_end_date }" pattern="yyyy-MM-dd"/>
							</div>             
                        </div>
                        <div class="row mt-3">
							<div class="col fw-bold" style="font-size: 1.2em;">
								배정통보일
							</div>             
                        </div>
                        <div class="row mt-1">
							<div class="col" style="font-size: 1.1em;">
								<fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.asgnm_anncm_date }" pattern="yyyy-MM-dd"/>
							</div>             
                        </div>
                        <div class="row mt-3">
							<div class="col fw-bold" style="font-size: 1.2em;">
								입주일 
							</div>             
                        </div>
                        <div class="row mt-1">
							<div class="col" style="font-size: 1.1em;">
								<fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.join_dorm_date }" pattern="yyyy-MM-dd"/>
							</div>             
                        </div>
                        
                        <!-- 입사신청 버튼 -->
			            <div class="row my-5 pb-5">	
			                <div class="col px-0 text-end">
			                	<c:choose>
			                		<c:when test="${!empty sessionStudentInfo }">
			                			<c:if test="${isApply == 1 }">
						                    <button disabled type="button" class="rounded-0 fw-bold btn btn-lg btn-secondary text-white ms-1">신청 완료</button>
			                			</c:if>
			                			<c:if test="${isApply == 2 }">
			                				<a href="./mj_applyDormByInfoPage">
						                    <button type="button" class="rounded-0 fw-bold btn btn-lg btn-secondary text-white ms-1">입사 신청</button>
						                	</a>
			                			</c:if>
			                		</c:when>
			                		<c:otherwise>
			                			<a href="./loginPage">
					                    <button type="button" class="rounded-0 fw-bold btn btn-lg btn-secondary text-white ms-1">입사 신청</button>
					                	</a>
			                		</c:otherwise>
			                	</c:choose>
			                	
			                </div>                    
			            </div>
                        
                    </div>
            	</div>
              </div>
                <!-- 공고 끝 -->
                
            </div>
            
        </div>
        
        <!-- footer 부분-->
        <div class="row" style="background-color: #181C23;">
            <div class="col-2 pt-4">
                
            </div>
            <div class="col-6 py-4">
                <div class="row">
                    <div class="col-2 px-0 fw-bold text-center" style="color: #FFC00B; font-size: medium;">
                        개인정보처리방침
                    </div>
                    <div class="col px-0 pt-2 fw-bold text-center" style="color: #BABBBD; font-size: 0.3em;">
                        <span class="bi bi-circle-fill"></span>
                    </div>
                    <div class="col-2 px-0 fw-bold text-center" style="color: #BABBBD;">
                        이메일무단수집거부
                    </div>
                    <div class="col px-0 pt-2 fw-bold text-center" style="color: #BABBBD; font-size: 0.3em;">
                        <span class="bi bi-circle-fill"></span>
                    </div>
                    <div class="col-2 px-0 fw-bold text-center" style="color: #BABBBD;">
                        대학정보공시
                    </div>
                    <div class="col pt-2 px-0 fw-bold text-center" style="color: #BABBBD; font-size: 0.3em;">
                        <span class="bi bi-circle-fill"></span>
                    </div>
                    <div class="col-2 px-0 fw-bold text-center" style="color: #BABBBD;">
                        오시는길
                    </div>
                </div>
                <div class="row ms-1 mt-4" style="border-bottom: 0.01em solid #303339;">
                    <div class="col"></div>
                </div>
                <div class="row mt-5">
                    <div class="col fw-bold" style="color: #BABBBD; font-size: medium;">
                        서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층)
                    </div>
                </div>
                <div class="row mt-1 mb-5">
                    <div class="col fw-bold" style="color: #505F65; font-size: medium;">
                        COPYRIGHT© 2023 MINGYU UNIVERSITY. ALL RIGHTS RESERVED.
                    </div>
                </div>
                
            </div>
            

        </div>

   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>