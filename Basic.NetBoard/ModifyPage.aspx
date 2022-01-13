<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ModifyPage.aspx.cs" Inherits="Basic.NetBoard.ModifyPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div align="center"> 
        <asp:HiddenField ID="HiddenId" runat="server"/>
        <asp:Label ID="Label1" runat="server" Text="글수정"></asp:Label>
        <table class="tbl01" cellpading="0" cellspacing="0">
            <tr>
                <td><asp:Label ID="titleLabel" runat="server" Text="제목 : "></asp:Label></td>
                <td><asp:TextBox ID="title" runat="server" Text="title"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="writerLabel" runat="server" Text="작성자 : "></asp:Label></td>
                <td><asp:TextBox ID="writer" runat="server" Text="writer"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="contentLabel" runat="server" Text="내용 : "></asp:Label></td>
                <td><asp:TextBox ID="content" runat="server" Text="내용"></asp:TextBox></td>
            </tr>
        </table>
        <div align="right">
            <asp:Button ID="Button1" runat="server" Text="목록으로" PostBackUrl="~/MainPage.aspx"/>
            <asp:Button ID="modifyBtn" runat="server" OnClick="btnWrite_Click"  Text="수정완료" />
        </div>
    </div>
    </form>
</asp:Content>
