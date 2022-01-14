<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InfoPage.aspx.cs" Inherits="Basic.NetBoard.InfoPage" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script language="javascript" type="text/javascript">      
        //글삭제기능
        function deleteBoard(e) {
            e.preventDefault();

            var id = document.getElementById(('<%= HiddenId.ClientID %>'));
            var num = prompt("비밀번호를 입력하세요");
               
            $.ajax({
                type: "POST",
                url: "InfoPage.aspx/deleteBoard",
                data: '{submitPw: "' + num + '",id: "'+id.value +'"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == 1) {
                        alert("글이 삭제되었습니다.");
                        window.location.href = "/MainPage.aspx";
                    } else if (response.d == 0) {
                        alert("비밀번호를 다시 입력해주세요.");
                    }
                },
                failure: function (response) {
                    console.log(response);
                    alert("에러 다시 시도해주세요");
                }
            });
        }

        //글수정기능
        function modifyBoard(e) {
            e.preventDefault();
            var id = document.getElementById(('<%= HiddenId.ClientID %>'));
            var num = prompt("비밀번호를 입력하세요");

            $.ajax({
                type: "POST",
                url: "InfoPage.aspx/modifyBoard",
                data: '{submitPw: "' + num + '",id: "' + id.value + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d == 1) {
                        window.location.href = "/ModifyPage.aspx?id="+id.value+"&pw="+num;
                    } else if (response.d == 0) {
                        alert("비밀번호를 다시 입력해주세요.");
                    }
                },
                failure: function (response) {
                    console.log(response);
                    alert("에러 다시 시도해주세요");
                }
            });
        }
    </script>
    <link href="style.css" rel="stylesheet" />
    <div align="center"class="box-container"> 
    <asp:HiddenField ID="HiddenId" runat="server"/>
    <h1>글읽기</h1>
    
        <table class="content-container" cellpading="0" cellspacing="0" border="1">
            <tr>
                <td bgcolor="#507CD1"><asp:Label ID="titleLabel" runat="server" Text="제목"></asp:Label></td>
                <td bgcolor="#EFF3FB"><asp:Label ID="title" runat="server" Text="title"></asp:Label></td>
            </tr>
            <tr>
                <td bgcolor="#507CD1"><asp:Label ID="writerLabel" runat="server" Text="작성자"></asp:Label></td>
                <td bgcolor="#EFF3FB"><asp:Label ID="writer" runat="server" Text="writer"></asp:Label></td>
            </tr>
            <tr>
                <td bgcolor="#507CD1"><asp:Label ID="dateLabel" runat="server" Text="작성일"></asp:Label></td>
                <td bgcolor="#EFF3FB"><asp:Label ID="date" runat="server" Text="date"></asp:Label></td>
            </tr>
            <tr>
                <td bgcolor="#507CD1"><asp:Label ID="cntLabel" runat="server" Text="조회수"></asp:Label></td>
                <td bgcolor="#EFF3FB"><asp:Label ID="count" runat="server" Text="조회수"></asp:Label></td>
            </tr>
            <tr >
                <td bgcolor="#507CD1" colspan="2"><asp:Label ID="contentLabel" runat="server" Text="내용"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2" bgcolor="#EFF3FB">
                    <asp:Label ID="content" runat="server" Text="내용"></asp:Label>
                </td>
            </tr>
        </table>
    
    <div align="right">
        <asp:Button ID="Button1" runat="server" CssClass="write-btn" Text="목록으로" PostBackUrl="~/MainPage.aspx"/>
        <asp:Button ID="modifyBtn" runat="server" CssClass="write-btn" OnClientClick="modifyBoard(event)"  Text="글수정" />
        <asp:Button ID="delBtn" runat="server" CssClass="write-btn" OnClientClick="deleteBoard(event)" Text="글삭제" />
    </div>
    </div>
    </form>
</asp:Content>
