<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<h1>이력서 등록</h1><br>

<!-- 이력서가 이미 등록된 경우 answer를 업데이트 해주는 프로세스 -->
    <c:choose>
 		<c:when test = "${introductionCount == 1}"> 
 		
	 			
 			<form action="ajdksUpdateSelfIntroductionProcess" method="post">
		    
						    <strong>질문1: 지원 동기가 무엇인가요?</strong><br>
							    <textarea name="answer1" cols="150" rows="15">
							   		${selfIntroductionDto.answer1}
							    </textarea><br><br>
						   
						    <strong>질문2: 가장 최선을 다했던 경험은 무엇인가요?</strong> <br>
							    <textarea name="answer2" cols="150" rows="15" >
							    	${selfIntroductionDto.answer2}
							    </textarea><br><br>
						    
						    <strong>질문3: 본인의 강점이 무엇입니까?</strong> <br>
							    <textarea name="answer3" cols="150" rows="15">
							    	${selfIntroductionDto.answer3}
							    </textarea><br><br>
						    
						     <strong>질문4: 지원자를 뽑아야 하는 이유는 무엇인가요?</strong> <br>
						    <textarea name="answer4" cols="150" rows="15" >
						    		${selfIntroductionDto.answer4}
						    </textarea><br><br>
							
						    <input type="submit">
						    
					</form><br><br><br>
        </c:when>
    </c:choose>
    
    
    <!-- 이력서를 아예 안쓴경우 insert 해주는 프로세스 -->
    <c:choose>
    		<c:when test = "${introductionCount == 0}"> 
		    		<form action="ajdksRegisterSelfIntroductionProcess" method="post">
		    
						    <strong>질문1: 지원 동기가 무엇인가요?</strong><br>
						    <textarea name="answer1" cols="150" rows="15"></textarea><br><br>
						   
						    <strong>질문2: 가장 최선을 다했던 경험은 무엇인가요?</strong> <br>
						    <textarea name="answer2" cols="150" rows="15"></textarea><br><br>
						    
						    <strong>질문3: 본인의 강점이 무엇입니까?</strong> <br>
						    <textarea name="answer3" cols="150" rows="15"></textarea><br><br>
						    
						     <strong>질문4: 지원자를 뽑아야 하는 이유는 무엇인가요?</strong> <br>
						    <textarea name="answer4" cols="150" rows="15"></textarea><br><br>
							
						    <input type="submit">
						    
					</form><br><br><br>
    		</c:when>
    </c:choose>



    <!-- 이력서 개수가 1 이상일시 -->

        


</body>
</html>