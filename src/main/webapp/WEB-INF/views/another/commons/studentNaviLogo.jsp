<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<script>
        //알림
       	function reloadNotifyCount(){
       		const url = "/toothless/another/student/reloadMyNotifyCount?student_pk="+${sessionStudentInfo.student_pk};
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
       	
        setInterval(reloadNotifyCount, 20000);
       	
       	function loadMyNewNotifyCount(){
       		const url = "/toothless/another/student/reloadMyNewNotifyList?student_pk="+${sessionStudentInfo.student_pk};
       		fetch(url)
       		.then(response => response.json())
       		.then((response) => {
       			const alertBox = document.getElementById("alertBox");
       			const sender = document.getElementById("sender");
       			const notifyIcon = document.getElementById("notifyIcon");
       			const message = document.getElementById("message");
       			const link = document.getElementById("link");
       			
       			if(response.data.length >= 2){
       				
       				alertBox.classList.remove("d-none");
       				sender.innerText = "";
       				sender.innerText = "알림";
       				notifyIcon.classList.remove("bi-bell-fill","bi-person-workspace","bi-briefcase-fill","bi-headset","bi-buildings","bi-capsule","bi-gear");
       				notifyIcon.classList.add("bi-bell-fill");
       				message.innerText = "";
       				message.innerText = "총 "+response.data.length+"개의 새로운 알림이 있습니다.";
       				
       				
       				
       				
       				updateMyCheckNotifyStatus();
           			reloadNotifyCount();
       				setTimeout(() => 
       					alertBox.classList.add("d-none"),
       					5000);
       				
       			}else if(response.data.length == 1){
       				alertBox.classList.remove("d-none");
       				sender.innerText = "";
       				sender.innerText = response.data[0].centerCategoryDto.position;
       				if(response.data[0].centerCategoryDto.center_pk == 1){
       					notifyIcon.classList.remove("bi-bell-fill","bi-bell-fill","bi-briefcase-fill","bi-headset","bi-buildings","bi-capsule","bi-gear");
       					notifyIcon.classList.add("bi-person-workspace");
       				}else if(response.data[0].centerCategoryDto.center_pk == 2){
       					notifyIcon.classList.remove("bi-bell-fill","bi-bell-fill","bi-briefcase-fill","bi-headset","bi-buildings","bi-capsule","bi-gear","bi-person-workspace" );
       					notifyIcon.classList.add("bi-briefcase-fill");
       				}else if(response.data[0].centerCategoryDto.center_pk == 3){
       					notifyIcon.classList.remove("bi-bell-fill","bi-bell-fill","bi-briefcase-fill","bi-headset","bi-buildings","bi-capsule","bi-gear","bi-person-workspace" );
       					notifyIcon.classList.add("bi-headset");
       				}else if(response.data[0].centerCategoryDto.center_pk == 4){
       					notifyIcon.classList.remove("bi-bell-fill","bi-bell-fill","bi-briefcase-fill","bi-headset","bi-buildings","bi-capsule","bi-gear","bi-person-workspace" );
       					notifyIcon.classList.add("bi-buildings");
       				}else if(response.data[0].centerCategoryDto.center_pk == 5){
       					notifyIcon.classList.remove("bi-bell-fill","bi-bell-fill","bi-briefcase-fill","bi-headset","bi-buildings","bi-capsule","bi-gear","bi-person-workspace" );
       					notifyIcon.classList.add("bi-capsule");
       				}else{
       					notifyIcon.classList.remove("bi-bell-fill","bi-bell-fill","bi-briefcase-fill","bi-headset","bi-buildings","bi-capsule","bi-gear","bi-person-workspace" );
       					notifyIcon.classList.add("bi-gear");
       				}
       				message.innerText = "";
       				message.innerText = response.data[0].notificationDto.message;
       				
       				link.setAttribute("onclick" ,"location.href='"+e.data[0].notificationDto.pageLink+"'");
       				
       				updateMyCheckNotifyStatus();
           			reloadNotifyCount();
       				setTimeout(() => 
       					alertBox.classList.add("d-none"),
       					10000);
       			}
       					
       			
       		});
       	}
       	setInterval(loadMyNewNotifyCount, 20000);
       	
       	function updateReadNotifyStatus(){
       		const url = "/toothless/another/student/updateReadNotifyStatus?student_pk="+${sessionStudentInfo.student_pk};
       		fetch(url);
       		
       	}
       	
       	
       	
       	function updateMyCheckNotifyStatus(){
       		const url = "/toothless/another/student/updateNewNotifyStatus?student_pk="+${sessionStudentInfo.student_pk};
       		fetch(url);

       	}
       	
       	function showNotifyModal(){
               const modal = bootstrap.Modal.getOrCreateInstance("#showMyNotifyListModal");
               loadUnreadNotifyList();
               modal.show();
           }
       	
       	function hideNotify(){
       		const alertBox = document.getElementById("alertBox");
       		alertBox.classList.add("d-none");
       	}
       	
       	function loadUnreadNotifyList() {
       		
			const url = "/toothless/another/student/loadUnreadNotifyList?student_pk="+${sessionStudentInfo.student_pk};
			fetch(url)
       		.then(response => response.json())
       		.then((response) => {
       			cleanNotifyList();	
       			hideNotify();
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

        				const goLinkPage = unreadNotifyWrapper.querySelector(".goLinkPage");
        	    		goLinkPage.setAttribute("onclick" , "location.href='"+e.notificationDto.pageLink+"'");
        				
        				const centerIcon = unreadNotifyWrapper.querySelector(".centerIcon");
        				if(e.centerCategoryDto.center_pk == 1){
        					centerIcon.classList.add("bi","bi-person-workspace");
        				}else if(e.centerCategoryDto.center_pk == 2){
        					centerIcon.classList.add("bi","bi-briefcase-fill");
        				}else if(e.centerCategoryDto.center_pk == 3){
        					centerIcon.classList.add("bi","bi-headset");
        				}else if(e.centerCategoryDto.center_pk == 4){
        					centerIcon.classList.add("bi","bi-buildings");
        				}else if(e.centerCategoryDto.center_pk == 5){
        					centerIcon.classList.add("bi","bi-capsule");
        				}else{
        					centerIcon.classList.add("bi","bi-gear");
        				}
        				
        				
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
        	    				if((currentDate.getMinutes() - date.getMinutes()) == 0){
        	    					created_at.innerText = "방금";
        	    				}else{
        	    					created_at.innerText = (currentDate.getMinutes() - date.getMinutes())+ "분전";
        	    				}
        	    			
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
        				reloadNotifyCount();
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
       		const url = "/toothless/another/student/loadReadNotifyList?student_pk="+${sessionStudentInfo.student_pk};
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
       				
       				const centerIcon = unreadNotifyWrapper.querySelector(".centerIcon");
       				if(e.centerCategoryDto.center_pk == 1){
       					centerIcon.classList.add("bi","bi-person-workspace");
       				}else if(e.centerCategoryDto.center_pk == 2){
       					centerIcon.classList.add("bi","bi-gear");
       				}else if(e.centerCategoryDto.center_pk == 3){
       					centerIcon.classList.add("bi","bi-headset");
       				}else if(e.centerCategoryDto.center_pk == 4){
       					centerIcon.classList.add("bi","bi-buildings");
       				}else if(e.centerCategoryDto.center_pk == 5){
       					centerIcon.classList.add("bi","bi-capsule");
       				}else{
       					centerIcon.classList.add("bi","bi-gear");
       				}
       				
       				
       				
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
       				
       	    		const goLinkPage = unreadNotifyWrapper.querySelector(".goLinkPage");
       	    		goLinkPage.setAttribute("onclick" , "location.href='"+e.notificationDto.pageLink+"'");
       	    		
       				unreadNotifyListBox.appendChild(unreadNotifyWrapper);
       			}
       		});
       	}
       	function mouseOver(target) {
       		target.classList.add("mouseOver");
		}
       	function mouseLeave(target){
       		target.classList.remove("mouseOver");
       	}
       	
       	
       	
       	 window.addEventListener("DOMContentLoaded", () =>{
       		 reloadNotifyCount();
       		 loadMyNewNotifyCount();
       		 
         });
        	 
        	 
        	
        </script>

	<div class="row">
       <div class="col">
           <div class="row text-center">
               <div class="col-4"></div>
               <div class="col ms-5">
               	<div onclick="location.href='/toothless/another/student/mainPage'" class="row" style="cursor: pointer;">
               		<div class="col-3 pe-2 text-end mt-2">
                     <img src="/toothless/resources/img/another/logo_black.png" alt="" style="height: 2em;">
                 </div>
                 <div class="col-9 ps-0 fw-bold fs-3 text-start align-self-center ">
                    MK University 
                 </div>
               	</div>
               </div>
               <div class="col-1"></div>
               <div class="col-1 position-relative pe-0 pb-0 fs-4 text-end align-self-center">
                   <button class="navbar-brand border-0 bg-white" onclick="showNotifyModal()"><i class="bi bi-bell text-balck pe-1">
                   <span id="reloadNotifyCount" class="position-absolute top-0 start-60 badge rounded-pill bg-danger d-none px-1 py-0" style="font-size: small;">
                   </span>
                   </i></button> 
               </div>
               <div class="col-1"></div>
           </div>
       </div>
   </div>
   <div class="row">
   	<div class="col">
             <div id="alertBox" class="alert row border border-black position-fixed bottom-0 end-0 me-4 px-0 py-0 d-none" role="alert" style="height: 9em; width: 20em;">
               <div class="col">
                   <div class="row border-bottom py-0 text-light rounded-top" style="background-color: #133369;">
                       <div id="sender" class="col-9  ">
                           
                       </div>
                       <div class="col text-end " style="font-size: x-small;">
                           <button onclick="hideNotify()" class="btn-close btn-close-white btn-close-disabled-opacity mt-1"></button>
                       </div>
                   </div>
                   
                   <div class="row bg-white pt-3">
                       <div class="col-2 ps-3 fs-3">
                           <i id ="notifyIcon" class="bi" style="color: #133369;"></i>
                       </div>
                       <div id="message" class="col fw-bold" style="font-size: small;">
                           
                       </div>
                   </div>
                   
                   <div class="row bg-white pb-3 rounded-bottom border-bottom border-black" style="color: #133369;">
                       <div class="col-6 text-center">
                           <button onclick="showNotifyModal()" class="btn border fw-bold mt-3 px-3 py-1" style="font-size: small; border-color: #133369;" >전체 알림확인</button>
                       </div>
                       <div class="col-6 text-center">
                           <button id="link"class="btn border fw-bold mt-3 px-4 py-1" style="font-size: small;">바로 가기</button>
                       </div>
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
                        <div id="newNotify"class="col-4 px-0 fs-5 mt-4 text-center ">
                            <a class="nav-link" href="#"  onclick="loadUnreadNotifyList()">신규 알림</a>
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
   <div id="notifyTemplete" class="d-none">
	        <div class="row my-3 unreadNotifyWrapper" style="background-color: rgb(230, 230, 230);">
	        	<div class="col">
	             	<div class="row py-2 border rounded goLinkPage">
	                 	<div class="col-2 fs-1 rounded-circle text-center mt-1 ms-3" >
	                    	 <i class="centerIcon" style="color: #133369;"></i>
	                 	</div>
	                	 <div class="col">
	                     	<div class="row pt-1">
	                        	 <div class="col fw-bold sender">
	                            	 
	                         	</div>
	                         	<div class="col text-end text-secondary created_at" style="font-size: small;">
	                            	 
	                         	</div>
	                    	</div>
	                     	<div class="row mt-2 pb-2">
	                         	<div class="col message">
	                            	 
	                         	</div>
	                     	</div>
	                 	</div>
		             </div>
	        	</div>	
	        </div>
        </div>
   
   