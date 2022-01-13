<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WritePage.aspx.cs" Inherits="Basic.NetBoard.WritePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <div align="center"> 
        <asp:Label ID="Label1" runat="server" Text="글작성"></asp:Label>
        <table class="tbl01" cellpading="0" cellspacing="0">
            <tr>
                <td><asp:Label ID="titleLabel" runat="server" Text="제목 : "></asp:Label></td>
                <td>
                    <asp:TextBox ID="title" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="vldTitleRequired" runat="server" ControlToValidate="title" ErrorMessage="제목을 입력해주세요" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="writerLabel" runat="server" Text="작성자 : "></asp:Label></td>
                <td>
                    <asp:TextBox ID="writer" runat="server"/>
                    <asp:RequiredFieldValidator ID="vldWriterRequired" runat="server" ControlToValidate="writer" ErrorMessage="작성자를 입력해주세요" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>             
            </tr>
            <tr>
                <td><asp:Label ID="pwLabel" runat="server" Text="비밀번호 : "></asp:Label></td>
                <td>
                    <asp:TextBox ID="pw" runat="server" OnTextChanged="pw_TextChanged" TextMode="Password"/>
                    <asp:RequiredFieldValidator ID="vldPwRequired" runat="server" ControlToValidate="pw" ErrorMessage="비밀번호를 입력해주세요" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="contentLabel" runat="server" Text="내용 : "></asp:Label></td>
                <td>
                    <asp:TextBox ID="content" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="vldContentRequired" runat="server" ControlToValidate="content" ErrorMessage="내용을 입력해주세요" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <div align="right">
            <asp:Button ID="writeBtn" runat="server" Text="글쓰기" OnClick="btnWrite_Click" />
            <asp:Button ID="list" runat="server" Text="목록으로" PostBackUrl="~/MainPage.aspx"/>
        </div>
    </div>
    </form>
</asp:Content>
