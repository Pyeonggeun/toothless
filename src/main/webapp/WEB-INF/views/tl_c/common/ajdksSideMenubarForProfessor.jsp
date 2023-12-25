<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 좌측메뉴바 -->
<div class="col-2 text-white px-0 professorleftmenubar" style="background-color: #0C2145; box-shadow: 2px 2px 2px gray; z-index: 2;">

	<!-- 접속자 정보 묶음 -->
	<div class="row text-center my-3">
		<div class="col">
			<!-- 접속자 사진 -->
			<div class="row">
				<div class="col">
					<i class="bi bi-person-circle" style="font-size: 5em;"></i>
				</div>	
			</div>
			<!-- 접속자 정보 -->
			<div class="row mt-2">
				<div class="col" style="font-size: 1em;">
					${sessionProfessorInfo.professor_id }&nbsp;간호학과&nbsp;${sessionProfessorInfo.name }
				</div>
			</div>
		</div>	
	</div>

	<!-- 검색창 -->
	<div class="row px-4 mt-4 mb-3">
		<div class="col border-bottom border-white py-1">
			<div class="row">
				<div class="col" style="font-size: 0.9em;">검색창</div>
				<div class="col text-end"><i class="bi bi-search" style="font-size: 0.9em; cursor: pointer;"></i></div>
			</div>
		</div>
	</div>
	
	<!-- 메뉴리스트 -->
	<div class="row">
		<div class="col">
			<input type="checkbox" id="title3"/>
			<label class="pt-3 pb-2 ps-3" for="title3"><i class="bi bi-postcard"></i>&nbsp;현장실습과정 관리</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='../../eunbi/professor/viewChargedInternshipCoursePage'">&gt;&nbsp;나의 과정 조회</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='../../taeho/student/ajdksServicePreparingPage'">&gt;&nbsp;나의 실습생 조회</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title4"/>
			<label class="pt-3 pb-2 ps-3" for="title4"><i class="bi bi-stickies"></i>&nbsp;성적 관리</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='../../eunbi/professor/studentGradeInquiryPage'">&gt;&nbsp;학생성적 조회</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='../../taeho/student/ajdksServicePreparingPage'">&gt;&nbsp;학생만족도조사결과 확인</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title5"/>
			<label class="pt-3 pb-2 ps-3" for="title5"><i class="bi bi-send"></i>&nbsp;쪽지함</label>			
			<div class="content text-white-50">
				<div class="row pt-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='../../taeho/student/ajdksServicePreparingPage'">&gt;&nbsp;받은쪽지함</span>
					</div>
				</div>
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='../../taeho/student/ajdksServicePreparingPage'">&gt;&nbsp;보낸쪽지함</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<input type="checkbox" id="title6"/>
			<label class="pt-3 pb-2 ps-3" for="title6"><i class="bi bi-newspaper"></i>&nbsp;공지사항</label>			
			<div class="content text-white-50">
				<div class="row py-2 ps-2">
					<div class="col ps-4">
						<span style="font-size: 0.9em; cursor: pointer;" onclick="location.href='../../woojae/professor/ajdksProfessorNoticePage'">&gt;&nbsp;공지사항</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div><!-- 좌측메뉴바 출구 -->
