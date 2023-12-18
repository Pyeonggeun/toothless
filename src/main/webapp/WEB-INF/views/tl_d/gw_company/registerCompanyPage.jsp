<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>기업 등록 페이지</title>

<script>
	function companyFormSubmit() {
		const companySubmit=document.getElementById("companySubmit");
		
		//여기서부터 회사
		
		//회사 규모 카테고리
		const comScale=document.getElementById("comScale");
		if(comScale.value=="기업규모를 선택해주세요"){
			alert("기업 규모를 선택해 주세요.");
			comScale.focus();
			return;
		}
		
		//사업자번호
		const businessNumber=document.getElementById("businessNumber");
		if(businessNumber.value==''){
			alert("사업자 번호를 입력해 주세요.");
			businessNumber.focus();
			return;
		}
		
		//회사명
		const comName=document.getElementById("comName");
		if(comName.value==''){
			alert("회사 명을 입력해 주세요.");
			comName.focus();
			return;
		}
		
		//회사 대표명
		const comBossname=document.getElementById("comBossname");
		if(comBossname.value==''){
			alert("회사 대표 성함을 입력해 주세요.");
			comBossname.focus();
			return;
		}
	
		//회사 주소명
		const comAddress=document.getElementById("comAddress");
		if(comAddress.value==''){
			alert("회사 주소를 입력해 주세요.");
			comAddress.focus();
			return;
		}
		
		//여기서부터 담당자
		
		//담당자 이름
		const comManagerName=document.getElementById("comManagerName");
		if(comManagerName.value==''){
			alert("담당자 성함을 입력해 주세요.");
			comManagerName.focus();
			return;
		}
		
		//담당자 이메일
		const comManagerEmail=document.getElementById("comManagerEmail");
		if(comManagerEmail.value==''){
			alert("담당자 이메일 주소를 입력해 주세요.");
			comManagerEmail.focus();
			return;
		}
		
		//담당자 부서
		const comManagerDepartment=document.getElementById("comManagerDepartment");
		if(comManagerDepartment.value==''){
			alert("담당자 부서명을 입력해 주세요.");
			comManagerDepartment.focus();
			return;
		}
		
		//담당자 직위
		const comManagerPosition=document.getElementById("comManagerPosition");
		if(comManagerPosition.value==''){
			alert("담당자 직위를 입력해 주세요.");
			comManagerPosition.focus();
			return;
		}
		
		//사무실 전화번호
		const comDirectNumber=document.getElementById("comDirectNumber");
		if(comDirectNumber.value==''){
			alert("사무실 전화번호를 입력해 주세요.");
			comDirectNumber.focus();
			return;
		}
		
		//담당자 휴대폰번호
		const comManagerPhone=document.getElementById("comManagerPhone");
		if(comManagerPhone.value==''){
			alert("담당자 휴대폰 번호를 입력해 주세요.");
			comManagerPhone.focus();
			return;
		}
		
		//여기서부터 기업 계정 가입 정보
		
		//외부인 계정 아이디
		const externalId=document.getElementById("externalId");
		if(comManagerEmail.value==''){
			alert("담당자 이메일 주소를 입력해 주세요.");
			comManagerEmail.focus();
			return;
		}
		
		const externalIdRegex = /^[a-zA-Z][a-zA-Z0-9_]*$/;
		if(!externalIdRegex.test(externalId.value)){
			alert("영문 대소문자, 숫자만 입력 가능합니다.");
			externalId.focus();	
			return ;
		}
		
		//외부인 계정 비밀번호
		const password=document.getElementById("password");
		if(password.value==''){
			alert("패스워드를 입력해주세요."); 
			password.focus();
			return;
		}
		 
		//비밀번호 정규표현 에러
		const passwordRegex = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
		if(!passwordRegex.test(password.value)){
			alert("영문 대소문자, 숫자, 특수문자(@,$,!,%,*,?,&)를 사용하여 비밀번호를 작성해주세요.");
			password.value = "";
			password.focus();
			
			return;
		}
		
		//사업자번호 중복
		if(isCheckedBusinessNumber==false){
			alert("사업자 등록번호를 확인해주세요.");
			businessNumber.focus();
			
			return;
		}
		
		//계정 아이디 중복
		if(isChekedExternalId==false){
			alert("아이디 중복확인이 필요합니다.");
			externalId.focus();
			
			return;
		}
		
		companySubmit.submit();
	}
	
	
	//사업자번호 중복체크
	function checkBusinessNumber(){
		const inputBusinessNumberValue = document.getElementById("businessNumber").value;
		
		const businessNumberxhr = new XMLHttpRequest();
		
		businessNumberxhr.onreadystatechange = function(){
			if(businessNumberxhr.readyState == 4 && businessNumberxhr.status == 200){
				
				const response = JSON.parse(businessNumberxhr.responseText);
				
				console.log(response.result);
				console.log(response.data);
			}
		};
		
		businessNumberxhr.open("get", "./existByBusinessNumber?business_number=" + inputBusinessNumberValue);
		
		businessNumberxhr.send();
		
	}
	
	function checkBusinessNumberJquery(){
		const inputBusinessNumberValue = $("#businessNumber").val();

		$.ajax({
			url: "./existByBusinessNumber?business_number=" + inputBusinessNumberValue,
			method: "get",
			dataType: "json",
			success: function(response){
				
				console.log(response.result);
				console.log(response.data);
			}
		});
		
	}
	
	let isCheckedBusinessNumber = false;
	
	function checkBusinessNumberFetch(){
		const inputBusinessNumberValue = document.querySelector("#businessNumber").value;
		
		const url = "./existByBusinessNumber?business_number=" + inputBusinessNumberValue;
		
		fetch(url)
		.then(response => response.json())
		.then((response) => {
			
			if(response.data == true){
				
				isCheckedBusinessNumber = false;
				
				const checkBusinessNumberResultBox = document.getElementById("checkBusinessNumberResultBox");
				checkBusinessNumberBox.innerText = "이미 등록된 사업자 등록번호 입니다.";
				checkBusinessNumberBox.style.color = "red";
				
				
			}else{
				isCheckedBusinessNumber = true;
			}
		})
		;
	}
	
	//외부인 아이디 중복체크
	function checkExternalId(){
		const inputExternalIdValue=document.getElenentById("externalId");
		
		const externalIdxhr=new XMLHttpRequest();
		
		externalIdxhr.onreadystatechange=function(){
			if(externalIdxhr.readyState==4 && externalIdxhr.status==200){
				const response=JSON.parse(externalIdxhr.responseText);
				
				console.log(response.result);
				console.log(response.data);
			}
			
		}; 
		
		externalIdxhr.open("get","./existByExternalId?external_id="+inputExternalIdValue);
		
		externalIdxhr.send();
		
	}
	
	function checkExternalIdJquery(){
		const inputExternalIdValue=$("#externalId").val();
		
		$.ajax({
			url:"./existByExternalId?external_id="+inputExternalIdValue,
			method: "get",
			dataType:"json",
			success: function(response){
				console.log(response.result);
				console.log(response.data);
			}
		});
	}
	
	let isChekedExternalId=false;
	 
	function checkExternalIdFetch(){
		const inputExternalIdValue=document.querySelector("#externalId").value;
		const url="./existByExternalId?external_id="+inputExternalIdValue;
		
		fetch(url)
		.then(response=>response.json())
		.then((response)=>{
			if(response.data==true){
				isChekedExternalId=false;
				
				const checkExternalIdResultBox=document.getElementById("checkExternalIdResultBox");
				checkExternalIdResultBox.innerText="이미 존재하는 아이디 입니다.";
				checkExternalIdResultBox.style.color="red";
			}else{
				isChekedExternalId=true;
				
				const checkExternalIdResultBox=document.getElementById("checkExternalIdResultBox");
				checkExternalIdResultBox.innerText="사용 가능한 아이디 입니다.";
				checkExternalIdResultBox.style.color="green";
			}
		});
	
	}
	
	

</script>
</head>
<body>

	<div class="container-fluid"> 
		<div class="row">
				<jsp:include page="../common/companyTopNavi.jsp"></jsp:include>	
		</div>
		
		<!-- 기업 정보 입력 -->
		<div class="row mt-5 mb-2">
			<div class="col fs-5 text-center fw-bold">기업 소재</div>
		</div>
		
		<form id="companySubmit" action="./registerCompanyProcess" method="post">
			<div class="row">
				<div class="col"></div>
				<div class="col mt-3 border-light-subtle">
					
					<!-- 기업 규모 입력 -->
					<div class="row mt-3"> 
						<div class="col"> 
							<div class="row mb-1">기업규모</div>
							<select id="comScale" class="form-select" name="com_scale_category_pk">
							  <option disabled selected>기업규모를 선택해주세요</option>
							  <c:forEach items="${comScaleList}" var="scale">
							  	<option value="${scale.com_scale_category_pk}">${scale.com_scale_category_name}</option>
							  </c:forEach>
							</select>
						</div>
					</div>
					
					<!-- 사업자 등록번호 입력 -->
					<div class="row mt-3">
						<div class="col">
							<div class="row mb-1">
								사업자 등록번호
							</div>
							<div class="row">
								<input onblur="checkBusinessNumberFetch()" id="businessNumber" type="text" name="business_number" class="form-control" placeholder="000-00-00000">
								<div id="checkBusinessNumberBox"></div>
							</div>
						</div>
					</div>
					
					<!-- 회사명 입력 -->
					<div class="row mt-3">
						<div class="col">
							<div class="row mb-1">
								회사명
							</div>
							<div class="row">
								<input id="comName" type="text" name="com_name" class="form-control" placeholder="회사명을 입력해주세요.">
							</div>
						</div>
					</div>
					
					<!-- 대표자 명 입력 -->
					<div class="row mt-3">
						<div class="col">
							<div class="row mb-1">
								대표자 명 
							</div>
							<div class="row">
								<input id="comBossname" type="text" name="com_bossname" class="form-control" placeholder="대표자명을 입력해주세요.">
							</div>
						</div>
					</div>
					
					<!-- 기업 주소 입력 -->
					<div class="row mt-3">
						<div class="col">
							<div class="row">
								주소 
							</div>
							<div class="row mb-3">
								<input id="comAddress" type="text" name="com_address" class="form-control" placeholder="주소를 입력해주세요.">
							</div>
						</div>
					</div>
					
				</div>
				
				
				<div class="col"></div>
			</div>
			
			<!-- 기업 담당자 입력 -->
			<div class="row mt-3">
				<div class="col fs-5 text-center fw-bold">기업 담당자 등록</div>
			</div>
			
			
			<div class="row">
				<div class="col"></div>
				<div class="col mt-3 border-light-subtle">
					
					<!-- 담당자 이름 입력 -->
					<div class="row mt-3">
						<div class="col">
							담당자 이름 <input id="comManagerName" type="text" name="com_manager_name" class="form-control" placeholder="담당자 명을 입력해주세요.">
						</div>
					</div>
					
					<!-- 담당자 이메일 입력 -->
					<div class="row mt-3">
						<div class="col">
							이메일 <input id="comManagerEmail" type="text" name="com_manager_email" class="form-control" placeholder="이메일을 입력해주세요.">
						</div>
					</div>
					
					<!-- 담당자 부서명 입력 -->
					<div class="row mt-3">
						<div class="col">
							부서명 <input id="comManagerDepartment" type="text" name="com_manager_department" class="form-control" placeholder="주소를 입력해주세요.">
						</div>
					</div>
					
					<!-- 담당자 직위 입력 -->
					<div class="row mt-3">
						<div class="col">
							직위 <input id="comManagerPosition" type="text" name="com_manager_position" class="form-control" placeholder="직위를 입력해주세요.">
						</div>
					</div>
					
					<!-- 담당자 사무실 전화번호 입력 -->
					<div class="row mt-3">
						<div class="col">
							사무실 전화번호 <input id="comDirectNumber" type="text" name="com_direct_number" class="form-control" placeholder="사무실 전화번호를 입력해주세요.">
						</div>
					</div>
					
					<!-- 담당자 휴대폰번호 입력 -->
					<div class="row mt-3">
						<div class="col mb-3">
							핸드폰번호 <input id="comManagerPhone" type="text" name="com_manager_phone" class="form-control" placeholder="휴대폰 번호를 입력해주세요.">
						</div>
					</div>
					
				</div>
				
				<div class="col"></div>
			</div>
			
			<!-- 여백 줄려고 -->
			<div class="row"></div>
			
			<!-- 취업지원센터에서 사용할 아이디, 비밀번호 입력 -->
			<div class="row mt-3 mb-2">
				<div class="col fs-5 text-center fw-bold">기업 계정 가입 정보</div>
			</div>
			
			<div class="row">
				<div class="col"></div>
				<div class="col mt-3 border-light-subtle">
					
					<div class="row mt-2">
						 
						<div class="row">
							ID <input onblur="checkExternalIdFetch()" id="externalId" type="text" name="external_id" class="form-control" placeholder="로그인시 사용할 ID를 입력해주세요.">
							<div id="checkExternalIdResultBox"></div>
						</div>
					</div>
					<div class="row mt-3">
						<div class="row mb-3">
							PW <input id="password" type="text" name="password" class="form-control" placeholder="로그인시 사용할 password를 입력해주세요.">
						</div>
					</div>
					
				</div>
				
				<div class="col"></div>
			</div>
			
			<div class="row mt-3 mb-2">
			
				
				<div class="col"></div>
				<div class="col d-grid"><input class="btn btn-primary" onclick="companyFormSubmit()" value="가입하기"></div>
				<div class="col"></div>
				
			</div>
			
		</form>
		
	</div>
	
	

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>