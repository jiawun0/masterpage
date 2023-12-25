<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="LinkFront.aspx.cs" Inherits="masterpage.LinkFront" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderTitle" runat="server">
    <asp:Label ID="Label_HeaderTitle" runat="server" Text="連結"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sidebar" runat="server">
    <!-- 抓取目前登入者的username -->
    <asp:Literal ID="Literal_someone" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" runat="server">
    <asp:Label ID="Label_title" runat="server" Text="連結小分支"></asp:Label>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content" runat="server">
    <table>
        <asp:Repeater ID="Repeater_link" runat="server">
            <itemtemplate>
                <%# Container.ItemIndex % 3 == 0 ? "<tr>" : "" %>
                <td>
                    <%--Id: <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("AlbumName") %>' /><br />--%>
                    <asp:Label ID="Label_LinkN" runat="server" Text='<%# Eval("LinkName") %>' />
                    <br />
                    <asp:Label ID="Label_LinkD" runat="server" Text='<%# Eval("LinkDescription") %>' />
                    <br />
                    <a href='<%# Eval("LinkURL") %>' target="_blank">
                        <img src='<%# GetRelativeImagePath(Eval("LinkThumbnail").ToString()) %>' width="100" height="100" />
                    </a>
                    <%--<img src='<%# Eval("AlbumPath") %>' width="100" height="100" />--%>
                    <%--<asp:Image ID="Image1" runat="server" Width="100" Height="100" ImageUrl='<%# GetRelativeImagePath(Eval("AlbumPath").ToString()) %>' /><br />--%>
                </td>
                <%# Container.ItemIndex % 3 == 2 || Container.ItemIndex == (Repeater_link.Items.Count - 1) ? "</tr>" : "" %>
            </itemtemplate>
        </asp:Repeater>
    </table>
    <br />
    <asp:Button ID="LinkBack" runat="server" Text="返回連結種類" style="height: 32px" OnClick="LinkBack_Click" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="body" runat="server">
</asp:Content>
