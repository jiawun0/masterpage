<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="masterpage.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="BrandContent" runat="server">
    登入頁面
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="NavbarLinks" runat="server">
    <ul class="navbar-nav ms-auto">
        <li class="nav-item mx-0 mx-lg-1">
            <asp:Button ID="HomeButton" runat="server" Text="首頁" OnClick="HomeButton_Click" />
            <%--<asp:Button ID="Button1" runat="server" CssClass="btn btn-primary rounded" Text="首頁" OnClick="HomeButton_Click" />--%>
        </li>
        <li class="nav-item mx-0 mx-lg-1">
            <asp:Button ID="LoginButton" runat="server" Text="登入" OnClick="LoginButton_Click" />
        </li>
        <li class="nav-item mx-0 mx-lg-1">
            <asp:Button ID="LogoutButton" runat="server" Text="登出" OnClick="LogoutButton_Click" />
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="SidebarBrandText" runat="server">
    <!-- 抓取目前登入者的username -->
    <asp:Label ID="Label1" runat="server" Text="目前登入者: "></asp:Label>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="DashboardText" runat="server">
    後台管理
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView_Login" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Realname" HeaderText="Realname" SortExpression="Realname" />
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Rank" HeaderText="Rank" SortExpression="Rank" />
            <asp:BoundField DataField="CreatDate" HeaderText="CreatDate" SortExpression="CreatDate" />
        </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectLogin %>" SelectCommand="SELECT * FROM [Login]"></asp:SqlDataSource>
</asp:Content>

<%--<asp:Content ID="Content7" ContentPlaceHolderID="ComponentsText1" runat="server">
    相簿
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="ComponentsText2" runat="server">
    影片
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="ComponentsText3" runat="server">
    Q&A
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="ComponentsText4" runat="server">
    連結
</asp:Content>--%>


