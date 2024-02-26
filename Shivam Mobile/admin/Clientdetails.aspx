<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminsite.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Clientdetails.aspx.cs" Inherits="Shivam_Mobile.admin.Clientdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <header>
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
        </header>
   <div style="margin:50px;">
    <center>
     
    <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" CssClass="text-center" Height="357px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Img") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label7" runat="server" Text='<%# Bind("MName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ram/Rom">
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Ram") %>'></asp:Label>
                    /<asp:Label ID="Label9" runat="server" Text='<%# Bind("Rom") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Color">
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Color") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mobile">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    ,<asp:Label ID="Label11" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                    ,<asp:Label ID="Label12" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                    ,<asp:Label ID="Label13" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                    ,<asp:Label ID="Label14" runat="server" Text='<%# Bind("Zipcode") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Payment Method">
                <ItemTemplate>
                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("PMethod") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CommandArgument='<%# Bind("Id") %>' Text="Delete"  CssClass="btn btn-danger" OnCommand="btnDelete_Command" />
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
</asp:Content>
