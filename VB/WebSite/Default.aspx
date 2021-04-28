<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>How to implement a password entry box with a strength bar</title>
    <link rel="Stylesheet" href="Styles.css" />
    <script type="text/javascript" src="Scripts.js"></script>
</head>
<body>
    <div>
        <h2>Create account</h2>
        <form id="createAccount" runat="server">
            <div style="height: 150px">
                <table border="0">
                    <tbody>
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
                                <table id="PasswordStrengthBar" class="pwdBlankBar" border="0" style="height: 4px; width: 220px">
                                    <tbody>
                                        <tr>
                                            <td id="PositiveBar" class="positiveBar"></td>
                                            <td id="NegativeBar" class="negativeBar"></td>
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