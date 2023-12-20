<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="masterpage.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderTitle" runat="server">
    <asp:Label ID="Label_HeaderTitle" runat="server" Text="首頁頁面"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sidebar" runat="server">
    <!-- 抓取目前登入者的username -->
    <asp:Literal ID="Literal_someone" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" runat="server">
    <asp:Label ID="Label_title" runat="server" Text="首頁目前維修中"></asp:Label>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="body" runat="server">
</asp:Content>
