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
                        <span class="fw-bold" style="color: white; font-size: x-large;">기숙사 커뮤니티</span>
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">공지사항</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">자유게시판</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">외출 외박 신청</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">상벌점 확인</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">고장수리요청</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">일지 작성</span>         
                    </div>
                </div>
                <div class="row" style="border-bottom: 0.01em solid #161313;">
                    <div class="col py-3" style="font-size: large;">
                        <span style="color: black;">FAQ</span>         
                    </div>
                </div>
            </div><!-- ㅋ-->
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">FAQ</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙사 커뮤니티 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> FAQ</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="row"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <div class="accordion" id="accordionExample">
                                    <div class="accordion-item">
                                      <h2 class="accordion-header">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                            <i class="bi bi-exclamation-lg text-danger" style="font-size: 1.7em;"></i><strong>입사 지원 자격조건은 어떻게 되나요?</strong>
                                        </button>
                                      </h2>
                                      <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            목원대학교에 재학중인 신입생, 재학생(학부, 대학원생)으로 아래에 해당하지 않으면 가능합니다.<br><br>
                                            ① 학칙에 의해 징계처분을 받은 자<br>
                                            <br>
                                            ② 생활관 운영수칙 제25조 4항에 의거 직전학기 관내 부적응 퇴사자, 벌점 퇴사자 또는 무단외박 등<br>
                                            벌점이 10점 이상에 해당하는 항목을 받은자<br>
                                            <br>
                                            ③ 공동생활에 부적당하다고 인정되는 자<br>
                                            <br>
                                            ④ 전염성 질환자 및 보균자<br>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="accordion-item">
                                      <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                            <i class="bi bi-exclamation-lg text-danger" style="font-size: 1.7em;"></i><strong>복학생입니다. 입사 신청은 어떻게 해야 하나요?</strong>
                                        </button>
                                      </h2>
                                      <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            아직 복학 신청을 하지 않으셨더라도 생활관 신청기간에 종합정보시스템 사이트에 접속하셔서 생활관 신청을 해주시면 됩니다. 이후 신청 희망 시 생활관 사무실 전화 문의하시기 바랍니다. 자세한 사항은 ‘입사안내’ 및 ‘생활관 커뮤니티 – 공지사항’을 참고하시기 바랍니다.
                                        </div>
                                      </div>
                                    </div>
                                    <div class="accordion-item">
                                      <h2 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                            <i class="bi bi-exclamation-lg text-danger" style="font-size: 1.7em;"></i>학기중에 생활관에 들어가고 싶은데요?
                                        </button>
                                      </h2>
                                      <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                        <div class="accordion-body">
                                            학기 중 생활관에 입사를 원하시는 경우에는
                                            사무실로 전화 문의하시거나 직접 사무실 방문하셔서 직원과 상담하신 후 결원자가 있는 경우 입사하실 수 있습니다. 건물별 공석에 한하여 신청 가능하며 입사(희망)일 기준으로 주차별 계산한 입사비를 납부하여야 합니다.
                                        </div>
                                      </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header">
                                          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                              <i class="bi bi-exclamation-lg text-danger" style="font-size: 1.7em;"></i>납부된 입사비의 입금 확인은 어떻게 하나요?
                                          </button>
                                        </h2>
                                        <div id="collapseFour" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                          <div class="accordion-body">
                                            입금 확인은 전화나 생활관 홈피 방학중질답게시판을 활용하시어 문의하시면 됩니다. 단, 입금하실 때 반드시 이름, 학과, 학년을 꼭 기재하셔야 확인이 가능합니다. 또한 인터넷뱅킹이나 텔레뱅킹을 이용하시어 보호자의 이름이나 타인명으로 입금 하였을 시는 반드시 사무실로 연락을 주어 확인받아야 합니다. 만일, 확인치 않아 확인이 안되는 경우 입사시 발생되는 문제는 입금자 본인의 책임이오니 숙지하시기 바랍니다.
                                          </div>
                                        </div>
                                      </div>
                                      <div class="accordion-item">
                                        <h2 class="accordion-header">
                                          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                              <i class="bi bi-exclamation-lg text-danger" style="font-size: 1.7em;"></i>퇴사 절차는 어떻게 되나요?
                                          </button>
                                        </h2>
                                        <div id="collapseFive" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                          <div class="accordion-body">
                                            퇴사는 아래와 같이 학기중 퇴사와 학기말 퇴사의 경우가 있습니다. · 학기말 퇴사시에는 사무실에서 정한 퇴사기간동안 개인에게 지급된 개인비품, 방열쇠등을 각 층장 (혹은 사무실)에게 반납하고 층장 또는 조교의 확인받고 비품확인 후 퇴사하시면 됩니다.· 학기중 퇴사에 있어서는 퇴사를 원하는 사생이 (징계에 의한 경우도 포함) 퇴사 신고서를 생활관 사무실에 제출하고, 또한 퇴사전에 개인에게 지급된 비품들을 반납하고 층장 또는 조교님의 비품확인을 받아 사감의 퇴사 허락을 받아야만 퇴사 가능합니다. (참조로 생활관 입사비는 환불 불가능 합니다)
                                          </div>
                                        </div>
                                      </div>
                                      <div class="accordion-item">
                                        <h2 class="accordion-header">
                                          <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                              <i class="bi bi-exclamation-lg text-danger" style="font-size: 1.7em;"></i>학기도중에 퇴사할 경우 기숙사비 환불은 어떻게 되나요?
                                          </button>
                                        </h2>
                                        <div id="collapseSix" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                                          <div class="accordion-body">
                                            납부한 입사비의 환불은 생활관 운영수칙 제19조에 의거하여 자퇴(재적), 휴학, 질병에 한하여 관련서류 제출 시 위약금 공제 없이 잔여 주차를 산정하여 환불되며, 입사비 납부 후 개인사정 및 부적응으로 인한 자진퇴사자와 징계, 벌점 등으로 인해 중도퇴사 조치된 관생에 대한 환불은 30%의 위약금을 공제하고 환불합니다. 또한 방학 중 잔류자의 입사비는 학기 퇴사기준과 동일 원칙으로 적용되며, 잔류기간에 따라 환불가능 기간의 차이가 있습니다.
                                          </div>
                                        </div>
                                      </div>
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
    </div>    
<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>
   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>