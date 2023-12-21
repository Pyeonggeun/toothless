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
<title> AJDKS TEMPLATE FOR PROFESSOR </title>
<style>
	/*교수좌측메뉴바설정*/
	.professorleftmenubar input {
	    display: none;
	}
	
	.professorleftmenubar label {
	    display: block;    
	    cursor: pointer;
	    background: #0C2145;
	    transition: ease .1s;
	}
	
	.professorleftmenubar label:hover {
	    background: #0C2145;
	    opacity: 50%;
	}
	
	.professorleftmenubar .content {
	    background: #091933;
   	    transition: ease .5s;    
	}
	
	.professorleftmenubar input + label + .content {
	    display: none;
	}
	
	.professorleftmenubar input:checked + label + .content {
	    display: block;
	}	
	
	/*a태그기본설정제거*/
	.nolinenoblue > a {
		text-decoration: none;
		color: #000000;
	}
	
	/*달력*/
	table {
      border-collapse: collapse;
      width: 100%;
      table-layout: fixed; /* 셀의 크기를 고정 */
    }

    th, td {
      border: 1px solid #ddd;
      padding: 15px; /* 각 셀의 안팎 여백 조절 */
      text-align: center;
      width: 14.2857%; /* 100%를 7등분하여 각 셀에 동일한 너비 할당 */
    }

    th {
      background-color: #f2f2f2;
    }

    td:hover {
      background-color: #ddd;
    }

</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
      renderCalendar(new Date());
    });

    function renderCalendar(date) {
      const calendarTable = document.getElementById('calendar');
      const currentMonthYear = document.getElementById('currentMonthYear');

      const monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
      const daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

      const year = date.getFullYear();
      const month = date.getMonth();
      const firstDay = new Date(year, month, 1);
      const lastDay = new Date(year, month + 1, 0);

      currentMonthYear.textContent = monthNames[month] + ' ' + year;

      let calendarHTML = '<tr>';
      for (let day of daysOfWeek) {
        calendarHTML += '<th>' + day + '</th>';
      }
      calendarHTML += '</tr>';

      let dayCount = 1;
      let dayOfWeek = firstDay.getDay();

      for (let i = 0; i < 6; i++) {
        calendarHTML += '<tr>';

        for (let j = 0; j < 7; j++) {
          if (i === 0 && j < dayOfWeek) {
            calendarHTML += '<td></td>';
          } else if (dayCount > lastDay.getDate()) {
            calendarHTML += '<td></td>';
          } else {
            calendarHTML += '<td>' + dayCount + '</td>';
            dayCount++;
          }
        }

        calendarHTML += '</tr>';
      }

      calendarTable.innerHTML = calendarHTML;
    }
	</script>
</head>
<body>
<div class="container-fluid"><!-- 전체 container 입구 -->

<div class="row">
	<div class="col">
		<jsp:include page="../../common/ajdksHighestMenubarForProfessor.jsp"></jsp:include>
	</div>
</div>
<div class="row">

	<!-- 좌측메뉴바 -->
	<jsp:include page="../../common/ajdksSideMenubarForProfessor.jsp"></jsp:include>
	
	<!-- 본문 :  자유롭게 이용하세요 화이팅 -->
	<div class="col">
		<div class="row">
			<div class="col px-0">
				<img src="../../../resources/img/internshipCourse/professorMainPage/professorMain.PNG" class="img-fluid" alt="...">
			</div>
		</div>
		<div class="row">
			<div class="col mx-5 ">
			
			<!-- 본문작성공간 -->
				<div class="row">
					<div class="col">

						<div class="row mt-4">
							<div class="col fs-4 fw-bold">
								<i class="bi bi-journal-check me-3"></i>현장실습 지도관리
							</div>
						</div>
						
						<div class="row mt-4">
							<div class="col">
								<div class="row">
									<div class="col fs-5 fw-semibold text-dark-emphasis">
										나의 현장실습 과정
									</div>
									<div class="col text-end text-secondary align-self-end" style="font-size:0.8em">
										더보기 +
									</div>
								</div>
								<div class="row mt-3 border py-3">
									<div class="col">
										<div class="row py-4">
											<div class="col text-center" style="font-size:1.5em">
												총 <span class="fw-semibold">0</span> 개
											</div>
										</div>
									</div>
									<div class="col text-center border-start">
										<div class="row mt-1">
											<div class="col">
												모집중
											</div>
											<div class="col fw-semibold">
												0개
											</div>
										</div>
										<div class="row">
											<div class="col mt-1">
												진행중
											</div>
											<div class="col fw-semibold">
												0개
											</div>
										</div>
										<div class="row">
											<div class="col mt-1">
												평가미완료
											</div>
											<div class="col fw-semibold">
												0개
											</div>
										</div>
									</div>
								</div>
								
								<div class="row mt-4">
									<div class="col mt-2 fs-5 fw-semibold text-dark-emphasis pb-1">
										최신 현장실습지원공고
									</div>
									<div class="col mt-2 text-end text-secondary align-self-end pb-1" style="font-size:0.8em">
										더보기 +
									</div>
								</div>
								<div class="row mt-2 border-top border-bottom py-3">
									<div class="col-2">
										<i class="bi bi-file-earmark-person text-secondary ms-3" style="font-size:5em"></i>
									</div>
									<div class="col ms-2 me-3">
										<div class="row">
											<div class="col fw-semibold" style="font-size:1.05em">
												퓨처코딩 솔루션스
											</div>
										</div>
										<div class="row mt-1">
											<div class="col text-secondary fw-semibold" style="font-size:0.9em">
												소프트웨어 개발 회사
											</div>
										</div>
										<div class="row mt-3">
											<div class="col-7 pe-3 border-end" style="font-size:0.75em">
												<div class="row">
													<div class="col fw-semibold">
														회사소개 )
													</div>
												</div>
												<div class="row mt-1">
													<div class="col">
													퓨처코딩 솔루션스는 미래를 이끌어갈 혁신적인 솔루션을 제공하고 있는 기업으로, 
													다양한 분야에서 전문 지식을 보유한 팀 멤버들이 함께 일하고 있습니다. 
													우리는 학습과 성장을 존중하며, 동료들 간의 협력을 통해 가치 있는 결과물을 창출합니다.
													</div>
												</div>
											</div>
											<div class="col ps-3" style="font-size:0.75em">
												<div class="row">
													<div class="col fw-semibold">
														혜택 )
													</div>
												</div>
												<div class="row mt-1">
													<div class="col">
														- 전문 개발자와의 교육 및 멘토링 기회 제공
													</div>
												</div>
												<div class="row">
													<div class="col">
														- 업계에서의 실전 경험 쌓기
													</div>
												</div>
												<div class="row">
													<div class="col">
														- 성공적으로 완료시, 추가 경력 사항으로 인정
													</div>
												</div>
											</div>
										</div>
										
									</div>
								</div>

							</div>
							<div class="col-5 ms-4">
								<div class="row">
									<div class="col">
										<h4 class="fw-bold text-dark-emphasis" id="currentMonthYear"></h4>
										<table class="mt-3" id="calendar"></table>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row mt-5">
							<div class="col-5 me-2">
								<div class="row border-bottom pb-3">
									<div class="col fs-5 fw-semibold text-dark-emphasis">
										공지사항
									</div>
									<div class="col text-end text-secondary align-self-end" style="font-size:0.8em">
										더보기 +
									</div>
								</div>
								<div class="row border-bottom pb-2 bg-light">
									<div class="col">
										<div class="row text-center mt-2">
											<div class="col-1" style="font-size:0.95em">
												#
											</div>
											<div class="col fw-semibold text-dark-emphasis" style="font-size:0.95em">
												제목
											</div>
											<div class="col-3" style="font-size:0.9em">
												작성일자
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div class="row py-2">
											<div class="col-1 text-center" style="font-size:0.95em">
												27
											</div>
											<div class="col fw-semibold text-dark-emphasis ps-4" style="font-size:0.95em">
												[안내] 현장실습 학생 평가 기간 안내
											</div>
											<div class="col-3 text-center" style="font-size:0.9em">
												2023.11.15
											</div>
										</div>
										<div class="row py-2">
											<div class="col-1 text-center" style="font-size:0.95em">
												26
											</div>
											<div class="col fw-semibold text-dark-emphasis ps-4" style="font-size:0.95em">
												[이벤트] 현장실습 성과 공유 워크샵 개최 예정
											</div>
											<div class="col-3 text-center" style="font-size:0.9em">
												2023.10.01
											</div>
										</div>
										<div class="row py-2">
											<div class="col-1 text-center" style="font-size:0.95em">
												25
											</div>
											<div class="col fw-semibold text-dark-emphasis ps-4" style="font-size:0.95em">
												[안내] 새로운 현장실습 지도관리 메뉴얼 등록
											</div>
											<div class="col-3 text-center" style="font-size:0.9em">
												2023.09.18
											</div>
										</div>
										<div class="row py-2">
											<div class="col-1 text-center" style="font-size:0.95em">
												24
											</div>
											<div class="col fw-semibold text-dark-emphasis ps-4" style="font-size:0.95em">
												[안내] 중요한 기한 안내: 2023년 8월 31일까지
											</div>
											<div class="col-3 text-center" style="font-size:0.9em">
												2023.08.25
											</div>
										</div>
										<div class="row py-2 border-bottom">
											<div class="col-1 text-center" style="font-size:0.95em">
												23
											</div>
											<div class="col fw-semibold text-dark-emphasis ps-4" style="font-size:0.95em">
												[일정] 2023년 하반기 현장실습 일정 안내
											</div>
											<div class="col-3 text-center" style="font-size:0.9em">
												2023.08.01
											</div>
										</div>	
									</div>
								</div>
							</div>
							
							<div class="col ms-4">
								<div class="row border-bottom pb-3">
									<div class="col fs-5 fw-semibold text-dark-emphasis">
										담당 업무 및 연락처
									</div>
									<div class="col text-end text-secondary align-self-end" style="font-size:0.8em">
										더보기 +
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div class="row border-bottom pb-2 bg-light">
											<div class="col">
												<div class="row text-center mt-2">
													<div class="col fw-semibold text-dark-emphasis" style="font-size:0.95em">
														성명
													</div>
													<div class="col-2 fw-semibold text-dark-emphasis" style="font-size:0.95em">
														직위
													</div>
													<div class="col-4 fw-semibold text-dark-emphasis" style="font-size:0.95em">
														담당업무
													</div>
													<div class="col-3 fw-semibold text-dark-emphasis" style="font-size:0.9em">
														교내전화
													</div>
												</div>
											</div>
										</div>
										<div class="row fs-6 pb-1 mt-2 mb-1 text-dark-emphasis">
											<div class="col text-center" style="font-size:0.9em">김은비</div>
											<div class="col-2  text-center" style="font-size:0.85em">학생처장</div>
											<div class="col-4 ps-4" style="font-size:0.85em">학생처 총괄</div>
											<div class="col-3  text-center" style="font-size:0.9em">02-940-8676</div>
										</div>
										<div class="row fs-6 pb-1 mt-1 mb-2 text-dark-emphasis">
											<div class="col text-center" style="font-size:0.9em">김태호</div>
											<div class="col-2  text-center" style="font-size:0.85em">현장실습지원팀장</div>
											<div class="col-4 ps-4" style="font-size:0.85em">현장실습지원팀 업무 총괄</div>
											<div class="col-3  text-center" style="font-size:0.9em">02-940-5606</div>
										</div>
										<div class="row fs-6 pb-1 mt-1 mb-2 text-dark-emphasis">
											<div class="col text-center" style="font-size:0.9em">이서영</div>
											<div class="col-2  text-center" style="font-size:0.85em">직원</div>
											<div class="col-4 ps-4" style="font-size:0.85em">
												국내/외 장단기 현장실습 운영<br>정부지원사업수주
											</div>
											<div class="col-3  text-center" style="font-size:0.9em">02-940-5606</div>
										</div>
										<div class="row fs-6 pb-2 mt-1 mb-2 border-bottom text-dark-emphasis">
											<div class="col text-center" style="font-size:0.9em">김우재</div>
											<div class="col-2  text-center" style="font-size:0.85em">직원</div>
											<div class="col-4 ps-4" style="font-size:0.85em">
												현장실습 대학정보공시 관리<br>현장실습 설명회 운영<br>우수인재 추천
											</div>
											<div class="col-3 text-center" style="font-size:0.9em">02-940-5606</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
					</div>
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