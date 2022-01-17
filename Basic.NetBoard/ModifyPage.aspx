<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ModifyPage.aspx.cs" Inherits="Basic.NetBoard.ModifyPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="style.css" rel="stylesheet" />
    <form id="form1" runat="server">
    <div align="center" class="box-container"> 
        <asp:HiddenField ID="HiddenId" runat="server"/>
        <h1>글수정</h1>
        <div align="center">
        <table class="tbl01" cellpading="0" width="100%" cellspacing="0" border="1">
            <colgroup>
                <col style="width:50%" />
                <col style="width:50%" />
            </colgroup>
            <tr>
                <td bgcolor="#507CD1">
                    <asp:Label ID="titleLabel" runat="server" Text="제목"></asp:Label>
                    <asp:RequiredFieldValidator ID="vldTitleRequired" runat="server" ForeColor="Red" ControlToValidate="title" ErrorMessage="제목을 입력해주세요" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td bgcolor="#EFF3FB">
                    <asp:TextBox ID="title" Width="100%" CssClass="text-box" runat="server" Text="title"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td bgcolor="#507CD1">
                    <asp:Label ID="writerLabel" runat="server" Text="작성자"></asp:Label>
                    <asp:RequiredFieldValidator ID="vldWriterRequired" runat="server" ForeColor="Red" ControlToValidate="writer" ErrorMessage="작성자를 입력해주세요" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td bgcolor="#EFF3FB">
                    <asp:TextBox ID="writer" Width="100%" CssClass="text-box" runat="server" Text="writer"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td bgcolor="#507CD1" colspan="2">
                    <asp:Label ID="contentLabel" runat="server" Text="내용"></asp:Label>
                    <asp:RequiredFieldValidator ID="vldContentRequired" runat="server" ForeColor="Red" ControlToValidate="content" ErrorMessage="내용을 입력해주세요" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
             </tr>
            <tr>
                <td bgcolor="#EFF3FB" colspan="2" height="500px">
                    <asp:TextBox ID="content" CssClass="text-box" runat="server" Width="100%" Height="100%" Text="내용" mode="multiline" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </table>
        </div>
        <div align="right">
            <asp:Button ID="Button1" CssClass="write-btn" runat="server" Text="목록으로" PostBackUrl="~/MainPage.aspx" CausesValidation="false"/>
            <asp:Button ID="modifyBtn" CssClass="write-btn" runat="server" OnClick="btnModify_Click"  Text="수정완료" />
        </div>
    </div>
    </form>
</asp:Content>
