<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<script>
	function backtopreviouspage(){
		history.go(-1);
	}
	
	function random_img(){
		num=Math.floor(Math.random()*10);
		document.randomImage.src="../../../resources/img/kimbaduck/김바덕"+num+".gif";
		}	
</script>
</head>
<body>
<div class="continer">
<div class="row mt-5 pt-4">
	<div class="col mt-5" style="text-align: center;">
		<img name="randomImage" style="width: 220px; height: 220px;">	
	</div>
	<script>
	random_img();
	</script>
</div>
<div class="row mt-2 mb-1">
	<div class="col" style="font-size: 3.4em; text-align: center;">
		<span style="font-weight: 900;">서비스 준비중</span><span style="font-weight: 100;">입니다</span>
	</div>
</div>
<div class="row mt-2 mb-0">
	<div class="col" style="font-size: 1.2em; text-align: center; color: #757575;">
		보다 나은 서비스 제공을 위하여 페이지 준비중에 있습니다
	</div>
</div>
<div class="row mt-0">
	<div class="col" style="font-size: 1.2em; text-align: center; color: #757575;">
		빠른 시일 내로 준비하여 찾아뵙겠습니다
	</div>
</div>
<div class="row mt-4 pt-1">
	<div class="col" style="text-align: center;">
		<button class="btn btn-warning" onclick="backtopreviouspage()">이전 페이지로 이동</button>
	</div>
</div>

</div>
</body>
</html>