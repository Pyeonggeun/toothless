<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<title>Insert title here</title>
		
		<script>
			let student_pk = "";	
		
			function getStudentInfo(){		
	    		fetch("./restStudentInfo")
	    		.then(response => response.json())
	    		.then(response => {
	    			
	    			const studentLoginPageUrl = "http://localhost:8181/toothless/another/student/loginPage";
	    			
	    			loginStudentInfo = response.data;	    			
	    			if(loginStudentInfo != null){
	    				student_pk = response.data.student_pk;	
	    			}
	    			
	    			if(loginStudentInfo == null){
	    				
	    				window.location.href = studentLoginPageUrl;
	    				
	    			}
	    		});		
	    	}
 
			
			function reloadItemList(){
				const url = "./restGetItemAndItemApplyList";
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					const studentItemListBox = document.getElementById("studentItemListBox");
					studentItemListBox.innerHTML = "";
					
					for(e of response.data){
						
						
						const studentItemListWrapper = document.querySelector("#templete .studentItemListWrapper").cloneNode(true);
						
						const imgLink = studentItemListWrapper.querySelector(".imgLink");
						imgLink.querySelector("img").src = "/uploadFiles/mainImage/" + e.itemDto.img_link;
						
						const catName = studentItemListWrapper.querySelector(".catName");
						catName.innerText = e.itemCatDto.name;
						
						const itemName = studentItemListWrapper.querySelector(".itemName");
						itemName.innerText = e.itemDto.name;
						
						const itemButton = studentItemListWrapper.querySelector(".itemButton");
						
						
						if(e.status == 'N' || e.status == null){
							if(e.itemApplyCount < 1){
								itemButton.setAttribute("onclick","showModal("+e.itemDto.item_pk+")");
								itemButton.classList.add("btn-primary");
								itemButton.innerText = "신청하기";
							}else if(e.itemApplyCount >= 1){
								itemButton.disabled = true;
								itemButton.classList.add("btn-outline-success");
								itemButton.innerText = "신청진행중"
							}
						}	
						if(e.status == 'Y'){
							itemButton.disabled = true;
							itemButton.classList.add("btn-outline-danger");
							itemButton.innerText = "대여중"
						}
							
						
						
						studentItemListBox.appendChild(studentItemListWrapper);
					}
				});
			}

			
			function showModal(itemPk){
		            //필요시 여기서 백엔드하고 연동... CSR
				const inputReason = document.getElementById("inputReason");
			
			
				const inputRentalDate = document.getElementById("inputRentalDate");
			
			
				const inputReturnDate = document.getElementById("inputReturnDate");
				
		            
	            const modal = bootstrap.Modal.getOrCreateInstance("#writeModal");
	            
	            inputReason.value="";
				inputRentalDate.value="";
				inputReturnDate.value="";
	            
		       	modal.show();
		       	
		       	const applyButton = document.getElementById("applyButton");
		       	applyButton.setAttribute("onclick","applyItem("+itemPk+")");
	        }

	        function save(){
	            //필요시 여기서 백엔드하고 연동... CSR
	            
	            const modal = bootstrap.Modal.getOrCreateInstance("#writeModal");
	           
	            modal.hide();
	        
	        }
	        
	        function applyItem(itemPk){
	        
	        
			const inputReason = document.getElementById("inputReason");
			
			
			const inputRentalDate = document.getElementById("inputRentalDate");
			
			
			const inputReturnDate = document.getElementById("inputReturnDate");
			
			if(inputReason.value == ''){
				alert("대여사유를 입력해주셔야 합니다.");
				inputReason.focus();
				return ;
			}
			
			if(inputRentalDate.value == ''){
				alert("대여시작일를 입력해주셔야 합니다.");
				inputRentalDate.focus();
				return ;
				
			}
			
			if(inputReturnDate.value == ''){
				alert("대여종료일를 입력해주셔야 합니다.");
				inputReturnDate.focus();
				return ;
				
			}
			
			const url = "./reststudentItemApply"
		
			fetch(url,{
				method: "post",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				},
				body: "student_pk=" + student_pk + "&item_pk=" + itemPk + "&reason=" + inputReason.value + "&rental_date=" + inputRentalDate.value + "&return_date=" + inputReturnDate.value
			})
			.then(response => response.json())
			.then(response => {
				//모달창 초기화
				save();
				reloadItemList();
				
				inputReason.value="";
				inputRentalDate.value="";
				inputReturnDate.value="";
			})
			;
			}

			
			window.addEventListener("DOMContentLoaded", () => {
				reloadItemList();
				getStudentInfo();
			});
			
			
			
		</script>
		<script src="../../resources/js/hn/topBanner.js"></script>
</head>
<body>
	<jsp:include page="../../another/commons/studentNaviLogo.jsp"></jsp:include>
	<jsp:include page="../commonJsp/studentTopBanner.jsp"></jsp:include>
	<div class="container-fluid">
        <div class="row" style="margin-left: 16%; margin-right: 16%;">
        	<div class="col">
        		<div class="row mt-2">
		            <div class="col text-end">
		                <a href="../common/studentMainPage" style="text-decoration-line : none; color: black;"><span style="font-size: 0.8em; opacity: 70%;">HOME</span></a>&nbsp;<span style="opacity: 70%;">></span>&nbsp;<a href="./studentItemApplyInformationPage" style="text-decoration-line : none; color: black;"><span style="font-size: 0.8em; opacity: 70%;">물품신청안내</span></a>&nbsp;<span style="opacity: 70%;">></span>&nbsp;<span class="fw-bold" style="font-size: 0.8em;">물품신청</span> 
		            </div>
		        </div>
				<div class="row mt-5">
					<div class="col-4"></div>
					<div class="col-4">
						<div class="row bg-secondary-subtle rounded-box py-3" style="border-radius: 100%;">
							<div class=" col text-center text-primary-emphasis fw-bold" style="font-size: 2em;">
								물품 리스트
							</div>
						</div>
					</div>
					<div class="col-4"></div>
				</div>
				
				<div id="studentItemListBox" class="row mt-4 mb-5">
					
				</div>
        	</div>
        </div>
        
		<div class="row">
               <div class="col">
                   <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
               </div>
           </div>
		</div>
	<div id="templete" class="d-none">
		<div class="studentItemListWrapper col-3 px-3">
			<div class="row mt-2 py-3">
				<div class="col shadow rounded">
					<div class="row  mt-2">
						<div class="imgLink col">
							<img class="img-fluid">
						</div>
					</div>
					<div class="row  mt-2">
						<div class="col fw-bold text-center text-primary" style="font-size:1.02em;"> 
							『물품 카테고리』
						</div>
					</div>	 
					<div class="row mt-1">
						<div class="catName col fw-bold text-center"> 
							
						</div>
					</div>
					<div class="row  mt-3">
						<div class="col fw-bold text-primary text-center" style="font-size:1.02em;"> 
							『물품명』
						</div>
					</div>	
					<div class="row  mt-1">
						<div class="itemName col fw-bold text-center"> 
							
						</div>
					</div>
					<div class="row  mt-3 p-2">
						<div class="col  d-grid">
							<button class="itemButton btn"></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="writeModal" class="modal" tabindex="-1">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header  border-bottom">
	        <h5 class="modal-title fw-bold" style="font-size: 1.08em;">물품 신청</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body bg-secondary-subtle">
	        <div class="row">
	            <div class="col">
	                <div class="row">
	                    <div class="col fw-bold">대여사유&nbsp;<span class="text-danger pb-3" style="font-size: 0.6em;">※필수입력</span></div>
	                </div>
	                <div class="row mt-2">    
	                    <div class="col">
	                        <textarea id="inputReason" class="form-control" rows="3" cols="10" placeholder="대여사유를 입력해주세요"></textarea>
	                    </div>	              
	                </div>
	                <div class="row mt-3">
	                    <div class="col fw-bold">
	                        <span>대여기간</span>&nbsp;<span class="text-danger pb-3" style="font-size: 0.6em;">※필수입력</span>
	                    </div>
	                </div>
	                <div class="row mt-2">   
	                    <div class="col">
	                        <input id="inputRentalDate" type="date" class="form-control">
	                    </div>
	                    <div class="col-1 ps-3 py-1">~</div>
	                    <div class="col">
	                        <input id="inputReturnDate" type="date" class="form-control">
	                    </div>
	                </div>   
	            </div>
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">취소</button>
	        <button type="button" id="applyButton"  class="btn btn-primary">신청</button>
	      </div>
	    </div>
	  </div>
	</div>		
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>