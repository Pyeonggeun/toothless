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
    
</head>
<body>
    <jsp:include page="../commons/student/topNavi.jsp"></jsp:include>
    <div class="row">
        <div class="col">
            <img src="../../resources/img/dormitory/studentMainLogo.jpg">
        </div>
    </div>


    <div class="container my-5 ">
        <div class="row">
            <div class="col-3 me-3"><!-- 여기부분은 목차부분 -->
                <div class="row rounded-1 opacity-90" style="background-color: #504528;">
                    <div class="col py-4 text-center">
                        <span class="fw-bold" style="color: white; font-size: x-large;">기숙사 커뮤니티</span>
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: #504528;">서식 자료실</span>
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">외박 및 외출신청</span>
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.2em solid #504528;">
                    <div class="col py-3 fw-bold" style="font-size: large;">
                        <span style="color: black;">상벌점 확인</span>
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">고장수리요청</span>
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">상담 및 건의</span>
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">일지 등록</span>
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">FAQ</span>
                    </div>
                </div>
            </div>
            <!-- 왼쪽 목차 끝 -->
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">상벌점 확인</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙사 커뮤니티 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;">상벌점 확인</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="row"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                    	<div class="row my-2">
                    		<div class="col-2 py-3 fw-bold" style="font-size: 1.1rem;">
                    			<span>이름</span>
                    		</div>
                    		<div class="col py-3 text-start" style="font-size: 1.0rem;">
                    			${sessionStudentInfo.name}
                    		</div>
                    	</div>
                        <div class="row my-3">
                        	<div class="col-2 fw-bold" style="font-size: 1.1rem;">
								<span>상벌점 내역</span>
							</div>
							<div class="col text-end">
							<span class="fw-bold">총 점수 &nbsp;</span>${sumTotalPoint}
							</div>
                        </div>
                        <div class="row my-4 border">
                        	<div class="col">
                        		<div class="row py-2 align-middle text-center border border-bottom-1 border-start-0 border-top-0 border-end-0">
                        				<div class="col fw-bold border border-bottom-0 border-start-0 border-top-0 border-end-1">상/벌점 Category</div>
                        				<div class="col fw-bold border border-bottom-0 border-start-0 border-top-0 border-end-1">사유</div>
                        				<div class="col-1 fw-bold border border-bottom-0 border-start-0 border-top-0 border-end-1">점수</div>
                        				<div class="col-3 fw-bold">부여일</div>
                        			</div>
                        		<c:forEach items="${pointSituationListMap}" var="pointSituationListMap">
                        			<div class="row py-2 align-middle border border-bottom-1 border-start-0 border-top-0 border-end-0">
                        				<div class="col border border-bottom-0 border-start-0 border-top-0 border-end-1">${pointSituationListMap.pointCategoryDto.content}</div>
                        				<div class="col border border-bottom-0 border-start-0 border-top-0 border-end-1">${pointSituationListMap.pointDto.reason}</div>
                        				<div class="col-1 text-center border border-bottom-0 border-start-0 border-top-0 border-end-1">${pointSituationListMap.pointCategoryDto.point}</div>
                        				<div class="col-3 text-center"><fmt:formatDate value="${pointSituationListMap.pointDto.created_at}" pattern="yyyy-MM-dd"/></div>
                        			</div>
                        		</c:forEach>
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