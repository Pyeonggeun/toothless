function showMenu() {

    document.getElementById("menu").classList.remove("d-none");

}

function hideMenu() {

    document.getElementById("menu").classList.add("d-none");

}

function color(target) {

    target.style.backgroundColor = '#133369';

}

function removeColor(target) {

    target.style.removeProperty("background-color");

}