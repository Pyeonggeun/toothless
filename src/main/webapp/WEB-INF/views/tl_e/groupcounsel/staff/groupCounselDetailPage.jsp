<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
	<title>집단 상담 디테일 페이지</title>
</head>
<body>

	<div class="container-fluid">
		
		<!-- 상단 메뉴 -->
		<div class="row border-bottom">
			<!-- 좌측 여백 -->
			<div class="col-1"></div>
			<div class="col-2 py-4">
				<div class="fw-bold" style="font-size: 1.3em;">학사관리시스템</div>
			</div>
			<div class="col"></div>
			<!-- 우측 여백 -->
			<div class="col-1"></div>
		</div>
		
		
		<div class="row border-bottom bg-success bg-opacity-25">
			
			<!-- 좌측 여백 -->
			<div class="col-1"></div>
			
			<!-- 나중에 카테고리 형식으로 디자인 -->
			<div class="col-2">
				<div class="row" style="height: 100%;">
					<div class="col-1"></div>
					<div class="col">
						<div class="row" style="height: 30%;"></div>
						<div class="row" style="height: 70%;">
							<div class="col" style="background-color: MediumBlue; opacity: 0.6;">
								<div class="fw-bold text-white pt-4 ps-2" style="font-size: 1.5em;">집단 상담</div>
							</div>
						</div>
					</div>
					<div class="col-1"></div>
				</div>
			</div>
			
			<!-- 집단상담/상담 등록, 이미지 -->
			<div class="col pt-5 pb-4">
				<div class="row">
					<div class="col-4">
						<div class="row py-2">
							<div class="col">
								<div class="fw-bold" style="font-size: 1.9em;">상담 등록</div>						
							</div>
						</div>
						<div class="row">
							<div class="col">
								<div class="text-secondary" style="font-size: 0.8"><i class="bi bi-house-door-fill"></i> / 집단 상담 / 상담 등록</div>
							</div>
						</div>
					</div>
					<!-- 이미지?? 가능하면 -->
					<div class="col"></div>
				</div>
			</div>
		
			<!-- 우측 여백 -->
			<div class="col-1"></div>
		</div>
		
	
		
		<div class="row mt-0">
			<!-- 왼쪽 여백 -->
			<div class="col-1"></div>
			<!-- 카테고리 -->
			<div class="col-2">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<div class="row" style="background-color: MediumBlue; opacity: 0.6;">
							<div class="col-1"></div>
							<div class="col py-4 border-bottom border-white">
								<div class="text-white" style="font-size: 1.1em;">상담 등록</div>
							</div>
							<div class="col-1"></div>
						</div>
						<div class="row" style="background-color: MediumBlue; opacity: 0.6;">
							<div class="col-1"></div>
							<div class="col py-4">
								<div class="text-white" style="font-size: 1.1em;">등록 현황</div>
							</div>
							<div class="col-1"></div>
						</div>					
					</div>
					<div class="col-1"></div>
				</div>
				<div class="row"></div>
			</div>
			<div class="col">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<div class="row mt-5"></div>
						
						<div class="row">
							<div class="col-5">
								<img class="img-fluid" style="height:36em ; width:100%" src="/uploadFiles/${groupCounselDto.posterImage}">
							</div>
							
							<div class="col">
								<div style="position: sticky; top: 100px;">
									<div class="row">
										<div class="col">
											<div class="fw-bold mb-2" style="font-size: 1.2em;">[${map.sellerDto.store_name}]</div>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<div class="text-black" style="font-size: 0.8em;">${map.goodsDto.title}</div>
										</div>
										<div class="col-1">
											<c:choose>
												<c:when test="${distinguishGoodsWish==1 && distinguishGoodsWish!=null}">
													<div><a href="./goodsWishListProcess?customer_id=${sessionCustomerInfo.id}&goods_id=${map.goodsDto.id}"><i class="bi bi-bookmark-fill" style="font-size: 1.0em; color: black;"></i></a></div>
												</c:when>
												<c:otherwise>
													<div><a href="./goodsWishListProcess?customer_id=${sessionCustomerInfo.id}&goods_id=${map.goodsDto.id}"><i class="bi bi-bookmark" style="font-size: 1.0em; color: black;"></i></a></div>
												</c:otherwise>
											</c:choose>
										</div>
										<div class="col-2"></div>
									</div>
									<div class="row">
										<div class="col">
											<div class="text-black" style="font-size: 0.8em;">KRW ${map.goodsDto.price}</div>
										</div>
									</div>
									<div class="row my-3">
										<div class="col">
											<div class="text-primary-secondary" style="font-size: 0.6em;">${map.goodsDto.content}</div>							
										</div>
										<div class="col-2"></div>
									</div>
									<div class="row">
										<div class="col">
											<div class="text-primary-secondary" style="font-size: 0.6em;">VIRGIN WOOL 80% NYLON 20%</div>
											<div class="text-primary-secondary mb-3" style="font-size: 0.6em;">FABRIC MADE IN ITALY</div>
											<div class="text-primary-secondary mb-1" style="font-size: 0.6em;">S 총장 116cm 어깨 52cm 가슴 60cm 소매 61.9cm</div>
											<div class="text-primary-secondary mb-1" style="font-size: 0.6em;">M 총장 117.5cm 어깨 53.5cm 가슴 62.5cm 소매 63.2cm</div>
											<div class="text-primary-secondary mb-1" style="font-size: 0.6em;">L 총장 119cm 어깨 55cm 가슴 65cm 소매 64.5cm</div>
											<div class="text-primary-secondary" style="font-size: 0.6em;">Model Size 187cm 67kg Fitting L</div>									
										</div>
									</div>
									
									<div class="row mt-5">
										<div class="col me-0 pe-0">
											<button type="button" style="font-size: 0.8em; width: 80%; height: 50px; padding: 5px; border: none; background-color: black; color: white;">
											ADD TO CART
											</button>
										</div>
										<div class="col ms-0 ps-0">
											<button onclick="location.href='./purchaseGoods?goodsId=${map.goodsDto.id}&customerId=${sessionCustomerInfo.id}'" class="fw-bold" type="button" style="font-size: 0.8em; width: 80%; height: 50px; padding: 5px; border-color: black; background-color: white; color: black;">
											ORDER
											</button>
										</div>
									</div>
								</div>								
							</div>
						</div>
						<!-- 임시 하단 여백 -->
						<div class="row mb-5 pb-5"></div>
					</div>
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		
		
		
		
		
	
	</div>
	




	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>	
</body>
</html>