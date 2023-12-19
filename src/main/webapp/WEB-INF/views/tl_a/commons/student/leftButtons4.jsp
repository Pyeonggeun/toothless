<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<style>
	/* 마우스 오버시 스타일*/
	.colorA{
	
			
			font-size: large;
			font-weight: 700;
			transition: font-weight: 1s ease-in;
			cursor: pointer;
			
	}
	/* 마우스 아웃시 스타일*/
	.colorB{
	
			
			font-size: large;
			transition: font-weight: 1s ease-out;
			font-weight: normal;
			
	
	}
	

</style>

<script>
	// 마우스 오버시 바뀌는 이벤트
	function changeColor(element){
		
		// rowbox랑 colbox 들고와서 스타일 변경..
		// 이거 마우스오버 하는 순간임..
		const rowbox = document.querySelector("#rowbox" + element);
		const colbox = document.querySelector("#colbox" + element);
		const navimenu = document.querySelector("#colbox" + element +" .navimenu"+ element);
		// 제거하고 다시추가
		colbox.classList.remove("colorB");
		colbox.classList.add("colorA");
		colbox.removeAttribute("style");
		rowbox.style.borderBottom = "0.2em solid #504528";
		navimenu.style.color = "#504528";
		
		// 여기서 바꾸는건 아예 컬러를 바꾸는거고..
		// 그냥 hover 전에는 마우스 올리고 나서.. 기본모양상태를 말하는듯..?
		// hover는 올릴시에만
		
		
	}
	//마우스커서 바깥으로 이동시 바뀌는 이벤트 (다시 속성 돌려놓으면 될듯 걍 changecolor에 있는거 다지워버리면됨)
	function restoreColor(element){
		const rowbox = document.querySelector("#rowbox" + element);
		const colbox = document.querySelector("#colbox" + element);
		const navimenu = document.querySelector("#colbox" + element +" .navimenu"+ element);
		colbox.classList.remove("colorA");
		colbox.classList.add("colorB");
		rowbox.style.borderBottom = "0.01em solid #161313";
		navimenu.style.color = "black";
	}

</script>

<div class="col-3 me-3"><!-- 여기부분은 목차부분 -->
   <div class="row rounded-0 rounded-5 rounded-top-0 rounded-start-0 opacity-90" style="background-color: #504528;">
       <div class="col py-4 text-center">
           <span class="fw-bold" style="color: white; font-size: x-large;">기숙사 커뮤니티</span>
       </div>
   </div>
   <div id="rowbox1" class="row" style="border-bottom: 0.01em solid #161313;">
       <div id="colbox1" class="col py-3" style="font-size: large;">
       <a href="./dm_dormNoticePage" style="text-decoration: none;" onmouseover="changeColor(1)" onmouseout="restoreColor(1)">
           <span class="navimenu1" style="color: black;">공지사항</span></a>
       </div>
   </div>
   <div id="rowbox2"  class="row" style="border-bottom: 0.01em solid #161313;">
       <div id="colbox2" class="col py-3" style="font-size: large;">
       <a href="./mainGaesipan" style="text-decoration: none;" onmouseover="changeColor(2)" onmouseout="restoreColor(2)" >
           <span class="navimenu2" style="color: black;">자유게시판</span></a>
       </div>
   </div>
   <div id="rowbox3"  class="row" style="border-bottom: 0.01em solid #161313;">
       <div id="colbox3" class="col py-3" style="font-size: large;">
       <a href="./jw_exitApplyPage" style="text-decoration: none;" onmouseover="changeColor(3)" onmouseout="restoreColor(3)">
           <span class="navimenu3" style="color: black;">외박 및 외출신청</span></a>
       </div>
   </div>
   <div id="rowbox4"  class="row" style="border-bottom: 0.01em solid #161313;">
       <div id="colbox4" class="col py-3" style="font-size: large;">
       <a href="./jw_checkDormStudentPointPage" style="text-decoration: none;" onmouseover="changeColor(4)" onmouseout="restoreColor(4)">
           <span class="navimenu4" style="color: black;">상벌점 확인</span></a>
       </div>
   </div>
   <div id="rowbox5"  class="row" style="border-bottom: 0.01em solid #161313;">
       <div id="colbox5" class="col py-3" style="font-size: large;">
       <a href="./sj_requestRepairPage" style="text-decoration: none;" onmouseover="changeColor(5)" onmouseout="restoreColor(5)">
           <span class="navimenu5" style="color: black;">고장수리요청</span></a>
       </div>
   </div>
   <div id="rowbox6"  class="row" style="border-bottom: 0.01em solid #161313;">
       <div id="colbox6" class="col py-3" style="font-size: large;">
       <a href="./dm_FAQ" style="text-decoration: none;" onmouseover="changeColor(6)" onmouseout="restoreColor(6)">
           <span class="navimenu7" style="color: black;">FAQ</span></a>
        </div>
    </div>
</div>