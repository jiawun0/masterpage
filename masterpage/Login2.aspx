﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="masterpage.Login2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderTitle" runat="server">
    <asp:Label ID="Label_HeaderTitle" runat="server" Text="登入頁面"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sidebar" runat="server">
    <!-- 抓取目前登入者的username -->
    <asp:Literal ID="Literal_someone" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" runat="server">
    <asp:Label ID="Label_title" runat="server" Text="登入知道大小事"></asp:Label>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content" runat="server">
    <asp:Label ID="Label_content" runat="server" Text="請填寫資料"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label_username" runat="server" Text="帳號:"></asp:Label>
    <asp:TextBox ID="TextBox_Username" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label_password" runat="server" Text="密碼:"></asp:Label>
    <asp:TextBox ID="TextBox_Password" runat="server" TextMode="Password"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button_login" runat="server" Text="登入" Style="height: 32px" OnClick="Button_login_Click" />
    &nbsp; &nbsp; &nbsp;<asp:Button ID="Button_loginnew" runat="server" Text="註冊新帳號" Style="height: 32px" OnClick="Button_loginnew_Click" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="body" runat="server">
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
