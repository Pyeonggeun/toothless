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


<script>
function showalert(){
	
	alert("구직희망 페이지를 이용 하시려면 구직희망 신청을 먼저 하셔야 합니다!");
};


window.addEventListener("DOMContentLoaded", () => {
	showalert();
});	


</script>


</head>
<body>

<div class="container-fluid">


	<div class="row">
		<div class="col">
			<jsp:include page="../common/studentTopNavi.jsp"></jsp:include>
		</div>
	</div>


	<div class="row">
		<div class="col-2">
			<jsp:include page="../common/studentMenu.jsp"></jsp:include>			
		</div>
		
		<div class="col-1 border-start"></div>
		
		
		<div class="col">		
				<div class="row text-center" style="align-itesm:center;">
					<div class="col">
						<div class="row mt-5">
							<div class="col fw-bold" style="font-size:2em;">구직 희망 신청서</div>
						</div>
						<c:if test="${checkOverlapHopejob}">
							<div class="row mt-5">
								<div class="col" style="color:red">
									이미 구직희망 프로그램을 신청 하셨습니다!
								</div>
							</div>
						</c:if>
						
						<c:if test="${guide != null}">
							<div class="row mt-5">
								<div class="col" style="color:red">
									구직희망 프로그램 신청을 먼저 해주세요!
								</div>
							</div>
						</c:if>			
						
						
						
						
						
						<form action="./hopeJobApplyProcess" method="post">
						<div class="row mt-5 border">
							<div class="col">
								
								
							  <div class="row border-bottom">
									<%--작성자(학생) 이름표기 --%>
									
									<div class="col-3 border-end pt-2 fw-bold text-center" style="font-size:1em;">
										<div class="row">
											<div class="col" style="font-size:3em;">
											 <i class="bi bi-person"></i>	
											</div>
										</div>
										<div class="row">
											<div class="col">
											  학생정보	
											</div>
										</div>										
									
									
									</div>
									<div class="col-9" style="text-align:left;">										
										<div class="row pt-2">
											<div class="col border-end fw-bold">
												학생명
											</div>
											<div class="col">
												${sessionStudentInfo.name}
											</div>
											<div class="col-7"></div>										
										</div>
										<div class="row pt-2">
											<div class="col border-end fw-bold">
												학번
											</div>
											<div class="col">
												${sessionStudentInfo.student_id}
											</div>
											<div class="col-7">
												
											</div>																							
										</div>										
										<div class="row pt-2">
											<div class="col border-end fw-bold">
												전화번호
											</div>
											<div class="col">
												${sessionStudentInfo.phone}
											</div>	
											<div class="col-7"></div>										
																					
										</div>	
										<div class="row py-2">
											<div class="col border-end fw-bold">
												이메일
											</div>
											<div class="col">
												${sessionStudentInfo.email}
											</div>
											<div class="col-7"></div>										
																						
										</div>																			
									</div>						
								</div>
								<%-- 희망연봉 입력칸 --%>
								<div class="row py-4">
									<div class="col-3 py-1 border-end fw-bold">
										희망 연봉
									</div>
									<div class="col">
										<div class="row">
											<div class="col-5">
												<input type="text" inputmode="numeric" pattern="[0-9]*" style="width:100%; height:100%; border:none;" class="px-0 py-0">
											</div>		
											<div class="col" style="font-size:1em; text-align:left;">원<span class="ps-3 text-secondary" style="font-size:0.8em">*숫자만 입력해주세요</span></div> 
										</div>									
									</div>

				
								</div>
								<div class="row border-top border-bottom py-4">
									<div class="col-3 py-2 border-end fw-bold">
										희망 지역
									</div>
									<div class="col-9">
										<input type="text" name="hope_area" style="width:100%; height:100%; border:none;" class="px-0 py-0">
									</div>										
								</div>
								<div class="row border-top border-bottom py-4">
									<div class="col-3 py-2 border-end fw-bold">
										희망 직종
									</div>
									<div class="col-9 pt-1">
										<div class="row">
											<c:forEach items="${list}" var="e">
												<div class="col">
													${e.job_field_category_name}<input name="job_field_pk" type="checkbox" value="${e.job_field_category_pk}"> 
												</div>
											</c:forEach>
										</div>
										
										
									</div>										
								</div>								
								<div class="row" >
									<div class="col">
										<div class="row border-bottom ">
											<div class="text-center col py-3 fw-bold">
												요구사항
											</div>
											<div class="col-9"></div>
										</div>
										<div class="row pt-3">
											<div class="col">
												<textarea name="requierments" rows="20"  style="width:100%; border:none;"></textarea>
												<%--<input type="text" name="requierments"  style="width:100%; height:100%; border:none;" class="px-0 py-0"> --%>
											</div>
										</div>										
									</div>
								</div>						
				<%--				</div>
								<div class="row border-top">
									<div class="col-3 py-5 border-end">
										요구사항
									</div>
									<div class="col-9">
										<input type="text" name="requierments"  style="width:100%; height:100%; border:none;" class="px-0 py-0">
									</div>						
								</div>
			 --%>				
																										
			

						  </div>
						</div>
						<div class="row mt-3" style="align-items:right;">
							<div class="col">
								<button type="submit" class="btn btn-primary">제출</button>
							</div>
						</div>
						</form>	
					</div>
				</div>
		</div>
		
		<div class="col-2"></div>
		
		
		
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