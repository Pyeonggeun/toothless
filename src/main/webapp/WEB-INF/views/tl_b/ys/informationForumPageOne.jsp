<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
    <script src="../../resources/js/hn/topBanner.js"></script>
</head>
<body>

	<jsp:include page="../../another/commons/studentNaviLogo.jsp"></jsp:include>
	<jsp:include page="../commonJsp/studentTopBanner.jsp"></jsp:include>
    <div class="container-fluid">		
        <div class="row mt-2 ps-5" style="margin-left: 16%; margin-right: 16%;">
            <div class="col">
                <div class="row">
                    <div class="col text-end">
                        <span style="font-size: 0.8em; opacity: 70%;">HOME</span>&nbsp;<span style="opacity: 70%;">></span>&nbsp;<span style="font-size: 0.8em; opacity: 70%;">정보마당</span>&nbsp;<span style="opacity: 70%;">></span>&nbsp;<span class="fw-bold" style="font-size: 0.8em;">고혈압</span>                   
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col">
                        <span style="font-size: 1.7em;">고혈압</span>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col fw-bold" style="font-size: 1em;">
                        <span style="position: relative; top: 9%;"><i class="bi bi-dot" style="font-size: 1.8em;"></i></span><span style="color: red;">고혈압</span>이란<span style="position: relative; bottom: 2%;">?</span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col ps-4" style="font-size: 0.9em;">
                        <p class="mb-0 pb-3 ps-3">혈압<span style="position: relative; bottom: 5%;">(</span>blood pressure<span style="position: relative; bottom: 2%;">)</span>이란 인체의 동맥혈관에 흐르는 혈액의 압력을 말한다.</p>
                    	<p class="mb-0 pb-3 ps-3">이 혈압은 혈액을 순환시키는 펌프인 심장으로 인하여 생긴다.</p>
                    	<p class="mb-0 pb-3 ps-3">심장은 주기적으로 수축과 확장을 되풀이하면서 혈액을 보내므로 혈압은 한 번의 맥박마다 최고값<span style="position: relative; bottom: 5%;">(</span>수축기혈압<span style="position: relative; bottom: 5%;">)</span>과 최저값<span style="position: relative; bottom: 5%;">(</span>확장기혈압<span style="position: relative; bottom: 5%;">)</span>이 있다. 혈압은 둘을 함께 표기하여 ”수축기혈압(mmHg)/확장기혈압(mmHg)” 으로 나타낸다.</p>
                    	<p class="mb-0 ps-3">인체의 모든 조직에 혈액이 원활하게 순환되려면 혈압이 적절히 유지되어야한다. 특히 인체의 가장 위에는 가장 중요한 장기인 뇌가 자리잡은 머리가 있으므로 혈압은 적어도 뇌의 혈액순환에 문제가 없을 정도는 되어야한다. 그러나 혈압이 적절하게 유지되지 못하고 비정상적으로 계속해서 높은 질환을 고혈압이라고 한다.</p>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col fw-bold" style="font-size: 1em;">
                        <span><span style="position: relative; top: 9%;"><i class="bi bi-dot" style="font-size: 1.8em;"></i></span>고혈압 진단</span>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <div class="row mt-2 ms-3" style="border-top-style: solid; border-top-color: black; border-top-width: 0.18em;">
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <div class="row border" style="background-color: #FDFAF0">
                                            <div class="col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                구분
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                정상
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                높은 정상
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                고혈압(1도)
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                고혈압(2도)
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                고혈압(3도)
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <div class="row border" style="background-color: #FDFAF0">
                                            <div class="col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                수축기압(mmHg) / 확장기압 (mmHg)
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                <span style="position: relative; bottom: 3%;">></span> 130 그리고 <span style="position: relative; bottom: 3%;"><</span> 85
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                130 ~ 139 그리고 85 ~ 89
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                140 ~ 159 또는 90 ~ 99
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                160 ~ 179 또는 100 ~ 109
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                <span style="position: relative; bottom: 3%;"><</span> 180 또는 <span style="position: relative; bottom: 3%;"><</span> 110
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="col">
                                        <div class="row border" style="background-color: #FDFAF0">
                                            <div class="col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                관리방법
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                2년마다 재검사
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                1년마다 재검사
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                2개월마다 확인
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                1개월마다 확인
                                            </div>
                                        </div>
                                        <div class="row border">
                                            <div class="col col pt-2 pb-2 text-center" style="font-size: 0.9em;">
                                                즉시 평가 1주일내 치료
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col ps-4" style="font-size: 0.9em;">
                        <p class="mb-0 ps-3">혈압은 측정하는 시간, 스트레스, 운동, 흡연, 커피 등 여러 요인에 따라 다양한 영향을 받기 때문에 한 번의 측정만으로 고혈압으로 진단하기는 곤란하며, 반복적 측정으로 높게 나올 때 고혈압으로 진단할 수 있다. 혈압을 측정하기 30분 이전에는 커피를 마시거나 담배를 피워서는 안되며, 최소한 5분 이상은 충분히 안정한 후에 측정한 혈압이어야 신뢰할 수 있다.</p>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col fw-bold" style="font-size: 1em;">
                        <span><span style="position: relative; top: 9%;"><i class="bi bi-dot" style="font-size: 1.8em;"></i></span>고혈압의 원인</span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col ps-4" style="font-size: 0.9em;">
                        <p class="mb-0 pb-3 ps-3">대부분 (95%) 의 고혈압은 뚜렷한 원인이 밝혀지지 않은 일차성 <span style="position: relative; bottom: 4%;">(</span>또는 본태성, 원발성<span style="position: relative; bottom: 4%;">)</span> 고혈압이라 한다. 부모가 고혈압 환자인 경우, 지나친 식염섭취 및 동물성 지방분의 섭취, 운동 부족, 비만증이 있는 경우, 지나친 음주와 흡연, 당뇨병이 있는 경우, 스트레스를 자주 받는 경우, 야심적, 공격적, 성급하며 긴장을 잘 하는 경우에 생기기 쉽다고 한다.</p>
                    	<p class="mb-0 ps-3">이는 원인을 찾아 제거하면 50 renal failure,<span style="position: relative; bottom: 3%;">(</span>신장염: nephritis, 신혈관성고혈압: renovascular hypertension) 내분비질환 <span style="position: relative; bottom: 3%;">(</span>부신: adrenal- 쿠싱 병: Cushing”s syndrome, 갑상선질환 – 갑상선기능저하증, 갑상선기능항진증, 호르몬 섭취 – 피임제<span style="position: relative; bottom: 3%;">(</span>에스트로겐<span style="position: relative; bottom: 3%;">)</span>, 스테로이드<span style="position: relative; bottom: 3%;">)</span> 혈관질환 <span style="position: relative; bottom: 3%;">(</span>대동맥축약 : coarctation of aorta) 임신 <span style="position: relative; bottom: 4%;">(</span>자간증, 임신중독증<span style="position: relative; bottom: 3%;">)</span> 신경질환 <span style="position: relative; bottom: 3%;">(</span>뇌압상승<span style="position: relative; bottom: 3%;">)</span> 등이 있다.</p>
                    </div>
                </div>                
                <div class="row mt-5">
                    <div class="col fw-bold" style="font-size: 1em;">
                        <span><span style="position: relative; top: 9%;"><i class="bi bi-dot" style="font-size: 1.8em;"></i></span>고혈압 증상</span>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col ps-4" style="font-size: 0.9em;">
                        <p class="mb-0 pb-3 ps-3">고혈압이 문제가 되는 이유는 대단히 흔하고 위험한 합병증을 일으키므로 이로 인하여 병을 앓거나 사망하는 사람의 수가 매우 많기 때문이다. 뇌혈관질환과 심혈관 질환은 질병에 의한 성인의 사망원인 중 가장 많다 <span style="position: relative; bottom: 3%;">(</span>보통 그 다음이 악성종양 <span style="position: relative; bottom: 3%;">(</span>암<span style="position: relative; bottom: 3%;">)</span> 입니다<span style="position: relative; bottom: 3%;">)</span>. 고혈압은 이 두 질환의 원인이자 악화인자로 관련이 깊다.</p>   
                    	<p class="mb-0 pb-3 ps-3">그러므로 고혈압은 성인의 건강에 매우 중요한 문제이다. 또한 의료경제의 관점에서 보아도 고혈압의 치료에 들어가는 비용은 고혈압으로 인하여 생긴 합병증을 치료하는 비용과 비교가 되지 않으므로 고혈압의 치료는 중요하다.</p>
                    	<p class="mb-0 ps-3">고혈압의 합병증은 혈관손상 (vascular damage) 라고 생각할 수 있다. 이는 다시 고혈압 자체에 의한 합병증과 고혈압에 의하여 이차적으로 동맥경화가 촉진되어 일어나는 합병증으로 나눌 수 있다. 전자에는 악성고혈압, 심부전, 뇌출혈, 신경화, 대동맥질환 등이 있으며 후자에는 관동맥질환, 급사, 뇌경색, 말초혈관질환 등이 있다.</p>
                    </div>
                </div>                
                <div class="row mt-5">
                    <div class="col fw-bold" style="font-size: 1em;">
                        <span><span style="position: relative; top: 9%;"><i class="bi bi-dot" style="font-size: 1.8em;"></i></span>고혈압 치료</span>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col ps-4 fw-bold" style="font-size: 0.9em;">
                        <span style="position: relative; bottom: 10%;">-</span> 비약물요법
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col ps-4 fw-bold" style="font-size: 0.9em;">
                        1. 식이요법
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col ps-4" style="font-size: 0.9em;">
                        <p class="mb-0 pb-3 ps-3"><span class="fw-bold" style="font-size: 1em; color: blue;">첫째</span>, 식이요법에서 가장 중요한 것은 염분<span style="position: relative; bottom: 8%;">(</span>짠음식<span style="position: relative; bottom: 8%;">)</span>섭취를 줄이는 것이다. 염분은 혈압 올리는 중요 인자이므로 짜게 먹는 습관을 가진 분은 반드시 싱겁게 먹도록 해야 한다.</p>   
                    </div>
                </div>               
                <div class="row mt-3">
                    <div class="col ps-4" style="font-size: 0.9em;">
                        <p class="mb-0 pb-3 ps-3"><span class="fw-bold" style="font-size: 1em; color: blue;">둘째</span>, 동물성 지방이나 당분의 섭취를 세심히 조심하고 조절해야 한다. 고혈압 자체만으로도 동맥경화증을 초래하는데 동물성 지방과 정제된 과량의 당분을 많이 섭취하면 이중으로 동맥경화증을 촉진하게 되므로 반드시 삼가 해야하며. 또한 이렇게 함으로써 과체중 비만증의 교정이 가능하여 강압효과를 얻을 수 있다.</p>   
                    </div>
                </div>                
                <div class="row mt-3">
                    <div class="col ps-4" style="font-size: 0.9em;">
                        <p class="mb-0 pb-3 ps-3"><span class="fw-bold" style="font-size: 1em; color: blue;">셋째</span>, 단백질, 신선한 야채는 충분히 섭취하는 것이 좋다. 의학적으로 단백질은 고혈압에 나쁘기는 커녕 혈압에 좋고 활동적인 생활에 필수적이다. 물론 모든 육류는 동물성 지방이 포함되어 있으므로 많은 양은 곤란하나 동물성 지방이 적은 육류를 한끼에 몇 점 먹는 정도는 하등 상관이 없다. 그리고 고혈압에 채식을 적극 권장하는 이유는 신선한 야채에는 우선 비타민 특히 B,C가 풍부하고 또한 소화되지 않는 섬유질이 많아대변 량을 많게 유지해 주어 변비를 방지하고 열량을 증가시키지 않으면서도 만복감을 주며 칼륨의 보급에 의해 나트륨<span style="position: relative; bottom: 8%;">(</span>염분<span style="position: relative; bottom: 8%;">)</span>의 배설을 촉진하기 때문이다.</p>  
                    </div>
                </div>                
                <div class="row mt-3">
                    <div class="col ps-4 fw-bold" style="font-size: 0.9em;">
                        2. 안정
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col ps-4" style="font-size: 0.9em;">
                        <p class="mb-0 pb-3 ps-3">항상 정신적 안정을 생각하고 일상생활에서 스트레스를 최대한 피하도록 해야 한다. 정신적 신체적 과로나 근심, 걱정, 불안. 긴장 등 감정적 충격 등이 유인이 되어 뇌졸중 심근경식증 등이 초래될 수 있으므로 정신적. 신체적 피로가 쌓이지 않도록 항상 충분한 휴식과 수면을 취하고 마음의 평온을 유지하도록 해야 한다.</p>
                    </div>
                </div>                
                <div class="row mt-3">
                    <div class="col ps-4 fw-bold" style="font-size: 0.9em;">
                        3. 규칙적인 운동
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col ps-4" style="font-size: 0.9em;">
                        <p class="mb-0 pb-3 ps-3">고혈압이 심하여 심장에 합병증이 있는 경우는 심한 운동은 삼가 하고, 힘들이지 않고 할 수 있는 가벼운 체조 산책 계단 오르기 등의 적당한 운동으로 체중조절이 가능하고 혈압이 떨어지므로 항시 적절한 운동을 하는 것이 좋다.</p>                           
                    </div>
                </div>                
                <div class="row mt-3">
                    <div class="col ps-4 fw-bold" style="font-size: 0.9em;">
                        4. 금연
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col ps-4" style="font-size: 0.9em;">
                        <p class="mb-0 pb-3 ps-3">흡연은 동맥경화를 진행시키므로 해로울 뿐만 아니라 특히 심근경색이나 협심증에는 더욱 나쁘다. 그러므로 담배는 절대적으로 피해야한다</p>
                    </div>
                </div>                
                <div class="row mt-3">
                    <div class="col ps-4 fw-bold" style="font-size: 0.9em;">
                        5. 목욕
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col ps-4" style="font-size: 0.9em;">
                        <p class="mb-0 pb-3 ps-3">갑자기 뜨거운 목욕, 사우나 또는 추운 날씨나 한밤중에 급격한 외출. 돌연한 노출 등은 뇌졸중이나 심근경색등의 유인이 될 수 있어 위험하니 절대 주의하시고 목욕은 미지근한 물로 천천히 하는 것이 좋다.</p>
                    </div>
                </div>                  
                <div class="row mt-3">
                    <div class="col ps-4 fw-bold" style="font-size: 0.9em;">
                        6. 변비
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col ps-4" style="font-size: 0.9em;">
                        <p class="mb-0 pb-3 ps-3">변비는 혈압을 올리므로 항상 변비를 예방하도록 한다. 야채, 과일 미역 등에 많이 들어 있는 섬유질은 변비에도 좋을 뿐아니라 비만해소 및 염분배설에 도움을 주므로 섬유질 식품을 많이 섭취하는 것이 좋다.</p>
                    </div>
                </div>                
                <div class="row mt-3">
                    <div class="col ps-4 fw-bold" style="font-size: 0.9em;">
                        <span style="position: relative; bottom: 8%;">-</span> 약물요법
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col ps-4" style="font-size: 0.9em;">
                        <p class="mb-0 pb-3 ps-3">고혈압의 일반적인 주의사항과 함께 약물을 복용함으로서 혈압을 떨어뜨리는 이른바 ”약물요법”은 매우 중요한 치료방법이다. 고혈압의 원인은 아직도 밝혀져 있지 않으므로 고혈압을 원인적으로 제거할 수 있는 방법은 없으며, 고혈압을 일으키는 여러가지 위험인자가 알려져 있기는 하지만 이런 위험인자를 제거하기도 쉽지 않기 때문에 고혈압을 정상혈압으로 끌어내리는 가장 확실한 방법은 약물요법이라고 할 수 있다. 혈압이 높을 수록 고혈압에 의한 고통스러운 증상과 합병증의 발생 및 생명의 단축이 심하게 자주 나타나기 때문에 최저<span style="position: relative; bottom: 4%;">(</span>확장기<span style="position: relative; bottom: 4%;">)</span>혈압이 105 &nbsp;&nbsp;이상인 경우에는 반드시 약물치료를 시행하는 것이 원칙이며, 최저<span style="position: relative; bottom: 4%;">(</span>확장기<span style="position: relative; bottom: 4%;">)</span> 혈압이 90∼104minHg일 경우 매 2개월마다 혈압을 재서 계속하여 95 이상으로 나을 때는 약물치료를 시작해야 합니다. 매 2개월마다 측정한 최저 <span style="position: relative; bottom: 4%;">(</span>확장기<span style="position: relative; bottom: 4%;">)</span>혈압이 90∼95mmHg일 때는 비 약물요법을 쓰면서 6개월마다 혈압을 재면서 관찰하는 것이 바람직하다.</p>
                    </div>
                </div>                
            </div>
        </div>
        <div class="row mt-5">
            <div class="col">
                <jsp:include page="../commonJsp/staffBottomBanner.jsp"></jsp:include>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>