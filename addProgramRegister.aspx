<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addProgramRegister.aspx.cs" Inherits="loly_hub_0._2.addProgramRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:HiddenField ID="programID" runat="server" />
        <asp:Label ID="unameLabel" runat="server" Text="username" ></asp:Label>
        <input required="required" id="unametxt" runat="server" />
        <br />
        <asp:Label ID="pwLabel" runat="server" Text="PassWord"></asp:Label>
        <asp:TextBox ID="pwtxt" runat="server" TextMode="Password" autocomplete="off"></asp:TextBox>
       <br />
         <asp:Label ID="Mobile" runat="server" Text="Mobile"></asp:Label>
        <input  id="mobiletxt" required="required" runat="server" type="tel" />

        <br />
       
        <br />
        <asp:Button ID="submit" runat="server" Text="submit" OnClick="submit_Click" />
    
    </div>
    </form>

    <form id="otp" runat="server">
        <asp:HiddenField ID="hiddenPWD" runat="server" />
        <asp:Label ID="otplbl" runat="server" Text="otp"></asp:Label>
        <asp:TextBox ID="otptxt" runat="server" ></asp:TextBox>
         <asp:Button ID="otpbtn" runat="server" Text="submit" OnClick="otpbtn_Click" />
    </form>

     <asp:Label ID="messages" runat="server"></asp:Label>
</body>
</html>
