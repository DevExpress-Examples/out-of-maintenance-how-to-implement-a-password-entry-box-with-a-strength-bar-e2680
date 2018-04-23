var minPwdLength = 3;
var strongPwdLength = 6;

function UpdateIndicator() {
    var strength = GetPasswordStrength(tbPassword.GetText());

    var className;
    var message;
    if (strength == -1){
        className = 'pwdBlankBar';
        message = "Empty";
    } else if (strength == 0){
        className = 'pwdBlankBar';
        message = "Too short";
    } else if (strength <= 0.2){
        className = 'pwdWeakBar';
        message = "Weak";
    } else if (strength <= 0.6){
        className = 'pwdFairBar';
        message = "Fair";
    } else{
        className = 'pwdStrengthBar';
        message = "Strong";
    }

    // update css and message
    var bar = document.getElementById("PasswordStrengthBar");
    bar.className = className;
    lbMessagePassword.SetValue(message);
}
function GetPasswordStrength(password) {
    if (password.length == 0) return -1;
    if (password.length < minPwdLength) return 0;

    var rate = 0;
    if (password.length >= strongPwdLength) rate++;
    if (password.match(/[0-9]/)) rate++;
    if (password.match(/[a-z]/)) rate++;
    if (password.match(/[A-Z]/)) rate++;
    if (password.match(/[!,@,#,$,%,^,&,*,?,_,~,\-,(,),\s,\[,\],+,=,\,,<,>,:,;]/)) rate++;
    return rate / 5;
}

function ConfirmedPassword_OnValidation(s, e) {
    if (tbPassword.GetValue() != tbConfirmedPassword.GetValue()) {
        e.isValid = false;
        e.errorText = "Passwords do not match";
    }
}