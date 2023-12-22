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
            <jsp:include page="../commons/student/leftButtons3.jsp"></jsp:include>
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
                    			${thisSemesterJoinDormInfo.joinDormInfoDto.title }
                    		</div>
                    	</div>
                        <div class="row mt-5">
                            <div class="col fw-bold" style="font-size: 1.2em;">
                               	 Ⅰ. 신청 대상
                            </div>
                        </div>
                        <div class="row mt-2">
							<div class="col " style="font-size: 1.0em;">
								□ ${thisSemesterJoinDormInfo.thisSemesterDto.semester_year }학년도 ${thisSemesterJoinDormInfo.thisSemesterDto.semester } 생활관 입사를 희망하는 본교 재학생
							</div>             
                        </div>
                        <div class="row mt-5">
							<div class="col fw-bold" style="font-size: 1.2em">
								Ⅱ. 신청 기간
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
								□ <span style="color: blue;"><fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.apply_start_date }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.apply_end_date }" pattern="yyyy-MM-dd"/></span>
							</div>             
                        </div>
                        <div class="row mt-5">
							<div class="col fw-bold" style="font-size: 1.2em;">
								Ⅲ. 선발인원
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;" >
								□ <span style="color: blue;">총 ${thisSemesterJoinDormInfo.joinDormInfoDto.selection_amount }명</span>
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
								□ 선발 비율:
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
								※ 상기 선발계획은 생활관 사정에 따라 변경될 수 있습니다.
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
								※ 서관(남)의 경우 선발 비율이 학교 사정에 따라 변경될 수 있습니다.
							</div>             
                        </div>
                        <div class="row mt-5">
							<div class="col fw-bold" style="font-size: 1.2em;">
								Ⅳ. 선발 방법
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
								□ ${thisSemesterJoinDormInfo.joinDormInfoDto.detail_expln }
							</div>             
                        </div>
                        <div class="row mt-5">
							<div class="col fw-bold" style="font-size: 1.2em;">
								Ⅴ. 합격자 발표일
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
								□ 발표일시: <span style="color: blue;"><fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.pass_anncm_date }" pattern="yyyy-MM-dd"/></span>
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
								□ 확인방법: 합격자 발표 및 납부기간에 생활관 홈페이지에 바로가기 팝업을 띄울 예정이오니 참고하시기 바랍니다.
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
                                1. 재학생 : [종합정보시스템] - [일반] - [생활관 관리] - [생활관 입사신청]
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
                                2 외국인 신입생(학부) : 신입생 생활관 신청 (mokwon.ac.kr) - [수험번호 입력] - [가상 계좌로 납부]
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
                                3 신입 대학원생 :  신입생 생활관 신청 (mokwon.ac.kr) - [수험번호 입력]
							</div>             
                        </div>
                        <div class="row mt-5">
							<div class="col fw-bold" style="font-size: 1.2em;">
								Ⅵ. 관비 납부
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
								□ <span style="color: blue;"><fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.payment_start_date }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.payment_end_date }" pattern="yyyy-MM-dd"/></span>
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
								□ 납부금액 : 850,000원
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
								□ 납부방법 : 
							</div>             
                        </div>
                         <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
                               1) 재 학 생 : [종합정보시스템] - [학사행정] - [부가서비스] - [생활관 입사 신청] - [본인인증] - [가상계좌로 납부]
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
                               2) 신입 대학원생 : 신입생 생활관 신청 (mokwon.ac.kr) - [수험번호 입력] - [가상 계좌로 납부]
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
                                ※ 납부 기간을 엄수해주시기 바라며, 기간 미준수 시 자동탈락 됩니다.
							</div>             
                        </div>
                        <div class="row mt-5">
							<div class="col fw-bold" style="font-size: 1.2em;">
								Ⅶ. 배정 통보일
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
								□ <span style="color: blue;"><fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.asgnm_anncm_date }" pattern="yyyy-MM-dd"/></span>
							</div>             
                        </div>
                        <div class="row mt-5">
							<div class="col fw-bold" style="font-size: 1.2em;">
								Ⅷ. 입주일 
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
								□ <span style="color: blue;"><fmt:formatDate value="${thisSemesterJoinDormInfo.joinDormInfoDto.join_dorm_date }" pattern="yyyy-MM-dd"/></span>
							</div>             
                        </div>
                        <div class="row mt-5">
							<div class="col fw-bold" style="font-size: 1.2em;">
								Ⅸ. 관련 문의처 
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
                              □ 문의 가능 시간 : 평일 09:00 ~ 15:00 (토, 일, 공휴일 휴무)
                              </div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
                              ◦ 전화 : 031) 123-7777~3, 5~7
                              </div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
                               ※ 12:00 ~ 13:00 은 점심시간이므로 통화 연결이 어렵습니다.
							</div>             
                        </div>
                        <div class="row mt-2">
							<div class="col" style="font-size: 1.0em;">
                               □ E-MAIL : dormitory@mkfactory.ac.kr
							</div>             
                        </div>
                        <!-- 수정 안해도 됨!!-->
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
						                    <button type="button" class="rounded-0 fw-bold btn btn-lg btn-primary text-white ms-1">입사 신청</button>
						                	</a>
			                			</c:if>
			                		</c:when>
			                		<c:otherwise>
			                			<a href="./loginPage">
					                    <button type="button" class="rounded-0 fw-bold btn btn-lg btn-primary text-white ms-1">입사 신청</button>
					                	</a>
			                		</c:otherwise>
			                	</c:choose>
			                	
			                </div>                    
			            </div>
                        
                    </div>
            	</div><!-- row끝 -->
              </div>
                <!-- 공고 끝 -->
                
            </div>
            
        </div>
        
<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>

   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>