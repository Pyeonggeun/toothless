function clickCollapse(target) {
	
	const number = Number(target.value.slice(-1));
	const word = target.value.slice(0, 1);
	
	console.log(word);
	
	if(word == 'c') {
		
		for(let i = 1 ; i <= 3 ; i++) {
			
			if(number == i) {
				
				bootstrap.Collapse.getOrCreateInstance("#collapseExample" + i).show();
        		target.value = "o" + i;
				
			}else {

				if(document.getElementById("collapse"+i).value.slice(0, 1) == 'o') {
					
					bootstrap.Collapse.getOrCreateInstance("#collapseExample" + i).hide();
            		document.getElementById("collapse" + i).value = "c" + i;			
            		
				}
				
			}
			
		}
		
	}else {
		
		bootstrap.Collapse.getOrCreateInstance("#collapseExample" + number).hide();
		target.value = "c" + number;
		
	}
	
}

function colorSideBar() {

	const str = window.location.pathname.slice(window.location.pathname.lastIndexOf("/")+1);
	
	if(str == 'medicineInventory') {
	
		document.getElementById("color1").classList.add("text-white");
		document.getElementById("color1").style.backgroundColor = '#014195';
		
		bootstrap.Collapse.getOrCreateInstance("#collapseExample1").show();
        document.getElementById("collapse1").value = "o1";
		
	}else if(str == 'medicineAdd') {
	
		document.getElementById("color2").classList.add("text-white");
		document.getElementById("color2").style.backgroundColor = '#014195';
		
		bootstrap.Collapse.getOrCreateInstance("#collapseExample1").show();
        document.getElementById("collapse1").value = "o1";
		
	}else if(str == 'codeRegistPage') {
	
		document.getElementById("color3").classList.add("text-white");
		document.getElementById("color3").style.backgroundColor = '#014195';
		
		bootstrap.Collapse.getOrCreateInstance("#collapseExample1").show();
        document.getElementById("collapse1").value = "o1";
		
	}else if(str == 'clinicPage') {
	
		document.getElementById("color4").classList.add("text-white");
		document.getElementById("color4").style.backgroundColor = '#014195';
		
		
	}else if(str == 'itemListAndRegistPage') {
	
		document.getElementById("color5").classList.add("text-white");
		document.getElementById("color5").style.backgroundColor = '#014195';
		
		bootstrap.Collapse.getOrCreateInstance("#collapseExample2").show();
        document.getElementById("collapse2").value = "o2";
		
	}else if(str == 'staffItemApplyListPage') {
	
		document.getElementById("color6").classList.add("text-white");
		document.getElementById("color6").style.backgroundColor = '#014195';
		
		bootstrap.Collapse.getOrCreateInstance("#collapseExample2").show();
        document.getElementById("collapse2").value = "o2";
		
	}else if(str == 'eduProgRegisterPage') {
	
		document.getElementById("color7").classList.add("text-white");
		document.getElementById("color7").style.backgroundColor = '#014195';
		
		bootstrap.Collapse.getOrCreateInstance("#collapseExample3").show();
        document.getElementById("collapse3").value = "o3";
		
	}else if(str == 'eduMainPageForStaff') {
	
		document.getElementById("color8").classList.add("text-white");
		document.getElementById("color8").style.backgroundColor = '#014195';
		
		bootstrap.Collapse.getOrCreateInstance("#collapseExample3").show();
        document.getElementById("collapse3").value = "o3";
		
	}else if(str == '0') {
	
		document.getElementById("color9").classList.add("text-white");
		document.getElementById("color9").style.backgroundColor = '#014195';
		
		bootstrap.Collapse.getOrCreateInstance("#collapseExample3").show();
        document.getElementById("collapse3").value = "o3";
		
	}else if(window.location.pathname.slice(window.location.pathname.lastIndexOf("/")-2) == 'dy/staffboardPage') {
	
		document.getElementById("color10").classList.add("text-white");
		document.getElementById("color10").style.backgroundColor = '#014195';
		
	}else if(window.location.pathname.slice(window.location.pathname.lastIndexOf("/")-2) == 'ty/staffboardPage') {
	
		document.getElementById("color11").classList.add("text-white");
		document.getElementById("color11").style.backgroundColor = '#014195';
		
	}

}

function reloadStaffName() {

	const url = "../common/getStaffName";
	
	fetch(url)
	.then(response => response.json())
	.then(response => {
	
		document.getElementById("staffName").innerText = response.data;
		console.log("호출됨");
	
	});
	
}

 window.addEventListener("DOMContentLoaded", () => {
 
	reloadStaffName();    	
	colorSideBar();
	
});