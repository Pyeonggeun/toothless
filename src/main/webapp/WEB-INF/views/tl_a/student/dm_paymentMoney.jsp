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
        .gold{
            color: #8C7430;
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
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">선발안내</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">거리배점표</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.2em solid #504528;">
                    <div class="col py-3 fw-bold" style="font-size: large;">
                        <span style="color: #504528;">납부금안내</span>       
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
                                <span class="fw-bold" style="font-size: xx-large;">납부금안내</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 모집안내 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 납부금안내</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="row"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                        
                        <div class="row mt-3">
                            <div class="col">
                                <li class="fw-bold" style="font-size: x-large; color: #282525;">입사비</li>
                            </div>
                        </div>
                        <div class="row mt-3 lh-lg">
                            <div class="col ps-5" style="font-size: 0.85em;">
                                <span class="fw-bold" style="color: #8C7430;">1.</span> 입사비에는 관리비만 포함한다.
                            </div>
                        </div>
                        <div class="row mt-1 lh-lg">
                            <div class="col ps-5" style="font-size: 0.85em;">
                                <span class="fw-bold" style="color: #8C7430;">2.</span> 입사비는 매학기별 납부하며, 방학중 입사비는 별도로 고지 후 납부한다.
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-end">
                                (2023-2학기 기준)
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <table class="table table-bordered align-middle text-center" style="border-top: 0.05em solid #8C7430;">
                                    <tr>
                                        <td style="color: #8C7430;">학사</td>
                                        <td style="color: #8C7430;">호실</td>
                                        <td style="color: #8C7430;">입사비</td>
                                        <td style="color: #8C7430;">비고</td>
                                    </tr>
                                    <tr>
                                        <td>mk학사(A동)</td>
                                        <td>4인1실</td>
                                        <td>544,000</td>
                                        <td rowspan="3">한 학기 기준</td>
                                    </tr>
                                    <tr>
                                        <td rowspan="2">mk학사(B동)</td>
                                        <td>2인1실</td>
                                        <td>850,000</td>
                                    </tr>
                                    <tr>
                                        <td>2인1실(럭셔리)</td>
                                        <td>1,700,000</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <li class="fw-bold" style="font-size: x-large; color: #282525;">입사비 환불</li>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col lh-lg">
                                생활관 운영 수칙 제 19조 생활관 입사비 환불은 공식입사일 이전 환불신청자에 한하여 100% 환급 가능하나, 공식입사일 이후 학적변동(자퇴, 휴학, 제적) 또는 질병(코로나19 확진 포함)에 한하여 관련서류 제출 시 위약금 공제 없이 잔여 주차를 산정하여 환불되며, 입사비 납부 후 개인사정 및 부적응으로 인한 자진퇴사자와 징계, 벌점 등으로 인해 중도퇴사 조치된 관생에 대한 환불은 30%의 위약금을 공제하고 환불하는 것을 원칙으로 함. 또한 방학 중 잔류자의 입사비는 학기 퇴사기준과 동일 원칙으로 적용되며, 잔류기간에 따라 환불가능 기간의 차이가 있음.
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">
                                <li class="fw-bold" style="font-size: x-large; color: #282525;">중도입사</li>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col lh-lg">
                                학기 중 결원 발생 시 본인 희망에 의해 중도 입사하는 경우 희망입사일 기준 잔여주차로 산정하여 입사비를 납부하여야 함.
                                단, 생활관에서 추가모집이 필요하다고 판단하여 공고를 통해 입사한 관생의 입사비는 별도 공지함.
                            </div>
                        </div>
                    </div>
                </div><!-- 여기까지-->
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