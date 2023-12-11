<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    	
    
    	
    	<script>
    	
    	
    	
		function reloadItemApplyList(){
			const url = "./getItemApplyList";
			
			fetch(url)
			.then(response => response.json())
			.then(response => {
				
				console.log(response);
				const itemApplyListBox = document.getElementById("itemApplyListBox");
				itemApplyListBox.innerHTML = "";
				
				for(e of response.data){
				
					const itemApplyWrapper = document.querySelector("#templete .itemApplyWrapper").cloneNode(true);
					
				    const studentId = itemApplyWrapper.querySelector(".studentId");
				    studentId.innerText = e.STUDENT_ID;
				    
				    const itemPk = itemApplyWrapper.querySelector(".itemPk");
				    itemPk.innerText = e.ITEM_PK;
				    
				    const catName = itemApplyWrapper.querySelector(".catName");
				    catName.innerText = e.CAT_NAME;
				    
				    const itemName = itemApplyWrapper.querySelector(".itemName");
				    itemName.innerText = e.ITEM_NAME;
				    
				    const reason = itemApplyWrapper.querySelector(".reason");
				    reason.innerText = e.REASON;
				    
				    const rentalDate = itemApplyWrapper.querySelector(".rentalDate");
				    
				    const date1 = new Date(e.RENTAL_DATE);
				    
				    rentalDate.innerText = date1.getFullYear() + "-" + (date1.getMonth()+1) + "-" + date1.getDate();
				    
				    const returnDate = itemApplyWrapper.querySelector(".returnDate");
				    
				    const date2 = new Date(e.RETURN_DATE);
				    
				    returnDate.innerText = date2.getFullYear() + "-" + (date2.getMonth()+1) + "-" + date2.getDate();
				    
				    const status = itemApplyWrapper.querySelector(".status");
				    
				   	
				    const itemButton = itemApplyWrapper.querySelector(".itemButton");
				    
				    
				    if(e.STATUS == 'Y'){
					    itemButton.setAttribute("onclick","itemReturn("+e.ITEM_APPLY_PK+")");
					    itemButton.classList.add("btn-outline-secondary");
					    itemButton.innerText = "반납";
					}
				    if(e.STATUS == 'N'){
					    itemButton.setAttribute("onclick","itemRental(this,"+e.ITEM_APPLY_PK+")");
					    itemButton.classList.add("btn-primary");
					    itemButton.innerText = "대여";
				    }
				    
				    
					itemApplyListBox.appendChild(itemApplyWrapper);
					
				}
				
			});
		}
		
		function itemRental(targetElement, itemApplyPk){
			const itemApplyWrapper = targetElement.closest(".itemApplyWrapper");
			
			const itemButton = itemApplyWrapper.querySelector(".itemButton");
			//itemButton.removeAttribute("onclick");
			itemButton.setAttribute("onclick","itemReturn("+itemApplyPk+")");
			itemButton.classList.remove("btn-primary");
			itemButton.classList.add("btn-outline-secondary");	
			itemButton.innerText = "반납";
			const url = "./restRentalProcess";
			const option = {
				method: "post",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				},
				body: "item_apply_pk=" + itemApplyPk	
			};
		   	
			fetch(url, option);
			//reloadItemApplyList();
		}
		
		function itemReturn(itemApplyPk){
			console.log(itemApplyPk);
			const url = "./restReturnProcess";
			const option = {
				method: "post",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				},
				body: "item_apply_pk=" + itemApplyPk	
			};
			fetch(url, option)
			.then(response => response.json())
			.then(response => {
				reloadItemApplyList();
			});
		}
		
		window.addEventListener("DOMContentLoaded", () => {
			reloadItemApplyList();
		});
		</script>	
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <jsp:include page="../commonJsp/staffTopBanner.jsp"></jsp:include>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                             	<jsp:include page="../commonJsp/staffSideBar.jsp"></jsp:include>
								<div class="col">
                                    <div class="row mt-5 ms-2 mx-auto">
                                        <div class="col-1 vr px-0" style="border-width:0.1em; border-style: solid; border-color: #0000FF;"></div>
                                        <div class="col-2 ps-1 fw-bold">
                                            물품대여&nbsp;현황관리   
                                        </div>  
                                    </div>
                                    <div  class="row ms-1 mt-4">
                                    	<div  class="studentId col-1" style="text-align: center;">
                                            <span>학번</span>
                                        </div>
                                        <div class="itemPk col-1" style="text-align: center;">
                                            <span>물품번호</span>
                                        </div>
                                        <div class="catName col-2" style="text-align: center;">
                                            <span>카테고리명</span>
                                        </div>
                                        <div class="itemName col-1" style="text-align: center;">
                                            <span>물품명</span>
                                        </div>
                                        <div class="reason col-1" style="text-align: center;">
                                            <span>대여사유</span>
                                        </div>
                                        <div class="rentalDate col-2" style="text-align: center;">
                                            <span>대여일</span>
                                        </div>
                                        <div class="returnDate col-2" style="text-align: center;">
                                            <span>반납일</span>
                                        </div>
                                        <div class="status col-2" style="text-align: center;">
                                           	대여/반납
                                        </div>
                                   	</div>
                                   	<div class="row">
                                        <div class="col ps-4">
                                            <hr style="border-color:black">
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div id="itemApplyListBox" class="col">
                                            
                                        </div>
                                    </div>
                                </div>     
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col py-4" style="background-color: #F2F2F2;">
                                <div class="row" style="margin-left: 16%; margin-right: 16%;">
                                    <div class="col">
                                        <div class="row">
                                            <div class="col-1 my-auto">
                                                    <img class="img-fluid" src="../../resources/img/another/logo_black.png">
                                            </div>
                                           	<div class="col-3 ps-0 my-auto" style="font-size: x-large">
                                                    MK University | 보건센터
                                           	</div>
                                            <div class="col text-body-tertiary" style="font-size: small;">
                                                <p class="my-0">서울특별시 강남구 테헤란로7길 7 에스코빌딩 6~7층&emsp;전화 : 02&#41;561-1911&emsp;팩스 : 02&#41;561-1911</p>
                                                <p class="my-0">COPYRIGHT&#40;C&#41; University of Seoul ALL RIGHTS RESERVED.</p>
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
        
        <div id="templete" class="d-none">  
           <div class="itemApplyWrapper row">  
             <div class="col">
             	<div  class="row ms-1">
              	<div  class="studentId col-1" style="text-align: center;">
                      <span>학번</span>
                  </div>
                  <div class="itemPk col-1" style="text-align: center;">
                      <span>물품번호</span>
                  </div>
                  <div class="catName col-2" style="text-align: center;">
                      <span>카테고리명</span>
                  </div>
                  <div class="itemName col-1" style="text-align: center;">
                      <span>물품명</span>
                  </div>
                  <div class="reason col-1" style="text-align: center;">
                      <span>대여사유</span>
                  </div>
                  <div class="rentalDate col-2" style="text-align: center;">
                      <span>대여일</span>
                  </div>
                  <div class="returnDate col-2" style="text-align: center;">
                      <span>반납일</span>
                  </div>
                  <div class="status col-2" style="text-align: center;">
                     	<button class="itemButton btn"></button>
                     			
                  </div>
             	</div>
	              <div class="row">
	                  <div class="col ps-4">
	                      <hr style="border-color:black">
	                  </div>
	              </div>
	          </div>
	      </div> 
		</div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>