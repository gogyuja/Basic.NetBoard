<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dbtest.aspx.cs" Inherits="Basic.NetBoard.dbtest" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "System.Data.SqlClient" %>
<script language="C#" runat="server">
//https://www.youtube.com/watch?v=HD5LzY76vH0 참조
/* void Page_Load()
     {
      //회사노트북
      string str_conn = "server=DESKTOP-VK51DCG\\STUDY;user id=DESKTOP-VK51DCG;password='';database=aspnet";
      SqlConnection conn = new SqlConnection(str_conn);

      Response.Write ("before: " + conn.State + "<hr>");
      conn.Open();

      Response.Write ("Open(): " + conn.State + "<hr>");  
      conn.Close();

      Response.Write ("close(): " + conn.State + "<hr>");
     }*/
</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>글목록</h1>
        <div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Basic.NetBoardConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [board]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="제목" SortExpression="title" />
                <asp:BoundField DataField="writer" HeaderText="글쓴이" SortExpression="writer" />
                <asp:BoundField DataField="date" DataFormatString="{0:yyyy/MM/dd HH:mm}" HeaderText="date" SortExpression="date" />
                <asp:BoundField DataField="count" HeaderText="count" SortExpression="count" />
                <asp:BoundField DataField="content" HeaderText="content" SortExpression="content" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
