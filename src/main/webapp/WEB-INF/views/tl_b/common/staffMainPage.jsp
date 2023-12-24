<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        
        <script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
        
        <script>
        
        	function reloadItemList() {
        		
        		const url = "./getItemList";
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			const itemBox = document.getElementById("itemBox");
        			itemBox.innerHTML = "";
        			
        			for(e of response.data) {
        				
        				const itemWrapper = document.querySelector("#templete .itemWrapper").cloneNode(true);
        				
        				itemWrapper.querySelector(".itemName").innerText = e.NAME;
        				itemWrapper.querySelector(".itemCategory").innerText = e.CATEGORYNAME;
        				
        				const rentalDate = new Date(e.RENTAL_DATE);
	        			const returnDate = new Date(e.RETURN_DATE);
        				
	        			itemWrapper.querySelector(".itemDate").innerText =
        					rentalDate.getFullYear() + "." + ("0" + (rentalDate.getMonth() + 1)).slice(-2) + "." + ("0" + rentalDate.getDate()).slice(-2) + "~" +
        					returnDate.getFullYear() + "." + ("0" + (returnDate.getMonth() + 1)).slice(-2) + "." + ("0" + returnDate.getDate()).slice(-2);
        				
	        			itemBox.appendChild(itemWrapper);
        				
        			}
        			
        		});
        		
        	}
        	
        	function reloadEduList() {
        		
        		const url = "./getEduList";
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			const eduBox = document.getElementById("eduBox");
        			eduBox.innerHTML = "";
        			
        			for(e of response.data) {
        				
        				const eduWrapper = document.querySelector("#templete .eduWrapper").cloneNode(true);
        				
        				eduWrapper.querySelector(".eduNumber").innerText = e.EDU_PK;
        				eduWrapper.querySelector(".eduName").innerText = e.NAME;
        				eduWrapper.querySelector(".eduCurrentCount").innerText = e.QUANTITY;
        				eduWrapper.querySelector(".eduTotalCount").innerText = e.CAPACITY;
        				
						const eduDate = new Date(e.EDU_DATE);
        				
						eduWrapper.querySelector(".eduDate").innerText =
							eduDate.getFullYear() + "." + ("0" + (eduDate.getMonth() + 1)).slice(-2) + "." + ("0" + eduDate.getDate()).slice(-2);
						
						eduBox.appendChild(eduWrapper);
        				
        			}
        			
        		});
        		
        	}
        	
        	function reloadStudentboardList() {
        		
        		const url = "./getStudentboardList";
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {

        			const studentBox = document.getElementById("studentBox");
        			studentBox.innerHTML = "";
        			
        			for(e of response.data) {
        				
        				const studentWrapper = document.querySelector("#templete .studentWrapper").cloneNode(true);
        				
        				studentWrapper.querySelector(".studentName").innerText = e.TITLE;
        				
						const studentDate = new Date(e.CREATED_AT);
        				
						studentWrapper.querySelector(".studentDate").innerText =
							studentDate.getFullYear() + "-" + ("0" + (studentDate.getMonth() + 1)).slice(-2) + "-" + ("0" + studentDate.getDate()).slice(-2);
						
						studentBox.appendChild(studentWrapper);
        				
        			}
        			
        		});
        		
        	}
        	
        	function reloadStaffboardList() {
        		
        		const url = "./getStaffboardList";;
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			const staffBox = document.getElementById("staffBox")
        			staffBox.innerHTML = "";
        			
        			for(e of response.data) {
        				
        				const staffWrapper = document.querySelector(".staffWrapper").cloneNode(true);
        				
        				staffWrapper.querySelector(".staffName").innerText = e.TITLE;
        				
						const staffDate = new Date(e.CREATED_AT);
        				
						staffWrapper.querySelector(".staffDate").innerText =
							staffDate.getFullYear() + "-" + ("0" + (staffDate.getMonth() + 1)).slice(-2) + "-" + ("0" + staffDate.getDate()).slice(-2);
						
						staffBox.appendChild(staffWrapper);
        				
        			}
        			
        		});
        		
        	}
        	
        	function reloadMedicineCount() {
        		
        		const url = "./getMedicineCount";
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			resetMedicineBox();
        			
        			document.getElementById("medicineTotalCount").innerText = response.data.totalMedicineCount;
            		document.getElementById("medicineAddCount").innerText = response.data.addMedicineCount;
            		document.getElementById("medicineOutCount").innerText = response.data.outMedicineCount;            		
            		document.getElementById("medicineDisposalCount").innerText = response.data.disposalMedicineCount;
            		document.getElementById("medicineLossCount").innerText = response.data.lossMedicineCount;
            		document.getElementById("medicineAdjustmentCount").innerText = response.data.adjustmentMedicineCount;
        			
        		});
        		
        	}
        	
        	function reloadUserCountList() {
        		
        		const url = "./getUserCountList";
        		
        		fetch(url)
        		.then(response => response.json())
        		.then(response => {
        			
        			const list = response.data;
        			
        			reloadChart(list);
        			
        		});
        		
        	}
			
        	function reloadChart(list) {
        		
        		const date = new Date();
        		const year = date.getFullYear();
        		const month = date.getMonth();
        		const firstDate = new Date(year, month, 1);
        		const firstDateStr = 
        			firstDate.getFullYear() + "-" + ("0" + (firstDate.getMonth() + 1)).slice(-2) + "-" + ("0" + firstDate.getDate()).slice(-2);
        		const lastDate = new Date(year, month+1, 0);
        		const lastDateStr = 
        			lastDate.getFullYear() + "-" + ("0" + (lastDate.getMonth() + 1)).slice(-2) + "-" + ("0" + lastDate.getDate()).slice(-2);
        		
        		let chartData = [];
        		for (let i = 1 ; i <= lastDate.getDate() ; i++) {
        		    let user = list[i-1];
        		    let currentDate = new Date(year, month, i);
        		    chartData.push({x: currentDate, y: user});
        		}
        		
        		
        		const ctx = document.getElementById('myChart');
        		
		    	new Chart(ctx, {
				    type: 'line',
				    data: {
				    	datasets: [{
					        label: '이용자 수',
					        data: chartData,
					        borderWidth: 1,
					        borderColor: '#005EAD'
				      	}]
				    },
				    options: {
				    	responsive: false,
				    	scales: {
				    		x: {
				                type: 'time',
				                time: {
				                    unit: 'day'
				                },
				                min: firstDateStr,
				                max: lastDateStr
				            },
					        y: {
					          beginAtZero: true,
					          stepSize: 5
					        }
				      	}
				    }
				});
        		
        	}
        	
        	function resetMedicineBox(){
        		
        		document.getElementById("medicineTotalCount").innerText = "";
        		document.getElementById("medicineAddCount").innerText = "";
        		document.getElementById("medicineOutCount").innerText = "";
        		document.getElementById("medicineDisposalCount").innerText = "";
        		document.getElementById("medicineLossCount").innerText = "";
        		document.getElementById("medicineAdjustmentCount").innerText = "";
        		
        	}
        	
			window.addEventListener("DOMContentLoaded", () => {
	    		
				reloadItemList();
				reloadEduList();
				reloadStudentboardList();
				reloadStaffboardList();
				reloadMedicineCount();
				reloadUserCountList();
	    		
	    	});
        
		</script>
        
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <div class="row">
                        <div class="col px-0">
                            <img class="img-fluid" src="../../resources/img/healthRoom/staffTopImg.jpg" style="height: 11vh; width: 100%; object-fit: cover; object-position: 50% 43%;">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="row border-bottom">
                                <div class="col py-2 fw-bold">
                                    <a href="./staffMainPage" class="link-underline link-underline-opacity-0 link-dark">
                                    	<img class="img-fluid" src="../../resources/img/another/logo_black.png" style="width: 2%;">
                                    	<span style="font-size: 0.95em; word-spacing: -0.25em">MK University</span>&nbsp;|<span style="font-size: 0.75em"> 보건센터</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <jsp:include page="../commonJsp/staffSideBar.jsp"></jsp:include>
                                <div class="col">
                                    <div class="row">
                                        <div class="col py-4 px-4">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row border-bottom" style="height: 10.72em">
                                                        <div class="col-4 px-4">
                                                            <div class="row">
                                                                <div class="col fw-bold" style="font-size: large;">
                                                                    오늘의 물품 대여
                                                                </div>
                                                                <div class="col text-end my-auto text-secondary" style="font-size: small;">
                                                                    <a class="link-underline link-underline-opacity-0 link-dark" href="../ys/staffItemApplyListPage">더보기 &gt;</a>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-2">
                                                                <div class="col">
                                                                    <div class="row fw-semibold text-white" style="font-size: 0.8em; background-color: #005EAD">
                                                                    	<div class="col-2 text-center">물품</div>
                                                                    	<div class="col text-center">카테고리</div>
                                                                    	<div class="col text-center">대여일</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="row">
                                                            	<div id="itemBox" class="col">
                                                            	
                                                            	</div>
                                                            </div>
                                                            
                                                        </div>
                                                        <div class="col px-4">
                                                            <div class="row">
                                                                <div class="col fw-bold" style="font-size: large;">
                                                                    교육프로그램 현황
                                                                </div>
                                                                <div class="col text-end my-auto text-secondary" style="font-size: small;">
                                                                    <a class="link-underline link-underline-opacity-0 link-dark" href="../hs/eduMainPageForStaff">더보기 &gt;</a>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-2">
                                                                <div class="col">
                                                                    <div class="row fw-semibold text-white" style="font-size: 0.8em; background-color: #005EAD">
                                                                    	<div class="col text-center">번호</div>
                                                                    	<div class="col-6 text-center">프로그램명</div>
                                                                    	<div class="col text-center">신청인원</div>
                                                                    	<div class="col text-center">교육일</div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="row">
                                                            	<div id="eduBox" class="col">
                                                            		
                                                            	</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col">
                                                    <div class="row border-bottom" style="height: 10.05em">
                                                        <div class="col-4 px-4">
                                                            <div class="row">
                                                                <div class="col fw-bold" style="font-size: large;">
                                                                    <span style="color: #005EAD">공지</span>사항
                                                                </div>
                                                                <div class="col text-end my-auto text-secondary" style="font-size: small;">
                                                                    <a class="link-underline link-underline-opacity-0 link-dark" href="../ty/staffBoardPage">더보기 &gt;</a>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div id="studentBox" class="col px-2">
                                                                	
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col px-4">
                                                            <div class="row">
                                                                <div class="col fw-bold" style="font-size: large;">
                                                                    의약품 통계
                                                                </div>
                                                                <div class="col text-end my-auto text-secondary" style="font-size: small;">
                                                                    <a class="link-underline link-underline-opacity-0 link-dark" href="../kh/medicineInventory">더보기 &gt;</a>
                                                                </div>
                                                            </div>
                                                            <div class="row align-items-center" style="height: 6.8em">
                                                                <div class="col px-1">
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-end my-auto">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD;">
                                                                                        <i class="bi bi-capsule"></i>
                                                                                    </span>
                                                                                </div>
                                                                                <div class="col my-auto">
		                                                                            <div class="row">
		                                                                                <div class="col" style="font-size: small;">
		                                                                                    총재고
		                                                                                </div>
		                                                                            </div>
		                                                                            <div class="row mt-1">
		                                                                                <div id="medicineTotalCount" class="col fw-bold" style="font-size: large;">
		                                                                                    1000
		                                                                                </div>
		                                                                            </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-end my-auto">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD;">
                                                                                        <i class="bi bi-bag-plus"></i>
                                                                                    </span>
                                                                                </div>
                                                                                <div class="col my-auto">
		                                                                            <div class="row">
		                                                                                <div class="col" style="font-size: small;">
		                                                                                    입고
		                                                                                </div>
		                                                                            </div>
		                                                                            <div class="row mt-1">
		                                                                                <div id="medicineAddCount" class="col fw-bold" style="font-size: large;">
		                                                                                    1000
		                                                                                </div>
		                                                                            </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-end my-auto">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD;">
                                                                                        <i class="bi bi-prescription2"></i>
                                                                                    </span>
                                                                                </div>
                                                                                <div class="col my-auto">
		                                                                            <div class="row">
		                                                                                <div class="col" style="font-size: small;">
		                                                                                    처방
		                                                                                </div>
		                                                                            </div>
		                                                                            <div class="row mt-1">
		                                                                                <div id="medicineOutCount" class="col fw-bold" style="font-size: large;">
		                                                                                    1000
		                                                                                </div>
		                                                                            </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-end my-auto">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD;">
                                                                                        <i class="bi bi-trash"></i>
                                                                                    </span>
                                                                                </div>
                                                                                <div class="col my-auto">
		                                                                            <div class="row">
		                                                                                <div class="col" style="font-size: small;">
		                                                                                	폐기
		                                                                                </div>
		                                                                            </div>
		                                                                            <div class="row mt-1">
		                                                                                <div id="medicineDisposalCount" class="col fw-bold" style="font-size: large;">
		                                                                                    1000
		                                                                                </div>
		                                                                            </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-end my-auto">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD;">
                                                                                        <i class="bi bi-exclamation-lg"></i>
                                                                                    </span>
                                                                                </div>
                                                                                <div class="col my-auto">
		                                                                            <div class="row">
		                                                                                <div class="col" style="font-size: small;">
		                                                                                    망실
		                                                                                </div>
		                                                                            </div>
		                                                                            <div class="row mt-1">
		                                                                                <div id="medicineLossCount" class="col fw-bold" style="font-size: large;">
		                                                                                    1000
		                                                                                </div>
		                                                                            </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-end my-auto">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD;">
                                                                                        <i class="bi bi-feather"></i>
                                                                                    </span>
                                                                                </div>
                                                                                <div class="col my-auto">
		                                                                            <div class="row">
		                                                                                <div class="col" style="font-size: small;">
		                                                                                    조정
		                                                                                </div>
		                                                                            </div>
		                                                                            <div class="row mt-1">
		                                                                                <div id="medicineAdjustmentCount" class="col fw-bold" style="font-size: large;">
		                                                                                    1000
		                                                                                </div>
		                                                                            </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col-4 px-4">
                                                            <div class="row">
                                                                <div class="col fw-bold" style="font-size: large;">
                                                                    <span style="color: #005EAD">직원</span> 게시판
                                                                </div>
                                                                <div class="col text-end my-auto text-secondary" style="font-size: small;">
                                                                    <a class="link-underline link-underline-opacity-0 link-dark" href="../dy/staffboardPage">더보기 &gt;</a>
                                                                </div>
                                                            </div>
                                                            <div class="row mt-1">
                                                                <div id="staffBox" class="col px-2">
                                                                	
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col px-4">
                                                            <div class="row">
                                                                <div class="col fw-bold" style="font-size: large;">
                                                                    보건센터 이용자통계
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col px-1">
                                                                    <div>
																	  <canvas id="myChart" style="height: 16em; width: 100%;"></canvas>
																	</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
                </div>
            </div>
        </div>
        
        <div id="templete" class="d-none">
        	
    		<div class="itemWrapper row mt-1">
    			<div class="col">
    				<div class="row" style="font-size: 0.85em;">
    					<div class="itemName col-2 text-center">P3000</div>
    					<div class="itemCategory col text-center">들것</div>
    					<div class="itemDate col text-center">2023-12-13~2023-12-23</div>
    				</div>
    			</div>
    		</div>
    		
    		<div class="eduWrapper row mt-1">
       			<div class="col">
       				<div class="row" style="font-size: 0.85em;">
       					<div class="eduNumber col text-center">121</div>
                 	<div class="eduName col-6 text-center">크리스마스 특별 행사 Fun! Fun! English in Movie 1회</div>
                 	<div class="col text-center">
                 		<span class="eduCurrentCount fw-bold" style="color: #005EAD">2</span> / <span class="eduTotalCount">20</span>
                 	</div>
                 	<div class="eduDate col text-center">2023-12-30</div>
       				</div>
       			</div>
       		</div>
       		
       		<div class="studentWrapper row mt-2">
        		<div class="col">
        			<div class="row" style="font-size: 0.8em">
        				<div class="studentName col d-block text-truncate">
        					[잡담]'2024 행정업무 온라인 서비스 개편'에 대한 안내사항이 있다고 합니다.
        				</div>
        				<div class="studentDate col-3 text-end">
        					2023-12-21
        				</div>
        			</div>
        		</div>
        	</div>
        	
        	<div class="staffWrapper row mt-2">
           		<div class="col">
           			<div class="row" style="font-size: 0.8em">
           				<div class="staffName col d-block text-truncate">
           					결핵예방주간 손씻기 교육 및 마스크, 손소독제 배부 알림
           				</div>
           				<div class="staffDate col-3 text-end">
           					2023-12-21
           				</div>
           			</div>
           		</div>
           	</div>
        	
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>