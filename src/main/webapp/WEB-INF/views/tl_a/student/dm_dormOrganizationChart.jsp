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
             <jsp:include page="../commons/student/leftButtons1.jsp"></jsp:include>
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">조직 및 전화번호</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙사 소개 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 조직 및 전화번호</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <div class="row"><!--여기가 안에 들어갈 내용들-->
                    <div class="col">
                        <div class="row mt-3">
                            <div class="col-5">
                                
                            </div>
                            <div class="col py-5 rounded-pill text-center" style="background-color: #8C7430; color: white;">
                                <span class="fw-bold fs-3">생활관장</span><br>
                                <span class="">042-829-7411</span>
                            </div>
                            <div class="col-5">
                                
                            </div>
                        </div>
                        <div class="row mt-5">
                            <div class="col-4">
                                
                            </div>
                            <div class="col fw-bold py-4 rounded-5 text-center" style="background-color: #F5F5F5; border: 0.1em solid #8C7430;">
                                사감(관리자)<br>
                                042-829-7410
                            </div>
                            <div class="col-4">
                                
                            </div>
                        </div>
                        <div class="row mt-5 column-gap-3">
                            <div class="col py-4 rounded-end-5" style="border: 0.05em solid #8C7430;">
                                <div class="row mx-0" style="border-bottom: 0.1em solid #8C7430;">
                                    <div class="col fw-bold py-3 text-center fs-4" style="color: #8C7430;">
                                        선발 및 상·벌점 담당
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <li>042-829-7402</li>
                                    </div>
                                </div>
                            </div>
                            <div class="col py-4 rounded-end-5" style="border: 0.05em solid #8C7430;">
                                <div class="row mx-0" style="border-bottom: 0.1em solid #8C7430;">
                                    <div class="col fw-bold py-3 text-center fs-4" style="color: #8C7430;">
                                        예산·회계 담당
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <li>042-829-7406</li>
                                    </div>
                                </div>
                            </div>
                            <div class="col py-4 rounded-end-5" style="border: 0.05em solid #8C7430;">
                                <div class="row mx-0" style="border-bottom: 0.1em solid #8C7430;">
                                    <div class="col fw-bold py-3 text-center fs-4" style="color: #8C7430;">
                                        자치 담당
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <li>042-829-7405</li>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-5 column-gap-3">
                            <div class="col py-4 rounded-end-5" style="border: 0.05em solid #8C7430;">
                                <div class="row mx-0" style="border-bottom: 0.1em solid #8C7430;">
                                    <div class="col fw-bold py-3 text-center fs-4" style="color: #8C7430;">
                                        시설 담당
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <li>042-829-7402</li>
                                    </div>
                                </div>
                            </div>
                            <div class="col py-4 rounded-end-5" style="border: 0.05em solid #8C7430;">
                                <div class="row mx-0" style="border-bottom: 0.1em solid #8C7430;">
                                    <div class="col fw-bold py-3 text-center fs-4" style="color: #8C7430;">
                                        외국인
                                    </div>
                                </div>
                                <div class="row mt-4">
                                    <div class="col">
                                        <li>042-829-7406</li>
                                    </div>
                                </div>
                            </div>
                            <div class="col py-4 rounded-end-5">
                                
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