<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to implement an advanced tooltip for ASPxGridView's command buttons using ASPxHint</title>
    <style>
        .hintContent {
            font: 14px;
            color: red;
            image-rendering: auto;
        }
    </style>
    <script>
        function ShowNewHint(s, e) {
            e.contentElement.innerHTML = '<div class="hintContent">' +
                '<img src="Images/InsertComment_32x32.png" />' +
                '<div>Click this button to add a new record.</div>' +
                '</div>';
            ASPxClientHint.UpdatePosition(e.hintElement);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$connectionStrings:MyDatabaseConnection %>"
                SelectCommand="SELECT [CategoryId], [CategoryName], [Description] FROM [Categories]"></asp:SqlDataSource>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="CategoryId">
                <Columns>
                    <dx:GridViewCommandColumn ShowNewButton="true" ShowDeleteButton="true" VisibleIndex="0"></dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="CategoryId" ReadOnly="True" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsCommandButton>
                    <NewButton>
                        <Styles>
                            <Style CssClass="dxNewHint"></Style>
                        </Styles>
                    </NewButton>
                    <DeleteButton>
                        <Styles>
                            <Style CssClass="dxDeleteHint"></Style>
                        </Styles>
                    </DeleteButton>
                </SettingsCommandButton>
            </dx:ASPxGridView>
            <dx:ASPxHint ID="ASPxHint1" runat="server" TargetSelector=".dxNewHint" Title="New Button">
                <ClientSideEvents Showing="ShowNewHint" />
            </dx:ASPxHint>
            <dx:ASPxHint ID="ASPxHint2" runat="server" TargetSelector=".dxDeleteHint" Title="Delete Button" Content="Click this button to delete the record.">
            </dx:ASPxHint>
        </div>
    </form>
</body>
</html>