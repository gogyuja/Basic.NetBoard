<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Basic.NetBoard.MainPage" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "System.Data.SqlClient" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="javascript" type="text/javascript">
        function btnWrite_Click() {
            window.location.href = "WritePage.aspx";
        }
    </script>
    <script language="C#" runat="server">
         void Page_Load()
             {
              //회사노트북
              string str_conn = "server=DESKTOP-VK51DCG\\STUDY;user id=DESKTOP-VK51DCG;password='';database=aspnet";
              SqlConnection conn = new SqlConnection(str_conn);

              Response.Write ("before: " + conn.State + "<hr>");
              conn.Open();

              Response.Write ("Open(): " + conn.State + "<hr>");  
              conn.Close();

              Response.Write ("close(): " + conn.State + "<hr>");
             }
    </script>
    <ContentTemplate>
        <div>
            <h1>여기 메인페이지, 테이블로 글목록 나열한다.</h1>
            <h4><asp:Literal ID="ltConnectionMessage" runat="server"/></h4>
            <h4><asp:Literal ID="testSql" runat="server"/></h4>
            <button id="btnWrite_test" type="button" onclick="btnWrite_Click()" >btnWrite_Click()메소드테스트</button>
            <button id="btnWrite" type="button" onclick="location.href='WritePage.aspx'"  style.visibility="hidden">글쓰기</button>
        </div>
    </ContentTemplate>
</asp:Content>