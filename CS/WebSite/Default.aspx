<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxDataView"
    TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxGlobalEvents"
    TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to implement a password entry box with a strength bar</title>
    <link rel="Stylesheet" href="Styles.css" />

    <script type="text/javascript" src="Scripts.js"></script>

</head>
<body>
    <div>
        <h2>
            Create account</h2>
        <form id="createAccount" runat="server">
            <div style="height: 150px">
                <table border="0" cellspacing="0px" cellpadding="5px">
                    <tbody valign="top">
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="lbLogin" runat="server" Text="Login Name:" AssociatedControlID="tbLogin">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="tbLogin" runat="server" Width="200px">
                                    <ValidationSettings SetFocusOnError="True" ErrorTextPosition="Bottom" ErrorDisplayMode="Text"
                                        ValidateOnLeave="False" Display="Dynamic">
                                        <RequiredField IsRequired="True" ErrorText="Required field cannot be left empty" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="lbPassword" runat="server" Text="Choose password:" AssociatedControlID="tbPassword">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="tbPassword" runat="server" Width="200px" Password="True" ClientInstanceName="tbPassword">
                                    <ClientSideEvents KeyUp="UpdateIndicator" TextChanged="UpdateIndicator" />
                                    <ValidationSettings SetFocusOnError="True" ErrorTextPosition="Bottom" ErrorDisplayMode="Text"
                                        ValidateOnLeave="False" Display="Dynamic">
                                        <RegularExpression ValidationExpression=".{3,}" ErrorText="Must have at least 3 characters" />
                                        <RequiredField IsRequired="True" ErrorText="Required field cannot be left empty" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                                <div style="color: #A0A0A0; margin-left: 4px; margin-top: 0px">
                                    <dx:ASPxLabel ID="lbPasswordLength" runat="server" Text="Minimum 3 characters in length">
                                    </dx:ASPxLabel>
                                </div>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="lbMessagePassword" ClientInstanceName="lbMessagePassword" runat="server"
                                    Text="Empty">
                                </dx:ASPxLabel>
                                <table id="PasswordStrengthBar" class="pwdBlankBar" border="0" cellspacing="0" cellpadding="0"
                                    style="height: 4px; width: 220px">
                                    <tbody>
                                        <tr>
                                            <td id="PositiveBar" class="positiveBar">
                                            </td>
                                            <td id="NegativeBar" class="negativeBar">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="lbConfirmedPassword" runat="server" Text="Re-enter password:" AssociatedControlID="tbConfirmedPassword">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="tbConfirmedPassword" runat="server" Password="True" Width="200px"
                                    OnValidation="tbConfirmedPassword_Validation">
                                    <ClientSideEvents Validation="ConfirmedPassword_OnValidation" />
                                    <ValidationSettings SetFocusOnError="True" EnableCustomValidation="True" ErrorTextPosition="Bottom"
                                        ErrorDisplayMode="Text" ValidateOnLeave="False" Display="Dynamic">
                                        <RequiredField IsRequired="True" ErrorText="Required field cannot be left empty" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div style="margin-top: 5px">
                <dx:ASPxButton ID="btRegister" runat="server" Text="Register me" Width="120px">
                </dx:ASPxButton>
            </div>
        </form>
    </div>
</body>
</html>
