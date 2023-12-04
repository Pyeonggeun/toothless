<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <div class="row">
                        <div class="col px-0">
                            <img class="img-fluid" src="../../resources/img/healthRoom/staffTopImg.jpg" style="height: 11vh; width: 100%; object-fit: cover; object-position: 50% 43%;">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="row border-bottom">
                                <div class="col py-2 fw-bold">
                                    <a href="./staffMainPage" class="link-underline link-underline-opacity-0 link-dark">
                                    	<img class="img-fluid" src="../../resources/img/another/logo_black.png" style="width: 2%;">
                                    	<span style="font-size: 0.95em; word-spacing: -0.25em">MK University</span>&nbsp;|<span style="font-size: 0.75em"> 보건센터</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <jsp:include page="../commonJsp/staffSideBar.jsp"></jsp:include>
                                <div class="col">
                                    <div class="row">
                                        <div class="col py-4 px-4">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row pb-2 border-bottom">
                                                        <div class="col px-4">
                                                            <div class="row">
                                                                <div class="col fw-bold" style="font-size: large;">
                                                                    예약자 리스트
                                                                </div>
                                                                <div class="col text-end my-auto text-secondary" style="font-size: small;">
                                                                    더보기 &gt;
                                                                </div>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col px-1">
                                                                    <table class="table table-borderless">
                                                                        <thead  style="font-size: small;">
                                                                            <tr>
                                                                                <th scope="col" class="col-7 pt-0">이름</th>
                                                                                <th scope="col" class="pt-0 text-center">생년월일</th>
                                                                                <th scope="col" class="pt-0 text-center">예약일시</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody style="font-size: small;">
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">김아무개</td>
                                                                                <td class="pt-0 pb-1 text-center">990504</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-13 13:00</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">이뭐시기</td>
                                                                                <td class="pt-0 pb-1 text-center">890715</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-13 13:00</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">박혁거세</td>
                                                                                <td class="pt-0 pb-1 text-center">981231</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-13 15:00</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">제갈공명</td>
                                                                                <td class="pt-0 pb-1 text-center">000701</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-13 18:00</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col px-4">
                                                            <div class="row">
                                                                <div class="col fw-bold" style="font-size: large;">
                                                                    오늘의 요보호 학생
                                                                </div>
                                                                <div class="col text-end my-auto text-secondary" style="font-size: small;">
                                                                    더보기 &gt;
                                                                </div>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col px-1">
                                                                    <table class="table table-borderless">
                                                                        <thead  style="font-size: small;">
                                                                            <tr>
                                                                                <th scope="col" class="col-6 pt-0">이름</th>
                                                                                <th scope="col" class="pt-0 text-center">생년월일</th>
                                                                                <th scope="col" class="pt-0 text-center">주원인</th>
                                                                                <th scope="col" class="pt-0 text-center">상태</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody style="font-size: small;">
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">김아무개</td>
                                                                                <td class="pt-0 pb-1 text-center">990504</td>
                                                                                <td class="pt-0 pb-1 text-center">정신질환</td>
                                                                                <td class="pt-0 pb-1 text-center">위험</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">김아무개</td>
                                                                                <td class="pt-0 pb-1 text-center">990504</td>
                                                                                <td class="pt-0 pb-1 text-center">정신질환</td>
                                                                                <td class="pt-0 pb-1 text-center">관심필요</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">김아무개</td>
                                                                                <td class="pt-0 pb-1 text-center">990504</td>
                                                                                <td class="pt-0 pb-1 text-center">정신질환</td>
                                                                                <td class="pt-0 pb-1 text-center">양호</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col px-4">
                                                            <div class="row">
                                                                <div class="col fw-bold" style="font-size: large;">
                                                                    교육프로그램 현황
                                                                </div>
                                                                <div class="col text-end my-auto text-secondary" style="font-size: small;">
                                                                    더보기 &gt;
                                                                </div>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col px-1">
                                                                    <table class="table table-borderless">
                                                                        <thead style="font-size: small;">
                                                                            <tr>
                                                                                <th scope="col" class="col-7 pt-0">프로그램명</th>
                                                                                <th scope="col" class="pt-0 text-center">참여인원</th>
                                                                                <th scope="col" class="pt-0 text-center">교육일시</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody style="font-size: small;">
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">아주아주 이로운 교육프로그램명</td>
                                                                                <td class="pt-0 pb-1 text-center">12명</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-13 13:00</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">아주아주 이로운 교육프로그램명</td>
                                                                                <td class="pt-0 pb-1 text-center">35명</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-13 13:00</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">아주아주 이로운 교육프로그램명</td>
                                                                                <td class="pt-0 pb-1 text-center">12명</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-13 13:00</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">아주아주 이로운 교육프로그램명</td>
                                                                                <td class="pt-0 pb-1 text-center">12명</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-13 13:00</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">아주아주 이로운 교육프로그램명</td>
                                                                                <td class="pt-0 pb-1 text-center">12명</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-13 13:00</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col">
                                                    <div class="row pb-4 border-bottom">
                                                        <div class="col-4 px-4">
                                                            <div class="row">
                                                                <div class="col fw-bold" style="font-size: large;">
                                                                    오늘의 할일
                                                                </div>
                                                                <div class="col text-end my-auto text-secondary" style="font-size: small;">
                                                                    더보기 &gt;
                                                                </div>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col px-1">
                                                                    <table class="table table-borderless">
                                                                        <tbody style="font-size: small;">
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">오늘의 할일을 써야하는데 뭘 써야할지 모르겠어요</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">졸려어어어ㅓ어어ㅓ어</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">아주아주 푹자버리기</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">많이많이많이 쉬기</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col px-4">
                                                            <div class="row">
                                                                <div class="col fw-bold" style="font-size: large;">
                                                                    의약품 통계
                                                                </div>
                                                                <div class="col text-end my-auto text-secondary" style="font-size: small;">
                                                                    더보기 &gt;
                                                                </div>
                                                            </div>
                                                            <div class="row mt-4">
                                                                <div class="col px-1">
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-center">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD;">
                                                                                        <i class="bi bi-capsule"></i>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-2">
                                                                                <div class="col text-center" style="font-size: small;">
                                                                                    총재고
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-1">
                                                                                <div class="col text-center fw-bold" style="font-size: large;">
                                                                                    1000
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-center">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD">
                                                                                        <i class="bi bi-exclamation-diamond"></i>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-2">
                                                                                <div class="col text-center" style="font-size: small;">
                                                                                    알러지
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-1">
                                                                                <div class="col text-center fw-bold" style="font-size: large;">
                                                                                    120
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-center">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD">
                                                                                        <i class="bi bi-heartbreak"></i>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-2">
                                                                                <div class="col text-center" style="font-size: small;">
                                                                                    외상
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-1">
                                                                                <div class="col text-center fw-bold" style="font-size: large;">
                                                                                    60
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-center">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD">
                                                                                        <i class="bi bi-lightning"></i>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-2">
                                                                                <div class="col text-center" style="font-size: small;">
                                                                                    소화기
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-1">
                                                                                <div class="col text-center fw-bold" style="font-size: large;">
                                                                                    100
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-center">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD">
                                                                                        <i class="bi bi-lungs"></i>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-2">
                                                                                <div class="col text-center" style="font-size: small;">
                                                                                    호흡기
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-1">
                                                                                <div class="col text-center fw-bold" style="font-size: large;">
                                                                                    20
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-center">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD">
                                                                                        <i class="bi bi-bandaid"></i>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-2">
                                                                                <div class="col text-center" style="font-size: small;">
                                                                                    일반
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-1">
                                                                                <div class="col text-center fw-bold" style="font-size: large;">
                                                                                    800
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-center">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD">
                                                                                        <i class="bi bi-box-arrow-up"></i>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-2">
                                                                                <div class="col text-center" style="font-size: small;">
                                                                                    사용
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-1">
                                                                                <div class="col text-center fw-bold" style="font-size: large;">
                                                                                    2100
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col text-center">
                                                                                    <span class="rounded-circle text-cetner px-2 py-1 text-white" style="aspect-ratio: 1/1; font-size: xx-large; background-color: #005EAD">
                                                                                        <i class="bi bi-x-square"></i>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-2">
                                                                                <div class="col text-center" style="font-size: small;">
                                                                                    폐기
                                                                                </div>
                                                                            </div>
                                                                            <div class="row mt-1">
                                                                                <div class="col text-center fw-bold" style="font-size: large;">
                                                                                    50
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col-4 px-4">
                                                            <div class="row">
                                                                <div class="col fw-bold" style="font-size: large;">
                                                                    공지사항
                                                                </div>
                                                                <div class="col text-end my-auto text-secondary" style="font-size: small;">
                                                                    더보기 &gt;
                                                                </div>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col px-1">
                                                                    <table class="table table-borderless">
                                                                        <tbody style="font-size: small;">
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">공지사항도 써야하는데</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-13</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">보건직원이 봐야하는 공지사항이 뭐가 있을까요</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-15</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">아무거나 쓰고쓰고쓰고쓰고쓰고쓰기</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-20</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">으ㅏ아아아아아ㅏ아아아ㅏ아아아ㅏ앙ㄱ</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-10</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="pt-0 pb-1">ㅑ맺더ㅔㅐㅑㅁ둫해ㅔㅜ모제ㅐㄷ호ㅜㅐㅑㅁ조ㅜㄷㄹ[ㅐ</td>
                                                                                <td class="pt-0 pb-1 text-end">2021-01-09</td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col px-4">
                                                            <div class="row">
                                                                <div class="col fw-bold" style="font-size: large;">
                                                                    보건실 이용자통계
                                                                </div>
                                                                <div class="col text-end my-auto text-secondary" style="font-size: small;">
                                                                    더보기 &gt;
                                                                </div>
                                                            </div>
                                                            <div class="row mt-3">
                                                                <div class="col px-1">
                                                                    <img class="img-fluid" src="../../resources/img/healthRoom/chart.png" style="width: 100%; aspect-ratio: 4/0.7;">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col py-4" style="background-color: #F2F2F2;">
                                    <div class="row" style="margin-left: 16%; margin-right: 16%;">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-1 my-auto">
                                                    <img class="img-fluid" src="../../resources/img/another/logo_black.png">
                                                </div>
                                                <div class="col-3 ps-0 my-auto" style="font-size: x-large">
                                                    MK University | 보건센터
                                                </div>
                                                <div class="col text-body-tertiary my-auto" style="font-size: small;">
                                                    <p class="my-0">서울특별시 강남구 테헤란로7길 7 에스코빌딩 6~7층&emsp;전화 : 02&#41;561-1911&emsp;팩스 : 02&#41;561-1911</p>
                                                    <p class="my-0">COPYRIGHT&#40;C&#41; University of Seoul ALL RIGHTS RESERVED.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>