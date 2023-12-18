<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.temporal.ChronoUnit" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

	<script>
	
		let myId = ${sessionExternalInfo.external_pk};
		
			
		function reloadOfflineMainList(){
			
			url = "./getOfflineMainList?external_pk=" + myId;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const offlineMainListBox = document.querySelector(".offlineMainListBox");
				offlineMainListBox.innerHTML = "";
				
				for(e of response.data){
					
					const offlineMainListWrapper = document.querySelector("#templete .offlineMainListWrapper").cloneNode(true);
					
					const offlineName = offlineMainListWrapper.querySelector(".offlineName");
					offlineName.innerText = e.studentInfoDto.name;
					
					const offlineCategory = offlineMainListWrapper.querySelector(".offlineCategory");
					offlineCategory.innerText = e.typeCategoryDto.name;
					
					const offlineHour = offlineMainListWrapper.querySelector(".offlineHour");
					offlineHour.innerText = e.offlineReservationDto.counsel_hour + ":00"
					
					offlineMainListBox.appendChild(offlineMainListWrapper);
					
				}
				
			});
			
		}
		
		
		function reloadOnlineMainList(){
			
			url = "./getOnlineMainList?external_pk=" + myId;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const onlineMainListBox = document.querySelector(".onlineMainListBox");
				onlineMainListBox.innerHTML = "";
				
				for(e of response.data){
					
					const onlineMainListWrapper = document.querySelector("#templete .onlineMainListWrapper").cloneNode(true);
					
					const onlineName = onlineMainListWrapper.querySelector(".onlineName");
					onlineName.innerText = e.studentInfoDto.name;
					
					const onlineCategory = onlineMainListWrapper.querySelector(".onlineCategory");
					onlineCategory.innerText = e.typeCategoryDto.name;
					
					const onlineTitle = onlineMainListWrapper.querySelector(".onlineTitle"); 
					onlineTitle.innerText = e.onlineCounselBoardDto.title;
					
					const onlineCreatedAt = onlineMainListWrapper.querySelector(".onlineCreatedAt");
					const date = new Date(e.onlineCounselBoardDto.created_at);
					onlineCreatedAt.innerText = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
				 
					onlineMainListBox.appendChild(onlineMainListWrapper);

				}
			});
		}
		
		
		function reloadGroupMainList(){
			
			url = "./getGroupMainList?external_pk=" + myId;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const groupMainListBox = document.querySelector(".groupMainListBox");
				groupMainListBox.innerHTML = "";
				
				for(e of response.data){
					
					const groupMainListWrapper = document.querySelector("#templete .groupMainListWrapper").cloneNode(true);
										
					const groupTitle = groupMainListWrapper.querySelector(".groupTitle"); 
					groupTitle.innerText = e.title;
					
					const groupAmount = groupMainListWrapper.querySelector(".groupAmount");
					groupAmount.innerText = e.amount;
					
					const groupLocation = groupMainListWrapper.querySelector(".groupLocation"); 
					groupLocation.innerText = e.location;
					
					const groupDate = groupMainListWrapper.querySelector(".groupDate");
					const date = new Date(e.counsel_date);
					groupDate.innerText = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
				 
					groupMainListBox.appendChild(groupMainListWrapper);

				}
			});
		}

		function moveToOfflineCheckPage() {
			  const jspPageUrl = '../offlineCounsel/offlineCounselReservationCheckPage'; // 이동할 JSP 페이지의 URL을 입력하세요.
			  window.location.href = jspPageUrl;
			}

		function moveToOnlineCheckPage() {
			  const jspPageUrl = '../onlineCounsel/counselorOnlineCounselMainPage'; // 이동할 JSP 페이지의 URL을 입력하세요.
			  window.location.href = jspPageUrl;
			}

		function moveToStatisticsPage() {
			  const jspPageUrl = '../offlineCounsel/offlineCounselStatisticsPage'; // 이동할 JSP 페이지의 URL을 입력하세요.
			  window.location.href = jspPageUrl;
			}
		
		
		function lineChart(){
			
			url = "./getMainLineChart?external_pk="+ myId;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const result = response.data;
				
				const offlineData = result.offlineData;
				const onlineData = result.onlineData;
				const groupData = result.groupData;
				
		        // 라벨들을 담을 배열과 데이터를 담을 배열 초기화
		        const offlineLabels = [];
		        const offlineDataValues = [];
		        const onlineDataValues = [];
		        const groupDataValues = [];
	
		        // result를 순회하며 각 항목의 값을 추출하여 labels와 dataValues에 추가
		        offlineData.forEach(item => {
		        	offlineLabels.push(item.COUNSEL_DATE);
		        	offlineDataValues.push(item.COUNT);
		        });
		        
		        onlineData.forEach(item => {
		        	onlineDataValues.push(item.COUNT);
		        });

		        groupData.forEach(item => {
		        	groupDataValues.push(item.COUNT);
		        });
				
				const myChart1 = new Chart(
				    document.getElementById('myChart1'),
				    {
					    type: 'line',
					    data: {
					    	labels: offlineLabels,
					        datasets: [
					        	{
						        	label: '오프라인',
						            data: offlineDataValues,
						            fill: false,
						            borderColor: '#8ACDD7',
						            tension: 0.1
					        	},
					        	{
						        	label: '온라인',
						            data: onlineDataValues,
						            fill: false,
						            borderColor: '#FF90BC',
						            tension: 0.1
					        	},
					        	{
						        	label: '집단',
						            data: groupDataValues,
						            fill: false,
						            borderColor: '#A367B1',
						            tension: 0.1
					        	}
					        ]
					    },
					  	
					    //추가 옵션이 있을 경우
					    options: {
					    	// 차트 사이즈를 부모 컨테이너의 크기에 맞게 반응형으로 조정
							responsive: true,
		                    plugins: {
		                        legend: {
		                            position: 'top',
		                        },
		                        title: {
		                            display: true,
		                            text: '2주간 상담 통계량'
		                        }
		                    },
						    scales: {
						        y: {
						            beginAtZero: true,
						            max: 10,
						            min: 0,
						            ticks: {
						                stepSize: 1
						            }
						        }
						    }
					    }	
					}
				);
			});
		}
		
		function pieChart(){
			
			url = "./getMainPieChart?external_pk=" + myId;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const resultData = response.data;
				
		        const labels = [];
		        const dataValues = [];

		        resultData.forEach(item => {
		            labels.push(item.NAME);
		            dataValues.push(item.RATE);
		        });
		        
		        const ctx = document.getElementById("myChart2");
		        
		        const DATA_COUNT = resultData.length;
	            const NUMBER_CFG = { count: DATA_COUNT, min: 0, max: 100 };

	            const COLORS = [
	            	'#6FEDD6',
	            	'#FF9551',
	            	'#FF4A4A',
	            	'#9AD0C2',
	            	'#2D9596',
	            	'#265073',
	            	'#ECF4D6',
	            	'#7071E8', 
	            	'#C683D7', 
	            	'#ED9ED6',
	            	'#C0EEE4',
	            	'#F8F988',
	            	'#FFCAC8',
	            	'#FF9E9E',
	            	'#F4F27E',
	            	'#6DB9EF',
	            	'#3081D0'
	            ];
	            
	            const data = {
		                labels: labels,
		                datasets: [
		                    {
		                        label: 'Percentage',
		                        data: dataValues,
		                        backgroundColor: COLORS.slice(0, dataValues.length),
		                    }
		                ]
		            };

	            
	            const myChart = new Chart(ctx, {
	                type: 'pie',
	                data: data,
	                options: {
	                    responsive: false,
	                    plugins: {
	                        legend: {
	                            position: 'top',
	                        },
	                        title: {
	                            display: true,
	                            text: '카테고리별 상담 통계'
	                        }
	                    }
	                }
	            	
	            });
	            
	            const actions = [
	                {
	                    name: 'Randomize',
	                    handler(chart) {
	                    	myChart.data.datasets.forEach(dataset => {
	                            dataset.data = Utils.numbers({ count: myChart.data.labels.length, min: 0, max: 100 });
	                        });
	                    	myChart.update();
	                    }
	                },
	        		{
	        		    name: 'Add Dataset',
	        		    handler(myChart) {
	        		      	const data = myChart.data;
	        		      	const newDataset = {
	        		        	label: 'Dataset ' + (data.datasets.length + 1),
	        		        	backgroundColor: [],
	        		        	data: [],
	        		      	};

	        		      	for (let i = 0; i < data.labels.length; i++) {
	        		        	newDataset.data.push(Utils.numbers({count: 1, min: 0, max: 100}));

	        		        const colorIndex = i % Object.keys(Utils.CHART_COLORS).length;
	        		        newDataset.backgroundColor.push(Object.values(Utils.CHART_COLORS)[colorIndex]);
	        		    	}

	        		      	myChart.data.datasets.push(newDataset);
	        		      	myChart.update();
	        		    }
	        		},
	        		{
	        		    name: 'Add Data',
	        		    handler(myChart) {
	        		      	const data = myChart.data;
	        		      	if (data.datasets.length > 0) {
	        		        	data.labels.push('data #' + (data.labels.length + 1));

	        		        for (let index = 0; index < data.datasets.length; ++index) {
	        		          	data.datasets[index].data.push(Utils.rand(0, 100));
	        		        }

	        		        myChart.update();
	        		      	}
	        		    }
	        		},
	        		{
	        		    name: 'Remove Dataset',
	        		    handler(myChart) {
	        		    	myChart.data.datasets.pop();
	        		    	myChart.update();
	        		    }
	        		},
	        		{
	        		    name: 'Remove Data',
	        		    handler(myChart) {
	        		    	myChart.data.labels.splice(-1, 1); // remove the label first

	        		    	myChart.data.datasets.forEach(dataset => {
	        		        dataset.data.pop();
	        		    });

	        		    	myChart.update();
	        		    }
	        		}

	            ];

			});
		}
	
		
		function mainListCount(){
			
			url = "./getMainListCount?external_pk=" + myId;
			
			const offlineCount = document.querySelector(".offlineCount");
			offlineCount.innerText = "";
			
			const onlineCount = document.querySelector(".onlineCount");
			onlineCount.innerText = "";
			
			const groupCount = document.querySelector(".groupCount");
			groupCount.innerText = "";

			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const count = response.data;
				offlineCount.innerText = count.offlineCount;
				onlineCount.innerText = count.onlineCount;
				groupCount.innerText = count.groupCount;
				
			});

			
			
		}
		
		
		window.addEventListener("DOMContentLoaded", () => {
			reloadOfflineMainList();
			reloadOnlineMainList();
			reloadGroupMainList();
			mainListCount();
			lineChart();
			pieChart();
		});
	
	
	</script>

</head>
<body>


	<!-- 상단 배너 -->
	
	<jsp:include page="./staffTopArea.jsp"></jsp:include>
	

	
	<!-- 상단 배너 이미지 -->	

	<div class="row">
		<div class="col fw-bold text-center">
			<img src="../../resources/img/counselCenterStaff/topBanner01.jpg" class="border border-dark" style="max-width: 100%; height: auto;">
		</div>
	</div>
	
	
	
	
	<!-- 중메뉴 -->

	<div class="container">
		<div class="row text-center fw-bold mt-4">
			<div class="col text-primary-emphasis">집단상담</div>
			<div class="col text-primary-emphasis">공지사항</div>
			<div class="col text-primary-emphasis">자유게시판</div>
		</div>
		<div class="row text-center mt-3">
			<div class="col">
				<div class="row">
					<div class="col-2"></div>
					<div class="col" style="border-top: 1.3px solid #ffa500;"></div>
					<div class="col-2"></div>
				</div>
			</div>
			<div class="col">
				<div class="row">
					<div class="col-2"></div>
					<div class="col" style="border-top: 1.3px solid #ffa500;"></div>
					<div class="col-2"></div>
				</div>
			</div>
			<div class="col">
				<div class="row">
					<div class="col-2"></div>
					<div class="col" style="border-top: 1.3px solid #ffa500;"></div>
					<div class="col-2"></div>
				</div>
			</div>
		</div>

		<div class="row pt-4" style="background-color: rgb(238, 238, 238);">
			<div class="col">
				<div class="row">
					<div class="col-3 ms-5 me-3 px-5 py-2 border rounded bg-white">
						<div class="row">
							<div class="col">
								<div class="row pt-2">
									<div class="col pt-2 fw-bold" style="color: #133369;">
										오프라인 상담예약(<span class="offlineCount">7</span>건)
									</div>
									<div class="col-3 text-end pe-2">
										<a class="navbar-brand" onclick="moveToOfflineCheckPage()" style="cursor:pointer;"><span class="fs-3 fw-bold" style="color: #133369;">+</span></a>
									</div>
								</div>
								<div class="row pb-3 border-top border-dark border-2 text-center" style="font-size: small;">
									<div class="col">
										<div class="row fw-bold py-2 border-bottom bg-secondary-subtle border-dark">
											<div class="col-3">
												이름
											</div>
											<div class="col">
												상담 종류
											</div>
											<div class="col-3">
												시간
											</div>
										</div>
										<div class="row">
											<div class="offlineMainListBox col overflow-auto" style="height: 16em;">

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-4 mx-2 px-5 pb-2 border rounded bg-white">
						<div class="row pt-3">
							<div class="col pt-2 fw-bold" style="color: #133369;">
								신규 온라인 상담(<span class="onlineCount">4</span>건)
							</div>
							<div class="col-3 text-end pe-2">
								<a class="navbar-brand" onclick="moveToOnlineCheckPage()" style="cursor:pointer;"><span class="fs-3 fw-bold" style="color: #133369;">+</span></a>
							</div>
						</div>
						<div class="row text-center border-top border-dark border-2" style="font-size: small;">
							<div class="col">
								<div class="row border-bottom border-dark py-2 bg-secondary-subtle">
									<div class="col-2 ps-4 fw-bold">
										이름
									</div>
									<div class="col-3 fw-bold">
										상담 종류
									</div>
									<div class="col-4 fw-bold">
										제목
									</div>
									<div class="col-3 fw-bold">
										신청일
									</div>
								</div>
								<div class="row text-center" style="font-size: small;">
									<div class="onlineMainListBox col overflow-auto" style="height: 16em;">

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-4 mx-2 px-5 pb-2 border rounded bg-white">
						<div class="row pt-3">
							<div class="col pt-2 fw-bold" style="color: #133369;">
								신규 집단 상담(<span class="groupCount">4</span>건)
							</div>
							<div class="col-3 text-end pe-2">
								<a class="navbar-brand" onclick="moveToStatisticsPage()" style="cursor:pointer;"><span class="fs-3 fw-bold" style="color: #133369;">+</span></a>
							</div>
						</div>
						<div class="row text-center border-top border-dark border-2" style="font-size: small;">
							<div class="col">
								<div class="row border-bottom border-dark py-2 bg-secondary-subtle">
									<div class="col-4 ps-4 fw-bold">
										제목
									</div>
									<div class="col-2 fw-bold">
										신청인원
									</div>
									<div class="col-3 fw-bold">
										장소
									</div>
									<div class="col-3 fw-bold">
										시행일시
									</div>
								</div>
								<div class="row text-center" style="font-size: small;">
									<div class="groupMainListBox col overflow-auto" style="height: 16em;">

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row my-5">
					<div class="col">
						<div class="row">
							<div class="col-7 ms-5 me-3 px-5 py-2 border rounded bg-white">
								<div class="row pt-3 ms-2">
									<div class="col ps-3 pt-2 fw-bold" style="color: #133369;">
										상담 진행 현황
									</div>
									<div class="col-7"></div>
								</div>
								<div class="row pt-2 pb-4">
									<div class="col">
										<canvas id="myChart1"></canvas>
									</div>
								</div>
							</div>
							<div class="col ms-2 me-5 px-5 py-2 border rounded bg-white">
								<div class="row pt-3 ms-2">
									<div class="col ps-3 pt-2 fw-bold" style="color: #133369;">
										카테고리별 상담 현황
									</div>
									<div class="col-7"></div>
								</div>
								<div class="row pt-3">
									<div class="col ps-5">
										<canvas id="myChart2" width="420" height="420"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="templete" class="d-none">
		<div class="offlineMainListWrapper row pt-2 pb-2 border-bottom">
			<div class="offlineName col-3">
				김현영
			</div>
			<div class="offlineCategory col">
				우울/불안 문제
			</div>
			<div class="offlineHour col-3">
				13:00
			</div>
		</div>
		<div class="onlineMainListWrapper row text-center border-bottom py-2" style="font-size: small;">
			<div class="onlineName col-2 ps-4">
				김현영
			</div>
			<div class="onlineCategory col-3">
				진로 문제
			</div>
			<div class="onlineTitle col-4 text-truncate">
				미래가 너무 걱정스럽다...
			</div>
			<div class="onlineCreatedAt col-3">
				2023-12-15
			</div>
		</div>
		<div class="groupMainListWrapper row text-center border-bottom py-2" style="font-size: small;">
			<div class="groupTitle col-4 ps-4 text-truncate">
				금연상담 프로그램
			</div>
			<div class="groupAmount col-2">
				30
			</div>
			<div class="groupLocation col-3 text-truncate">
				강남역 3번출구 앞
			</div>
			<div class="groupDate col-3">
				2023-12-22
			</div>
		</div>
		
	

	</div>

		
		<div class="row mt-5">
			<div class="col-1"></div>
			<div class="col" style="font-weight: bold; color: navy; text-align: center;">상담원 관리</div>
			<div class="col" style="font-weight: bold; color: navy; text-align: center;">조회수 Top3 공지사항</div>
			<div class="col" style="font-weight: bold; color: navy; text-align: center;">조회수 Top3 게시글</div>
			<div class="col-1"></div>
		</div>
			


		<div class="row mt-4">
			<div class="col-1"></div>

			<!-- 통계1 -->
			<div class="col">
				<div class="row mb-2" style="font-weight: bold; font-size: 0.8em; text-align: center;">
					<div class="col-4">상담원 번호</div>
					<div class="col">이름</div>
					<div class="col">성별</div>
					<div class="col">등록일</div>
				</div>
				<c:forEach items="${counselorList }" var="counselorList">
					<div class="row">
						<div class="col-4" style="text-align: center; font-size: 0.8em; font-weight: bold;">
							${counselorList.id }
						</div>
						<div class="col" style="text-align: center; font-size: 0.8em; font-weight: bold;">
							${counselorList.name }
						</div>
						<div class="col" style="text-align: center; font-size: 0.8em; font-weight: bold;">
							${counselorList.gender }
						</div>
						<div class="col" style="text-align: center; font-size: 0.8em;">
							<fmt:formatDate value="${counselorList.created_at }" pattern="yy.MM.dd"/>
						</div>
					</div>
				</c:forEach>
			</div>			
			
			
			<!-- 통계2 -->
			<div class="col-1" style="font-weight: bold; font-size: 0.8em; text-align: right;">
				<div class="row">
					<div class="col">
						순위
					</div>
				</div>
				<div class="row mt-2">
					<div class="col" style="color: red;">1위</div>
				</div>
				<div class="row">
					<div class="col" style="color: mediumblue;">2위</div>
				</div>
				<div class="row">
					<div class="col" style="color: darkgreen;">3위</div>
				</div>
			</div>
			<div class="col">
				<div class="row mb-2" style="font-weight: bold; font-size: 0.8em; text-align: center;">
					<div class="col">제목</div>
					<div class="col">조회수</div>
					<div class="col">작성일</div>
				</div>
				<c:forEach items="${top3Notice }" var="top3Notice">
					<div class="row">
						<div class="col" style="font-weight: bold; font-size: 0.8em; text-align: center;">
							<a href="..//notice/readNoticeBoardPage?id=${top3Notice.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${top3Notice.title }</a>
						</div>
						<div class="col" style="font-weight: bold; font-size: 0.8em; text-align: center;">
							<a href="..//notice/readNoticeBoardPage?id=${top3Notice.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;">${top3Notice.read_count }</a>
						</div>
						<div class="col" style="font-size: 0.8em; text-align: center;">
							<a href="..//notice/readNoticeBoardPage?id=${top3Notice.id }" class="link-offset-2 link-underline link-underline-opacity-0" style="color: black;"><fmt:formatDate value="${top3Notice.created_at }" pattern="yy.MM.dd"/></a>
						</div>
					</div>
				</c:forEach>
			</div>
			
			
			<!-- 통계3 -->
			<div class="col-1" style="font-weight: bold; font-size: 0.8em; text-align: right;">
				<div class="row">
					<div class="col">
						순위
					</div>
				</div>
				<div class="row mt-2">
					<div class="col" style="color: red;">1위</div>
				</div>
				<div class="row">
					<div class="col" style="color: mediumblue;">2위</div>
				</div>
				<div class="row">
					<div class="col" style="color: darkgreen;">3위</div>
				</div>
			</div>
			<div class="col">
				<div class="row mb-2" style="font-weight: bold; font-size: 0.8em; text-align: center;">
					<div class="col-5">제목</div>
					<div class="col">조회수</div>
					<div class="col">작성일</div>
				</div>
				<c:forEach items="${top3Freeboard }" var="top3Freeboard">
					<div class="row">
						<div class="col-5" style="font-weight: bold; font-size: 0.8em; text-align: center;">
							${top3Freeboard.title }
						</div>
						<div class="col" style="font-weight: bold; font-size: 0.8em; text-align: center;">
							${top3Freeboard.read_count }
						</div>
						<div class="col" style="font-size: 0.8em; text-align: center;">
							<fmt:formatDate value="${top3Freeboard.created_at }" pattern="yy.MM.dd"/>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	
	
	
	

	<!-- 풋터 -->
	
	<div class="row">
		<div class="col text-center fw-bold">
			<hr>
		</div>
	</div>
	<div class="row">
		<div class="col"></div>
		<div class="col">
			<div class="row">
				<div class="col" style="font-size: 0.7em; font-weight: bold; text-align: center;">
					서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층) /
				</div>
			</div>
			<div class="row">
				<div class="col" style="font-size: 0.7em; font-weight: bold; text-align: center;">
					TEL:010-4761-2103 / E-MAIL:se001lec@naver.com
				</div>
			</div>
			<div class="row">
				<div class="col" style="font-size: 0.7em; font-weight: bold; text-align: center;">
					COPYRIGHT© 2023 MINKUE UNIVERSITY ALL RIGHTS RESERVED.
				</div>
			</div>
		</div>
		<div class="col mt-2" style="text-align: left;">
			<i class="bi bi-twitter"></i>
			<i class="bi bi-facebook"></i>
			<i class="bi bi-instagram"></i>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>