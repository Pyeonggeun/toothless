<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>
        <style>
        </style>
		<!--로그인 하지않으면 직원용 게시판 이용 불가-->
        <c:if test="${empty sessionStaffInfo }">
			<script>
				alert("로그인 후 이용해주세요");
				location.href='../../another/staff/loginPage';
			</script>
		</c:if>
		<!--제목있어야 글작성 가능-->
		<script>
			function formSubmit(){
				const frm = document.getElementById("frm");

				const inputId = document.getElementById("inputId");

				if(inputId.value == ''){
					alert("제목을 입력하세요.");
					inputId.focus();
					return ;
				}
				if(inputTxt.value == ''){
					alert("내용을 입력하세요.");
					inputTxt.focus();
					return ;
				}
				frm.submit();
				<%-- Submit 클릭 중복 방지--%>
				document.querySelector(".avoidRedundancy").setAttribute("disabled", "true");
			}
		</script>
		<script src="../../resources/js/hn/topBanner.js"></script>
    </head>
    <body>
    	<jsp:include page="../commonJsp/studentTopBanner.jsp"></jsp:include>
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <jsp:include page="../commonJsp/staffTopBanner.jsp"></jsp:include>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <jsp:include page="../commonJsp/staffSideBar.jsp"></jsp:include>
                                <div class="col  bg-body-tertiary">
                                    <!--여기서 부터-->
                                    <div class="row mt-5 mb-5">
                                    	<div class="col">
                                    	<form id="frm" action="./writeTextProcess" method="post" enctype="multipart/form-data">
                                    		<div class="row ms-5 mb-5">
                                    			<div class="col-md-5 me-4 border bg-white text-dark">
                                    				<div class="row">
                                    					<div class="col">
                                    						<div class="row border-bottom">
                                    							<div class="col d-flex align-items-center fw-bold fs-5 py-3">글쓰기</div>
                                    						</div>
                                    						<div class="row">
                                    							<div class="col my-4">
                                    								<textarea id="inputId" name="title" class="form-control" style="height: 40px" maxlength="99" placeholder="제목을 입력해주세요."></textarea>
                                    							</div>
                                    						</div>
                                    						<div class="row mb-4">
                                    							<div class="col mb-2">
																	<textarea id="inputTxt" name="content" class="form-control" style="height: 400px;" maxlength="1300" placeholder="내용을 입력해주세요."></textarea>
																</div>
                                    						</div>
                                    						<div class="row">
                                    							<div class="col mb-4">
                                    								<input name="imgFiles" type="file" accept="image/*" multiple>
                                    							</div>
                                    						</div>
                                    					</div>
                                    				</div>
                                    			</div>
                                    			<div class="col-md-4 ms-4">
                                    				<div class="row">
                                    					<div class="col border bg-white text-dark">
                                    						<div class="row mt-3 pb-3">
                                    							<div class="col text-center"><input class="avoidRedundancy btn btn-primary px-5 rounded-0" type="button" onclick="formSubmit()" value="작성완료"></div>
                                    							<div class="col text-center"><button class="btn btn-primary px-5 rounded-0" type="button" onclick="location.href='./staffboardPage'">취 &nbsp;&nbsp;&nbsp;&nbsp; 소</button></div>
                                    						</div>
                                    					</div>
                                    				</div>
													<div class="row border mt-3 bg-white text-dark">
														<div class="col">
															<div class="row py-1 border-bottom">
																<div class="col fw-bold fs-6">게시판 주의사항</div>
															</div>
															<div class="row">
																<div class="col">
																	<div class="row mt-2">
																		<div class="col" style="font-size: small;"> ● 지나치게 선정적, 폭력적이거나 불법적인 내용의 게시물은 바로 삭제됩니다.</div>
																	</div>
																	<div class="row mt-2">
																		<div class="col" style="font-size: small;"> ● 도배 방지를 위해 유사한 내용의 게시글을 72시간 내 업로드할 시 게시글 삭제 및 이용제한이 이루어질 수 있습니다.</div>
																	</div>
																	<div class="row mt-2">
																		<div class="col" style="font-size: small;"> ● 작성된 게시물이 저작권을 침해하는 경우 게시자에게 책임이 있습니다.</div>
																	</div>
																	<div class="row mt-2">
																		<div class="col" style="font-size: small;"> ● 그 외 게시판 이용에 관련된 사항은 커뮤니티 이용 규칙을 따릅니다.</div>
																	</div>
																	<div class="row mt-2 mb-2">
																		<div class="col" style="font-size: small;"> ● siu~~~~~~~~~~~</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
                                    			</div>
                                    		</div>
                                    	</form>
                                    	</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
