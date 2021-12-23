<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Basic.NetBoard.MainPage" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">
        function btnWrite_Click() {
            window.location.href = "WritePage.aspx";
        }
    </script>
    <ContentTemplate>
        <div>
            <h1>여기 메인페이지, 테이블로 글목록 나열한다.</h1>
            <button id="btnWrite" type="button" onclick="location.href='WritePage.aspx'"  style.visibility="hidden">글쓰기</button>
        </div>
    </ContentTemplate>
</asp:Content>