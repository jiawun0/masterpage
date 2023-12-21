<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="LinkBack.aspx.cs" Inherits="masterpage.LinkBack" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderTitle" runat="server">
    <asp:Label ID="Label_HeaderTitle" runat="server" Text="連結後台"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Sidebar" runat="server">
    <!-- 抓取目前登入者的username -->
    <asp:Literal ID="Literal_someone" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="title" runat="server">
    <asp:Label ID="Label_Link" runat="server" Text="新增連結請填表"></asp:Label>
    <br />
    <asp:Label ID="Label_LinkName" runat="server" Text="連結名稱: "></asp:Label>
    <br />
    <asp:TextBox ID="TextBox_LinkName" runat="server" Placeholder="請輸入連結名稱"></asp:TextBox>
    <br />
    <asp:Label ID="Label_LinkDescription" runat="server" Text="連結描述: "></asp:Label>
    <br />
    <asp:TextBox ID="TextBox_LinkDescription" runat="server" Placeholder="請輸入連結描述"></asp:TextBox>
    <br />
    <asp:Label ID="Label_LinkURL" runat="server" Text="連結網址: "></asp:Label>
    <br />
    <asp:TextBox ID="TextBox_LinkURL" runat="server" Placeholder="請輸入連結完整網址"></asp:TextBox>
    <br />
    <asp:Label ID="Label_LinkThumbnail" runat="server" Text="選取縮圖: "></asp:Label>
    <br />
    <asp:FileUpload ID="FileUpload_LinkT" runat="server" />
    <br />
    <asp:Button ID="UploadBtn" runat="server" Text="上傳" OnClick="UploadBtn_Click" />
    <br />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="content" runat="server">
    <asp:GridView ID="GridView_LinkUpload" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCancelingEdit="GridView_LinkUpload_RowCancelingEdit" OnRowDeleting="GridView_LinkUpload_RowDeleting" OnRowEditing="GridView_LinkUpload_RowEditing" OnRowUpdating="GridView_LinkUpload_RowUpdating">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:TemplateField HeaderText="LinkName" SortExpression="LinkName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox_TemplateLN" runat="server" Text='<%# Bind("LinkName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label_TemplateLN" runat="server" Text='<%# Bind("LinkName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="LinkDescription" SortExpression="LinkDescription">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox_TemplateLD" runat="server" Text='<%# Bind("LinkDescription") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label_TemplateLD" runat="server" Text='<%# Bind("LinkDescription") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LinkURL" HeaderText="LinkURL" SortExpression="LinkURL" ReadOnly="True" />
            <asp:BoundField DataField="LinkCreatTime" HeaderText="LinkCreatTime" SortExpression="LinkCreatTime" ReadOnly="True" />
            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image_LinkThumbnail" runat="server" Width="100" Height="100" ImageUrl='<%# GetRelativeImagePath(Eval("LinkThumbnail").ToString()) %>' AlternateText="image lost" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectLB %>" DeleteCommand="DELETE FROM [Link] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Link] ([LinkName], [LinkDescription], [LinkURL], [LinkThumbnail], [LinkCreatTime], [CategoryID]) VALUES (@LinkName, @LinkDescription, @LinkURL, @LinkThumbnail, @LinkCreatTime, @CategoryID)" SelectCommand="SELECT * FROM [Link]" UpdateCommand="UPDATE [Link] SET [LinkName] = @LinkName, [LinkDescription] = @LinkDescription, [LinkURL] = @LinkURL, [LinkThumbnail] = @LinkThumbnail, [LinkCreatTime] = @LinkCreatTime, [CategoryID] = @CategoryID WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LinkName" Type="String" />
            <asp:Parameter Name="LinkDescription" Type="String" />
            <asp:Parameter Name="LinkURL" Type="String" />
            <asp:Parameter Name="LinkThumbnail" Type="String" />
            <asp:Parameter Name="LinkCreatTime" Type="DateTime" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LinkName" Type="String" />
            <asp:Parameter Name="LinkDescription" Type="String" />
            <asp:Parameter Name="LinkURL" Type="String" />
            <asp:Parameter Name="LinkThumbnail" Type="String" />
            <asp:Parameter Name="LinkCreatTime" Type="DateTime" />
            <asp:Parameter Name="CategoryID" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="LinkCBack" runat="server" Text="返回連結種類後台" Style="height: 32px" OnClick="LinkCBack_Click" />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="body" runat="server">
</asp:Content>
