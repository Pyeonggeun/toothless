<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	// 현재 날짜와 시간을 가져오기
	Date currentDate = new Date();
	
	// 날짜 포맷 지정
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	// 포맷에 맞게 날짜를 문자열로 변환
	String formattedDate = dateFormat.format(currentDate);
%>    
    
    
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
            
            <!-- 입사신청 시작 -->
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">입사신청</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 모집안내 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 입사신청</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <!--여기가 안에 들어갈 내용들-->
                <div class="row">
                    <div class="col">
                        <form action="./mj_applyDormProcess" method="get">
                        
						<!-- 기숙사명 -->
						<div class="row border rounded-0 p-3 text-center">
							<div class="col">
								<div class="row">
									<div class="col fw-bold fs-3 my-2">
										기숙사 입사 신청서
									</div>
								</div>
								<div class="row">
									<div class="col my-2 fs-5">
										( ${thisSemesterJoinDormInfo.thisSemesterDto.semester_year }학년도 ${thisSemesterJoinDormInfo.thisSemesterDto.semester } )
									</div>
								</div>
								
								<!-- 정보/양식 -->
								<div class="row border rounded-0 m-3 text-center">
									<div class="col">
										<div class="row border-bottom">
											<div class="col-2 py-2 border-end fw-bold">
												전  공
											</div>
											<div class="col-4 py-2 border-end">
												${studentInfoAll.departmentInfo.name }
											</div>
											<div class="col-2 py-2 border-end fw-bold">
												학  년
											</div>
											<div class="col-4 py-2">
												${studentInfoAll.studentYear}
											</div>
										</div>
										<div class="row border-bottom">
											<div class="col-2 py-2 border-end fw-bold">
												성  명
											</div>
											<div class="col-4 py-2 border-end">
												${studentInfoAll.studentInfo.name }
											</div>
											<div class="col-2 py-2 border-end fw-bold">
												학  번
											</div>
											<div class="col-4 py-2">
												${studentInfoAll.studentInfo.student_id }
											</div>
										</div>
										<div class="row border-bottom">
											<div class="col-2 py-2 border-end fw-bold">
												E-mail
											</div>
											<div class="col-4 py-2 border-end">
												${studentInfoAll.studentInfo.email }
											</div>
											<div class="col-2 py-2 border-end fw-bold">
												휴대전화
											</div>
											<div class="col-4 py-2">
												${studentInfoAll.studentInfo.phone }
											</div>
										</div>
										<div class="row border-bottom">
											<div class="col-2 py-2 border-end fw-bold">
												주  소
											</div>
											<div class="col py-2 border-end">
												${studentInfoAll.studentInfo.address }
											</div>
										</div>
										<div class="row border-bottom">
											<div class="col-2 py-2 border-end fw-bold">
												우선선발 여부
											</div>
											<div class="col text-center align-self-center">
						                        <div class="form-check form-check-inline">
						                            <input class="form-check-input" type="radio" name="priority_select" value="Y">
						                            <label class="form-check-label" for="inlineRadio1">대상자</label>
						                        </div>                                
						                    </div>
						                    <div class="col text-center align-self-center">
						                        <div class="form-check form-check-inline">
						                            <input class="form-check-input" type="radio" name="priority_select" value="N">
						                            <label class="form-check-label" for="inlineRadio2">대상자아님</label>
						                        </div>
						                    </div>
										</div>
									</div>
								</div>
							</div>
							
							<div class="row mt-2">
								<div class="col text-center">
									본인은 입사 후 기숙사 규정을 준수할 것을 약속드리며, 위와 같이 신청합니다.
								</div>
							</div>
							
							<div class="row mt-4">
								<div class="col text-center">
									<%= formattedDate %>
								</div>
							</div>
						</div>
						
						
							
						<!-- 제출 -->
						<input type="hidden" name="dorm_info_pk" value=${thisSemesterJoinDormInfo.joinDormInfoPk }>
						<input type="hidden" name="student_pk" value=${studentInfoAll.studentInfo.student_pk }>
						<div class="row mt-3 mb-5">
							<div class="col px-0">
								<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary me-1"> &nbsp;&nbsp; 취소 &nbsp;&nbsp;</button>
							</div>			
							<div class="col-5"></div>
			                <div class="col px-0 text-end">
								<button type="button" class="rounded-0 fw-bold btn btn-lg btn-outline-secondary">임시 저장</button>
			                    <button type="submit" class="rounded-0 fw-bold btn btn-lg btn-secondary text-white ms-1">입사 신청</button>
			                </div>                    
			             </div>
			        	</form>
                    </div>
                </div>
                <!-- 여기까지-->
            </div>
            <!-- 입사신청페이지 끝 -->
        </div>
    </div>
        
<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>
   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>