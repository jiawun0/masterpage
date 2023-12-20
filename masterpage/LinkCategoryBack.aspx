<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="LinkCategoryBack.aspx.cs" Inherits="masterpage.LinkCategoryBack" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderTitle" runat="server">
    <asp:Label ID="Label_HeaderTitle" runat="server" Text="連結種類後台"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sidebar" runat="server">
    <!-- 抓取目前登入者的username -->
    <asp:Literal ID="Literal_someone" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" runat="server">
    <asp:Label ID="Label_title" runat="server" Text="新增連結種類請填表"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label_LinkCategoryName" runat="server" Text="分類名稱: "></asp:Label>
    <br />
    <asp:TextBox ID="TextBox_LinkCategoryName" runat="server" Placeholder="請輸入分類名稱"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="CreateLinkCategoryBtn" runat="server" Text="新增連結分類" OnClick="CreateLinkCategoryBtn_Click" />
    <br />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content" runat="server">
    <asp:GridView ID="GridView_LinkCategoryBack" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCancelingEdit="GridView_LinkCategoryBack_RowCancelingEdit" OnRowDeleting="GridView_LinkCategoryBack_RowDeleting" OnRowEditing="GridView_LinkCategoryBack_RowEditing" OnRowUpdating="GridView_LinkCategoryBack_RowUpdating">
        <columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:TemplateField HeaderText="CategoryName" SortExpression="CategoryName">
                <edititemtemplate>
                    <asp:TextBox ID="TextBox_TemplateCN" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                </edititemtemplate>
                <itemtemplate>
                    <asp:Label ID="Label_TemplateCN" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                </itemtemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CategoryCreatTime" HeaderText="CategoryCreatTime" SortExpression="CategoryCreatTime" ReadOnly="True" />
            <asp:TemplateField HeaderText="LinkBack">
                <itemtemplate>
                    <asp:Button ID="BtnRedirectLinkBack" runat="server" Text="連結後台" CommandArgument='<%# Eval("Id") %>' CommandName="RedirectToLinkBack" OnClick="BtnRedirect_Click" />
                </itemtemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
        </columns>
    </asp:GridView>
    <deleteparameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </deleteparameters>
    <insertparameters>
        <asp:Parameter Name="CategoryName" Type="String" />
        <asp:Parameter Name="CategoryCreatTime" Type="DateTime" />
    </insertparameters>
    <updateparameters>
        <asp:Parameter Name="CategoryName" Type="String" />
        <asp:Parameter Name="CategoryCreatTime" Type="DateTime" />
        <asp:Parameter Name="Id" Type="Int32" />
    </updateparameters>
    </asp:SqlDataSource>
        </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="body" runat="server">
</asp:Content>
