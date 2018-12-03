using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {

    protected void Page_Load(object sender, EventArgs e) {
    }

    protected void tbConfirmedPassword_Validation(object sender, DevExpress.Web.ValidationEventArgs e) {
        if(e.IsValid && tbPassword.Text != tbConfirmedPassword.Text) {
            e.ErrorText = "Passwords do not match";
            e.IsValid = false;
        }

        if(e.IsValid)
            Response.Redirect("Complete.aspx");
    }
}
