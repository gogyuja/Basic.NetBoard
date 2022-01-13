<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InfoPage.aspx.cs" Inherits="Basic.NetBoard.InfoPage" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script language="javascript" type="text/javascript">      
            function deleteBoard(e) {
                e.preventDefault();
                var num = prompt("비밀번호를 입력하세요");
                $.ajax({
                    type: "POST",
                    url: "InfoPage.aspx/deleteBoard",
                    data: '{submitPw: "' + num + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("성공");
                    },
                    failure: function (response) {
                        alert("실패");
                    }
                });
            }
        </script>

    <div align="center"> 
        <asp:HiddenField ID="id" runat="server" />
        <asp:Label ID="Label1" runat="server" Text="글읽기"></asp:Label>
        <table class="tbl01" cellpading="0" cellspacing="0">
            <tr>
                <td><asp:Label ID="titleLabel" runat="server" Text="제목 : "></asp:Label></td>
                <td><asp:Label ID="title" runat="server" Text="title"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="writerLabel" runat="server" Text="작성자 : "></asp:Label></td>
                <td><asp:Label ID="writer" runat="server" Text="writer"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="dateLabel" runat="server" Text="작성일 : "></asp:Label></td>
                <td><asp:Label ID="date" runat="server" Text="date"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="cntLabel" runat="server" Text="조회수 : "></asp:Label></td>
                <td><asp:Label ID="count" runat="server" Text="조회수"></asp:Label></td>
            </tr>
            <tr>
                <td><asp:Label ID="contentLabel" runat="server" Text="내용 : "></asp:Label></td>
                <td><asp:Label ID="content" runat="server" Text="내용"></asp:Label></td>
            </tr>
        </table>
        <div align="right">
            <asp:Button ID="Button1" runat="server" Text="목록으로" PostBackUrl="~/MainPage.aspx"/>
            <asp:Button ID="Button2" runat="server" Text="글수정" />
            <asp:Button ID="delBtn" runat="server" OnClientClick="deleteBoard(event)" Text="글삭제" />
        </div>
    </div>
    </form>
</asp:Content>
