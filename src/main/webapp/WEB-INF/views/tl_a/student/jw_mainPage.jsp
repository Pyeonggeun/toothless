<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

	<style>
		.text-over-cut {
		    display: -webkit-box;
		    -webkit-line-clamp: 2;
		    -webkit-box-orient: vertical;
		    overflow: hidden;
		    max-width: 200px;
		}
		
		.default-color {
		    color: #777777;
		}
		
		.new-color {
		    color: #FFFFFF;
		}

		
		.image-transition {
            transition: transform 0.5s ease;
        }
        
		.img-container {
		    position: relative;
		    z-index: 1; /* 이미지 위에 나타나도록 설정 */
		}

		.box {
		    position: relative;
		}
		
		.circle-overlay {
		    position: absolute;
		    top: 50%;
		    left: 45%;
		    transform: translate(-50%, -50%);
		    width: 100px; /* 조절 가능한 원의 크기 */
		    height: 100px;
		    border-radius: 50%;
		    background-color: #8C7427; /* 색상 */
		    opacity: 0;
		    transition: opacity 0.5s ease;
		    z-index: -1;
		}
		
        .badge-container {
            position: relative;
            z-index: 2; /* 뱃지를 이미지와 원 위로 가져오기 */
        }
        
        .button-with-background {
		    transition: transform 0.3s ease;
		}
		
		.button-with-background:hover {
		   transform: translateY(-10px);
		}

		
	</style>
	
	<script>

	
	    function changeColor(num) {
	        document.getElementById("box" + num).style.backgroundColor = "#8C7427";
	        document.getElementById("title" + num).style.color = "#FFC704";
	        document.getElementById("title" + num).classList.add("fw-bold");
	        document.getElementById("content" + num).classList.remove("default-color");
	        document.getElementById("content" + num).classList.add("new-color");
	        document.getElementById("imageContainer" + num).classList.add("image-transition");
	        
	     	// 이미지 올리기
	        document.getElementById("imageContainer" + num).style.transform = "translateY(-38px)";
	     	
	     	// 뱃지 바꾸기
	     	const badge = document.getElementById("badge" + num);
	     	badge.classList.remove("p-2");
	     	badge.classList.add("px-4", "py-2");
	     	badge.style.backgroundColor = "#E5E5E5";
	     	badge.style.color = "#777777";
	     	badge.innerText = "바로가기";
	     	
	     	const iTag = document.createElement("i");
	     	iTag.classList.add("ms-2", "fs-5", "bi", "bi-arrow-right");
	     	iTag.style.color = "#777777";
	     	badge.appendChild(iTag);
	     	
	     	// 원 만들기
	     	var box = document.getElementById("box" + num);
	     	var circleOverlay = box.querySelector(".circle-overlay");
		    if (circleOverlay) {
		        circleOverlay.style.opacity = 1;
		    }
	     	
	    }


	    function restoreColor(num) {
	    	document.getElementById("box" + num).style.backgroundColor = "";
	    	document.getElementById("title" + num).style.color = "black";
	    	document.getElementById("title" + num).classList.remove("fw-bold");
	    	document.getElementById("content" + num).classList.remove("new-color");
	    	document.getElementById("content" + num).classList.add("default-color");

	    	// 이미지 내리기
		    document.getElementById("imageContainer" + num).style.transform = "translateY(0)";
	    	
	     	// 뱃지 바꾸기
	     	const badge = document.getElementById("badge" + num);
	     	badge.classList.add("p-2");
	     	badge.classList.remove("px-4", "py-2");
	     	badge.style.backgroundColor = "#E5E5E5";
	     	badge.innerText = "";
	     	
	     	const iTag = document.createElement("i");
	     	iTag.classList.add("fs-5", "bi", "bi-arrow-right");
	     	iTag.style.color = "white";
	     	badge.appendChild(iTag);
	     	
	     	var box = document.getElementById("box" + num);
	     	var circleOverlay = box.querySelector(".circle-overlay");
	        if (circleOverlay) {
	            circleOverlay.style.opacity = 0;
	        }
		}
	    
	    // 특정 링크로 이동 - onclick사용
	    function toLink(link) {

		    window.location.href = link;
		}
	    

	    
	    
	</script>


</head>
<body>
<!-- 상단 common Navi -->
<jsp:include page="../commons/student/topNavi.jsp"></jsp:include>

<!-- 캐러셀 이미지 -->
<div class="row">
	<div class="col p-0">
		<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="../../resources/img/dormitory/mainCarousel1.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="../../resources/img/dormitory/mainCarousel2.png" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
</div>
<!-- 중간 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-1 ps-0 pe-3 d-flex align-items-end">
			<img src="../../resources/img/dormitory/mainPageLeftImg.png" class="img-fluid">		
		</div>
		<div class="col">
			<!-- 버튼들 -->
			<div class="row mb-5 py-5">
				<div class="col">
					<div class="row border border-bottom-0 p-0">
						<div id="box0" class="box box0 col border-end"
						onclick="toLink('./dm_dormIntroduction')"
						onmouseover="changeColor(0)" onmouseout="restoreColor(0)">
							<!-- 이모티콘 -->
							<div class="row mt-4 ms-3">
								<div id="imageContainer0" class="col-3 img-container">
									<div class="circle-overlay"></div>
									<img src="../../resources/img/dormitory/img1.png" class="img-fluid" style="height: 60px">
								</div>
							</div>
							<!-- 제목 -->
							<div id="title0" class="row mt-3 ms-3">
								<div class="col fs-5">
									MK대 기숙사
								</div>
							</div>
							<!-- 설명 -->
							<div id="content0" class="row default-color mt-2 ms-3">
								<div class="col">
									MK대 기숙사를 소개합니다.<br>
									&nbsp;
								</div>
							</div>
							<!-- 바로가기 -->
							<div class="row mt-5 ms-3 mb-4">
								<div class="col">
									<div class="row">
										<div class="col-3 align-self-center">
										<span id="badge0" class="badge rounded-5 p-2 " style="background-color:#E5E5E5; font-size: 1.1em">
											<i class="text-white fs-5 bi bi-arrow-right"></i>
										</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="box1" class="box box1 col border-end" 
						onclick="toLink('./mj_dormPosted')"
						onmouseover="changeColor(1)" onmouseout="restoreColor(1)">
							<!-- 이모티콘 -->
							<div class="row mt-4 ms-3">
								<div id="imageContainer1" class="col-3 img-container">
									<div class="circle-overlay"></div>
									<span>
									<img src="../../resources/img/dormitory/img2.png" class="img-fluid" style="height: 57px; width: 51px"></span>
								</div>
							</div>
							<!-- 제목 -->
							<div id="title1" class="row mt-3 ms-3">
								<div class="col fs-5">
									입사신청
								</div>
							</div>
							<!-- 설명 -->
							<div id="content1" class="row default-color mt-2 ms-3">
								<div class="col">
									생활관 입사신청 방법을<br>
									안내합니다.
								</div>
							</div>
							<!-- 바로가기 -->
							<div class="row mt-5 ms-3 mb-4">
								<div class="col">
									<div class="row">
										<div class="col-3 align-self-center">
										<span id="badge1" class="badge rounded-5 p-2 " style="background-color:#E5E5E5; font-size: 1.1em">
											<i class="text-white fs-5 bi bi-arrow-right"></i>
										</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="box2" class="box box2 col border-end" 
						onclick="toLink('./jw_exitApplyPage')"
						onmouseover="changeColor(2)" onmouseout="restoreColor(2)">
							<!-- 이모티콘 -->
							<div class="row mt-4 ms-3">
								<div id="imageContainer2" class="col-3 img-container">
									<div class="circle-overlay"></div>
									<img src="../../resources/img/dormitory/img3.png" class="img-fluid" style="height: 60px">
								</div>
							</div>
							<!-- 제목 -->
							<div id="title2" class="row mt-3 ms-3">
								<div class="col fs-5">
									외박 및 외출신청
								</div>
							</div>
							<!-- 설명 -->
							<div id="content2" class="row default-color mt-2 ms-3">
								<div class="col">
									외박 및 외출신청 방법을<br>
									안내합니다.
								</div>
							</div>
							<!-- 바로가기 -->
							<div class="row mt-5 ms-3 mb-4">
								<div class="col">
									<div class="row">
										<div class="col-3 align-self-center">
										<span id="badge2" class="badge rounded-5 p-2 " style="background-color:#E5E5E5; font-size: 1.1em">
											<i class="text-white fs-5 bi bi-arrow-right"></i>
										</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="box3" class="box box3 col" 
						onclick="toLink('./dm_dormNoticePage')"
						onmouseover="changeColor(3)" onmouseout="restoreColor(3)">
							<!-- 이모티콘 -->
							<div class="row mt-4 ms-3">
								<div id="imageContainer3" class="col-3 img-container">
									<div class="circle-overlay"></div>
									<img src="../../resources/img/dormitory/img4.png" class="img-fluid" style="height: 57px; width: 49px;">
								</div>
							</div>
							<!-- 제목 -->
							<div id="title3" class="row mt-3 ms-3">
								<div class="col fs-5">
									공지사항
								</div>
							</div>
							<!-- 설명 -->
							<div id="content3" class="row default-color mt-2 ms-3">
								<div class="col">
									기숙사의 공지사항을<br>
									알려드립니다.
								</div>
							</div>
							<!-- 바로가기 -->
							<div class="row mt-5 ms-3 mb-4">
								<div class="col">
									<div class="row">
										<div class="col-3 align-self-center">
										<span id="badge3" class="badge rounded-5 p-2 " style="background-color:#E5E5E5; font-size: 1.1em">
											<i class="text-white fs-5 bi bi-arrow-right"></i>
										</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 222222222222222222222222222222222222222222222222222222 -->
					<div class="row border p-0">
						<div id="box4" class="box box4 col border-end" 
						onclick="toLink('./dm_FAQ')"
						onmouseover="changeColor(4)" onmouseout="restoreColor(4)">
							<!-- 이모티콘 -->
							<div class="row mt-4 ms-3">
								<div id="imageContainer4" class="col-3 img-container">
									<div class="circle-overlay"></div>
									<img src="../../resources/img/dormitory/img5.png" class="img-fluid" style="height: 63px; width: 50px;">
								</div>
							</div>
							<!-- 제목 -->
							<div id="title4" class="row mt-3 ms-3">
								<div class="col fs-5">
									FAQ
								</div>
							</div>
							<!-- 설명 -->
							<div id="content4" class="row default-color mt-2 ms-3">
								<div class="col">
									자주하는 질문을 확인하실 수<br>
									있습니다.
								</div>
							</div>
							<!-- 바로가기 -->
							<div class="row mt-5 ms-3 mb-4">
								<div class="col">
									<div class="row">
										<div class="col-3 align-self-center">
										<span id="badge4" class="badge rounded-5 p-2 " style="background-color:#E5E5E5; font-size: 1.1em">
											<i class="text-white fs-5 bi bi-arrow-right"></i>
										</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="box5" class="box box5 col border-end" 
						onclick="toLink('#')"
						onmouseover="changeColor(5)" onmouseout="restoreColor(5)">
							<!-- 이모티콘 -->
							<div class="row mt-4 ms-3">
								<div id="imageContainer5" class="col-3 img-container">
									<div class="circle-overlay"></div>
									<img src="../../resources/img/dormitory/img6.png" class="img-fluid" style="height: 60px; width: 62px;">
								</div>
							</div>
							<!-- 제목 -->
							<div id="title5" class="row mt-3 ms-3">
								<div class="col fs-5">
									고장 수리요청
								</div>
							</div>
							<!-- 설명 -->
							<div id="content5" class="row default-color mt-2 ms-3">
								<div class="col">
									고장 수리를 요청하실 수<br>
									있습니다.
								</div>
							</div>
							<!-- 바로가기 -->
							<div class="row mt-5 ms-3 mb-4">
								<div class="col">
									<div class="row">
										<div class="col-3 align-self-center">
										<span id="badge5" class="badge rounded-5 p-2 " style="background-color:#E5E5E5; font-size: 1.1em">
											<i class="text-white fs-5 bi bi-arrow-right"></i>
										</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="box6" class="box box6 col border-end" 
						onclick="toLink('./mainGaesipan')"
						onmouseover="changeColor(6)" onmouseout="restoreColor(6)">
							<!-- 이모티콘 -->
							<div class="row mt-4 ms-3">
								<div id="imageContainer6" class="col-3 img-container">
									<div class="circle-overlay"></div>
									<img src="../../resources/img/dormitory/img7.png" class="img-fluid" style="height: 60px">
								</div>
							</div>
							<!-- 제목 -->
							<div id="title6" class="row mt-3 ms-3">
								<div class="col fs-5">
									자유게시판
								</div>
							</div>
							<!-- 설명 -->
							<div id="content6" class="row default-color mt-2 ms-3">
								<div class="col">
									자유롭게 글을 작성하실<br>
									수 있습니다.
								</div>
							</div>
							<!-- 바로가기 -->
							<div class="row mt-5 ms-3 mb-4">
								<div class="col">
									<div class="row">
										<div class="col-3 align-self-center">
										<span id="badge6" class="badge rounded-5 p-2 " style="background-color:#E5E5E5; font-size: 1.1em">
											<i class="text-white fs-5 bi bi-arrow-right"></i>
										</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div id="box7" class="box box7 col" 
						onclick="toLink('./jw_checkDormStudentPointPage')"
						onmouseover="changeColor(7)" onmouseout="restoreColor(7)">
							<!-- 이모티콘 -->
							<div class="row mt-4 ms-3">
								<div id="imageContainer7" class="col-3 img-container">
									<div class="circle-overlay"></div>
									<img src="../../resources/img/dormitory/img8.png" class="img-fluid" style="height: 60px;">
								</div>
							</div>
							<!-- 제목 -->
							<div id="title7" class="row mt-3 ms-3">
								<div class="col fs-5">
									상벌점 확인
								</div>
							</div>
							<!-- 설명 -->
							<div id="content7" class="row default-color mt-2 ms-3">
								<div class="col">
									상벌점을 확인하실 수<br>
									있습니다.
								</div>
							</div>
							<!-- 바로가기 -->
							<div class="row mt-5 ms-3 mb-4">
								<div class="col">
									<div class="row">
										<div class="col-3 align-self-center">
										<span id="badge7" class="badge rounded-5 p-2 " style="background-color:#E5E5E5; font-size: 1.1em">
											<i class="text-white fs-5 bi bi-arrow-right"></i>
										</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
			<!-- 공지사항/위치 -->
			<div class="row my-5 py-5">
				<div class="col-7">
					<div class="row">
						<div class="col">
							<span class="pb-4 pe-0 fs-3 fw-bold position-relative">
							NOTICE
							<span class="position-absolute top-0 start-100 translate-middle p-1 border border-light rounded-circle" style="background-color: #8C7427"></span>
							</span>
						</div>
						<div class="col text-end me-3">
							<i class="fs-5 px-3 bi bi-arrow-left btn" style="color: #B2B2B2;"></i>
							<i class="fs-5 px-3 bi bi-arrow-right btn" style="color: #B2B2B2;"></i>
							<i class="fs-3 px-3 bi bi-plus-lg btn"></i>
						</div>
					</div>
					<div class="row my-3 mt-4">
						<div class="col pe-5">
							<div class="row">
								<div class="col">
									<span style="font-size: 0.8em;">공지사항</span>
								</div>
							</div>
							<div class="row">
								<div class="col pb-5">
									<span class="text-over-cut">2023학년도 2학기 생활관 상시 추가모집 안내</span>
								</div>
							</div>
							<div class="row">
								<div class="col pb-2">
									<span style="color: #999999;">2023.11.30</span>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="px-3 py-2 rounded-0 btn btn-sm btn-outline-secondary border-secondary-subtle" style="font-size: 0.8em;">
										<span class="text-black me-2">자세히 보기</span>  
										<i class="bi bi-arrow-right"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="col px-5 border-start border-end">
							<div class="row">
								<div class="col">
									<span style="font-size: 0.8em;">공지사항</span>
								</div>
							</div>
							<div class="row">
								<div class="col pb-5">
									<span class="text-over-cut">2023학년도 2학기 생활관 상시 추가모집 안내</span>
								</div>
							</div>
							<div class="row">
								<div class="col pb-2">
									<span style="color: #999999;">2023.11.30</span>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="px-3 py-2 rounded-0 btn btn-sm btn-outline-secondary border-secondary-subtle" style="font-size: 0.8em;">
										<span class="text-black me-2">자세히 보기</span>  
										<i class="bi bi-arrow-right"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="col px-5">
							<div class="row">
								<div class="col">
									<span style="font-size: 0.8em;">공지사항</span>
								</div>
							</div>
							<div class="row">
								<div class="col pb-5">
									<span class="text-over-cut">2023학년도 2학기 생활관 상시 추가모집 안내</span>
								</div>
							</div>
							<div class="row">
								<div class="col pb-2">
									<span style="color: #999999;">2023.11.30</span>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<a class="px-3 py-2 rounded-0 btn btn-sm btn-outline-secondary border-secondary-subtle" style="font-size: 0.8em;">
										<span class="text-black me-2">자세히 보기</span>  
										<i class="bi bi-arrow-right"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-5">
					<div class="row">
						<div class="col px-0">
							<span class="pb-4 pe-0 fs-3 fw-bold position-relative">
							LOCATION
							<span class="position-absolute top-0 start-100 translate-middle p-1 border border-light rounded-circle" style="background-color: #8C7427"></span>
							</span>
						</div>
					</div>
					<div class="row my-3">
						<div class="col">
							<div class="row my-3 d-flex">
								<button class="button-with-background col px-0 border-0 position-relative" 
								        style="height: 200px; background: url('../../resources/img/dormitory/location1.jpg') center center no-repeat; background-size: cover; width: 200px;">
								    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.6);"></div>
								    <div class="row">
									    <div class="col text-white text-start" style="font-size:1.1em; position: absolute; top: 30%; left: 57%; transform: translate(-50%, -50%);">
									        위치안내
									    </div>
								    </div>
								    <div class="row mt-4">
									    <div class="col px-3 py-2 text-white text-start" style="font-size:0.8em; position: absolute; top: 47%; left: 56%; transform: translate(-50%, -50%);">
										    자세히 보기
										    <i class="bi bi-arrow-right text-white"></i>
									    </div>
									</div>
								</button>
								<button class="button-with-background col px-0 border-0 position-relative" 
								        style="height: 200px; background: url('../../resources/img/dormitory/location2.jpg') center center no-repeat; background-size: cover; width: 200px;">
								    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.6);"></div>
								    <div class="row">
									    <div class="col text-white text-start" style="font-size:1.1em; position: absolute; top: 30%; left: 57%; transform: translate(-50%, -50%);">
									        시내버스 노선안내
									    </div>
								    </div>
								    <div class="row mt-4">
									    <div class="col px-3 py-2 text-white text-start" style="font-size:0.8em; position: absolute; top: 47%; left: 56%; transform: translate(-50%, -50%);">
										    자세히 보기
										    <i class="bi bi-arrow-right text-white"></i>
									    </div>
									</div>
								</button>
								<button class="button-with-background col px-0 border-0 position-relative" 
								        style="height: 200px; background: url('../../resources/img/dormitory/location3.jpg') center center no-repeat; background-size: cover; width: 200px;">
								    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.6);"></div>
								    <div class="row">
									    <div class="col text-white text-start" style="font-size:1.1em; position: absolute; top: 30%; left: 57%; transform: translate(-50%, -50%);">
									        셔틀버스 노선안내
									    </div>
								    </div>
								    <div class="row mt-4">
									    <div class="col px-3 py-2 text-white text-start" style="font-size:0.8em; position: absolute; top: 47%; left: 56%; transform: translate(-50%, -50%);">
										    자세히 보기
										    <i class="bi bi-arrow-right text-white"></i>
									    </div>
									</div>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-1 pe-0 ps-3"></div>
	</div>
</div>

<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>