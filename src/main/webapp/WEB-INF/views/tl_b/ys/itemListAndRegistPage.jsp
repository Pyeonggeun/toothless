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
                                    <form action="./itemRegistProcess" method="post" enctype="multipart/form-data">
                                    <div class="row mt-2 ms-2 me-1">
                                        <div class="col">
                                            <div class="row mt-4">
                                                <div class="col-1 fw-bold border border-dark-subtle bg-dark-subtle" style="font-size: 0.8em; text-align: center; display: flex; align-items: center;">
                                               	 물품카테고리
                                               	 </div>
                                               	 <div class="col-2 border border-dark-subtle" style="display: flex; align-items: center;">
                                               	 	<select name="item_cat_pk" class="form-select form-select-sm d-grid rounded-0" aria-label="Small select example" style="border-color: black;">
                                                        <option class="text-center" selected>---선택해주세요---</option>
                                                        <c:forEach items="${itemCategoryList }" var="itemCategory">
                                                        <option value="${itemCategory.item_cat_pk }">${itemCategory.name }</option>
                                                        </c:forEach>
                                                    </select> 
                                               	 </div>
                                                <div class="col-1 fw-bold  border border-dark-subtle bg-dark-subtle" style="font-size: 0.8em; text-align: center; display: flex; align-items: center;">
                                                물품명
                                                </div>
                                                <div class="col-2 border border-dark-subtle" style="text-align: center; display: flex; align-items: center;">
                                                    <input name="name" type="text" class="form-control-sm">
                                                </div>
                                                <div class="col-1  fw-bold border border-dark-subtle bg-dark-subtle" style="font-size: 0.8em; text-align: center; display: flex; align-items: center;">
                                                    <span>물품설명서</span>
                                                </div>
                                                <div class="col-2  border border-dark-subtle" style="text-align: center; display: flex; align-items: center;">
                                                    <textarea name="content" rows="2" cols="20" class="form-control-sm"></textarea>
                                                </div>
                                                <div class="col-1  fw-bold border border-dark-subtle bg-dark-subtle" style="font-size: 0.8em; text-align: center; display: flex; align-items: center;">
                                                    물품이미지
                                                </div>   
                                                <div class="col-2  border border-dark-subtle" style="display: flex; align-items: center;">
                                                    <input type="file" name="mainImage" class="form-control-sm py-4" accept="image/*">
                                                </div>
											</div>
												
                                            <div class="row mt-2 mx-0">
		                                        <div class="col-11"></div>
		                                        <div class="col ps-5 pe-1">
		                                            <input type="submit" value="등록">
		                                        </div>
		                                    </div>
                                        </div>
                                    </div>
                                    
                                    </form>
                                    <div class="row mt-5 ms-2 mx-auto">
                                        <div class="col-1 vr px-0" style="border-width:0.1em; border-style: solid; border-color: #0000FF;"></div>
                                        <div class="col-2 ps-1 fw-bold">
                                            물품목록정보   
                                        </div>  
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col">
                                            <div class="row bg-dark-subtle ms-2 me-1 border border-dark-subtle">
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
    		<div class="col align-middle">
    			<div class="row ms-2 me-1 border border-dark-subtle"> 
			    	<div class="itemPk col-2 py-4" style="text-align: center;">
			            <span>아이템 번호</span>
			        </div>
			        <div class="catName col-2 py-4" style="text-align: center;">
			            <span>카테고리명</span>
			        </div>
			        <div class="itemName col-2 py-4" style="text-align: center;">
			            
			        </div>
			        <div class="createdAt col-3 py-4" style="text-align: center;">
			            <span>생성일시</span>
			        </div>
			        <div class= "col-3 py-4" style="text-align: center;">
			            <button class="modifiedButton btn btn-primary">수정</button>
			            <button class="deleteButton btn btn-outline-danger">삭제</button>
			        </div>
		    	</div>
    		</div>
    	</div>
	</div>   
    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>