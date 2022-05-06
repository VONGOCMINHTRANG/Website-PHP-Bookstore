function addproduct() {
    document.getElementById("addproduct").style.display ="block";
    // document.getElementById("xoasanpham").style.display ="none";
    document.getElementById("cacsanpham").style.display ="none";
    document.getElementById("suasanpham").style.display ="none";
}
function suasanpham() {
    document.getElementById("addproduct").style.display ="none";
    // document.getElementById("xoasanpham").style.display ="none";
    document.getElementById("cacsanpham").style.display ="none";
    document.getElementById("suasanpham").style.display ="block";
}
function cacsanpham() {
    document.getElementById("addproduct").style.display ="none";
    // document.getElementById("xoasanpham").style.display ="none";
    document.getElementById("cacsanpham").style.display ="block";
    document.getElementById("suasanpham").style.display ="none";
}
function listsanpham() {
    document.getElementById("listsanpham").style.display ="block";
    document.getElementById("listdonhang").style.display ="none";
    document.getElementById("listkhachhang").style.display ="none";
}
function listdonhang() {
    document.getElementById("listsanpham").style.display ="none";
    document.getElementById("listdonhang").style.display ="block";
    document.getElementById("listkhachhang").style.display ="none";
}
function listkhachhang() {
    document.getElementById("listsanpham").style.display ="none";
    document.getElementById("listdonhang").style.display ="none";
    document.getElementById("listkhachhang").style.display ="block";
}
// Material Select Initialization
$(document).ready(function() {
    $('.mdb-select').materialSelect();
    });


