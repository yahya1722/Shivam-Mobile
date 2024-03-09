<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminsite.Master" AutoEventWireup="true"  CodeBehind="addproduct.aspx.cs" Inherits="Shivam_Mobile.admin.addproduct" %>
  <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  </asp:Content>
  <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <head>
        <title>Add product</title>
      <style>
        .mp {
          margin-top: 50px;
          padding: 20px;
        }

        .ml {
          margin: 10px 40% 10px 40%;

        }

        .fc {
          max-width: 500px;
        }

        .fg {
          margin: 20px;
          align-items: center;
        }
      </style>
    </head>

    <body>
      <div class="container bg-light mp">
        <div class="ml text-center">
          <h1>Add Product</h1>
        </div>
        <section class="panel panel-default" style="margin:50px 0px 50px 80px;">

          <div class="panel-body">

            <form class="form-horizontal" role="form">

              <!-- catagory form-group // -->
              <div class="form-group d-flex fg">
                <label for="name" class="col-sm-3 control-label text-start h4">Select Category</label>
                <div class="col-sm-9 fc">
                  <asp:DropDownList ID="category" runat="server" Height="30px" Width="500px">
                    <asp:ListItem Value="">Select Your Category</asp:ListItem>
                    <asp:ListItem Value="Iphone">Iphone</asp:ListItem>
                    <asp:ListItem Value="Oneplus">Oeplus</asp:ListItem>
                    <asp:ListItem Value="Samsung">Samsung</asp:ListItem>
                    <asp:ListItem Value="Vivo">Vivo</asp:ListItem>
                    <asp:ListItem Value="Realme">Realme</asp:ListItem>
                  </asp:DropDownList>
                  <asp:RequiredFieldValidator ID="categoryValidator" runat="server" ControlToValidate="category"
                    InitialValue="" ErrorMessage="Please Select an Option" ForeColor="Red" Display="Dynamic"
                    SetFocusOnError="True" />
                </div>
              </div>

              <!-- name form-group // -->
              <div class="form-group d-flex fg">
                <label for="name" class="col-sm-3 control-label text-start h4"> Product Name</label>
                <div class="col-sm-9">
                  <asp:TextBox ID="productname" CssClass="form-control fc" runat="server"
                    placeholder="Enter Product Name"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="nameValidator" runat="server" ControlToValidate="productname"
                    ErrorMessage="Please Enter Name" ForeColor="Red" Display="Dynamic" SetFocusOnError="True">
                  </asp:RequiredFieldValidator>
                </div>
              </div>
              <!--imei form-group // -->
              <div class="form-group d-flex fg">
                <label for="name" class="col-sm-3 control-label text-start h4">Product IMEI </label>
                <div class="col-sm-9">
                  <asp:TextBox ID="productimei" CssClass="form-control fc" runat="server"
                    placeholder="Enter Product IMEI" MaxLength="15"
                    onkeypress="return(event.charCode >=48 && event.charCode<=57 || (event.charCode==8))" OnTextChanged="productimei_TextChanged"></asp:TextBox>                  
                  <asp:RequiredFieldValidator ID="ImeiValidator" runat="server" ControlToValidate="productimei"
                    ErrorMessage="Please Enter IMEI" ForeColor="Red" Display="Dynamic" SetFocusOnError="True">
                  </asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="imeiRegularValidator" runat="server"
                    ErrorMessage="Please Enter a 15 Digit IMEI" Display="Dynamic" ForeColor="Red"
                    ControlToValidate="productimei" ValidationExpression="^[0-9]{15}$" SetFocusOnError="True">
                  </asp:RegularExpressionValidator>

                </div>
              </div>
              <!--color form-group // -->
              <div class="form-group d-flex fg">
                <label for="name" class="col-sm-3 control-label text-start h4">Product Color </label>
                <div class="col-sm-9">
                  <asp:TextBox ID="productcolor" CssClass="form-control fc" runat="server"
                    placeholder="Enter Product Color"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="colorValidator" runat="server" ControlToValidate="productcolor"
                    ErrorMessage="Please Enter Color" ForeColor="Red" Display="Dynamic" SetFocusOnError="True">
                  </asp:RequiredFieldValidator>
                </div>
              </div>
              <!-- ram form-group // -->
              <div class="form-group d-flex fg">
                <label for="name" class="col-sm-3 control-label text-start h4">Product Ram </label>
                <div class="col-sm-9 ">
                  <asp:RadioButtonList ID="productram" CssClass="fc text-center" runat="server"
                    RepeatDirection="Horizontal" Width="1185px" Font-Bold="False">
                    <asp:ListItem Value="2 GB">2 GB</asp:ListItem>
                    <asp:ListItem Value="3 GB">3 GB</asp:ListItem>
                    <asp:ListItem Value="4 GB">4 GB</asp:ListItem>
                    <asp:ListItem Value="6 GB">6 GB</asp:ListItem>
                    <asp:ListItem Value="8 GB">8 GB</asp:ListItem>
                    <asp:ListItem Value="12 GB">12 GB</asp:ListItem>
                  </asp:RadioButtonList>
                  <asp:RequiredFieldValidator ID="ramValidator" runat="server" ControlToValidate="productram"
                    InitialValue="" ErrorMessage="Please Select Ram" ForeColor="Red" Display="Dynamic"
                    SetFocusOnError="True" />
                </div>
              </div>
              <!--rom form-group // -->

              <div class="form-group d-flex fg">
                <label for="name" class="col-sm-3 control-label text-start h4">Product Rom </label>
                <div class="col-sm-9 ">
                  <asp:RadioButtonList ID="productrom" CssClass="fc" runat="server" RepeatDirection="Horizontal"
                    Width="1185px">
                    <asp:ListItem Value="16 GB">16 GB</asp:ListItem>
                    <asp:ListItem Value="32 GB">32 GB</asp:ListItem>
                    <asp:ListItem Value="64 GB">64 GB</asp:ListItem>
                    <asp:ListItem Value="128 GB">128 GB</asp:ListItem>
                    <asp:ListItem Value="256 GB">256 GB</asp:ListItem>
                    <asp:ListItem Value="512 GB">512 GB</asp:ListItem>
                    <asp:ListItem Value="1 TB">1 TB</asp:ListItem>
                  </asp:RadioButtonList>
                  <asp:RequiredFieldValidator ID="romValidator" runat="server" ControlToValidate="productrom"
                    ErrorMessage="Please Select Rom" ForeColor="Red" Display="Dynamic" SetFocusOnError="True" />
                </div>
              </div>
              <!--qty form-group // -->
              <div class="form-group d-flex fg">
                <label for="name" class="col-sm-3 control-label text-start h4">Product Quantity </label>
                <div class="col-sm-9 input-group">
                  <asp:TextBox ID="productqty" CssClass="form-control fc text-center" runat="server"
                    placeholder="Enter Product Quantity" TextMode="Number" min="0"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="qtyValidator" runat="server" ControlToValidate="productqty"
                  ErrorMessage="Please Enter Quantity" ForeColor="Red" Display="Dynamic" SetFocusOnError="True">
                </asp:RequiredFieldValidator>
              </div>
              <!--price form-group // -->
              <div class="form-group d-flex fg">
                <label for="name" class="col-sm-3 control-label text-start h4">Product Price </label>
                <div class="col-sm-9 input-group">
                  <div class="input-group-text"><i class="fa-solid fa-indian-rupee-sign" style="color: #000000;"></i>
                  </div>
                  <asp:TextBox ID="productprice" CssClass="form-control fc text-center" runat="server"
                    placeholder="Enter Product Price"
                    onkeypress="return(event.charCode >=48 && event.charCode<=57 || (event.charCode==8))"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="priceValidator" runat="server" ControlToValidate="productprice"
                  ErrorMessage="Please Enter Price" ForeColor="Red" Display="Dynamic" SetFocusOnError="True">
                </asp:RequiredFieldValidator>

              </div>

              <!--description form-group // -->
              <div class="form-group d-flex fg">
                <label for="name" class="col-sm-3 control-label text-start h4">Product Description </label>
                <div class="col-sm-9">
                  <asp:TextBox ID="productdescription" CssClass="form-control fc" runat="server"
                    placeholder="Enter Product Description" TextMode="MultiLine" Rows="4"></asp:TextBox>
                </div>
              </div>

              <!--img form-group // -->
              <div class="form-group d-flex fg">
                <label for="name" class="col-sm-3 control-label text-start h4">Product Images </label>

                <div class="col-sm-3">
                  <asp:FileUpload ID="img1" runat="server" />
                  <asp:RequiredFieldValidator ID="imgValidator1" runat="server" ControlToValidate="img1"
                    ErrorMessage="Please Select Photo" ForeColor="Red" Display="Dynamic" SetFocusOnError="True" />
                </div>

                <div class="col-sm-3">
                  <asp:FileUpload ID="img2" runat="server" />
                  <asp:RequiredFieldValidator ID="imgValidator2" runat="server" ControlToValidate="img2"
                    ErrorMessage="Please Select Photo" ForeColor="Red" Display="Dynamic" SetFocusOnError="True" />

                </div>

                <div class="col-sm-3">
                  <asp:FileUpload ID="img3" runat="server" />
                  <asp:RequiredFieldValidator ID="imgValidator3" runat="server" ControlToValidate="img3"
                    ErrorMessage="Please Select Photo" ForeColor="Red" Display="Dynamic" SetFocusOnError="True" />


                </div>
              </div>

              <div class="form-group fg">
                <div class="" style="margin:40px 280px">
                  <asp:Button ID="add" CssClass="btn btn-primary" runat="server" Text="Add Product" Width="500px"
                    Font-Bold="True" Font-Size="25px" OnClick="add_Click" />
                </div>
              </div>
            </form>

          </div><!-- panel-body // -->
        </section><!-- panel// -->


      </div> <!-- container// -->
    </body>
  </asp:Content>