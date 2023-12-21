<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <script src="https://kit.fontawesome.com/fdd6196f61.js" crossorigin="anonymous"></script>

        <style>
            
            @font-face {
                font-family: 'Jal_Onuel';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
                font-weight: normal;
                font-style: normal;
            }

            .mkmk {
                font-family: 'Jal_Onuel';
            }
            
        </style>

        <script>
	        
	        let pageNumber = 1;
	    	let totalPageNumber = 1;
	    	let startPageNumber = 1;
	    	let endPageNumber = 1;
	    	
	    	let lifeStudentKey = 0;
	    	let lectureStudentKey = 0;
	    	
	    	function getLifeStudentKey() {
	    		
	    		const url = "./getLifeStudentKey";
	    		
	    		fetch(url)
	    		.then(response => response.json())
	    		.then(response => {
	    			
	    			lifeStudentKey = response.data;
	    			
	    			reloadTotalReviewLectureCount();
	    			console.log("살행딤");
	    		});
	    		
	    	}
	    	
			function previousPage() {
        		
				pageNumber = startPageNumber - 1;
        		
				reloadReviewLecture();
        		
        	}
			
			function nextPage() {
        		
				pageNumber = endPageNumber + 1;
        		
				reloadReviewLecture();
        		
        	}
			
			function movePage(target) {
        		
				pageNumber = Number(target.innerText);
        		
				reloadReviewLecture();
        		
        	}
			
			function pagination() {
				
				startPageNumber = (parseInt((pageNumber-1)/5))*5+1;
				endPageNumber = ((parseInt(pageNumber-1)/5)+1)*5;
     			
     			if(endPageNumber > totalPageNumber) {
     				endPageNumber = totalPageNumber;
     			}
     			
     			if(startPageNumber <= 1) {
     				document.getElementById("previous").classList.add("disabled");
     			}else {
     				document.getElementById("previous").classList.remove("disabled");
     			}
     			
     			if(endPageNumber >= totalPageNumber) {
     				document.getElementById("next").classList.add("disabled");
     			}else {
     				document.getElementById("next").classList.remove("disabled");	
     			}
     			
     			for(let i = 1 ; i <= 5 ; i++) {
     				document.getElementById("pageNumberBox" + i).innerHTML = "";
     			}
     			
     			for(let i = startPageNumber ; i <= endPageNumber ; i++) {
     				
     				const pageNumberLink = document.querySelector("#templete .pageNumberLink").cloneNode(true);
     				
     				if(i == pageNumber) {
     					pageNumberLink.classList.remove("text-black");
     					pageNumberLink.style.color = '#f7a505';
     				}else {
     					pageNumberLink.classList.add("text-black");
     					pageNumberLink.style.removeProperty("color");
     				}
     				
     				pageNumberLink.innerText = i;
     				
     				document.getElementById("pageNumberBox" + (i - parseInt((pageNumber-1)/5)*5)).appendChild(pageNumberLink);
     				
     			}
				
			}
			
			function reloadTotalReviewLectureCount() {
				
				const url = "./getTotalReviewLectureCount?life_student_key=" + lifeStudentKey;
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					document.getElementById("totalCount").innerText = response.data;
					
					totalPageNumber = Math.ceil(response.data/5);
					
					reloadReviewLecture();
					
				});
				
			}
			
			function reloadReviewLecture() {
				
				const url = "./getReviewLectureList?pageNumber=" + pageNumber + "&life_student_key=" + lifeStudentKey;
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					pagination();
					
					const reviewLectureBox = document.getElementById("reviewLectureBox");
					reviewLectureBox.innerHTML = "";
					
					if(totalPageNumber == 0) {
						
						const noReviewLectureWrapper = document.querySelector("#templete .noReviewLectureWrapper").cloneNode(true);
						reviewLectureBox.appendChild(noReviewLectureWrapper);
						
						return;
						
					}
					
					for(e of response.data) {
						
						const reviewLectureWrapper = document.querySelector("#templete .reviewLectureWrapper").cloneNode(true);
						
						reviewLectureWrapper.querySelector(".round").innerText = e.round;
						reviewLectureWrapper.querySelector(".category").innerText = e.categoryName;
						reviewLectureWrapper.querySelector(".name").innerText = e.lectureName;
						
						const reviewButton = reviewLectureWrapper.querySelector(".reviewButton");
						reviewButton.setAttribute("value", e.LECTURE_STUDENT_KEY);
						
						if(e.isReviewRegister) {
							
							reviewButton.setAttribute("onclick", "showReviewModal(this)");
							reviewButton.classList.remove("text-white");
							reviewButton.style.removeProperty("background-color");
							reviewButton.style.color = '#7844ae';
							reviewButton.style.borderColor = '#7844ae';
							reviewButton.style.border = "solid";
							reviewButton.style.borderWidth = "0.01em";
							reviewButton.innerText = "보기";
							
						}else {
							
							reviewButton.setAttribute("onclick", "showWriteReviewModal(this)");
							reviewButton.classList.add("text-white");
							reviewButton.style.removeProperty("color", "border-color", "border", "border-width");
							reviewButton.style.backgroundColor = '#7844ae';
							reviewButton.innerText = "참여하기";
							
						}
						
						reviewLectureBox.appendChild(reviewLectureWrapper);
						
					}
					
				});
				
			}
			
			function reloadLectureReviewInfo(key) {
				
				const url = "./getLectureReviewInfo?lecture_student_key=" + key;
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					for(let i = 1 ; i <= response.data.star_count ; i++) {
						
						const starShow = document.getElementById("starShow" + i);
						
						starShow.classList.add("fa-solid");
						starShow.classList.remove("fa-regular");
						
					}
					
					for(let i = response.data.star_count + 1 ; i <= 5 ; i++) {
						
						const starShow = document.getElementById("starShow" + i);
							
						starShow.classList.remove("fa-solid");
						starShow.classList.add("fa-regular");
						
					}
					
					const showContent = document.getElementById("showContent");
					showContent.innerText = response.data.review.replace(/<br>/g, '\n');

					const modal = bootstrap.Modal.getOrCreateInstance("#reviewModal");
	                modal.show();
					
				});
				
			}
			
			function colorStars(target) {
				
				const starFill = Number(target.id.slice(-1));
				document.getElementById("registerButton").value = starFill;
				
				for(let i = 1 ; i <= starFill ; i++) {
					
					const starWrite = document.getElementById("starWrite" + i);
					
					starWrite.classList.add("fa-solid");
					starWrite.classList.remove("fa-regular");
					
				}
				
				for(let i = starFill + 1 ; i <= 5 ; i++) {
					
					const starWrite = document.getElementById("starWrite" + i);
						
					starWrite.classList.remove("fa-solid");
					starWrite.classList.add("fa-regular");
					
				}
				
			}
			
			function registerReview(target) {
				
				if(document.getElementById("writeContent").value == '') {
					
					document.getElementById("pleaseWriteContent").innerText = "! 후기를 입력해주세요";
					
					return;
					
				}
				
				const starCount = Number(target.value);
				let review = document.getElementById("writeContent").value;
				review = review.replace(/\n/g, '<br>');
				
				const url = "./insertLectureReviewInfo?lecture_student_key=" + lectureStudentKey + "&star_count=" + starCount + "&review=" + review;
				
				fetch(url)
				.then(response => response.json())
				.then(response => {
					
					const modal = bootstrap.Modal.getOrCreateInstance("#writeReviewModal");
					modal.hide();
					
					reloadReviewLecture();
					
				});
				
			}
			
			function resetWriteReview() {
				
				for(let i = 2 ; i <= 5 ; i++) {
					
					const starWrite = document.getElementById("starWrite" + i);
					
					starWrite.classList.add("fa-regular");
					starWrite.classList.remove("fa-solid");
					
				}
				
				document.getElementById("writeContent").value = "";
				document.getElementById("pleaseWriteContent").innerHTML = "";
				
			}
			
			function showWriteReviewModal(target) {
                
				lectureStudentKey = Number(target.value);

                resetWriteReview();
               
                const modal = bootstrap.Modal.getOrCreateInstance("#writeReviewModal");
                modal.show();
                
            }

            function showReviewModal(target) {
                
            	lectureStudentKey = Number(target.value);
            	
            	reloadLectureReviewInfo(lectureStudentKey);
            	
            	const modal = bootstrap.Modal.getOrCreateInstance("#reviewModal");
                modal.show();
            	
            }
        	
	        function goMyPage() {
	    		
	    		/* if(myPk == null) {
	    			location.href = "../../another/student/loginPage";
	    			return;
	    		} */
	    		
	    		location.href = "./myPage";
	    		
	    	}
	    	
	    	function goApplyPage() {
	    		
	    		/* if(myPk == null) {
	    			location.href = "../../another/student/loginPage";
	    			return;
	    		} */
	    		
	    		location.href = "./applyPage";
	    		
	    	}
	    	
	    	function goMainPage() {
	    		
	    		location.href = "./mainPage";
	    		
	    	}
	    	
	    	function goLecturePage() {
	    		
	    		location.href = "./lecturePage";
	    		
	    	}
	    	
	    	function goReviewPage() {
	    		
	    		location.href = "./reviewPage";
	    		
	    	}
	    	
	    	function logout() {
	    		
	    		location.href = "../../another/external/logoutProcess";
	    		
	    	}
	    	
	    	window.addEventListener("DOMContentLoaded", () => {
	    		
	    		/* getMyPk(); */
	    		getLifeStudentKey();
	    		
	    	});
        
        </script>
        
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <jsp:include page="./top.jsp"></jsp:include>
                    <div class="row">
                        <div class="col py-4 progress-bar progress-bar-striped" style="background-color: #7844ae;">
                            <div class="row">
                                <div class="col text-white text-center fw-bold" style="font-size: 2em; letter-spacing: -0.05em;">
                                    나의 강의실
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row my-5">
                        <div class="col">
                            <div class="row" style="margin-left: 10.5%; margin-right: 10.5%;">
                                <div class="col-2">
                                    <div class="row sticky-top" style="top: 8em;">
                                        <div class="col rounded border">
                                            <div onclick="goMyPage()" class="row">
                                                <div class="col fw-bold text-secondary py-3 ps-3" style="font-size: 0.95em;">
                                                    홈
                                                </div>
                                                <div class="col text-end fw-bold text-secondary py-3 pe-3">
                                                    &gt;
                                                </div>
                                            </div>
                                            <div>
                                                <hr class="my-0">
                                            </div>
                                            <div onclick="goLecturePage()" class="row">
                                                <div class="col fw-bold text-secondary py-3 ps-3" style="font-size: 0.95em;">
                                                    학습
                                                </div>
                                                <div class="col text-end fw-bold text-secondary py-3 pe-3">
                                                    &gt;
                                                </div>
                                            </div>
                                            <div>
                                                <hr class="my-0">
                                            </div>
                                            <div onclick="goReviewPage()" class="row">
                                                <div class="col fw-bold py-3 ps-3" style="font-size: 0.95em; color: #7844ae;">
                                                    만족도/후기
                                                </div>
                                                <div class="col text-end fw-bold py-3 pe-3" style="color: #7844ae;">
                                                    &gt;
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col ms-5">
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col px-0 fw-bold" style="font-size: 2em;">
                                                    만족도/후기
                                                </div>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="col px-0">
                                                    <div class="row">
                                                        <div class="col py-1 text-secondary" style="font-size: 0.9em;">
                                                            총 <span id="totalCount" class="fw-semibold">155</span> 건
                                                        </div>
                                                    </div>
                                                    <div>
                                                        <hr class="mt-0">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div id="reviewLectureBox" class="col">
                                                
                                                </div>
                                            </div>
                                            <div class="row mt-5">
	                                            <div class="col d-grid justify-content-center">
	                                                <nav aria-label="Page navigation example">
	                                                    <ul class="pagination mb-0">
	                                                        <li id="previous" class="page-item">
	                                                            <a onclick="previousPage()" class="page-link border-0 text-black fw-bold" href="#" aria-label="Previous" style="font-size: 1.1em;">
	                                                                <span aria-hidden="true">&laquo;</span>
	                                                            </a>
	                                                        </li>
	                                                        <li id="pageNumberBox1" class="page-item my-auto"></li>
	                                                        <li id="pageNumberBox2" class="page-item my-auto"></li>
	                                                        <li id="pageNumberBox3" class="page-item my-auto"></li>
	                                                        <li id="pageNumberBox4" class="page-item my-auto"></li>
	                                                        <li id="pageNumberBox5" class="page-item my-auto"></li>
	                                                        <li id="next" class="page-item">
	                                                            <a onclick="nextPage()" class="page-link border-0 text-black fw-bold" href="#" aria-label="Next" style="font-size: 1.1em;">
	                                                                <span aria-hidden="true">&raquo;</span>
	                                                            </a>
	                                                        </li>
	                                                    </ul>
	                                                </nav>
	                                            </div>
	                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <jsp:include page="./bottom.jsp"></jsp:include>
                </div>
            </div>
        </div>
        
        <div id="templete" class="d-none">
        
        	<div class="reviewLectureWrapper row mt-3">
	            <div class="col py-4 rounded border">
	                <div class="row">
	                    <div class="col px-4">
	                        <div class="row">
	                            <div class="col">
	                                <span class="text-body-tertiary border-secondary-subtle ps-2 pe-1 py-1 fw-bold" style="border: solid; border-width: 0.01em; font-size: 0.85em;">
	                                    &#91;<span class="round">123</span>&#93;<span style="font-size: 0.9em;">차</span>
	                                </span>
	                                <span class="ms-2 px-2 py-1 fw-bold" style="font-size: 0.8em; border: solid; border-width: 0.01em; color: #f7a505;">
	                                    오프라인
	                                </span>
	                            </div>
	                        </div>
	                        <div class="row mt-3">
	                            <div class="category col fw-bold text-body-tertiary" style="font-size: 0.95em;">
	                                파이썬
	                            </div>
	                        </div>
	                        <div class="row mt-2">
	                            <div class="name col fw-bold" style="font-size: 1.1em;">
	                                기업현장교사 기본과정 온라인교육(15시간) 이수자를 위한 보충 영상 ※선택사항, 정규교과과정아님
	                            </div>
	                        </div>
	                    </div>
	                    <div class="vr px-0 text-body-tertiary"></div>
	                    <div class="col-3 my-auto">
	                        <div class="row">
	                            <div class="col d-grid justify-content-center">
	                                <button onclick="showWriteReviewModal()" class="reviewButton btn text-white fw-bold px-5 py-2" style="font-size: 0.9em; background-color: #7844ae;">참여하기</button>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        
	        <div class="noReviewLectureWrapper row mt-2">
	       		<div class="col rounded border" style="height: 20em">
	       			<div class="row align-items-center" style="height: 20em">
	       				<div class="col">
	       					<div class="row">
	                            <div class="col text-center">
	                                <i class="bi bi-chat-dots-fill" style="color: #EEEEEE; font-size: 2.5em;"></i>
	                            </div>
	                        </div>
	                        <div class="row mt-2">
	                            <div class="col text-center" style="font-size: 0.9em;">
	                            	강의가 없습니다
	                            </div>
	                        </div>
	       				</div>
	       			</div>
	       		</div>
	       	</div>
        
        	<a onclick="movePage(this)" class="pageNumberLink page-link border-0 text-black px-4" href="#" style="font-size: 1.1em;">1</a>
        	
        </div>

        <jsp:include page="./writeReviewModal.jsp"></jsp:include>

        <jsp:include page="./reviewModal.jsp"></jsp:include>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>