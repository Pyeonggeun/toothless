<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 부트스트랩 --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<%-- 부트스트랩 아이콘 --%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<%-- 구글폰트(Quicksand, Dongle, Gowun Dodum --%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gowun+Dodum&family=Quicksand:wght@300&display=swap" rel="stylesheet">
<style>
*{
	/* font-family: 'Dongle', sans-serif; */
	font-family: 'Gowun Dodum', sans-serif;
	/* font-family: 'Quicksand', sans-serif; */
}
</style>
<script>

</script>
<title>상담원 상세정보</title>
</head>
<body>
	<jsp:include page="../commons/staffTopArea.jsp"></jsp:include>
	<div class="container">			

		<div class="row"></div>
		<div class="row">			
			
			<!-- 여기부터 레이아웃 -->
			<div class="col">
				<div class="row mt-5">
					<div class="col">
						<span class="fw-bold fs-2">상담원 상세정보</span>
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col-auto">
						<img src="../../resources/img/counselorImage/${counselorDto.profileImage}" class="img-fluid">
					</div>
					
					<div class="col">
						<div class="row align-items-center">
							<div class="col-2">
								<span class="fw-bold fs-5">이름</span>	
							</div>
							<div class="col">
								<span class="fw-bold fs-3">${counselorDto.name}</span> 상담사	
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">상담원번호</span>	
							</div>
							<div class="col">
								<span class="">${counselorDto.id}</span>	
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">나이</span>	
							</div>						
							<div class="col">
								<span class="">${counselorDto.age}</span>	
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">성별</span>	
							</div>
							<div class="col">
								<c:choose>
								<c:when test="${counselorDto.gender == 'M'}">
									<span class="">남</span>
								</c:when>
								<c:otherwise>
									<span class="">여</span>
								</c:otherwise>
								</c:choose>									
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">전화번호</span>	
							</div>						
							<div class="col">
								<span class="">${counselorDto.phonenumber}</span>	
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">이메일</span>	
							</div>						
							<div class="col">
								<span class="">${counselorDto.email}</span>	
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">주소</span>	
							</div>						
							<div class="col">
								<span class="">${counselorDto.address}</span>	
							</div>
						</div>
						<div class="row align-items-center mt-3">
							<div class="col-2">
								<span class="fw-bold fs-5">상담분야</span>	
							</div>						
							<c:forEach items="${counselorTypeList}" var="counselorTypeList">
								<div class="col-auto">
									<span class="">${counselorTypeList.CATEGORYNAME}</span>	
								</div>
							</c:forEach>							
						</div>						
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">
						<div class="row">
							<div class="col">
								<span class="fw-bold fs-5">경력사항</span>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col">
								<div class="row justify-content-center">
									<div class="col-10 border rounded">
										<div class="row mt-3 mb-3">
											<div class="col">
												<span class="">${counselorDto.career}</span>
											</div>
										</div>										
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">
						<div class="row">
							<div class="col">
								<span class="fw-bold fs-5">상담원 자격정보</span>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col">								
								<div class="row">
									<div class="col">
										<c:forEach items="${licenseList}" var="licenseList">
										<div class="row mt-2 justify-content-center">
											<div class="col-10 border rounded text-center">
												<div class="row mt-2 mb-2">
													<div class="col">
														<img src="../../resources/img/counselorImage/license/${licenseList.license}" class="img-fluid">	
													</div>
												</div>
											</div>	
										</div>
										</c:forEach>
									</div>									
								</div>																
							</div>
						</div>
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col">						
						<div class="row mt-4">
							<div class="col">
								<span class="fw-bold fs-5">상담원평가</span>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col border rounded">
								<div class="row">
									<div class="col-2">
										<span class="fw-bold fs-6">평균 만족도</span>
									</div>
									<div class="col">
										<span class="fw-bold fs-6">${scoreAvg.offlineScoreAvg}</span>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col-2">
										<span class="fw-bold fs-6">만족도 현황</span>
									</div>
									<div class="col">
										<div class="row">
											<div class="col">
												<span class="text-warning">
													<i class="bi bi-star-fill"></i>													
												</span>
												<span>(${surveyScore.offlineSurveyScore.SCORE1})</span>
											</div>
											<div class="col">
												<span class="text-warning">
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>													
												</span>
												<span>(${surveyScore.offlineSurveyScore.SCORE2})</span>
											</div>
											<div class="col">
												<span class="text-warning">
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>													
												</span>
												<span>(${surveyScore.offlineSurveyScore.SCORE3})</span>
											</div>
											<div class="col">
												<span class="text-warning">
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>																										
												</span>
												<span>(${surveyScore.offlineSurveyScore.SCORE4})</span>
											</div>
											<div class="col">
												<span class="text-warning">
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>													
												</span>
												<span>(${surveyScore.offlineSurveyScore.SCORE5})</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-4">
							<div class="col">
								<span class="fw-bold fs-5">상담이력</span>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col border rounded">
								<div class="row">
									<div class="col">
										<span class="fw-bold">오프라인상담</span>
									</div>
								</div>
								<div class="row mt-2">
									<div class="col">
										<div class="row">
											<div class="col-auto">
												<div class="row">
													<div class="col">
														<span>번호</span>	
													</div>
												</div>
												<c:forEach items="${completeCounselList.offlineList}" var="offlineList">
												<div class="row mt-2">
													<div class="col">
														<span>${offlineList.ID}</span>
													</div>
												</div>
												</c:forEach>
											</div>
											<div class="col">
												<div class="row">
													<div class="col">
														<span>상담종류</span>	
													</div>
												</div>
												<c:forEach items="${completeCounselList.offlineList}" var="offlineList">
												<div class="row mt-2">
													<div class="col">
														<span>${offlineList.CATEGORY}</span>
													</div>
												</div>
												</c:forEach>
											</div>
											<div class="col">
												<div class="row">
													<div class="col">
														<span>상담일시</span>	
													</div>
												</div>
												<c:forEach items="${completeCounselList.offlineList}" var="offlineList">
												<div class="row mt-2">
													<div class="col">
														<span>${offlineList.CYEAR}-${offlineList.CMONTH}-${offlineList.CDATE}</span>
													</div>
												</div>
												</c:forEach>
											</div>											
										</div>																				
									</div>
								</div>
							</div>
							<div class="col border rounded">
								<div class="row">
									<div class="col">
										<span>온라인상담</span>
									</div>
								</div>
							</div>
							<div class="col border rounded">
								<div class="row">
									<div class="col">
										<span>집단상담</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>