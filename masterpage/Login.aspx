<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="masterpage.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BrandContent" runat="server">
    登入頁面
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NavbarLinks" runat="server">
    <ul class="navbar-nav ms-auto">
        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="index.aspx">首頁</a></li>
        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="login.aspx">登入</a></li>
        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="logout.aspx">登出</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarBrandText" runat="server">
    <!-- 抓取目前登入者的username -->
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="DashboardText" runat="server">
    後台管理
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="ComponentsText1" runat="server">
    相簿
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="ComponentsText2" runat="server">
    影片
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="ComponentsText3" runat="server">
    QA
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="ComponentsText4" runat="server">
    連結
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
