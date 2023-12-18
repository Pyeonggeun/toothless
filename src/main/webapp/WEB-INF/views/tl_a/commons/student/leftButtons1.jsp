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
            <span class="fw-bold" style="color: white; font-size: x-large;">기숙사 소개</span>
        </div>
    </div>
    <div id="rowbox1" class="row" style="border-bottom: 0.01em solid #161313;">
        <div id="colbox1" class="col py-3" style="font-size: large;">
        	<a href="./dm_dormIntroduction" style="text-decoration: none;" onmouseout="restoreColor(1)" onmouseover="changeColor(1)">
            <span class="navimenu1" style="color: black;">인사말</span>  
            </a>      
        </div>
    </div>
    <div id="rowbox2" class="row" style="border-bottom: 0.01em solid #161313;">
        <div id="colbox2" class="col py-3" style="font-size: large;">
            <a href="./dm_dormOrganizationChart" style="text-decoration: none;" onmouseout="restoreColor(2)" onmouseover="changeColor(2)">
            <span class="navimenu2" style="color: black;">조직 및 전화번호</span>         
       		</a>
        </div>
    </div>
    <div id="rowbox3" class="row" style="border-bottom: 0.01em solid #161313;">
        <div id="colbox3" class="col py-3" style="font-size: large;">
            <a href="./dm_dormSearchMap" style="text-decoration: none;" onmouseout="restoreColor(3)" onmouseover="changeColor(3)">
            <span class="navimenu3" style="color: black;">찾아오시는 길</span>         
        	</a>
        </div>
    </div>
</div><!-- ㅋ-->