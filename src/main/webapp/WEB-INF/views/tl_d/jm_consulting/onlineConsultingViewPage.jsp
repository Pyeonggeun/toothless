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
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col">
			<div class="row">
				<div class="col">
					<span>내 온라인 상담 내역</span>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<div class="row">
						<div class="col">
							상담내용
						</div>
						<div class="col">
							${onlineConsultingInfo.onlineConsultingDto.on_consulting_contents}
						</div>						
					</div>
					<div class="row">
						<div class="col">
							문의 날짜
						</div>
						<div class="col">
							${onlineConsultingInfo.onlineConsultingDto.created_at}
						</div>						
					</div>
					<div class="row">
						<div class="col">
							
						</div>
						<div class="col">
							${onlineConsultingInfo.onlineConsultingDto.on_consulting_contents}
						</div>						
					</div>
					<div class="row">
						<div class="col">
							상담내용
						</div>
						<div class="col">
							${onlineConsultingInfo.onlineConsultingDto.on_consulting_contents}
						</div>						
					</div>															
				</div>
			</div>
			
					
			
		</div>
	</div>
</div>
</body>
</html>