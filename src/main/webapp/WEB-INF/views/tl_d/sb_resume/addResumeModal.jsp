<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row">
	<div class="col fs-5 fw-bold mt-5">이력서 등록</div>
</div>
<div class="row border-bottom border-dark"></div>

<div class="row border border-top">
	<div class="col">
		<div class="row  border-bottom">
			<div class="col p-3 ms-2">
				<div class="row border-bottom border-gray">
					<div class="col fs-3">인적사항</div>
				</div>
			</div>
			<div class="row">
				<div class="col">이름 : ${sessionStudentInfo.name }</div>
			<div class="col">생일 : <fmt:formatDate value="${sessionStudentInfo.birth}" pattern="yy.MM.dd"/></div>
			<div class="col">성별 : ${sessionStudentInfo.gender }</div>
			<div class="col">이메일 : ${sessionStudentInfo.email }</div>
		</div>
		<div class="row">
			<div class="col">전화번호 : ${sessionStudentInfo.phone }</div>
			<div class="col">주소 : ${sessionStudentInfo.address }</div>
			</div>
		</div>
	</div>	
</div>
<form action="./resumeRegisterProcess" method="post">
	<input name="student_pk" type="hidden" value="${sessionStudentInfo.student_pk }">
	
<div class="row mt-3 border border-top">
	<div class="col">
		<div class="row  border-bottom">
			<div class="col p-3 ms-2">
				<div class="row border-bottom border-gray">
					<div class="col fs-3">메인 이력서 선택</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<input name="main_resume" type="radio" value="Y"> 메인이력서
						<input name="main_resume" type="radio" value="N"> 추가이력서 <br>
						
						<input name="is_public" type="hidden" value="N"><br>
					</div>
				</div>
			</div>
			
			
		</div>
	</div>
</div>				


<div class="row mt-3 border border-top">
	<div class="col">
		<div class="row  border-bottom">
			<div class="col p-3 ms-2">
				<div class="row border-bottom border-gray">
					<div class="col fs-3">이력서 제목</div>
				</div>
				<div class="row mt-2">
					<div class="col">
					<textarea name="resume_title" rows="2" cols="80"></textarea>
					</div>
				</div>
			</div>
			
			
		</div>
	</div>
</div>				

<div class="row mt-3 border border-top">
	<div class="col">
		<div class="row  border-bottom">
			<div class="col p-3 ms-2">
				<div class="row border-bottom border-gray">
					<div class="col fs-3">자소서</div>
				</div>
				<div class="row mt-2">
					<div class="col">
					<textarea name="cover_letter" rows="30" cols="80"></textarea>
					</div>
				</div>
			</div>
			
			
		</div>
	</div>
</div>				
</form>
