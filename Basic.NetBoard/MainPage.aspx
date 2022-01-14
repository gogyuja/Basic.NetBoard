<%@ Page Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Basic.NetBoard.MainPage" EnableEventValidation="false" %>
<%@ Import Namespace = "System.Data" %>
<%@ Import Namespace = "System.Data.SqlClient" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <script language="javascript" type="text/javascript">
            function btnWrite_Click() {
                window.location.href = "WritePage.aspx";
            }
        </script>
        <link href="style.css" rel="stylesheet" />
    <ContentTemplate>
        <div 
            align="center"
            class="box-container">
            <h1>MainPage</h1>           
            <%--<h4><asp:Literal ID="testSql" runat="server"/></h4>--%>
            <div>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Basic.NetBoardConnectionString %>" 
              SelectCommand="SELECT * FROM [board] order by id desc"></asp:SqlDataSource>
              
                <asp:GridView ID="boardGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" 
                    GridLines="None" AllowPaging="true" CellPadding="10" OnRowDataBound="OnRowDataBound"  OnSelectedIndexChanged="OnSelectedIndexChanged"
                    CssClass="content-container">
                    <RowStyle BackColor="#EFF3FB" />
                    <AlternatingRowStyle BackColor="White" />

                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="CENTER"/>
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="처음" LastPageText="끝" PageButtonCount="10" PreviousPageText="Previous" NextPageText="Next"/>
                    <PagerStyle BackColor="#EFF3FB" HorizontalAlign="CENTER" Font-Size="Large"/>

                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" ItemStyle-HorizontalAlign="Center"/>
                        <asp:BoundField DataField="title" HeaderText="제목" SortExpression="title" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="writer" HeaderText="글쓴이" SortExpression="writer" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="date" DataFormatString="{0:yy/MM/dd HH:mm}" HeaderText="date" SortExpression="date" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="count" HeaderText="조회수" SortExpression="count" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="content" ItemStyle-CssClass="target" HeaderText="content" SortExpression="content" ItemStyle-HorizontalAlign="Center"  />
                    </Columns>

                </asp:GridView>
                
                    <!--글쓰기버튼-->
                    <div align="right" margin-right="500px">
                         <button id="btnWrite_test" type="button" onclick="btnWrite_Click()" class="write-btn">글쓰기</button>
                     </div> 
                </div>
           
            </div>
    </ContentTemplate>
    </form>
</asp:Content>