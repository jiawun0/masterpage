<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="LinkCategoryFront.aspx.cs" Inherits="masterpage.LinkCategoryFront" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderTitle" runat="server">
    <asp:Label ID="Label_HeaderTitle" runat="server" Text="連結種類"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sidebar" runat="server">
    <!-- 抓取目前登入者的username -->
    <asp:Literal ID="Literal_someone" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" runat="server">
    <asp:Label ID="Label_title" runat="server" Text="連結種類都在這"></asp:Label>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content" runat="server">
    <asp:GridView ID="GridView_LinkCategoryFront" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" >
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="LinkFront.aspx?CategoryID={0}" DataTextField="CategoryName" HeaderText="CategoryName" />
                    <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" Visible="False" />
                    <asp:BoundField DataField="CategoryCreatTime" HeaderText="CategoryCreatTime" SortExpression="CategoryCreatTime" />
                </Columns>
            </asp:GridView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="body" runat="server">
</asp:Content>
