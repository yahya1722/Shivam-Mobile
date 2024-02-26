<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true"
    CodeBehind="Product.aspx.cs" Inherits="Shivam_Mobile.Oneplus" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <header>
            <style>
                .container-fluid {
                    max-width: 1400px;
                }

                .card {
                    background: #fff;
                    box-shadow: 0 6px 10px rgba(0, 0, 0, .08), 0 0 6px rgba(0, 0, 0, .05);
                    transition: .3s transform cubic-bezier(.155, 1.105, .295, 1.12), .3s box-shadow, .3s -webkit-transform cubic-bezier(.155, 1.105, .295, 1.12);
                    border: 0;
                    border-radius: 1rem;
                }

                .card-img,
                .card-img-top {
                    border-top-left-radius: calc(1rem - 1px);
                    border-top-right-radius: calc(1rem - 1px);
                }


                .card h5 {
                    /*overflow: hidden;*/
                    height: 36px;
                    font-weight: 380;
                    font-size: 1rem;
                    text-align: center;
                }

                .card h5 a {
                    color: black;
                    text-decoration: none;
                }

                .card-img-top {
                    width: 100%;
                    min-height: 250px;
                    max-height: 250px;
                    object-fit: contain;
                }

                .card:hover {
                    transform: scale(1.02);
                    box-shadow: 0 10px 20px rgba(0, 0, 0, .12), 0 4px 8px rgba(0, 0, 0, .06);
                }

                /* Centered text */
                .label-top {
                    position: absolute;
                    background-color: var(--label-index);
                    color: #fff;
                    top: 8px;
                    right: 8px;
                    padding: 5px 10px 5px 10px;
                    font-size: .7rem;
                    font-weight: 600;
                    border-radius: 3px;
                    text-transform: uppercase;
                }

                .bold-btn {
                    font-size: 1rem;
                    font-weight: 500;
                    text-transform: uppercase;
                    /*padding: 5px 50px 5px 50px;*/
                }


                @media (max-width: 1025px) {
                    .btn {
                        padding: 5px 40px 5px 40px;
                    }
                }

                @media (max-width: 250px) {
                    .btn {
                        padding: 5px 30px 5px 30px;
                    }
                }


                .btn-check-focus+.btn-warning,
                .btn-warning-p:focus {
                    background: var(--btnbghover);
                    color: var(--btnfontcolorhover);
                    /* box-shadow: -1px 6px 13px rgba(255, 150, 43, 0.35); */

                }

                .btn-warning:active:focus {
                    box-shadow: 0 0 0 0.25rem var(--btnactivefs);
                }

                .btn-warning:active {
                    background: var(--btnbghover);
                    color: var(--btnfontcolorhover);
                    /* box-shadow: -1px 6px 13px rgba(255, 150, 43, 0.35); */
                }

                .modal-dialog {
                    max-width: 80%;
                    margin: 4% auto;
                }

                .im1 {

                    object-fit: contain;
                    max-height: 400px;
                    min-height: 400px;
                    width:420px;
                }
            </style>
        </header>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         
             
        <main class="container-fluidz bg-trasparent my-4 p-3" >
           
            <asp:DataList ID="dlProducts" runat="server" RepeatColumns="4" RepeatLayout="Flow"
                CssClass="row row-cols-1 row-cols-xs-2 row-cols-sm-2 row-cols-lg-4 g-3" RepeatDirection="Horizontal"
                OnSelectedIndexChanged="dlProducts_SelectedIndexChanged">
                <ItemTemplate>
                    <div class="col">
                        <div class="card h-100 shadow-sm">
                            <div class="m-2">
                             <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>                                                         
                             --%>  <asp:ImageButton ID="ImageButton1" CssClass="card-img-top"
                                    ImageUrl='<%# Bind("Image1") %>' CommandArgument='<%# Bind("Id") %>' runat="server"
                                    OnCommand="ImageButton1_Command" OnClick="ImageButton1_Click" /> 
                              <%--  </ContentTemplate>
                            </asp:UpdatePanel>
                              --%>    
                            </div>
                            <div class="card-body">
                                <h5 class="card-title" style="font-size:19px; font-weight:490;">
                                    <asp:Label ID="catogry" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                                    &nbsp;<asp:Label ID="name" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                    &nbsp;(<asp:Label ID="color" runat="server" Text='<%# Bind("Color") %>'></asp:Label>
                                    <asp:Label ID="ram" runat="server" Text='<%# Bind("Ram") %>'></asp:Label>,
                                    <asp:Label ID="rom" runat="server" Text='<%# Bind("Rom") %>'></asp:Label>)
                                </h5>
                                <div class="clearfix mb-3 text-center">
                                    <h3>
                                        ₹<asp:Label ID="price" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                        .00

                                </div>
                                <div class="d-flex gap-2 my-3">
                                   <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>--%>
                                    <asp:Button ID="ck" CssClass="btn btn-warning bold-btn" runat="server" Text=" add to cart" Font-Size="20px" CommandArgument='<%# Bind("Id") %>' OnCommand="ck_Command" Width="50%"  />
                                     <asp:Button ID="Button1" CssClass="btn btn-success bold-btn" runat="server" Text="Buy Now" Font-Size="20px" Width="50%" CommandArgument='<%# Bind("Id") %>' OnCommand="Button1_Command"/>                                  
                                
                                    <%-- </ContentTemplate>
                            </asp:UpdatePanel>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
                
        </main>
         <%--model popup--%>
        <div class="modal" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Modal content goes here -->
                        <section class="py-5">
                            <div class="container px-4 px-lg-5">
                                <div class="row gx-4 gx-lg-5 align-items-center">
                                    <div class="col-md-5">
                                        <%--slider--%>
                                            <div id="carouselExampleControls" class="carousel slide  mb-5 mb-md-0 h-25"
                                                data-bs-ride="carousel">
                                                <div class="carousel-inner">
                                                    <div class="carousel-item active">
                                                        <asp:Image ID="Image1" CssClass="d-block im1" runat="server" />
                                                    </div>
                                                    <div class="carousel-item">
                                                        <asp:Image ID="Image2" CssClass="d-block im1" runat="server" />
                                                    </div>
                                                    <div class="carousel-item">
                                                        <asp:Image ID="Image3" CssClass="d-block  im1" runat="server" />
                                                    </div>
                                                </div>
                                                <button class="carousel-control-prev" type="button"
                                                    data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                                    <span class="fa-solid fa-chevron-left fa-2xl"
                                                        style="color: #000000;" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Previous</span>
                                                </button>
                                                <button class="carousel-control-next" type="button"
                                                    data-bs-target="#carouselExampleControls" data-bs-slide="next"
                                                    style="color: #000000;">
                                                    <span class="fa-solid fa-chevron-right fa-2xl"
                                                        style="color: #000000;" aria-hidden="true"></span>
                                                    <span class="visually-hidden">Next</span>
                                                </button>
                                            </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="h2 fw-bolder">
                                            <asp:Label ID="cat" runat="server"></asp:Label>
                                            <asp:Label ID="name" runat="server"></asp:Label>
                                            <label class="h4">(</label><asp:Label ID="clr" CssClass="h4" runat="server"></asp:Label>
                                            <asp:Label ID="ram" CssClass="h4" runat="server"></asp:Label><label
                                                class="h4">)</label>
                                            <label class="h4">(</label><asp:Label ID="rom" CssClass="h4" runat="server"></asp:Label>
                                            <label class="h4">RAM)</label>
                                        </div>

                                        <div class="fs-3 mb-5" style="font-weight:700;">
                                            ₹<asp:Label ID="price" runat="server"></asp:Label>.00
                                        </div>

                                        <p class="lead">
                                            <asp:Label ID="descripson" runat="server" Font-Size="25px"></asp:Label>
                                        </p>
                                        <div class="d-flex">
                                             <asp:Button ID="ck1" CssClass="btn btn-warning bold-btn" runat="server" Text="add to cart" Font-Size="20px" Width="250px" OnClick="ck1_Click" />
                                            
                                        </div>
                                   </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>