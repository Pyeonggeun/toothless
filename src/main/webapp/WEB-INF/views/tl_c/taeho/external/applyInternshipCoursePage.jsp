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
<title> AJDKS TEMPLATE FOR COMPANY </title>
<style>
	/*산업체좌측메뉴바설정*/
	.companyleftmenubar input {
	    display: none;
	}
	
	.companyleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #22212E;
	    transition: ease .1s;
	}
	
	.companyleftmenubar label:hover {
	    background: #22212E;
	    opacity: 50%;
	}
	
	.companyleftmenubar .content {
	    background: #1C1C26;
   	    transition: ease .5s;    
	}
	
	.companyleftmenubar input + label + .content {
	    display: none;
	}
	
	.companyleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}

</style>
</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<div class="row">

	<!-- 좌측메뉴바 : col-2 -->
	<jsp:include page="../../common/ajdksTemplateForCompany.jsp"></jsp:include>
	
	<!-- 메인화면 -->
	<div class="col">
		<!-- 안내문구 -->
		<div class="row py-2" style="box-shadow: 2px 2px 2px gray; font-size: 0.9em;">
			<div class="col ps-2">
				<span>&#035;&nbsp;${ajdksCompanyInfoDto.company_name } 님 환영합니다</span>
			</div>	
			<div class="col pe-2 text-end nolinenoblue">
				<a href="../../taeho/external/ajdksCompanyLogoutProcess">로그아웃</a>
			</div>	
		</div>
		
		<!-- 본문 : 자유롭게 이용하세요 화이팅 -->
		<div class="row">
			<div class="col mx-5">
			
				<div class="row pt-5 pb-1">
					<div class="col fw-bold ps-0" style="font-size: 1.5em;">
						<i class="bi bi-file-earmark-plus"></i>&nbsp;현장실습과정신청
					</div>
				</div>
			
				<div class="row border-bottom border-secondary border-3 mb-1">
					<div class="col text-danger text-end" style="font-size: 0.8em;">
						*는 필수입력항목입니다. 
					</div>
				</div>
			
				<div class="row border-top border-bottom">
					<div class="col-3 border-end py-3 text-center" style="background-color: #F6F8FB;">
						과정명<span class="text-danger">*</span>		
					</div>
					<div class="col pt-2 pb-1 ps-4">
						<div class="row">
							<div class="col border border-secondary-subtle px-0 py-2" style="cursor: text;">
								<br>
							</div>
							<div class="col"></div>
						</div>
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-3 border-end py-3 text-center" style="background-color: #F6F8FB;">
						모집인원<span class="text-danger">*</span>
					</div>
					<div class="col pt-2 pb-1 ps-4">
						<div class="row">
							<div class="col border border-secondary-subtle pe-1 py-2 text-end" style="cursor: text;">
								<div class="row">
									<div class="col">
										1
									</div>
									<div class="col">
										<i class="bi bi-caret-down-fill text-dark" style="cursor: pointer;"></i>							
									</div>
								</div>
							</div>
							<div class="col-2 pt-2">
								명
							</div>
							<div class="col"></div>
							<div class="col"></div>
							<div class="col"></div>
						</div>
					
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-3 border-end py-3 text-center" style="background-color: #F6F8FB;">
						자격요건<span class="text-danger">*</span>
					</div>
					<div class="col pt-2 pb-1 ps-4">
						<div class="row">
							<div class="col border border-secondary-subtle pe-1 py-2 text-end" style="cursor: text;">
								<div class="row">
									<div class="col">
										1
									</div>
									<div class="col">
										<i class="bi bi-caret-down-fill" style="cursor: pointer;"></i>							
									</div>
								</div>
							</div>
							<div class="col-2 pt-2">
								학기
							</div>
							<div class="col pt-2">
								<input name="fakeradio" type="radio" id="up">
								<label for="up">&nbsp;&nbsp;이상</label>
							</div>
							<div class="col pt-2">
								<input name="fakeradio" type="radio" id="down">
								<label for="down">&nbsp;&nbsp;이하</label>
							</div>
							<div class="col"></div>
						</div>
					
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-3 border-end py-3 text-center" style="background-color: #F6F8FB;">
						산업체명<span class="text-danger">*</span>
					</div>
					<div class="col pt-2 pb-1 ps-4">
						<div class="row">
							<div class="col border border-secondary-subtle text-secondary px-0 py-2" style="cursor: text;">
								&nbsp;&nbsp;&nbsp;${ajdksCompanyInfoDto.company_name }
							</div>
							<div class="col"></div>
						</div>
					
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-3 border-end py-3 text-center" style="background-color: #F6F8FB;">
						협력학과<span class="text-danger">*</span>		
					</div>
					<div class="col pt-2 pb-1 ps-4">
						<div class="row">
							<div class="col border border-secondary-subtle ps-0 pe-1 py-2 text-end" style="cursor: text;">
								<i class="bi bi-caret-down-fill" style="cursor: pointer;"></i>
							</div>
							<div class="col"></div>
							<div class="col"></div>
						</div>
					
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-3 border-end py-3 text-center" style="background-color: #F6F8FB;">
						모집기간 시작일<span class="text-danger">*</span>
					</div>
					<div class="col pt-2 pb-1 ps-4">
						<div class="row">
							<div class="col border border-secondary-subtle py-2" style="cursor: text;">
								<div class="row">
									<div class="col text-secondary ps-4" style="font-size: 0.9em;">
										yyyy - mm - dd
									</div>
									<div class="col-2 pe-4 text-end">
										<i class="bi bi-calendar text-dark" style="cursor: pointer;"></i>							
									</div>
								</div>								
							</div>
							<div class="col-1 text-center pt-2">
								~
							</div>
							<div class="col border border-secondary-subtle py-2" style="cursor: text;">
								<div class="row">
									<div class="col text-secondary ps-4" style="font-size: 0.9em;">
										yyyy - mm - dd
									</div>
									<div class="col-2 pe-4 text-end">
										<i class="bi bi-calendar text-dark" style="cursor: pointer;"></i>							
									</div>
								</div>								
							</div>
							<div class="col"></div>
							<div class="col"></div>
						</div>
					
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-3 border-end py-3 text-center" style="background-color: #F6F8FB;">
						모집기간 종료일<span class="text-danger">*</span>
					</div>
					<div class="col pt-2 pb-1 ps-4">
						<div class="row">
							<div class="col border border-secondary-subtle py-2" style="cursor: text;">
								<div class="row">
									<div class="col text-secondary ps-4" style="font-size: 0.9em;">
										yyyy - mm - dd
									</div>
									<div class="col-2 pe-4 text-end">
										<i class="bi bi-calendar text-dark" style="cursor: pointer;"></i>							
									</div>
								</div>								
							</div>
							<div class="col-1 text-center pt-2">
								~
							</div>
							<div class="col border border-secondary-subtle py-2" style="cursor: text;">
								<div class="row">
									<div class="col text-secondary ps-4" style="font-size: 0.9em;">
										yyyy - mm - dd
									</div>
									<div class="col-2 pe-4 text-end">
										<i class="bi bi-calendar text-dark" style="cursor: pointer;"></i>							
									</div>
								</div>								
							</div>
							<div class="col"></div>
							<div class="col"></div>
						</div>
					
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-3 border-end py-3 text-center" style="background-color: #F6F8FB;">
						실습기간 시작일<span class="text-danger">*</span>
					</div>
					<div class="col pt-2 pb-1 ps-4">
						<div class="row">
							<div class="col border border-secondary-subtle py-2" style="cursor: text;">
								<div class="row">
									<div class="col text-secondary ps-4" style="font-size: 0.9em;">
										yyyy - mm - dd
									</div>
									<div class="col-2 pe-4 text-end">
										<i class="bi bi-calendar text-dark" style="cursor: pointer;"></i>							
									</div>
								</div>								
							</div>
							<div class="col-1 text-center pt-2">
								~
							</div>
							<div class="col border border-secondary-subtle py-2" style="cursor: text;">
								<div class="row">
									<div class="col text-secondary ps-4" style="font-size: 0.9em;">
										yyyy - mm - dd
									</div>
									<div class="col-2 pe-4 text-end">
										<i class="bi bi-calendar text-dark" style="cursor: pointer;"></i>							
									</div>
								</div>								
							</div>
							<div class="col"></div>
							<div class="col"></div>
						</div>
					
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-3 border-end py-3 text-center" style="background-color: #F6F8FB;">
						실습기간 종료일<span class="text-danger">*</span>
					</div>
					<div class="col pt-2 pb-1 ps-4">
						<div class="row">
							<div class="col border border-secondary-subtle py-2" style="cursor: text;">
								<div class="row">
									<div class="col text-secondary ps-4" style="font-size: 0.9em;">
										yyyy - mm - dd
									</div>
									<div class="col-2 pe-4 text-end">
										<i class="bi bi-calendar text-dark" style="cursor: pointer;"></i>							
									</div>
								</div>								
							</div>
							<div class="col-1 text-center pt-2">
								~
							</div>
							<div class="col border border-secondary-subtle py-2" style="cursor: text;">
								<div class="row">
									<div class="col text-secondary ps-4" style="font-size: 0.9em;">
										yyyy - mm - dd
									</div>
									<div class="col-2 pe-4 text-end">
										<i class="bi bi-calendar text-dark" style="cursor: pointer;"></i>							
									</div>
								</div>								
							</div>
							<div class="col"></div>
							<div class="col"></div>
						</div>
					
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-3 border-end py-3 text-center" style="background-color: #F6F8FB;">
						선발결과 발표일<span class="text-danger">*</span>
					</div>
					<div class="col pt-2 pb-1 ps-4">
						<div class="row">
							<div class="col border border-secondary-subtle py-2" style="cursor: text;">
								<div class="row">
									<div class="col text-secondary ps-4" style="font-size: 0.9em;">
										yyyy - mm - dd
									</div>
									<div class="col-2 pe-4 text-end">
										<i class="bi bi-calendar text-dark" style="cursor: pointer;"></i>						
									</div>
								</div>								
							</div>
							<div class="col-1"></div>
							<div class="col"></div>
							<div class="col"></div>
							<div class="col"></div>
							</div>
					
					</div>
				</div>
			
				<div class="row border-bottom">
					<div class="col-3 border-end py-5 text-center" style="background-color: #F6F8FB;">
						<br>과정상세설명
					</div>
					<div class="col pt-2 pb-1 ps-4">
						<div class="row">
							<div class="col border border-secondary-subtle px-0 py-2" style="cursor: text;">
								<br><br><br><br><br><br>
							</div>
							<div class="col-2"></div>
						</div>
					
					</div>
				</div>

				<div class="row pt-4 pb-5 mb-4">
					<div class="col"></div>
					<div class="col"></div>
					<div class="col me-1 text-center rounded py-2" style="color: #4A3D73; border-style: solid; border-color: #4A3D73; border-width: 0.5px; cursor: pointer;">저장하기</div>
					<div class="col ms-1 text-center text-white border border-white rounded py-2" style="background-color: #4A3D73; cursor: pointer;">제출하기</div>
					<div class="col"></div>
					<div class="col"></div>
				</div>
				
			</div>
		</div>

<jsp:include page="../../common/ajdksFooter.jsp"></jsp:include>		

		
	</div>
	
</div>
		

</div><!-- 전체 container 출구 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>