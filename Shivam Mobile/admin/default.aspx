<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Shivam_Mobile.admin.WebForm1" %>

    <!DOCTYPE html>

    <html>

    <head runat="server">
        <title>Admin Login Page</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link href="../Bootstrap/Css/5.0.2.bootstrap.min.css" rel="stylesheet" />
        <script src="../Bootstrap/js/jquery-3.2.1.slim.min.js"></script>
        <script src="../Bootstrap/js/js_bootstrap.min.js"></script>
        <script src="../Bootstrap/js/popperjs_core@2.9.2_dist_umd_popper.min.js"></script>
        <link href="../Fontawesome/css/all.css" rel="stylesheet" />
        <link href="main.css" rel="stylesheet" />
        <style>
            a {
                text-decoration: none;
            }

            .login-page {
                width: 100%;
                height: 100vh;
                display: inline-block;
                display: flex;
                align-items: center;
            }

            .form-right i {
                font-size: 100px;
            }

            .lg-con {
                height: 400px;
            }

            .mr {
                margin-top: 20px;
                margin-bottom: 20px;
            }
        </style>
    </head>


    <body>
        <form id="form1" runat="server">

            <div class="login-page bg-light">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <h3 class="mb-3">Login Now</h3>
                            <div class="bg-white shadow rounded">
                                <div class="row lg-con">
                                    <div class="col-md-7 pe-0">
                                        <div class="form-left h-100 py-5 px-5">
                                            <form class="row g-4">
                                                <div class="col-12">
                                                    <label>Username<span class="text-danger">*</span></label>
                                                    <div class="input-group mr">
                                                        <div class="input-group-text"><i class="fa-solid fa-user" style="color: #000000;"></i>
                                                        </div>
                                                        <asp:TextBox ID="userid" runat="server" CssClass="form-control"
                                                            placeholder="Enter Username"
                                                            OnTextChanged="userid_TextChanged" OnDataBinding="Page_Load"></asp:TextBox>
                                                        
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="user_id" runat="server"
                                                        ErrorMessage="Enter Your User Id" ControlToValidate="userid"
                                                        Display="Dynamic" ForeColor="Red">
                                                    </asp:RequiredFieldValidator>

                                                </div>

                                                <div class="col-12">
                                                    <label>Password<span class="text-danger">*</span></label>
                                                    <div class="input-group mr">
                                                        <div class="input-group-text"><i class="fa-solid fa-lock" style="color: #000000;"></i>
                                                        </div>
                                                        <asp:TextBox ID="userpass" runat="server"
                                                            CssClass="form-control" placeholder="Enter Password"
                                                            TextMode="Password"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="user_pass" runat="server"
                                                        ErrorMessage="Enter Your Password" ControlToValidate="userpass"
                                                        Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </div>

                                                <div class="col-sm-12">
                                                    <a href="#" class="float-end text-primary">Forgot Password?</a>
                                                </div>

                                                <div class="col-12">
                                                    <asp:Button ID="l_Button" runat="server"
                                                        CssClass="btn btn-primary px-4 float-end mt-5" Text="Login"
                                                        OnClick="l_Button_Click" Width="100%" />
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-md-5 ps-0 d-none d-md-block ">
                                        <div class="form-right h-100 text-white text-center pt-5" style="background-color:#2e2b2b; margin-right:0px;">
                                            <img src="../Icon/logo.png" alt="Shivam Mobile" height="100%" style="width:100%;" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
              </div>
        </form>
    </body>
 </html>