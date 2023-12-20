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
    <asp:Literal ID="Literal_someone" runat="server"></asp:Literal>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView_Login" runat="server" AutoGenerateColumns="False" DataKeyNames="Id">
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

<asp:Content ID="Content7" ContentPlaceHolderID="Title" runat="server">
    <asp:Label ID="Label_title" runat="server" Text="登入知道大小事"></asp:Label>
</asp:Content>

<asp:Content ID="Content8" ContentPlaceHolderID="Welcome" runat="server">
    <asp:Label ID="Label_content" runat="server" Text="請填寫資料"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label_username" runat="server" Text="帳號:"></asp:Label>
            <asp:TextBox ID="TextBox_Username" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label_password" runat="server" Text="密碼:"></asp:Label>
            <asp:TextBox ID="TextBox_Password" runat="server" TextMode="Password" ></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button_login" runat="server" Text="登入" style="height: 32px" OnClick="Button_login_Click" />
    &nbsp; &nbsp; &nbsp;<asp:Button ID="Button_loginnew" runat="server" Text="註冊新帳號" style="height: 32px" OnClick="Button_loginnew_Click" />
</asp:Content>



<%--這個刪掉有問題--%>
<asp:Content ID="Content6" ContentPlaceHolderID="DashboardText" runat="server">
</asp:Content>

<%--<asp:Content ID="Content" ContentPlaceHolderID="ComponentsText1" runat="server">
    相簿
</asp:Content>

<asp:Content ID="Content" ContentPlaceHolderID="ComponentsText2" runat="server">
    影片
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="ComponentsText3" runat="server">
    Q&A
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="ComponentsText4" runat="server">
    連結
</asp:Content>--%>


