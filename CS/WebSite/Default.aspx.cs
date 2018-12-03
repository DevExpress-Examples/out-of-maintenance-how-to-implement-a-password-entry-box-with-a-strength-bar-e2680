using DevExpress.Web;
using System;

public partial class _Default : System.Web.UI.Page {

    protected void Page_Load(object sender, EventArgs e) {
    }

    protected void tbConfirmedPassword_Validation(object sender, ValidationEventArgs e) {
        if(e.IsValid && tbPassword.Text != tbConfirmedPassword.Text) {
            e.ErrorText = "Passwords do not match";
            e.IsValid = false;
        }

        if(e.IsValid)
            Response.Redirect("Complete.aspx");
    }
}
