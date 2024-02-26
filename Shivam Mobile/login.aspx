<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="login.aspx.cs" Inherits="Shivam_Mobile.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
<style>
        * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Open Sans', sans-serif;
      background-color: #222;
    }

    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    .form-container {
      width: 600px;
      margin: 0 auto;
      padding: 50px;
      background-color: #333;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
      color: #fff;
    }

    h1 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 36px;
      color: #b38bff;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      margin-bottom: 10px;
      font-size: 18px;
    }

    .input {
      padding: 12px;
      border: none;
      border-radius: 5px;
      margin-bottom: 20px;
      font-size: 16px;
      color: #fff;
      width:100%;
      margin-top:2%;
      background-color: #555;
    }

    .button {
      padding: 10px;
      background-color: #b38bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 18px;
      width:100%;
      margin-top:8%;
      margin-bottom:3%;
      transition: background-color 0.2s ease-in-out;
    }

    .button:hover {
      background-color: #8c5fb2;
    }

    a {
      text-decoration: none;
      color: #b38bff;
      font-size: 18px;
      transition: color 0.2s ease-in-out;
    }

    a:hover {
      color: #8c5fb2;
    }

    p {
      text-align: center;
      margin: 8px;
    }
    
    
</style>


   
</head>
<body>
   <form id="form1" runat="server"> 
   <div class="container">
    <div class="form-container" id="login-form">
      <h1>Login</h1>
      <form>
        <label for="username">Email</label>
          <asp:TextBox ID="username" CssClass="input"  runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Email" ControlToValidate="username" SetFocusOnError="True" Display="Dynamic" ForeColor="Red" Font-Size="20px"></asp:RequiredFieldValidator>
          <br />        
          <label for="password" >Password</label>
          <asp:TextBox ID="password" CssClass="input" runat="server" TextMode="Password"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="password" SetFocusOnError="True" Display="Dynamic" ForeColor="Red" Font-Size="20px"></asp:RequiredFieldValidator>
          
          <asp:Button ID="login1" CssClass="button" runat="server" Text="Login" OnClick="login1_Click" />
      </form>
      <p>Don't have an account? <a href="register.aspx" >Sign up</a></p>
    </div>

    </div>
       </form>
</body>
</html>

