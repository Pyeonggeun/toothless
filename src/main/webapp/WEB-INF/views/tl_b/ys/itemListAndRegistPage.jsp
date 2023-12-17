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
    		let loginStaffInfo = null;
    	
	    	function getStaffInfo(){		
	    		fetch("./restStaffInfo")
	    		.then(response => response.json())
	    		.then(response => {
	    			
	    			const staffLoginPageUrl = "http://localhost:8181/toothless/another/staff/loginPage";
	    			
	    			loginStaffInfo = response.data;
	    			
	    			if(loginStaffInfo == null){
	    				
	    				const moveToLoginPage = confirm("로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?");
	    				
	    				if(moveToLoginPage){
	    					
	    					window.location.href = staffLoginPageUrl;
	    				
	    				}
	    			}
	    		});		
	    	}
    	
    		function reloadItemAndCategoryList(){
    			
    			const url = "./restItemAndCategoryList";
    			
    			fetch(url)
    			.then(response => response.json())
    			.then(response => {
    				
    				const itemAndCategoryListBox = document.getElementById("itemAndCategoryListBox");
    				itemAndCategoryListBox.innerHTML = "";
    				
    				for(e of response.data){
    					const itemAndCategoryWrapper = document.querySelector("#templete .itemAndCategoryWrapper").cloneNode(true);
    					
    					const itemPk = itemAndCategoryWrapper.querySelector(".itemPk");
    					itemPk.innerText = e.ITEM_PK;
    					
    					const catName = itemAndCategoryWrapper.querySelector(".catName");
    					catName.innerText = e.CAT_NAME;
    					
    					const itemName = itemAndCategoryWrapper.querySelector(".itemName");
    					itemName.innerText = e.ITEM_NAME;
    					
    					itemName.setAttribute("onclick","getItem("+e.ITEM_PK+")");
    					
    					const createdAt = itemAndCategoryWrapper.querySelector(".createdAt");
    					const date = new Date(e.CREATED_AT);
    					
    					createdAt.innerText = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
    					
    					const modifiedButton = itemAndCategoryWrapper.querySelector(".modifiedButton");
    					
    					const deleteButton = itemAndCategoryWrapper.querySelector(".deleteButton"); 
    					
    					deleteButton.setAttribute("onclick","deleteItem("+e.ITEM_PK+")");
    					
    					itemAndCategoryListBox.appendChild(itemAndCategoryWrapper);
    				}
    			});	
    		}
    		
    		function itemCategoryList(){
    			<%-- selectbox 검색 --%>
    			<%--
    			const url = "./restGetCategoryList"
    			
    			fetch(url)
    			.then(response => response.json())
    			.then(response => {
    				
    				const categoryWrapper = document.querySelector("#categoryWrapper");
    				const defaultOption = document.createElement("option");
    				defaultOption.setAttribute("selected","");
    				defaultOption.setAttribute("value","0");
    				defaultOption.innerText = "전체";
    				categoryWrapper.appendChild(defaultOption);
    				
    				for(e of response.data){
    					
    					const newOption = document.createElement("option");
    					newOption.setAttribute("value", e.item_cat_pk);
    					newOption.innerText = e.name;
    					categoryWrapper.appendChild(newOption);

    				}
    			});
    			--%>
    			
    			const url = "./restGetCategoryList"
    			
    				fetch(url)
    			    .then(response => response.json())
    			    .then(response => {
    			    	
    			    	console.log("itemCategoryList()실행됨 : " + response.data);
    					const categoryWrapper = document.querySelector(".categoryWrapper");
    					categoryWrapper.innerHTML = "";
    					
    					for(e of response.data){
    						
    						const searchCategoryOption = document.querySelector("#templete .searchCategoryOption").cloneNode(true);
    						
    						const categoryOption = searchCategoryOption.querySelector(".categoryOption");
    						categoryOption.setAttribute("id", "categoryOption" + e.item_cat_pk);			
    						categoryOption.setAttribute("value", e.item_cat_pk);				
    						
    						const categoryLabel = searchCategoryOption.querySelector(".categoryLabel");				
    						categoryLabel.setAttribute("for", "categoryOption" + e.item_cat_pk);				
    						categoryLabel.innerText = e.name;
    						
    						searchCategoryOption.appendChild(categoryOption);
    						searchCategoryOption.appendChild(categoryLabel);
    						
    						categoryWrapper.appendChild(searchCategoryOption);
    						
    						
    					}
    			    });
    		}
    		
    		function getSearchCounselorType(){
    			const searchCategoryValueList = [];
    			
    			const searchCategoryValue = document.getElementsByClassName("categoryOption");
    			
    			for(let e = 0 ; e < searchCategoryValue.length ; e++){
    				if(searchCategoryValue[e].checked){
    					searchCategoryValueList.push(searchCategoryValue[e].value);
    				}
    			}
    			
    			return searchCategoryValueList;
    		}
    		<%-- selctbox 검색 --%>
    		<%--
    		function searchItemList(searchType,searchName){
    			
    			const searchCategory = document.getElementById("searchCategory").value;
    			const searchItemName = document.getElementById("searchItemName").value; 
    			
    			console.log(searchCategory);
    			console.log(searchItemName);
    			
    			const url = "./restSearchItemList?searchCategory=" +  searchCategory + "&searchItemName=" + searchItemName;
    			
    			fetch(url)
    			.then(response => response.json())
    			.then(response =>{			
    				const itemAndCategoryListBox = document.getElementById("itemAndCategoryListBox");
    				itemAndCategoryListBox.innerHTML = "";
    				
    				for(e of response.data){
    					
    					const itemAndCategoryWrapper = document.querySelector("#templete .itemAndCategoryWrapper").cloneNode(true);
    					
    					const itemPk = itemAndCategoryWrapper.querySelector(".itemPk");
    					itemPk.innerText = e.ITEM_PK;
    					
    					const catName = itemAndCategoryWrapper.querySelector(".catName");
    					catName.innerText = e.CAT_NAME;
    					
    					const itemName = itemAndCategoryWrapper.querySelector(".itemName");
    					itemName.innerText = e.ITEM_NAME;
    					
    					itemName.setAttribute("onclick","getItem("+e.ITEM_PK+")");
    					
    					const createdAt = itemAndCategoryWrapper.querySelector(".createdAt");
    					const date = new Date(e.CREATED_AT);
    					
    					createdAt.innerText = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
    					
    					const modifiedButton = itemAndCategoryWrapper.querySelector(".modifiedButton");
    					
    					const deleteButton = itemAndCategoryWrapper.querySelector(".deleteButton"); 
    					
    					deleteButton.setAttribute("onclick","deleteItem("+e.ITEM_PK+")");
    					
    					itemAndCategoryListBox.appendChild(itemAndCategoryWrapper);
    					
    				}
    			});
    			
    		}
    		
    		--%>
				function searchItemList(){
    			
    			const searchCategory = getSearchCounselorType();
    			const searchItemName = document.getElementById("searchItemName").value; 
    			
    			console.log(searchCategory);
    			console.log(searchItemName);
    			
    			const url = "./restSearchItemList?searchCategory=" +  searchCategory + "&searchItemName=" + searchItemName;
    			
    			fetch(url)
    			.then(response => response.json())
    			.then(response =>{			
    				const itemAndCategoryListBox = document.getElementById("itemAndCategoryListBox");
    				itemAndCategoryListBox.innerHTML = "";
    				
    				for(e of response.data){
    					
    					const itemAndCategoryWrapper = document.querySelector("#templete .itemAndCategoryWrapper").cloneNode(true);
    					
    					const itemPk = itemAndCategoryWrapper.querySelector(".itemPk");
    					itemPk.innerText = e.ITEM_PK;
    					
    					const catName = itemAndCategoryWrapper.querySelector(".catName");
    					catName.innerText = e.CAT_NAME;
    					
    					const itemName = itemAndCategoryWrapper.querySelector(".itemName");
    					itemName.innerText = e.ITEM_NAME;
    					
    					itemName.setAttribute("onclick","getItem("+e.ITEM_PK+")");
    					
    					const createdAt = itemAndCategoryWrapper.querySelector(".createdAt");
    					const date = new Date(e.CREATED_AT);
    					
    					createdAt.innerText = date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate();
    					
    					const modifiedButton = itemAndCategoryWrapper.querySelector(".modifiedButton");
    					
    					const deleteButton = itemAndCategoryWrapper.querySelector(".deleteButton"); 
    					
    					deleteButton.setAttribute("onclick","deleteItem("+e.ITEM_PK+")");
    					
    					itemAndCategoryListBox.appendChild(itemAndCategoryWrapper);
    					
    				}
    			});
    			
    		}
    		
    		function searchInitialize(){
    			     			
    			const searchCategoryValues = getSearchCounselorType();
    		    const searchCategoryCheckboxes = document.getElementsByClassName("categoryOption");

    		    searchCategoryValues.forEach((value) => {
    		        // Find the checkbox with the matching value and uncheck it
    		        const checkbox = Array.from(searchCategoryCheckboxes).find((checkbox) => checkbox.value === value);
    		        if (checkbox) {
    		            checkbox.checked = false;
    		        }
    		    });
    		    
    		    const searchItemName = document.getElementById("searchItemName");
    			searchItemName.value = "";
    		}
			
    		function formSubmit(event){
    			
				const frm = document.getElementById("frm");
				const inputCategory = document.getElementById("inputCategory");
				const inputName = document.getElementById("inputName");
				const inputText = document.getElementById("inputText");
				const inputFile = document.getElementById("inputFile");
				
				event.preventDefault();
				
				if(inputCategory.value == '' || inputCategory.value == '---선택해주세요---'){
					alert("카테고리를 입력해주셔야 합니다.");
					inputCategory.focus();
					return;
				}
				
				if(inputName.value == ''){
					alert("상품명을 입력해주셔야 합니다.");
					inputName.focus();
					return;
					
				}
				
				if(inputText.value == ''){
					alert("상품설명서를 입력해주셔야 합니다.");
					inputText.focus();
					return;
					
				}
				
				if(inputFile.files.length == 0){
					alert("파일를 선택해주셔야 합니다.");
					inputFile.focus();
					return;
					
				}
				
				frm.submit();
			}
    		
    		function getItem(itemPk){
    			window.location.href = "./itemUpdateAndDeleteDetailPage?item_pk=" + itemPk;
    		}
    		
    		function deleteItem(itemPk){
    			const url = "./restItemDeleteProcess?item_pk=" + itemPk;
    			
    			fetch(url)
    			.then(response => response.json())
    			.then(response => {
    				
    				reloadItemAndCategoryList();
    			});
    			
    		}
    		
    	
    		window.addEventListener("DOMContentLoaded", () => {
    			
    			
    			reloadItemAndCategoryList();
    			itemCategoryList();
    			getStaffInfo();
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
                                            물품등록    
                                        </div>  
                                    </div>
                                    <form id="frm" action="./itemRegistProcess" method="post" enctype="multipart/form-data">
                                    <div class="row mt-2 ms-2 me-1">
                                        <div class="col ">
                                            <div class="row mt-2 my-auto border border-dark-subtle">
                                                <div class="col-1 fw-bold border border-dark-subtle" style="font-size: 0.8em; text-align: center; display: flex; align-items: center; justify-content: center; background-color: #EDEDED">
                                               	  <span>물품카테고리</span>
                                               	 </div>
                                               	 <div class="col-2 border border-dark-subtle" style="display: flex; align-items: center; justify-content: center;">
                                               	 	<select id="inputCategory" name="item_cat_pk" class="form-select form-select-sm d-grid rounded-0" aria-label="Small select example" style="border-color: black;">
                                                        <option class="text-center">---선택해주세요---</option>
                                                        <c:forEach items="${itemCategoryList }" var="itemCategory">
                                                        <option value="${itemCategory.item_cat_pk }">${itemCategory.name }</option>
                                                        </c:forEach>
                                                    </select> 
                                               	 </div>
                                               	 <!-- text-center = text-align: center; -->
                                                <div class="col-1 fw-bold border border-dark-subtle" style="font-size: 0.8em;  text-align: center; display: flex; align-items: center; justify-content: center; background-color: #EDEDED">
                                                 <span>물품명</span>
                                                </div>
                                                <div class="col-2 border border-dark-subtle" style="text-align: center; display: flex; align-items: center; justify-content: center;">
                                                    <input id="inputName" name="name" type="text" class="form-control-sm">
                                                </div>
                                                <div class="col-1 fw-bold border border-dark-subtle" style="font-size: 0.8em; text-align: center; display: flex; align-items: center; justify-content: center; background-color: #EDEDED">
                                                    <span>물품설명서</span>
                                                </div>
                                                <div class="col-2 border border-dark-subtle" style="text-align: center; display: flex; align-items: center; justify-content: center;">
                                                    <textarea id="inputText" name="content" rows="2" cols="20" class="form-control-sm"></textarea>
                                                </div>
                                                <div class="col-1 fw-bold border border-dark-subtle" style="font-size: 0.8em; text-align: center; display: flex; align-items: center; justify-content: center; background-color: #EDEDED">
                                                    <span>물품이미지</span>
                                                </div>   
                                                <div class="col-2 border border-dark-subtle" style="display: flex; align-items: center; justify-content: center;">
                                                    <input id="inputFile" type="file" name="mainImage" class="form-control-sm py-4" accept="image/*">
                                                </div>
											</div>
												
                                            <div class="row mt-2">
		                                        <div class="col ps-3 pe-0 text-end">
		                                            <button  onclick="formSubmit(event)" class="btn btn-primary">등록</button>
		                                        </div>
		                                    </div>
                                        </div>
                                    </div>
                                    </form>
                                     
                                    <div class="row mt-4 ms-2 mx-auto">
                                        <div class="col-1 vr px-0" style="border-width:0.1em; border-style: solid; border-color: #0000FF;"></div>
                                        <div class="col-2 ps-1 fw-bold">
                                            물품검색    
                                        </div>  
                                    </div>
                                    <div class="row mt-3 ms-2 me-1" style="background-color: #EDEDED">
                                    	<div class="col">
                                    		<div class="row mt-4">
		                                    	<div class="col fw-bold text-center" style="font-size: 0.9em;">
		                                    		※물품카테고리
		                                    	</div>
		                                    </div>
		                                    <div class="row mt-2">
		                                    	<div class="categoryWrapper col-auto mx-auto">
		                                    		<!-- 
		                                    		<select id="categoryWrapper" class="form-check" aria-label="Default select example">
													  
													</select>
													 -->
		                                    	</div>
		                                    </div>
		                                    <!--  
		                                    <div class="row mt-2">
		                                    	<div class="col-3"></div>
		                                    	<div class="col-1" style="font-size: 0.8em;">
		                                    		<div class="form-check">
													  <input class="form-check-input" type="checkbox" value="1" id="category1">
													  <label class="form-check-label" for="category1">
													    	구급낭
													  </label>
													</div>
		                                    	</div>
		                                    	<div class="col-1" style="font-size: 0.8em;">
		                                    		<div class="form-check">
													  <input class="form-check-input" type="checkbox" value="2" id="category2">
													  <label class="form-check-label" for="category2">
													    	목발
													  </label>
													</div>
		                                    	</div>
		                                    	<div class="col-1" style="font-size: 0.8em;">
		                                    		<div class="form-check">
													  <input class="form-check-input" type="checkbox" value="3" id="category3">
													  <label class="form-check-label" for="category3">
													    	들것
													  </label>
													</div>
		                                    	</div>
		                                    	<div class="col-1" style="font-size: 0.8em;">
		                                    		<div class="form-check">
													  <input class="form-check-input" type="checkbox" value="4" id="category4">
													  <label class="form-check-label" for="category4">
													    	CPR모형
													  </label>
													</div>
		                                    	</div>
		                                    	<div class="col-2" style="font-size: 0.8em;">
		                                    		<div class="form-check">
													  <input class="form-check-input" type="checkbox" value="5" id="category5">
													  <label class="form-check-label" for="category5">
													    	심장재세동기
													  </label>
													</div>
		                                    	</div>
		                                    	<div class="col-3"></div>
		                                    </div>
		                                    -->
		                                    <div class="row mt-2">
		                                    	<div class="col fw-bold text-center" style="font-size: 0.9em;">
		                                    		※물품명
		                                    	</div>
		                                    </div>
		                                    <div class="row mt-2">
		                                    	<div class="col text-center">
		                                    		<div class="col">
													    <input type="text" id="searchItemName" class="form-control-sm" placeholder="검색어를 입력하세요" />
			                                        </div>
		                                    	</div>
		                                    </div>
		                                    <div class="row mt-4">
		                                    	<div class="col">
		                                    		
		                                    	</div>
		                                    </div>
                                    	</div>
                                    </div>
                                    <div class="row mt-2">
                                    	<div class="col text-center">
                                    		<button onclick="searchInitialize()" class="btn btn-outline-dark">초&nbsp;기&nbsp;화</button>
                                    		<button onclick="searchItemList()" class="btn btn-primary">검&nbsp;색</button>
                                    	</div>
                                    </div>
                                    
                                    <div class="row mt-5 ms-2 mx-auto">
                                        <div class="col-1 vr px-0" style="border-width:0.1em; border-style: solid; border-color: #0000FF;"></div>
                                        <div class="col-2 ps-1 fw-bold">
                                            물품목록정보   
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col">
                                            <div class="row ms-2 me-1 border border-dark-subtle" style="background-color: #EDEDED">
                                                <div class="col-2 fw-bold" style="text-align: center;">
                                                    물품번호
                                                </div>
                                                <div class="col-2 fw-bold" style="text-align: center;">
                                                    물품카테고리
                                                </div>
                                                <div class="col-2 fw-bold" style="text-align: center;">
                                                    물품명
                                                </div>
                                                <div class="col-3 fw-bold" style="text-align: center;">
                                                    등록일
                                                </div>
                                                <div class="col-3 fw-bold" style="text-align: center;">
                                                    수정/삭제
                                                </div>
                                            </div>
                                            
                                        <div id="itemAndCategoryListBox" class="col">
                                        
                                        </div>    

                                        </div>
                                    </div>
                                    <div class="row mt-5">
                                    	<div class="col">
                                    		
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
    </div>
    <div id="templete" class="d-none">
    	<div class="itemAndCategoryWrapper row">
    		<div class="col">
    			<div class="row ms-2 me-1 border border-dark-subtle"> 
			    	<div class="itemPk col-2 py-3 my-auto" style="text-align: center;  align-items: center;">
			            <span>아이템 번호</span>
			        </div>
			        <div class="catName col-2 py-3 my-auto" style="text-align: center;  align-items: center;">
			            <span>카테고리명</span>
			        </div>
			        <div class="itemName col-2 py-3 my-auto" style="text-align: center;  align-items: center;">
			            
			        </div>
			        <div class="createdAt col-3 py-3 my-auto" style="text-align: center; align-items: center;">
			            <span>생성일시</span>
			        </div>
			        <div class= "col-3 py-3 my-auto" style="text-align: center; align-items: center;">
			            <button class="modifiedButton btn btn-primary">수정</button>
			            <button class="deleteButton btn btn-outline-danger">삭제</button>
			        </div>
		    	</div>
    		</div>
    	</div>
    	<div class="searchCategoryOption form-check form-check-inline align-middle" id="" required>                                                
        	<input class="categoryOption form-check-input" type="checkbox" >
        	<label class="categoryLabel form-check-label"></label>                                    	
        </div>
	</div>   
    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>