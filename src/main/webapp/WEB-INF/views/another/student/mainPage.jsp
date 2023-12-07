<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        
        <script>
        	function reloadNotifyCount(){
        		const url = "./reloadMyNotifyCount?student_pk="+${sessionStudentInfo.student_pk};
        		fetch(url)
        		.then(response => response.json())
        		.then((response) => {
        			const reloadNotifyCount = document.getElementById("reloadNotifyCount");
        	        if(response.data != 0){
        	        	reloadNotifyCount.classList.remove("d-none");
        	        	reloadNotifyCount.innerText = "";
        	        	reloadNotifyCount.innerText = response.data;
        	        	
        	        }else if(response.data == 0){
        	        	reloadNotifyCount.classList.add("d-none");
        	        }
        	        
        		});
        	}
        	setInterval(reloadNotifyCount, 5000);
        	
        	function loadMyNewNotifyCount(){
        		const url = "./reloadMyNewNotifyList?student_pk="+${sessionStudentInfo.student_pk};
        		fetch(url)
        		.then(response => response.json())
        		.then((response) => {
        			
        			const alertBox = document.getElementById("alertBox");
        			const sender = document.getElementById("sender");
        			const message = document.getElementById("message");
        			const link = document.getElementById("link");
        			if(response.data.length >= 2){
        				
        				alertBox.classList.remove("d-none");
        				sender.innerText = "";
        				sender.innerText = "[알림]";
        				message.innerText = "";
        				message.innerText = "총 "+response.data.length+"개의 새로운 알림이 있습니다.";
        				
        				//commentUpdate.setAttribute("href", "./mainPage");
        				updateMyCheckNotifyStatus();
        				
        				setTimeout(() => 
        					alertBox.classList.add("d-none"),
        					5000);
        				
        			}else if(response.data.length == 1){
        				alertBox.classList.remove("d-none");
        				sender.innerText = "";
        				sender.innerText = response.data[0].centerCategoryDto.position;
        				message.innerText = "";
        				message.innerText = response.data[0].notificationDto.message;
        				
						updateMyCheckNotifyStatus();
						
        				setTimeout(() => 
        					alertBox.classList.add("d-none"),
        					5000);
        			}
        					
        			
        		});
        	}
        	setInterval(loadMyNewNotifyCount, 5000);
        	
        	function updateReadNotifyStatus(){
        		const url = "./updateReadNotifyStatus?student_pk="+${sessionStudentInfo.student_pk};
        		fetch(url);
        		
        	}
        	
        	
        	
        	function updateMyCheckNotifyStatus(){
        		const url = "./updateNewNotifyStatus?student_pk="+${sessionStudentInfo.student_pk};
        		fetch(url);

        	}
        	
        	function showNotifyModal(){
                const modal = bootstrap.Modal.getOrCreateInstance("#showMyNotifyListModal");
                loadUnreadNotifyList();
                modal.show();
            }
        	
        	function loadUnreadNotifyList() {
				const url = "./loadUnreadNotifyList?student_pk="+${sessionStudentInfo.student_pk};
				fetch(url)
        		.then(response => response.json())
        		.then((response) => {
        			cleanNotifyList();
        			const unreadNotifyListBox =document.querySelector("#unreadNotifyListBox");
        			
        			const newNotify = document.getElementById("newNotify");
        			newNotify.classList.remove("text-secondary");
        			newNotify.classList.add("fw-bold", "border-bottom", "border-black", "border-2");
        			
        			const readNotify = document.getElementById("readNotify");
        			readNotify.classList.remove("fw-bold", "border-bottom", "border-black", "border-2");
        			readNotify.classList.add("text-secondary");
        			

        			if(response.data.length == 0){
        				unreadNotifyListBox.classList.add("text-center","text-secondary");
        				
        				unreadNotifyListBox.innerText = "신규 알림이 없습니다.";
        			}else{
        				for(e of response.data){
	        				const unreadNotifyWrapper = document.querySelector("#notifyTemplete .unreadNotifyWrapper").cloneNode(true);
	        				console.log("실행");	
	        				//const link = unreadNotifyWrapper.querySelector(".link");
	        				const sender = unreadNotifyWrapper.querySelector(".sender");
	        				sender.innerText = "";
	        				sender.innerText = "["+e.centerCategoryDto.position+"]";
	        				
	        				const created_at = unreadNotifyWrapper.querySelector(".created_at");
	        				created_at.innerText = "";
	        	    		const date = new Date(e.notificationDto.created_at);
	        	    		const currentDate = new Date();
	        	    		
	        	    		if (date.getFullYear() +"."+ (date.getMonth()+1) + "."+ date.getDate() == 
	        	    			currentDate.getFullYear() +"."+ (currentDate.getMonth()+1) + "."+ currentDate.getDate()){
	        	    			if((currentDate.getHours() - date.getHours()) == 0){
	        	    				created_at.innerText = (currentDate.getMinutes() - date.getMinutes())+ "분전";
	        	    			}else{
	        	    				created_at.innerText = (currentDate.getHours() - date.getHours())+ "시간전";
	        	    			}
	        	    		}else{
	        	    			created_at.innerText = date.getFullYear() +"."+ (date.getMonth()+1) + "."+ date.getDate();
	        	    		}
	        	    		const message = unreadNotifyWrapper.querySelector(".message");
	        	    		message.innerText = "";
	        	    		message.innerText = e.notificationDto.message;
	        				
	        				unreadNotifyListBox.appendChild(unreadNotifyWrapper);
	        				updateReadNotifyStatus();
	        			}
        			}
        		});
			}
        	function cleanNotifyList(){
        		const unreadNotifyListBox =document.querySelector("#unreadNotifyListBox");
        		unreadNotifyListBox.innerText = "";
        		unreadNotifyListBox.classList.remove("text-center","text-secondary");
        		
        	}
        	function checkReadNotifyList(){
        		const url = "./loadReadNotifyList?student_pk="+${sessionStudentInfo.student_pk};
				fetch(url)
        		.then(response => response.json())
        		.then((response) => {
        			cleanNotifyList();
        			const unreadNotifyListBox =document.querySelector("#unreadNotifyListBox");
        			
        			const newNotify = document.getElementById("newNotify");
        			newNotify.classList.add("text-secondary");
        			newNotify.classList.remove("fw-bold", "border-bottom", "border-black", "border-2");
        			
        			const readNotify = document.getElementById("readNotify");
        			readNotify.classList.add("fw-bold", "border-bottom", "border-black", "border-2");
        			readNotify.classList.remove("text-secondary");
        			        		
        			
        			if(response.data.length == 0){
        				unreadNotifyListBox.classList.add("text-center","text-secondary");
        				
        				unreadNotifyListBox.innerText = "이전 알림이 없습니다.";
        			}
					for(e of response.data){
        				
        				const unreadNotifyWrapper = document.querySelector("#notifyTemplete .unreadNotifyWrapper").cloneNode(true);
        				//const link = unreadNotifyWrapper.querySelector(".link");
        				const sender = unreadNotifyWrapper.querySelector(".sender");
        				sender.innerText = "";
        				sender.innerText = "["+e.centerCategoryDto.position+"]";;
        				
        				const created_at = unreadNotifyWrapper.querySelector(".created_at");
        				created_at.innerText = "";
        	    		const date = new Date(e.notificationDto.created_at);
        	    		created_at.innerText = date.getFullYear() +"."+ (date.getMonth()+1) + "."+ date.getDate();
        	    		
        	    		const message = unreadNotifyWrapper.querySelector(".message");
        	    		message.innerText = "";
        	    		message.innerText = e.notificationDto.message;
        				
        				unreadNotifyListBox.appendChild(unreadNotifyWrapper);
        			}
        		});
        	}
        
        	
        	
        	
        	 window.addEventListener("DOMContentLoaded", () =>{
        		 reloadNotifyCount();
        		 loadMyNewNotifyCount();
        		 
             });
        	
        </script>
        
        <style>
             @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;800&family=Roboto+Mono:wght@700&display=swap');
            .body{
                font-family: 'Noto Sans KR', sans-serif;
                font-family: 'Roboto Mono', monospace;
            }

            .text-main{
                color: rgb(0, 0, 255);
            }
            .fs-s{
                font-size: small;
            }
            .fs-xs{
                font-size: x-small;
            }
            .bg-gray{
                background-color: rgb(241, 240, 237);
            }
            .border-main{
                border-color: #133369;
            }
        </style>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <div class="row text-center">
                        <div class="col-4"></div>
                        <div class="col-1 pe-2 text-end">
                            <img src="../../resources/img/another/logo_black.png" alt="" style="height: 4em;">
                        </div>
                        <div class="col-3 ps-0 fw-bold fs-1 text-start ">
                            MK University<span class="fs-6"> | </span> <span class="fs-5">학생포털사이트</span> 
                        </div>
                        <div class="col-2"></div>
                        <div class="col-1 border-end border-secondary text-end text-secondary mt-5" style="font-size: small">
                            포털이용안내
                        </div>
                        <div class="col-1 text-start text-secondary mt-5 "style="font-size: small">
                            <a class="navbar-brand" href="./logoutProcess">로그아웃</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row text-center py-1 fw-bold text-light" style="background-color: #133369">
                <div class="col-2"></div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./mainpage">현장실습 지원 센터</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="./mainpage">취업<i class="bi bi-dot"></i>창업 지원 센터</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="../../tl_e/commons/counselCenterStudentMainPage">상담 센터</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="../../tl_a/student/jw_mainPage">생활관 관리 센터</a>
                </div>
                <div class="col align-self-center">
                    <a class="navbar-brand" href="../../tl_b/common/studentMainPage">보건 센터</a>
                </div>
                <div class="col-1 position-relative pb-0">
                	<a class="navbar-brand" href="#" onclick="showNotifyModal()"><i class="bi bi-bell-fill pe-1">
                	<span id="reloadNotifyCount" class="position-absolute top-70 start-50 badge rounded-pill bg-danger d-none px-1 py-0" style="font-size: xx-small;">
    				</span>
    				</i></a> 
                </div>
                <div class="col-2"></div>
            </div>
            <div class="row">
            	<div class="col">
                    <div id="alertBox" class="alert alert-primary position-fixed bottom-0 end-0 me-5 d-none" role="alert" style="height: 8em; width: 20em;">
                        <div class="row text-start ">
                            <div id="sender" class="col fw-bold ">
                                [취업 창업센터] 
                            </div>
                        </div>
                        <div class="row mt-1">
                            <div id="message" class="col">
                                알림 내용 블라블라블라블라블라이마ㅓㄹ이마ㅓ 답글이 등록되었습니다.
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-end">
                                <a id="link" class="alert-link Text-end">바로가기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-2">
                    <div class="row border border-2">
                        <div class="col">
                            <div class="row">
                                <div class="col">
                                    이름 : ${sessionStudentInfo.name }
                                </div>
                                <div class="col">
                                    ${studentOtherInfo.departmentName } <c:if test="${studentOtherInfo.graduationInfo == 0 }">${studentOtherInfo.studentYear } 학년</c:if> 
                                </div>
                            </div>
                            <div class="row">
                            <c:choose>
                            	<c:when test="${studentOtherInfo.graduationInfo != 0 }">
                            		<div class="col">
                                 		 현재 상태: 졸업생
                                	</div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="col">
                                  		현재 상태: 재학생  
                                	</div>
                            	</c:otherwise>
                            </c:choose>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="row">
                        <div class="col text-end">
                            <img src="../../resources/img/another/iu1.png" alt="" style="height: 8em;">
                        </div>
                        <div class="col text-center fs-1 fw-bold">
                            서울민규 대학교 총장님 말씀
                        </div>
                        <div class="col text-start">
                            <img src="../../resources/img/another/iu2.png" alt=""style="height: 8em;">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col text-center">
                            <img src="../../resources/img/another/minkue.png" alt="" style="height: 30em;">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col text-end">
                            <img src="../../resources/img/another/iu3.png" alt="" style="height: 8em;">
                        </div>
                        <div class="col text-center fs-2 mt-5">
                            2차 프로젝트 화이팅~! &gt; _ &lt;
                        </div>
                        <div class="col text-start">
                            <img src="../../resources/img/another/iu4.png" alt="" style="height: 8em;">
                        </div>
                    </div>
                </div>
            </div>    
        </div>
        
         <div id="showMyNotifyListModal" class="modal" tabindex="-1">
            <div class="modal-dialog  modal-dialog-scrollable">
              <div class="modal-content" >
                <div class="row">
                        <div class="col"></div> 
                        <div id="newNotify"class="col-4 px-0  mt-4 fs-5 text-center ">
                            <a class="nav-link n" href="#"  onclick="loadUnreadNotifyList()">신규 알림</a>
                        </div>
                        <div class="col"></div>
                        <div id="readNotify"class="col-4 mt-4 fs-5 text-center">
                            <a class="nav-link" href="#" onclick="checkReadNotifyList()">이전 알림</a>
                        </div>
                        <div  class="col-1 ps-0" style="font-size: small;">
                            <button  type="button" class="btn-close mt-2 border border-2 border-black" data-bs-dismiss="modal"></button>
                       </div>
                </div>
                <div class="modal-body">
                     <div  class="row ">
                        <div class="col-1"></div>
                        <div id="unreadNotifyListBox" class="col ">
                            
                        </div>
                        <div class="col-1"></div>
                     </div>
                </div>
              </div>
            </div>
        </div>
        <div ></div>
        <div id="notifyTemplete" class="d-none">
	        <div class="row my-3 unreadNotifyWrapper">
	        	<div class="col">
	        		<a class="navbar-brand link" href="#">
	             	<div class="row py-2 border rounded">
	                 	<div class="col-2 fs-4 text-center mt-1 ms-3">
	                    	 <i class="bi bi-megaphone" style="color: #133369;"></i>
	                 	</div>
	                	 <div class="col">
	                     	<div class="row pt-1">
	                        	 <div class="col fw-bold sender">
	                            	 [취업창업]
	                         	</div>
	                         	<div class="col text-end text-secondary created_at" style="font-size: small;">
	                            	 2023.12.06.
	                         	</div>
	                    	</div>
	                     	<div class="row mt-2 pb-2">
	                         	<div class="col message">
	                            	 ekekkddkdkkddkdkdkdkdkdkdkdkk!!!
	                         	</div>
	                     	</div>
	                 	</div>
		             </div>
		             </a>
	        	</div>	
	        </div>
        </div>
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>