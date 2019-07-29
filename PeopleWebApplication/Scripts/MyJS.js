var cookieCulture = new String(getCookie("language"));
var cookieUsername = new String( getCookie("user").split('=')[4]);
var userExpression = new String("<b>" + cookieUsername + "</b></br>");

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function ShowToastr() {
   
    (cookieCulture == "en") ? toastr.info(userExpression + "Data successfully inserted") : toastr.info(userExpression + "Podaci uspješno uneseni");
}

function ShowToastrUpdate() {

    (cookieCulture == "en") ? toastr.success(userExpression + "Data succesfully updated!") :
        toastr.success(userExpression + "Podaci uspješno ažurirani!");


}
function ShowToastrDelete() {

    (cookieCulture == "en") ? toastr.warning(userExpression + "Deleted!") : toastr.warning(userExpression + "Obrisano!");

}

function ShowToastrUpdateEmail() {

    (cookieCulture == "en") ? toastr.info(userExpression + "E-mail successfully updated!") : toastr.info(userExpression + "E-mail uspješno ažuriran");

}