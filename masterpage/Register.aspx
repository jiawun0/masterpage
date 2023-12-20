<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="masterpage.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderTitle" runat="server">
    <asp:Label ID="Label_HeaderTitle" runat="server" Text="註冊頁面"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sidebar" runat="server">
    <!-- 抓取目前登入者的username -->
    <asp:Literal ID="Literal_someone" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" runat="server">
    <asp:Label ID="Label_title" runat="server" Text="加入我們共同探索"></asp:Label>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content" runat="server">
    <asp:Label ID="Label_RealName" runat="server" Text="姓名: "></asp:Label>
    <asp:TextBox ID="TextBox_RealName" runat="server" Placeholder="請輸入真實姓名"></asp:TextBox>
    <br />
    <asp:Label ID="Label_Username" runat="server" Text="帳號: "></asp:Label>
    <asp:TextBox ID="TextBox_Username" runat="server" Placeholder="請輸入帳號"></asp:TextBox>
    <br />
    <asp:Label ID="Label_Password" runat="server" Text="密碼: "></asp:Label>
    <asp:TextBox ID="TextBox_Password" runat="server" Placeholder="請輸入6位以上字元" TextMode="Password"></asp:TextBox>
    <br />
    <asp:Label ID="Label_pwCheck" runat="server" Text="確認密碼: "></asp:Label>
    <asp:TextBox ID="TextBox_pwCheck" runat="server" Placeholder="請再次輸入密碼" TextMode="Password"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button_Register" runat="server" Text="確認註冊" OnClick="Button_Register_Click"  />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="body" runat="server">
</asp:Content>
