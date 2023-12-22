<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
	pageContext.setAttribute("br", "<br>");
	pageContext.setAttribute("cn", "\n");	
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <script type="text/javascript" src="../../resources/js/hn/sideBar.js"></script>
        <c:if test="${empty sessionStaffInfo }">
			<script>
				alert("로그인 후 이용해주세요");
				location.href='../../another/staff/loginPage';
			</script>
		</c:if>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <jsp:include page="../commonJsp/staffTopBanner.jsp"></jsp:include>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <jsp:include page="../commonJsp/staffSideBar.jsp"></jsp:include>
                                <div class="col bg-body-tertiary">
                                    <!--여기서 부터-->
                                    <div class="row mt-5 mb-5">
                                    	<div class="col">
                                    	<form id=frm action="./modifyTextProcess" method="post">
                                    		<div class="row ms-5 mb-5">
                                    			<div class="col-md-5 me-4 border bg-white text-dark">
                                    				<div class="row">
                                    					<div class="col">
                                    						<div class="row border-bottom">
                                    							<div class="col d-flex align-items-center fw-bold fs-5 py-3">글쓰기</div>
                                    						</div>
                                    						<div class="row">
                                    							<div class="col my-4">
                                    								<textarea id="inputId" name="title" class="form-control" style="height: 40px" maxlength="99" placeholder="제목을 입력해주세요.">${readText.staffboardDto.title }</textarea>
                                    							</div>
                                    						</div>
                                    						<div class="row mb-4">
                                    							<div class="col mb-4">
																	<textarea id="inputTxt" name="content" class="form-control" style="height: 400px;" maxlength="1300" placeholder="내용을 입력해주세요.">${readText.staffboardDto.content}${fn:replace(b.board_content,br,cn)}</textarea>
																</div>
                                    						</div>
                                    					</div>
                                    				</div>
                                    			</div>
                                    			<div class="col-md-4 ms-4">
                                    				<div class="row">
                                    					<div class="col border bg-white text-dark">
                                    						<div class="row mt-3 pb-3">
                                    							<div class="col text-center"><input class="avoidRedundancy btn btn-primary px-5 rounded-0" type="button" style="background-color: #005EAD; border-style: none" value="수정완료" onclick="formSubmit()"></div>
                                    							<div class="col text-center"><button class="btn btn-primary px-5 rounded-0" type="button" style="background-color: #005EAD; border-style: none" onclick="location.href='./readTextPage?staffboard_pk=${readText.staffboardDto.staffboard_pk }'">취 &nbsp;&nbsp;&nbsp;&nbsp; 소</button></div>
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
																		<div class="col" style="font-size: small;"> ● 다른 교직원 및 구성원들과의 상호 작용에서 존중과 예의를 지켜야 합니다. 공손한 언어와 타인의 의견에 대한 존중이 필요합니다.</div>
																	</div>
																	<div class="row mt-2">
																		<div class="col" style="font-size: small;"> ● 게시물이나 댓글은 주제와 관련이 있어야 하며, 교육과 관련된 정보, 소식, 또는 유익한 자료를 나누는 데 중점을 두어야 합니다.</div>
																	</div>
																	<div class="row mt-2">
																		<div class="col" style="font-size: small;"> ● 다른 교직원이나 구성원을 비방하거나 모욕하는 행위는 금지되며, 존중과 협력을 기반으로 하는 환경을 유지해야 합니다.</div>
																	</div>
																	<div class="row mt-2">
																		<div class="col" style="font-size: small;"> ● 학교나 기관 내부 정보, 교육과 관련된 기밀 사항은 공개되어서는 안 됩니다. 게시물에서는 합법적이고 공개 가능한 정보에만 초점을 맞춰야 합니다.</div>
																	</div>
																	<div class="row mt-2 mb-2">
																		<div class="col" style="font-size: small;"> ● 교직원 게시판에서는 상업 광고, 스팸, 또는 상업적인 목적을 가진 게시물을 허용하지 않습니다. 게시물은 교육과 관련이 있어야 하며, 광고적 목적을 가진 내용은 허용되지 않습니다.
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
                                    			</div>
                                    		</div>
                                    		<input name="staffboard_pk" type="hidden" value="${readText.staffboardDto.staffboard_pk }">
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