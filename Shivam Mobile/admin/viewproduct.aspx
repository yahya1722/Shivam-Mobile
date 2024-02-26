<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminsite.Master" EnableEventValidation="false"
    AutoEventWireup="true" CodeBehind="viewproduct.aspx.cs" Inherits="Shivam_Mobile.admin.viewproduct" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <html>

        <head>
            <title>Update product</title>
            <style>
                .fc {
                    max-width: 400px;
                }

                .con {
                    margin-bottom: 50px;
                    padding-top: 30px;
                    /*text-transform: uppercase;*/
                }

                .form-control {
                    display: inline;
                }
                img{
                    Height:70px;
                    Width:auto;

                }
            </style>
        </head>

        <body>
            <div style="margin:50px 10px;">
                <center>
                    <div class="container">
                        <div class="con">
                            <div class="col-sm-9">
                                <asp:TextBox ID="Textsearch" CssClass="form-control fc" placeholder="Search " runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="Button1_Click" />
                            </div>
                              <asp:Label ID="record" runat="server" ForeColor="Red" Text="Recond Not Found" Visible="False" Font-Bold="True" Font-Size="23px"></asp:Label>
                        <asp:Label ID="emp" runat="server" ForeColor="Red" Text="Please Enter Search Text" Visible="False" Font-Bold="True" Font-Size="23px"></asp:Label>

                        </div>
                        
                    </div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3"
                        CssClass="text-center" ForeColor="Black" GridLines="Vertical" Height="242px" Width="1291px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IMEI">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Imei") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Color">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Color") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ram">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Ram") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Rom">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Rom") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Qty">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Qty") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Description") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Image1">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Image1") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Image2">
                                <ItemTemplate>
                                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# Bind("Image2") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Image3">
                                <ItemTemplate>
                                    <asp:Image ID="Image3" runat="server" ImageUrl='<%# Bind("Image3") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="Edit" runat="server" Text="Edit" CssClass="btn btn-secondary"
                                        CommandArgument='<%# Bind("Id") %>'
                                        OnClick="Edit_Click" OnCommand="Edit_Command"  />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="Delete" runat="server" CommandArgument='<%# Bind("Id") %>'
                                        OnCommand="Delete_Command1" Text="Delete" CssClass="btn btn-danger"
                                        OnClick="Delete_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </center>
            </div>

        </body>

        </html>
    </asp:Content>