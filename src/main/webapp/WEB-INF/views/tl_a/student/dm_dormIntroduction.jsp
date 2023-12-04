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
            <img src="../../resources/img/dormitory/studentMainLogo.png">
        </div>
    </div>


    <div class="container mt-3">
        <div class="row">
            <div class="col-3 me-3"><!-- 여기부분은 목차부분 -->
                <div class="row rounded-1 opacity-90" style="background-color: #504528;">
                    <div class="col py-4 text-center">
                        <span class="fw-bold" style="color: white; font-size: x-large;">기숙사 소개</span>
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.2em solid #504528;">
                    <div class="col py-3 fw-bold" style="font-size: large;">
                        <span style="color: #504528;">인사말</span>       
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">조직 및 전화번호</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">찾아오시는 길</span>         
                    </div>
                </div>
            </div><!-- ㅋ-->
            <div class="col d">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">인사말</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙사 소개 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 인사말</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="" style="background-color: #F5F5F5;">
                <div class="row mt-5"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                        <div class="row mt-5">
                            <div class="col ps-4" style="font-size: x-large; color: #8C7430;">
                                안녕하십니까?
                            </div>
                        </div>
                        <div class="row">
                            <div class="col ps-4" style="font-size: x-large; color: #8C7430;">
                                우리 기숙사의 한 식구가 되심을 진심으로 환영합니다.
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col">

                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col ps-4" style="font-size: medium;">
                                기숙사은 우리 대학 인재 양성의 심장으로서 그동안 큰 사랑을 받으면서 발전해 왔습니다. <span class="fw-bold"> 약 1,610명의 MK 가족이 기숙</span>하는 곳으로 중부권 <span class="fw-bold" style="color: #8C7430;">최고의 최신식 건물과 최첨단 휴게실 복지시설</span>(독서실, 헬스기구 등) 디지털 인터넷 시스템을 구비하여 원스톱 시스템으로 제2의 가정처럼 생활할 수 있도록 완비되어 있습니다.
                            </div>
                        </div>
                        <div class="row mt-4">
                            <div class="col">

                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col ps-4" style="font-size: medium;">
                                또 " ㅋㅋ " 는 건학이념을 기초로 미래의 주역으로 성장하게 될 관생들이 다양한 지식 축척과 인격도야는 물론 자치적으로 이루어지는 각종 문화행사를 통해 아름다운 <span class="fw-bold" style="color: #8C7430;">추억과 미래의 비전</span>을 세울 수 있는 좋은 기회의 공간입니다.
                            </div>
                        </div>
                    </div>
                    <div class="col-6 d-grid">
                        <div class="row">
                            <div class="col">
                                <img class="img-fluid" src="/img/img4.jpg">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">

                            </div>
                        </div>
                        
                    </div>
                </div><!-- 여기까지-->
                <div class="row mt-3">
                    <div class="col ps-4 pe-5" style="font-size: medium;">
                        이곳에서 생활하는 동안 <span class="fw-bold" style="color: #8C7430;">좋은 인간관계를 형성</span>하심은 물론 분명한 비전과 목표를 가지고 매사에 최선을 다하고 열심히 학업에 매진하시어 사회에 나가 떳떳하고 자신감 넘치는 사회의 구성원으로 자리매김 하시길 바랍니다.
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col ps-4 pe-5" style="font-size: medium;">
                        우리 기숙사를 섬기는 모든 이들은 학생들이 가정에서와 같은 <span class="fw-bold" style="color: #8C7430;">따뜻한 정</span>을 느낄 수 있도록 최선을 다하며, 특히 성장한 생활환경이 서로 다른 학생들이 공동생활을 통하여 서로 <span class="fw-bold">존중하며, 건전하고 보람된 대학생활을 할 수 있도록 지원</span>을 아끼지 않겠습니다.
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col ps-4 pe-5" style="font-size: medium;">
                        다시 한 번 우리 기숙사 입사를 진심으로 축하드리며 <span class="fw-bold">관생 여러분들의 앞날과 학부모님의 가정에 하나님의 축복이 늘 함께 하시기를 소망합니다.</span>
                    </div>
                </div>
             </div>    
            </div>
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