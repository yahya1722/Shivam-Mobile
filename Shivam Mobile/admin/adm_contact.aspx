<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/admin/adminsite.Master" AutoEventWireup="true" CodeBehind="adm_contact.aspx.cs" Inherits="Shivam_Mobile.admin.adm_contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         
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
            </style>
        
        
    <div style="margin:50px;">
    <center>
         <div class="container">
                        <div class="con">
                            <div class="col-sm-9">
                                <asp:TextBox ID="Textsearch" CssClass="form-control fc" placeholder="Search Mobile Number" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="Button1_Click"  />
                            </div>
                             <asp:Label ID="record" runat="server" ForeColor="Red" Text="Recond Not Found" Visible="False" Font-Bold="True" Font-Size="23px"></asp:Label>
                        <asp:Label ID="emp" runat="server" ForeColor="Red" Text="Please Enter Search Mobile Number" Visible="False" Font-Bold="True" Font-Size="23px"></asp:Label>

                            
                </div>
             </div>
                   

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="808px" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="text-center" Height="281px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
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
            <asp:TemplateField HeaderText="Message">
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Message") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" CommandArgument='<%# Bind("Id") %>' Text="Delete" OnCommand="btnDelete_Command1" CssClass="btn btn-danger" />
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
