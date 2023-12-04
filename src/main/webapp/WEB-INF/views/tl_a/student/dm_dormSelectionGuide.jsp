<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        .menus{
            text-align: center;
            float: inline-block;
        }
        
 
    </style>
    <script>
        //js주석
        /*여러줄 주석*/
        
    </script>
</head>
<body>
    <jsp:include page="../commons/student/topNavi.jsp"></jsp:include>
    <div class="row">
        <div class="col">
            <img src="../../resources/img/dormitory/studentMainLogo.jpg">
        </div>
    </div>


    <div class="container mt-3">
        <div class="row">
            <div class="col-3 me-3"><!-- 여기부분은 목차부분 -->
                <div class="row rounded-1 opacity-90" style="background-color: #504528;">
                    <div class="col py-4 text-center">
                        <span class="fw-bold" style="color: white; font-size: x-large;">모집안내</span>
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">모집공고</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.2em solid #504528;">
                    <div class="col py-3 fw-bold" style="font-size: large;">
                        <span style="color: #504528;">선발안내</span>       
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">거리배점표</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">납부금안내</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">입사신청</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">합격안내</span>         
                    </div>
                </div>
                
                
                
            </div><!-- ㅋ-->
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">선발안내</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 모집안내 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 선발안내</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="row mt-3"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                        <li class="fw-bold" style="font-size: x-large; color: #282525;"> 입사자격</li>
                    </div>
                </div>
                <div class="row mt-3" style="border: 0.01em solid #303339;">
                    <div class="col border-opacity-10" style="border: 0.5em solid rgb(239, 239, 239);">
                        <div class="row mt-4">
                            <div class="col ps-5" style="font-size: 0.85em;">
                                목원대학교에 재학중인 신입생, 재학생(학부, 대학원생)으로 아래에 해당하지 않아야 한다.
                            </div>
                        </div>
                        <div class="row mt-3 lh-lg">
                            <div class="col ps-5" style="font-size: 0.85em;">
                                <span class="fw-bold" style="color: #8C7430;">1.</span> 학칙에 의해 징계처분을 받은 자
                            </div>
                        </div>
                        <div class="row mt-1 lh-lg">
                            <div class="col ps-5 lh-lg" style="font-size: 0.85em;">
                                <span class="fw-bold" style="color: #8C7430;">2.</span> 생활관 운영수칙 제25조 4항에 의거 직전학기 관내 부적응 퇴사자, 벌점 퇴사자 또는 무단외박 등 벌점이 20점 이상에 해당하는 항목을 받은 자
                            </div>
                        </div>
                        <div class="row mt-1 lh-lg">
                            <div class="col ps-5" style="font-size: 0.85em;">
                                <span class="fw-bold" style="color: #8C7430;">3.</span> 공동생활에 부적당하다고 인정되는 자
                            </div>
                        </div>
                        <div class="row mt-1 lh-lg mb-4">
                            <div class="col ps-5" style="font-size: 0.85em;">
                                <span class="fw-bold" style="color:#8C7430;">4.</span> 전염성 질환자 및 보균자
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col">
                        <li class="fw-bold" style="font-size: x-large; color: #282525;"> 신청 및 접수</li>
                    </div>
                </div>
                <div class="row mt-3" style="border: 0.01em solid #303339;">
                    <div class="col border-opacity-10" style="border: 0.5em solid rgb(239, 239, 239);">
                        <div class="row mt-4">
                            <div class="col ps-5 lh-lg" style="font-size: 0.85em;">
                                <span class="fw-bold" style="color: #8C7430;">1.</span> 재학생/복학생/대학원생의 입사신청공고는 매 학기말 홈페이지 게시판으로 하며, 접수는 방학 전 일정한 기간을 정하여 실시한다.
                                (복학생에 한하여 전체 재학생 선발 1주일 전까지 접수 가능)
                            </div>
                        </div>
                        <div class="row mt-1 lh-lg">
                            <div class="col ps-5" style="font-size: 0.85em;">
                                <span class="fw-bold" style="color: #8C7430;">2.</span> 신입생은 합격자 발표 시 별도로 공고한다.
                            </div>
                        </div>
                        <div class="row mt-1 lh-lg mb-4">
                            <div class="col ps-5" style="font-size: 0.85em;">
                                <span class="fw-bold" style="color: #8C7430;">3.</span> 접수는 인터넷 신청과 방문 및 우편접수에 한하며, 우편접수는 신청기간 내에 도착해야만 유효한다.
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-5 lh-lg">
                    <div class="col ps-2">
                        <li class="fw-bold" style="font-size: x-large; color: #282525;"> 선발기준 및 방법</li>
                    </div>
                </div>
                <div class="row mt-2 lh-lg"> 
                    <div class="col ps-3">
                        <li class="fw-bold" style="font-size: large; color: #282525;">&nbsp우선 배정</li>
                    </div>
                </div>
                <div class="row mt-1 lh-lg">
                    <div class="col ps-3" style="font-size: 0.85em;">
                        <span class="fw-bold" style="color: #8C7430;">1.</span> 학교 지정 장학생 및 현 자치임원, 외국인, ROTC
                    </div>
                </div>
                <div class="row mt-1 lh-lg">
                    <div class="col ps-3 lh-lg" style="font-size: 0.85em;">
                        <span class="fw-bold" style="color: #8C7430;">2.</span> 기초생활수급자, 독립 유공자(손,자녀), 국가 유공자 자녀, 장애인(3급 이상), 한 부모 가정. 단, 증빙서류를 기간 내에 제출한 자에 한하고 기초생활수급자 및 독립·국가 유공자의 경우 직전학기 학사 경고자는 선발에서 제외하며 신청자가 선발 인원보다 많을 경우 거리50+성적50을 적용하여 선발 인원만큼만 선발한다.
                    </div>
                </div>
                <div class="row mt-1 lh-lg mx-0" style="background-color: rgb(239, 239, 239);">
                    <div class="col py-3 ps-3" style="font-size: 0.85em;">
                        <i class="bi bi-exclamation-circle-fill" style="color: red;"></i> 생활관비 면제는 관련이 없고 학교 지정 4년 장학생만 생활관비 면제에 해당하며, 기초생활수급자, 독립유공자(손·자녀), 국가유공자(자녀)인 경우 평점 3.0(B) 이상만 우선선발이 가능하다.</li>
                    </div>
                </div>
                <div class="row mt-3 lh-lg"> 
                    <div class="col ps-3">
                        <li class="fw-bold" style="font-size: large; color: #282525;">&nbsp선발 기준</li>
                    </div>
                </div>
                <div class="row mt-1 lh-lg">
                    <div class="col ps-3" style="font-size: 0.85em;">
                        <span class="fw-bold" style="color: #8C7430;">1.</span> 선발 기준표에 의해 총점순으로 선발한다.
                    </div>
                </div>
                <div class="row mt-1 lh-lg">
                    <div class="col ps-3" style="font-size: 0.85em;">
                        <span class="fw-bold" style="color: #8C7430;">-</span>총점 100점 : 거리 50점 + 성적 50점
                    </div>
                </div>
                <div class="row mt-1 lh-lg">
                    <div class="col ps-3" style="font-size: 0.85em;">
                        <span class="fw-bold" style="color: #8C7430;">2.</span> 성적반영
                    </div>
                </div>
                <div class="row mt-1 lh-lg">
                    <div class="col ps-3" style="font-size: 0.85em;">
                        <span class="fw-bold" style="color: #8C7430;">-</span>신입생 : 거리 점수 (500점 만점을 100점 만점으로 환산함)
                    </div>
                </div>
                <div class="row mt-1 lh-lg">
                    <div class="col ps-3" style="font-size: 0.85em;">
                        <span class="fw-bold" style="color: #8C7430;">-</span>재학생 : 직전학기 성적 (복학생 : 휴학 직전학기 성적)
                    </div>
                </div>
                <div class="row mt-1 lh-lg">
                    <div class="col ps-3" style="font-size: 0.85em;">
                        <span class="fw-bold" style="color: #8C7430;">-</span>대학원생 : 대학원 직전학기 성적
                    </div>
                </div>
                <div class="row mt-1 lh-lg">
                    <div class="col ps-3" style="font-size: 0.85em;">
                        <span class="fw-bold" style="color: #8C7430;">3.</span> 거리반영
                    </div>
                </div>
                <div class="row mt-1 lh-lg">
                    <div class="col ps-3" style="font-size: 0.85em;">
                        <span class="fw-bold" style="color: #8C7430;">-</span>각 시군 주요 교통이용지(중심지)에서 본교까지의 거리 (거리 산출은 GPS와 네비게이션을 활용, 섬지역은 만점 반영)
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col">
                        <table class="table table-bordered align-middle text-center"  style="border-top: 0.1em solid #8C7430;">
                            <tr>
                                <td style="background-color: #F5F5F5; color: #8C7430;">거리</td>
                                <td style="background-color: #F5F5F5; color: #8C7430;">점수</td>
                                <td style="background-color: #F5F5F5; color: #8C7430;">거리</td>
                                <td style="background-color: #F5F5F5; color: #8C7430;">점수</td>
                                <td style="background-color: #F5F5F5; color: #8C7430;">거리</td>
                                <td style="background-color: #F5F5F5; color: #8C7430;">점수</td>
                                <td style="background-color: #F5F5F5; color: #8C7430;">거리</td>
                                <td style="background-color: #F5F5F5; color: #8C7430;">점수</td>
                            </tr>
                            <tr>
                                <td style="background-color: #F5F5F5;">18km - 20km</td>
                                <td>20점</td>
                                <td style="background-color: #F5F5F5;">91km - 100km</td>
                                <td>140점</td>
                                <td style="background-color: #F5F5F5;">171km - 180km</td>
                                <td>260점</td>
                                <td style="background-color: #F5F5F5;">251km - 260km</td>
                                <td>380점</td>
                            </tr>
                            <tr>
                                <td style="background-color: #F5F5F5;">21km - 30km</td>
                                <td>35점</td>
                                <td style="background-color: #F5F5F5;">101km - 110km</td>
                                <td>155점</td>
                                <td style="background-color: #F5F5F5;">181km - 190km</td>
                                <td>275점</td>
                                <td style="background-color: #F5F5F5;">261km - 270km</td>
                                <td>395점</td>
                            </tr>
                            <tr>
                                <td style="background-color: #F5F5F5;">31km - 40km</td>
                                <td>50점</td>
                                <td style="background-color: #F5F5F5;">111km - 120km</td>
                                <td>170점</td>
                                <td style="background-color: #F5F5F5;">191km - 200km</td>
                                <td>290점</td>
                                <td style="background-color: #F5F5F5;">271km - 280km</td>
                                <td>410점</td>
                            </tr>
                            <tr>
                                <td style="background-color: #F5F5F5;">41km - 50km</td>
                                <td>65점</td>
                                <td style="background-color: #F5F5F5;">121km - 130km</td>
                                <td>185점</td>
                                <td style="background-color: #F5F5F5;">201km - 210km</td>
                                <td>305점</td>
                                <td style="background-color: #F5F5F5;">281km - 290km</td>
                                <td>425점</td>
                            </tr>
                            <tr>
                                <td style="background-color: #F5F5F5;">51km - 60km</td>
                                <td>80점</td>
                                <td style="background-color: #F5F5F5;">131km - 140km</td>
                                <td>200점</td>
                                <td style="background-color: #F5F5F5;">211km - 220km</td>
                                <td>320점</td>
                                <td style="background-color: #F5F5F5;">291km - 300km</td>
                                <td>440점</td>
                            </tr>
                            <tr>
                                <td style="background-color: #F5F5F5;">61km - 70km</td>
                                <td>95점</td>
                                <td style="background-color: #F5F5F5;">141km - 150km</td>
                                <td>215점</td>
                                <td style="background-color: #F5F5F5;">221km - 230km</td>
                                <td>335점</td>
                                <td style="background-color: #F5F5F5;">301km - 310km</td>
                                <td>455점</td>
                            </tr>
                            <tr>
                                <td style="background-color: #F5F5F5;">71km - 80km</td>
                                <td>110점</td>
                                <td style="background-color: #F5F5F5;">151km - 160km</td>
                                <td>230점</td>
                                <td style="background-color: #F5F5F5;">231km - 240km</td>
                                <td>350점</td>
                                <td style="background-color: #F5F5F5;">311km - 320km</td>
                                <td>470점</td>
                            </tr>
                            <tr>
                                <td style="background-color: #F5F5F5;">81km - 90km</td>
                                <td>125점</td>
                                <td style="background-color: #F5F5F5;">161km - 170km</td>
                                <td>245점</td>
                                <td style="background-color: #F5F5F5;">241km - 250km</td>
                                <td>365점</td>
                                <td style="background-color: #F5F5F5;">321km - 340km</td>
                                <td>485점</td>
                            </tr>
                            <tr>
                                <td colspan="8">섬지역 500점</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div><!-- -->
            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>
        <div class="row my-5">
            <div class="col">

            </div>
        </div>
        <!-- footer 부분-->
        <div class="row" style="background-color: #181C23;">
            <div class="col-2 pt-4">
                
            </div>
            <div class="col-6 py-4">
                <div class="row">
                    <div class="col-2 px-0 fw-bold text-center" style="color: #FFC00B; font-size: medium;">
                        개인정보처리방침
                    </div>
                    <div class="col px-0 pt-2 fw-bold text-center" style="color: #BABBBD; font-size: 0.3em;">
                        <span class="bi bi-circle-fill"></span>
                    </div>
                    <div class="col-2 px-0 fw-bold text-center" style="color: #BABBBD;">
                        이메일무단수집거부
                    </div>
                    <div class="col px-0 pt-2 fw-bold text-center" style="color: #BABBBD; font-size: 0.3em;">
                        <span class="bi bi-circle-fill"></span>
                    </div>
                    <div class="col-2 px-0 fw-bold text-center" style="color: #BABBBD;">
                        대학정보공시
                    </div>
                    <div class="col pt-2 px-0 fw-bold text-center" style="color: #BABBBD; font-size: 0.3em;">
                        <span class="bi bi-circle-fill"></span>
                    </div>
                    <div class="col-2 px-0 fw-bold text-center" style="color: #BABBBD;">
                        오시는길
                    </div>
                </div>
                <div class="row ms-1 mt-4" style="border-bottom: 0.01em solid #303339;">
                    <div class="col"></div>
                </div>
                <div class="row mt-5">
                    <div class="col fw-bold" style="color: #BABBBD; font-size: medium;">
                        서울 강남구 테헤란로 7길 7(역삼동 에스코빌딩 6층)
                    </div>
                </div>
                <div class="row mt-1 mb-5">
                    <div class="col fw-bold" style="color: #505F65; font-size: medium;">
                        COPYRIGHT© 2023 MINGYU UNIVERSITY. ALL RIGHTS RESERVED.
                    </div>
                </div>
                
            </div>
            

        </div>

   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>