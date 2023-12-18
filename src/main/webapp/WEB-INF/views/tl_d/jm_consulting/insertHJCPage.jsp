<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>


<script>
<%-- --%>
	<%-- 전체 카테고리 불러오고 출력 --%>
	function getCategortListAll(){
		
		url = "./getHopeJobCategoryList"
		
		fetch(url)
		.then(response => response.json())
		.then(response =>{
			
			
			//복사 붙여넣기할 위치
			const allJobFiledList = document.getElementById("allJobFiledList");
			
			allJobFiledList.innerText='';
			allJobFiledList.innerHTML='';
			for(e of response.data){
			
			<%-- 복사할 템플릿 불러오기 --%>
			const listWrapper = document.querySelector("#templete .listWrapper").cloneNode(true);
			
			//리스트네임 위치찾기
			const listName = listWrapper.querySelector(".listName");
			
			//리스트네임에 불러온값(카테고리이름) 넣어주기
			listName.innerText = e.jobFieldCategoryDto.job_field_category_name;	
			//카테고리 input type checkbox 값 할당해서 넣어주기
			
			//위치찾기
			const listIsCheck = listWrapper.querySelector(".listIsCheck");
			
			//input엘리먼트부여
			const listIsCheckElement = document.createElement('input');
			
			//type속성부여
			listIsCheckElement.type = 'checkbox';
			listIsCheckElement.value = e.jobFieldCategoryDto.job_field_category_pk;
			
			//나중에 등록할때 다중 선택을 위한 class부여
			listIsCheckElement.classList.add('insertHopeJobCategoryValue');
			
			//이미 학생의 관심분야일때 disabled
			if(e.isBoolean == true){
				listIsCheckElement.disabled = true;
			}
			
			
			//마무리
			listIsCheck.appendChild(listIsCheckElement);
			allJobFiledList.appendChild(listWrapper);
			};//포문끝
					
		});
		
	}//전체 카테고리끝
	
	<%--내 카테고리 --%>
	function getMyHopeJobCategoryList(){

		url = "./getMyHopeJobCategoryList"
			
			fetch(url)
			.then(response => response.json())
			.then(response =>{
				
				const myJobFiledList = document.getElementById("myJobFiledList");
				
				
				myJobFiledList.innerText='';
				
				
				for(e of response.data){
					
					const listWrapper = document.querySelector("#templete .listWrapper").cloneNode(true);
					const listName = listWrapper.querySelector(".listName");
					listName.innerText = e.jobFieldCategoryDto.job_field_category_name;
					
					
					const listIsCheck = listWrapper.querySelector(".listIsCheck");
					
					
					const listIsCheckElement = document.createElement('input');
					listIsCheckElement.type = 'checkbox';					
					listIsCheckElement.value = e.hopeJobCategoryDto.hope_job_category_pk;
					listIsCheckElement.classList.add("deleteMyHopeJobCategoryValue");
					
					listIsCheck.appendChild(listIsCheckElement);
					myJobFiledList.appendChild(listWrapper);
					
				};				
			});
		
	}
	
	
	//구직관심분야 등록하기	
	function insertHopeJobCategory(){

		//체크된 등록 벨류들 가져오기
		//input.에서 .은 class선택자라고함
		var checkboxes = document.querySelectorAll('input.insertHopeJobCategoryValue:checked');
		console.log(checkboxes);
		// 체크박스 벨류담을 배열생성
		var checkBoxValues = [];
		//for문돌려서 value뽑기
	      checkboxes.forEach(function(checkbox) {
	    	checkBoxValues.push(checkbox.value);
	      });
		
		if(checkboxes.length==0){
			alert("등록할 분야를 선택해 주세요!");
			return;
		}

		//등록		
		<%--링크--%>
		const url = "./insertHopeJobCategory?checkBoxValues=" + checkBoxValues;
		fetch(url)
		.then(response => response.json()) //얘는 es5처럼 역직렬화 해줘야함(제이쿼리는 안해줌) (언어변환) 
		.then((response) => {
			getCategortListAll();
			getMyHopeJobCategoryList();
		})	;
	}
	

	//내 구직희망 카테고리 삭제
	function deleteMyHopeJobCategory(){
		
		
		//체크된거 뽑기
		var checkboxes = document.querySelectorAll('input.deleteMyHopeJobCategoryValue:checked');
		
		var checkBoxValues = [];
		
		if(checkboxes.length==0){
			alert("삭제할 분야를 선택해 주세요!");
			return;
		}		
		
		for(var e of checkboxes){
			checkBoxValues.push(e.value);
		};
		
		//체크된거 삭제
		const url = "./deleteMyHopeJobCategory?checkBoxValues=" + checkBoxValues;
		fetch(url)
		.then(response => response.json()) //얘는 es5처럼 역직렬화 해줘야함(제이쿼리는 안해줌) (언어변환) 
		.then((response) => {
			getCategortListAll();
			getMyHopeJobCategoryList();
		})	;		
		
	}
	
	
	
	
	
	//우선실행ㅎ
	window.addEventListener("DOMContentLoaded", () => {
		getCategortListAll();
		getMyHopeJobCategoryList();
	});	
</script>


</head>
<body>


<div class="container">

	<div class="row">
		<div class="col">

				<jsp:include page="../common/staffTopNavi.jsp"></jsp:include>
			
		</div>
	</div>

	<div class="row">
	
		<div class="col-2">
			<jsp:include page="../common/staffMenu.jsp"></jsp:include>	
		</div>
		<div class="col-1 border-start"></div>
		<div class="col mx-2 my-2">
		
			<div class="row mx-1 mt-4">
				<div class="col fw-bold text-center" style="font-size:1.5em;">
					내 구직 관심 분야 관리
				</div>
			</div>
			
			
			
			<div class="row mx-1 mt-5">
				<div class="col p-3 border text-center">
					<div class="row py-3 border-bottom border-2 ">
						<div class="col fw-bold" style="font-size:1.4em;">
							전체 관심 분야
						</div>
					</div>
					<div class="row pt-3">
						<div id="allJobFiledList" class="col" style="font-size:0.9em;">
							
						</div>
					</div>					
				</div>
				<!-- 등록/삭제버튼 -->
				<div class="col-2 text-center">
					<div class="row mt-5 pt-5">
						<div class="col mt-5 pt-5" style="font-size:2.3em;">
							<div class="row pt-3">
								<div class="col">
									<i onclick="insertHopeJobCategory()" class="bi bi-arrow-right-square"></i>
								</div>
							</div>
							<div class="row pt-2">
								<div class="col">
									<i onclick="deleteMyHopeJobCategory()" class="bi bi-arrow-left-square"></i>
								</div>
							</div>							
						</div>
					</div>							
				</div>
				
				<div class="col p-3 border text-center">
					<div class="row py-3 border-bottom border-2">
						<div class="col fw-bold" style="font-size:1.4em;">
							내 관심 분야
						</div>
					</div>
					<div class="row pt-3">
						<div id="myJobFiledList" class="col" style="font-size:0.9em;"><!-- 리스트래퍼 -->
							
						</div>
					</div>					
				</div>
			</div>
			<div class="row mt-5 ms-2">
				<div class="col">
					<a href="./hopeJobConsultingPage"><button type="button" class="btn btn-primary">목록으로</button>
					</a>
				</div>
			</div>				
									
		</div>
		<div class="col-2"></div>
	</div>
	

	

</div>


<%--템플릿 --%>
<div id ="templete" class="d-none">
	<div class="listWrapper row py-2" style="font-size:1.1em;">
		<div class="listName col ps-3">

		</div>
		<div class="listIsCheck ps-4 col">
			
		</div>					
	</div>
</div>





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>