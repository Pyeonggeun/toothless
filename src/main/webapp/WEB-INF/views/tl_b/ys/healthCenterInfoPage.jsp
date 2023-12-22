<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    	<script src="../../resources/js/hn/topBanner.js"></script>
    	
    	<script>
    	
    		function showMap() {
    			
    			const modal = bootstrap.Modal.getOrCreateInstance("#mapModal");
    			modal.show();
    			reloadMap();
    			
    		}
    	
    	</script>
    	
    </head>
    <body>
    	<jsp:include page="../../another/commons/studentNaviLogo.jsp"></jsp:include>
		<jsp:include page="../commonJsp/studentTopBanner.jsp"></jsp:include>
        <div class="container-fluid">
            <div class="row mt-2 ps-5" style="margin-left: 16%; margin-right: 16%;">
                <div class="col">
                    <div class="row">
                        <div class="col text-end">
                            <span style="font-size: 0.8em; opacity: 70%; ">HOME</span>&nbsp;<span style="font-size: 0.8em; opacity: 70%; position: relative; bottom: 3%;">></span>&nbsp;<span style="font-size: 0.8em; opacity: 70%;">보건센터 소개</span>&nbsp;<span style="font-size: 0.8em; opacity: 70%; position: relative; bottom: 3%;">></span>&nbsp;<span class="fw-bold" style="font-size: 0.8em;">보건센터 안내</span>                   
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col text-center fw-bold">
                            <span style="font-size: 2.3em;">보건센터 안내</span>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col"></div>
                        <div class="col-3 px-0" style="border-style: solid; border-bottom: 0.08em; border-width: 0.08em; border-bottom-color: black;"></div>
                        <div class="col"></div>
                    </div>
                    <div class="row mt-5">
                        <div class="col-6">
                            <div class="row">
                                <div class="col">
                                    <img class="img-fluid" src="../../resources/img/healthRoom/healthcenter.jpg">
                                </div>
                            </div>
                        </div>
                        <div class="col-6 ps-5">
                            <div class="row">
                                <div class="col fw-bold" style="color: #2974BA; font-size: 1.2em;"> 
                                    위치
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col">
                                    <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot" style="font-size: 0.9em;"></i></span>&nbsp;서울특별시 강남구 테헤란로7길 7 에스코빌딩 MK 본관 1층(103호)</span>
                                </div>
                            </div>
                            <div class="row mt-3 ms-1">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-4 text-center pt-1 pb-1" style="border-style: solid; border-radius: 0.3em; border-width: 0.03em; font-size: 0.9em;">
                                            <a onclick="showMap()" style="text-decoration: none; color: black;">지도 보기&nbsp;&nbsp;&nbsp;&nbsp;<i class="bi bi-box-arrow-up-right"></i></a>
                                        </div>
                                        <div class="col"></div>   
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col fw-bold" style="color: #2974BA; font-size: 1.2em;"> 
                                    보건센터 이용시간
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col">
                                    <span><span style="position: relative; bottom: 8%;"><i class="bi bi-dot" style="font-size: 0.9em;"></i></span>&nbsp;월<span style="position: relative; bottom: 4%;">~</span>금요일 <span style="position: relative; bottom: 8%;">(</span>09:00 ~ 18:00<span style="position: relative; bottom: 8%;">)</span></span>
                                </div>
                            </div>
                            <div class="row mt-1">
                                <div class="col">
                                    <span><span style="position: relative; bottom: 5%;"><i class="bi bi-dot" style="font-size: 0.9em;"></i></span>&nbsp;점심시간 <span style="position: relative; bottom: 8%;">(</span>12:00 ~ 13:00<span style="position: relative; bottom: 8%;">)</span></span>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col fw-bold" style="color: #2974BA; font-size: 1.2em;"> 
                                    진료신청방법
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col">
                                    <span style="position: relative; bottom: 8%;"><i class="bi bi-dot" style="font-size: 0.9em;"></i>&nbsp;진료신청은 온라인 예약 불가, 오프라인으로만 가능</span>
                                </div>
                            </div>
                        </div>
                    </div>                    
                    <div class="row mt-5">
                        <div class="col fw-bold" style="font-size: 1.2em;">
                            업무
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;일반질환관리<span style="position: relative; bottom: 7%;">:</span> 호흡기계, 소화기계, 피부계, 근골격계, 안과, 구강질환 및 두통, 생리통, 피로 등에 관하여 무료약품<span style="position: relative; bottom: 7%;">(</span>1~2일분<span style="position: relative; bottom: 7%;">)</span>을 제공</span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;외상 및 화상에 대한 처치</span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;의사진료<span style="position: relative; bottom: 7%;">:</span> 학기 중 주 1~2회 운영<span style="position: relative; bottom: 7%;">(</span>방학, 시험기간 제외<span style="position: relative; bottom: 7%;">)</span></span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;안정실 운영</span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;응급환자의 1차 처치 및 연계병원으로의 후송</span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;금연교실운영<span style="position: relative; bottom: 7%;">:</span> 체내 일산화탄소 측정 및 금연보조제 지급, 금연성공 시 비타민 지급</span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;보건센터 내 건강관리기구 운영<span style="position: relative; bottom: 7%;">(</span>혈압, 맥박, 체온, 신장, 체중<span style="position: relative; bottom: 7%;">(</span>비만도<span style="position: relative; bottom: 7%;">)</span>, 혈당검사, 체지방측정, 콜레스테롤 측정, 빈혈검사<span style="position: relative; bottom: 7%;">)</span></span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;비만관리<span style="position: relative; bottom: 7%;">:</span> 체성분 측정 및 결과 상담</span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;재학생 건강검진실시<span style="position: relative; bottom: 7%;">(</span>년 1회~2회<span style="position: relative; bottom: 7%;">)</span> - 공지 후 실시<span style="position: relative; bottom: 7%;">(</span>기본검사: 시력, 체중, 혈압, 비만/흉부촬영/혈액검사: 빈혈, 간질환, 고지혈증, 당뇨/소변<span style="position: relative; bottom: 7%;">)</span></span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;독감 예방 접종 실시<span style="position: relative; bottom: 7%;">(</span>년1회<span style="position: relative; bottom: 7%;">)</span> - 공지 후 실시</span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;기타 예방접종 실시 - 공지 후 실시</span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;건강 상담 및 건강 상식 정보 제공</span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;기타 보건관리를 위한 각종업무<span style="position: relative; bottom: 7%;">(</span>업무일지 및 처치기록 등의 작성, 정리, 분석<span style="position: relative; bottom: 7%;">)</span></span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;비품 및 약품관리</span>
                        </div>
                    </div>
                    <div class="row mt-1">
                        <div class="col" style="font-size: 0.9em;">
                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;진료확인서 발급</span>
                        </div>
                    </div>
                    <div class="row mt-5">
                        <div class="col fw-bold" style="font-size: 1.2em;">
                            구성원 소개 및 연락처
                        </div>
                    </div>
                    <div class="row mt-3 ms-1">
                        <div class="col-4 border">
                            <div class="row">
                                <div class="col ps-4 pt-4 pb-5" style="font-size: 1em;">
                                    <span class="fw-bold" style="opacity: 70%;">보건센터장</span><span style="position: relative; bottom: 1%; font-size: 1.2em;">:</span> <span class="fw-bold">이민규</span>
                                    <div class="row">                                        
                                        <div class="col pt-2 pb-1" style="position: relative; left: 4%; border-bottom-style: solid; border-width: 0.08em; opacity: 70%;">
                                            
                                        </div>
                                        <div class="col-1"></div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col">
                                            <span><span style="position: relative;"><i class="bi bi-dot"></i></span>&nbsp;<span style="position: relative; bottom: 9%;">(</span><span style="position: relative; bottom: 2%;">MK</span>대학교병원 가정의학과 교수<span style="position: relative; bottom: 9%;">)</span></span>
                                        </div>
                                    </div>                                    
                                </div>                                
                            </div>                            
                        </div>
                        <div class="col-1"></div>
                        <div class="col-4 border">
                            <div class="row">
                                <div class="col ps-4 pt-4 pb-5" style="font-size: 1em;">
                                    <span class="fw-bold" style="opacity: 70%;">간호사</span><span style="position: relative; bottom: 1%; font-size: 1.2em;">:</span> <span class="fw-bold">이민지</span>
                                    <div class="row">                                        
                                        <div class="col pt-2 pb-1" style="position: relative; left: 4%; border-bottom-style: solid; border-width: 0.08em; opacity: 70%;">
                                            
                                        </div>
                                        <div class="col-1"></div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col">
                                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;전화 <span style="position: relative; bottom: 2%; font-size: 1.2em;">:</span> 031-219-1596</span>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col">
                                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;팩스 <span style="position: relative; bottom: 2%; font-size: 1.2em;">:</span> 031-219-1597</span>
                                        </div>
                                    </div>
                                    <div class="row mt-1">
                                        <div class="col">
                                            <span><span style="position: relative; bottom: 3%;"><i class="bi bi-dot"></i></span>&nbsp;이메일 <span style="position: relative; bottom: 2%; font-size: 1.2em;">:</span> soo1lec@mk.ac.kr</span>
                                        </div>
                                    </div>                                         
                                </div>                                
                            </div>                            
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="row mt-5">
                <div class="col">
                    <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
                </div>
            </div>
        </div>
        
        <div id="mapModal" class="modal" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered modal-lg">
			    <div class="modal-content">
			    	<div class="modal-header border-0 py-3">
			    		<span class="fw-bold" style="font-size: 1.1em">지도</span>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="font-size: 0.8em"></button>
			      	</div>
			      	<div class="modal-body pt-0">
			        	<div class="row">
			        		<div class="col">
			        			<div class="row">
			        				<div class="col">
			        					<div id="map" style="width:100%; height:400px;"></div>
			        				</div>
			        			</div>
			        			<div class="row mt-3">
			        				<div class="col" style="font-size: 0.9em">
			        					위치 : 서울특별시 강남구 테헤란로7길 7 에스코빌딩 MK 본관 1층(103호)
			        				</div>
			        			</div>
			        			<div class="row mt-1">
			        				<div class="col" style="font-size: 0.9em">
			        					오시는 길 :&nbsp;<span class="badge text-white rounded-circle" style="background-color: #3CB44A; position: relative; top: -0.15em;">2</span>
			        					<span class="badge text-white rounded-pill" style="background-color: #A71E31; position: relative; top: -0.15em;">신분당</span> 강남역 12번 출구에서 250m
			        				</div>
			        			</div>
			        		</div>
			        	</div>
			      	</div>
			    </div>
		  	</div>
		</div>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a277eb582a644847f86de6196a42745f"></script>
		
		<script>
		
			function reloadMap() {
				
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
					center: new kakao.maps.LatLng(37.499605278039844, 127.03004492190401), //지도의 중심좌표.
					level: 3 //지도의 레벨(확대, 축소 정도)
				};

				var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
				
				var markerPosition  = new kakao.maps.LatLng(37.499632, 127.030471); 

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
				    position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
			}	
		
		</script>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>