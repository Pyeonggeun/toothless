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
            <jsp:include page="../commons/student/leftButtons4.jsp"></jsp:include>
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row my-3">
                            <div class="col pb-2">
                                <span class="fw-bold" style="font-size: xx-large;">고장수리요청</span>
                            </div>
                            <div class="col text-end pt-3">
                                <span class="bi bi-house-door-fill" style="color: #999897;"></span><span style="color: #7A8082;"> > 기숙사 커뮤니티 </span> <span style="color: #999897;"> > </span><span class="fw-bold" style="color: #767575;"> 고장수리요청</span>
                            </div>
                            <span class="border-bottom  border-dark border-4 mt-2"></span>
                        </div>
                       
                    </div>
                </div>
                <form action="./requestRepairWriteProcess" method="post" enctype="multipart/form-data">
                <div class="row my-2">
                	<div class="col">
                	<input type="hidden" value="${dormStudentDto.dorm_student_pk}" name="dorm_student_pk">
                		<div class="mb-3">
						  	<label for="exampleFormControlInput1" class="form-label fw-bold fs-5">제목</label>
						  	<input type="text" class="form-control" name="title"  placeholder="제목을 입력하세요.">
						</div>
						<label for="exampleFormControlInput1" class="form-label fw-bold fs-5 mt-3">작성자</label>
						<input class="form-control" type="text" value="${studentInfoDto.name}" aria-label="readonly input example" readonly>
						<div class="my-3">
						 	<label for="exampleFormControlTextarea1" class="form-label fw-bold fs-5 mt-3">내용</label>
						  	<textarea class="form-control" name="content" rows="10"  placeholder="내용을 입력하세요."></textarea>
						</div>
						<div class="mb-3">
						  <label for="formFileMultiple" class="form-label fw-bold fs-5 mt-3">파손시설 사진</label>
						  <input class="form-control" type="file" id="formFileMultiple" name="imgs"accept="image/*">
						</div>
						<div class="row">
							<div class="col d-flex justify-content-end my-2">
                			<button type="submit" class="btn rounded-0 px-4" style="background-color:#504528; color:#FFFFFF;">접수완료</button>
                		</div>
						</div>
		            </div>
                	
                </div>
                </form>
               
               
           
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

<!-- 하단 footer -->
<jsp:include page="../commons/student/footer.jsp"></jsp:include>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>    
</body>
</html>