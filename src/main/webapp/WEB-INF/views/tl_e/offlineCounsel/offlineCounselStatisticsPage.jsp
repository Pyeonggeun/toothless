<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		
		
		function lineChart(){
			
			url = "./twoWeekStatisticsData?external_pk="+ myId;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const resultData = response.data;
				
		        // 라벨들을 담을 배열과 데이터를 담을 배열 초기화
		        const labels = [];
		        const dataValues = [];

		        // resultData를 순회하며 각 항목의 값을 추출하여 labels와 dataValues에 추가
		        resultData.forEach(item => {
		            labels.push(item.COUNSEL_DATE);
		            dataValues.push(item.COUNT);
		        });
				
				const myChart1 = new Chart(
				    document.getElementById('myChart1'),
				    {
					    type: 'line',
					    data: {
					        labels: labels,
					        datasets: [{
					            label: '누적 통계',
					            data: dataValues,
					            fill: false,
					            borderColor: '#E26EE5',
					            tension: 0.1
					        }]
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
		                            text: '2주간 상담 누적 통계량'
		                        }
		                    },
						    scales: {
						        y: {
						            beginAtZero: true,
						            max: 20,
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
			
			url = "./twoWeekStatisticsDataByCategory?external_pk=" + myId;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const resultData = response.data;
				
		        const labels = [];
		        const dataValues = [];

		        resultData.forEach(item => {
		            labels.push(item.CATEGORYNAME);
		            dataValues.push(item.RATE);
		        });
		        
		        const ctx = document.getElementById("myChart2");
		        
		        const DATA_COUNT = resultData.length;
	            const NUMBER_CFG = { count: DATA_COUNT, min: 0, max: 100 };

	            const data = {
		                labels: labels,
		                datasets: [
		                    {
		                        label: 'Percentage',
		                        data: dataValues,
		                        backgroundColor: ['#7071E8', '#C683D7', '#ED9ED6'],
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
		
		
		function barChart(){
			
			
			url = "./offlineSurveyScoreStatistics?external_pk=" + myId;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				
				const resultData = response.data;
				
		        const labels = [];
		        const dataValues = [];

		        resultData.forEach(item => {
		            labels.push(item.SCORE);
		            dataValues.push(item.COUNT);
		        });
		        
		        const ctx = document.getElementById("myChart3");
				
		        const DATA_COUNT = resultData.length;
		        const NUMBER_CFG = {count: DATA_COUNT, min: -0, max: 10};
				
		        const data = {
		          labels: labels,
		          datasets: [
		            {
		              label: '리뷰 평점수',
		              data: dataValues,
		              backgroundColor: ['#8ACDD7'],
		            },
		          ]
		        };
		        
		        const myChart = new Chart(ctx, {
		        	  type: 'bar',
		        	  data: data,
		        	  options: {
		        	    responsive: true,
		        	    plugins: {
		        	      legend: {
		        	        position: 'top',
		        	      },
		        	      title: {
		        	        display: true,
		        	        text: '상담 평점당 개수'
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
					    },
					    barThickness: 20
		        	}
		        });
		        
		        const actions = [
		        	  {
		        	    name: 'Randomize',
		        	    handler(chart) {
		        	      chart.data.datasets.forEach(dataset => {
		        	        dataset.data = chart.data.labels.map(() => {
		        	          return [Utils.rand(-100, 100), Utils.rand(-100, 100)];
		        	        });
		        	      });
		        	      chart.update();
		        	    }
		        	  },
		        	];
				
			});
			
		}
		
		
		function barChart2(){
			
			url = "./offlineStatisticsOfDay?external_pk=" + myId;
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				const resultData = response.data;
				
		        const labels = [];
		        const dataValues = [];

		        resultData.forEach(item => {
		            labels.push(item.DAYWEEK);
		            dataValues.push(item.COUNT);
		        });
		        
		        const ctx = document.getElementById("myChart4");
				
		        const DATA_COUNT = dataValues.length;
		        const NUMBER_CFG = {count: DATA_COUNT, min: -100, max: 100};
		        
		        const data = {
				          labels: labels,
				          datasets: [
				            {
				              label: '요일별 통계',
				              data: dataValues,
				              borderColor: "#C5E898",
				              backgroundColor: "#C5E898",
				              barThickness: 20
				            },
					    ]
					};

		        
		        const myChart = new Chart(ctx, {
		        		  type: 'bar',
		        		  data: data,
		        		  options: {
		        		    responsive: true,
		        		    plugins: {
		        		      legend: {
		        		        position: 'top',
		        		      },
		        		      title: {
		        		        display: true,
		        		        text: '요일별 상담 통계'
		        		    },
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
					    },

		        	},

		        });
		        
		        <%--
		        const data = {
		          labels: labels,
		          datasets: [
		            {
		              label: '요일별 통계',
		              data: Utils.numbers(NUMBER_CFG),
		              borderColor: Utils.CHART_COLORS.red,
		              backgroundColor: Utils.transparentize(Utils.CHART_COLORS.red, 0.5),
		            },
		          ]
		        };
		        --%>
		        
		        const actions = [
		        	  {
		        	    name: 'Randomize',
		        	    handler(chart) {
		        	      chart.data.datasets.forEach(dataset => {
		        	        dataset.data = Utils.numbers({count: chart.data.labels.length, min: -100, max: 100});
		        	      });
		        	      chart.update();
		        	    }
		        	  },
		        	  {
		        	    name: 'Add Dataset',
		        	    handler(chart) {
		        	      const data = chart.data;
		        	      const dsColor = Utils.namedColor(chart.data.datasets.length);
		        	      const newDataset = {
		        	        label: 'Dataset ' + (data.datasets.length + 1),
		        	        backgroundColor: Utils.transparentize(dsColor, 0.5),
		        	        borderColor: dsColor,
		        	        borderWidth: 1,
		        	        data: Utils.numbers({count: data.labels.length, min: -100, max: 100}),
		        	      };
		        	      chart.data.datasets.push(newDataset);
		        	      chart.update();
		        	    }
		        	  },
		        	  {
		        	    name: 'Add Data',
		        	    handler(chart) {
		        	      const data = chart.data;
		        	      if (data.datasets.length > 0) {
		        	        data.labels = Utils.months({count: data.labels.length + 1});

		        	        for (let index = 0; index < data.datasets.length; ++index) {
		        	          data.datasets[index].data.push(Utils.rand(-100, 100));
		        	        }

		        	        chart.update();
		        	      }
		        	    }
		        	  },
		        	  {
		        	    name: 'Remove Dataset',
		        	    handler(chart) {
		        	      chart.data.datasets.pop();
		        	      chart.update();
		        	    }
		        	  },
		        	  {
		        	    name: 'Remove Data',
		        	    handler(chart) {
		        	      chart.data.labels.splice(-1, 1); // remove the label first

		        	      chart.data.datasets.forEach(dataset => {
		        	        dataset.data.pop();
		        	      });

		        	      chart.update();
		        	    }
		        	  }
		        	];
			
			});
			
		}
		
		
		
		window.addEventListener("DOMContentLoaded", () => {
			lineChart();
			pieChart();
			barChart();
			barChart2();
		});
	
	</script>


</head>
<body>

	<div class="container-fluid">
	
		<div class="row">
			<div class="col">
				<jsp:include page="../commons/counselorTopArea.jsp"></jsp:include>
			</div>
		</div>

		<div class="row">
			<div class="col-1"></div>
			<div class="col-10 ps-5">
				<div class="row pt-5">
					<div class="col fs-3 fw-bold">
						통계 내역
					</div>
				</div>
				<div class="row pt-5 fw-bold text-center">
					<div class="col-6">
						<div class="row ps-3">
							<div class="col px-3 py-1 border border-dark rounded-pill text-white" style="background-color: #133369;">
								2주간 상담 진행 현황
							</div>
							<div class="col-7"></div>
						</div>
						<div class="row pt-5">
							<div class="col">
								<canvas id="myChart1"></canvas>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="row ps-3">
							<div class="col px-3 py-1 border border-dark rounded-pill text-white" style="background-color: #133369;">
								상담 리뷰 평점 통계
							</div>
							<div class="col-7"></div>
						</div>
						<div class="row pt-5">
							<div class="col">
								<canvas id="myChart3"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="row mt-5 pt-5 fw-bold text-center">
					<div class="col-6">
						<div class="row ps-3">
							<div class="col px-3 py-1 border border-dark rounded-pill text-white" style="background-color: #133369;">
								카테고리별 상담 통계
							</div>
							<div class="col-7"></div>
						</div>
						<div class="row pt-5">
							<div class="col">
								<canvas id="myChart2" width="400" height="400"></canvas>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="row ps-3">
							<div class="col px-3 py-1 border border-dark rounded-pill text-white" style="background-color: #133369;">
								요일별 상담 통계
							</div>
							<div class="col-7"></div>
						</div>
						<div class="row pt-5">
							<div class="col">
								<canvas id="myChart4" width="400" height="200"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		
		<pre>
		
		
		
		
		
		
		
		</pre>
	
	
	</div>
	


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>