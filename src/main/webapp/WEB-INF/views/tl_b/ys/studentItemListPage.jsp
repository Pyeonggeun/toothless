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
								itemButton.setAttribute("onclick","applyItem("+e.itemDto.item_pk+")");
								itemButton.classList.add("btn-primary");
								itemButton.innerText = "신청하기";
							}else if(e.itemApplyCount >= 1){
								itemButton.disabled = true;
								itemButton.classList.add("btn-success");
								itemButton.innerText = "신청중"
							}
						}	
						if(e.status == 'Y'){
							itemButton.disabled = true;
							itemButton.classList.add("btn-danger");
							itemButton.innerText = "대여중"
						}
							
						
						
						studentItemListBox.appendChild(studentItemListWrapper);
					}
				});
			}
		
			function applyItem(itemPk){
				<%--const studentItemListWrapper = targetElement.closest(".studentItemListWrapper");
				--%>
				window.location.href="./studentItemApplyPage?item_pk=" + itemPk;
				
				
			}
			
			window.addEventListener("DOMContentLoaded", () => {
				reloadItemList();				
			});
			
		</script>
		
</head>
<body>
	<div class="container-fluid">
		<div class="row">
		    <div class="col">
		        <div class="row">
		            <div class="col py-2 fw-bold text-white" style="background-color: #014195">
		                <a href="../common/studentMainPage" class="link-underline link-underline-opacity-0 link-dark">
		                	<img class="img-fluid" src="../../resources/img/another/logo_black.png" style="width: 4%;">
		                </a>	
		                	<span style="font-size: 1em; word-spacing: -0.25em">MK University</span>&nbsp;|<span style="font-size: 1em"> 보건센터</span>&nbsp;|<span style="font-size: 1em"> 물품목록</span>    
		               
	            	</div>
	        	</div>
	    	</div>
		</div>
		<div id="studentItemListBox" class="row mt-4 mb-5" style="margin-left: 16%; margin-right: 16%;">
			
		</div>
	</div>
	<div id="templete" class="d-none">
		<div class="studentItemListWrapper col-3 pt-5 ps-3">
			<div class="row ms-2 mt-2">
				<div class="imgLink col">
					<img class="img-fluid">
				</div>
			</div>	 
			<div class="row ms-2 mt-2">
				<div class="catName col fw-bold"> 
					카테고리명	
				</div>
			</div>
			<div class="row ms-2 mt-2">
				<div class="itemName col fw-bold"> 
					물품명
				</div>
			</div>
			<div class="row ms-2 mt-3">
				<div class="col-6"></div>
				<div class="col d-grid">
					<button class="itemButton btn"></button>
				</div>
			</div>
		</div>
	</div>		
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>