function showMenu() {

    document.getElementById("menu").classList.remove("d-none");

}

function hideMenu() {

    document.getElementById("menu").classList.add("d-none");

}

function color(target) {

	target.classList.remove("text-white");
    target.style.color = '#BDE1FF';

}

function removeColor(target) {

	target.classList.add("text-white");
    target.style.removeProperty("color");

}