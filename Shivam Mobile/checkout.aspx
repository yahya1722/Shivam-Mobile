<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Shivam_Mobile.checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Bootstrap/Css/5.0.2.bootstrap.min.css" rel="stylesheet" />
    <script src="Bootstrap/js/5.0.2_dist_js_bootstrap.bundle.min.js"></script>
    <script src="Bootstrap/js/jquery-3.2.1.slim.min.js"></script>
    <script src="Bootstrap/js/js_bootstrap.min.js"></script>
    <script src="Bootstrap/js/popperjs_core@2.9.2_dist_umd_popper.min.js"></script>
    <link href="Fontawesome/css/all.css" rel="stylesheet" />
    <style>
        .con {
            margin-bottom: 20px;
            padding-top: 30px;
            text-align: center;
            text-transform: uppercase;
        }

        .map-container {
            overflow: hidden;
            padding-bottom: 56.25%;
            position: relative;
            height: 0;
        }

        .map-container iframe {
            left: 0;
            top: 0;
            height: 100%;
            width: 100%;
            position: absolute;
        }

        .star {

            color: #e02b27;
            font-size: 1.2rem;
            margin: 0 0 0 5px;
        }
       label{
           margin-bottom:0.5rem;
       }
       .form-group{
           margin-bottom:1rem;
       }
       .in{
           max-width:500px;

       }
       body{
              background-color: #f5f3ea;
       }
       label{
           margin:10px;
       }
       .lb{
           margin-left:0px;
       }
       .pi{
           width:80px;
           margin-left:50px;
       }
       
    
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
     <section class="vh-100" >
    <div class="container h-100" style="max-width:1450px;">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col" style="margin:2%;">
  
          <div class="card mb-4">
            <div class="card-body p-4">
  
              <div class="row align-items-center">
                <div class="col-md-2">
                    <asp:Image ID="Image1" CssClass="img-fluid pi" runat="server" />
                  </div>
                <div class="col-md-2 d-flex justify-content-center">
                  <div>
                    <p class="small text-muted mb-4 pb-2">Name</p>
                      <asp:Label ID="lck" CssClass="lead fw-normal mb-0" runat="server" ></asp:Label>
                      <asp:Label ID="lnm" CssClass="lead fw-normal mb-0" runat="server"> </asp:Label>
                      
                  </div>
                </div>
                <div class="col-md-2 d-flex justify-content-center">
                  <div>
                    <p class="small text-muted mb-4 pb-2">Ram</p>
                      <asp:Label ID="lram" CssClass="lead fw-normal mb-0" runat="server"></asp:Label>
                  </div>
                </div>
                <div class="col-md-2 d-flex justify-content-center">
                  <div>
                    <p class="small text-muted mb-4 pb-2">Rom</p>
                     <asp:Label ID="lrom" CssClass="lead fw-normal mb-0" runat="server"></asp:Label>
                  </div>
                </div>
                <div class="col-md-2 d-flex justify-content-center">
                  <div>
                    <p class="small text-muted mb-4 pb-2">Color</p>
                      <asp:Label ID="lcolor" CssClass="lead fw-normal mb-0" runat="server"></asp:Label>
                  </div>
                </div>
                <div class="col-md-2 d-flex justify-content-center">
                  <div>
                    <p class="small text-muted mb-4 pb-2">Price</p>
                    <span class="lead fw-normal mb-0"">₹</span><asp:Label ID="lprice" CssClass="lead fw-normal mb-0" runat="server"></asp:Label><span class="lead fw-normal mb-0">.00</span>
                    </div>
                </div>
              </div>
  
            </div>
          </div>
  <div class="row">
          <div class="card mb-5 col-lg-6" style="height: fit-content;"  >
            <div class="card-body p-4" style="margin-left:3%">
  
              <h2 class="mb-4">SHIPPING ADDRESS

 </h2>
                <form id="contactForm" method="post" action="#">
                    <div class="form-group">
                        <label for="name" class="lb">Name <span class="star">*</span></label>
                        <asp:TextBox ID="name" name="name" CssClass="form-control in"  runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="Namevalidater" runat="server" ErrorMessage="Please Enter Name" SetFocusOnError="True" Display="Dynamic" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="email" class="lb">Email <span class="star">*</span></label>
                        <asp:TextBox ID="email" name="email" CssClass="form-control in" runat="server" TextMode="Email" ViewStateMode="Disabled"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EmailFieldValidator" runat="server" ErrorMessage="Please Enter Email" ControlToValidate="email" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="EmailRegularvalidetor" runat="server" ErrorMessage="Invalid Email Format" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" SetFocusOnError="True"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="mobile" class="lb">Mobile <span class="star">*</span></label>
                        <asp:TextBox ID="mobile" Font-Names="" CssClass="form-control in"   runat="server" TextMode="Phone" MaxLength="10" onkeypress="return(event.charCode >=48 && event.charCode<=57 || (event.charCode==8))"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="mobileFieldValidator" runat="server" ErrorMessage="Please Enter Mobile Number" Display="Dynamic" ControlToValidate="mobile" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="mobileRegularValidator" runat="server" ErrorMessage="Please Enter a Valid Mobile Number." Display="Dynamic" ForeColor="Red" ControlToValidate="mobile" ValidationExpression="^[0-9]{9,10}$" SetFocusOnError="True"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label for="address" class="lb">Delivery Address<span class="star">*</span></label>
                        <asp:TextBox ID="address" name="message" CssClass="form-control in"  runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Mobile Number" Display="Dynamic" ControlToValidate="address" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        
                    </div>
                    <div class="form-group">
                        <label for="country" class="lb">Country <span class="star">*</span></label>
                        <asp:TextBox ID="country" name="ctr" CssClass="form-control in"  runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Country Name" SetFocusOnError="True" Display="Dynamic" ControlToValidate="country" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                   <div class="form-group">
                        <label for="state" class="lb">State <span class="star">*</span></label>
                        <asp:TextBox ID="state" name="state" CssClass="form-control in"  runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter State" SetFocusOnError="True" Display="Dynamic" ControlToValidate="state" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="City" class="lb">City <span class="star">*</span></label>
                        <asp:TextBox ID="city" name="city" CssClass="form-control in"  runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter City" SetFocusOnError="True" Display="Dynamic" ControlToValidate="city" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="zip" class="lb">Zipcode <span class="star">*</span></label>
                        <asp:TextBox ID="zip" name="zip" CssClass="form-control in"  runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter zip" SetFocusOnError="True" Display="Dynamic" ControlToValidate="zip" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <asp:Button ID="submit" CssClass="btn btn-primary" runat="server" Text="Submit" Width="100px" OnClick="submit_Click"  />
                </form>
            
  
            </div>
          </div>

            <div class="card mb-5 col-lg-5"style="margin-left:3%; width:47%; height: fit-content;" >
                <div class="card-body p-4" style="margin-left: 3%">

                    <h2 class="mb-4">PAYMENT METHOD</h2>
                    <form id="" method="post" action="#">
                        <asp:RadioButtonList ID="pmethod" runat="server" Font-Size="20px">
                            <asp:ListItem Selected="True" Value="cash on delivery">Cash on Delivery</asp:ListItem>
                            <asp:ListItem Enabled="False">Net Banking </asp:ListItem>
                            <asp:ListItem Enabled="False">Credit/Debit/ATM Card</asp:ListItem>
                            <asp:ListItem Enabled="False">UPI</asp:ListItem>
                        </asp:RadioButtonList>
                    </form>

                </div>                 
            </div>
      

                
  </div>
        </div>
      </div>
    </div>
  </section>
        </form>
    
</body>
</html>
