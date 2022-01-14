<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WritePage.aspx.cs" Inherits="Basic.NetBoard.WritePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="style.css" rel="stylesheet" />
    <form id="form1" runat="server">
    <div align="center" class="box-container"> 
        <h1>글작성</h1>
        <div align="center">
        <table class="tbl01" width="100%" cellpading="0" cellspacing="0" border="1">
            <colgroup>
                <col style="width:50%" />
                <col style="width:50%" />
            </colgroup>
            <tr>
                <td bgcolor="#507CD1">
                    <asp:Label ID="titleLabel" runat="server" Text="제목"></asp:Label>
                    <asp:RequiredFieldValidator ID="vldTitleRequired" runat="server" ForeColor="Red" ControlToValidate="title" ErrorMessage="제목을 입력해주세요" SetFocusOnError="True" Display="Dynamic"/>
                </td>
                <td bgcolor="#EFF3FB">
                    <asp:TextBox ID="title" Width="100%" CssClass="text-box" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td bgcolor="#507CD1">
                    <asp:Label ID="writerLabel" runat="server" Text="작성자"></asp:Label>
                    <asp:RequiredFieldValidator ID="vldWriterRequired" runat="server" ForeColor="Red" ControlToValidate="writer" ErrorMessage="작성자를 입력해주세요" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td bgcolor="#EFF3FB">
                    <asp:TextBox ID="writer"  Width="100%" CssClass="text-box" runat="server"/>
                </td>             
            </tr>
            <tr>
                <td bgcolor="#507CD1">
                    <asp:Label ID="pwLabel" runat="server" Text="비밀번호"></asp:Label>
                    <asp:RequiredFieldValidator ID="vldPwRequired" runat="server" ForeColor="Red" ControlToValidate="pw" ErrorMessage="비밀번호를 입력해주세요" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="vldPwNumRequired" runat="server" ForeColor="Red" ControlToValidate="pw" ErrorMessage="숫자만 입력해주세요" SetFocusOnError="true" Display="Dynamic" ValidationExpression="^[0-9]+$"></asp:RegularExpressionValidator>
                </td> 
                <td bgcolor="#EFF3FB">
                    <asp:TextBox ID="pw" class="text-box"  Width="100%" runat="server" OnTextChanged="pw_TextChanged" TextMode="Password"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" bgcolor="#507CD1">
                    <asp:Label ID="contentLabel" runat="server" Text="내용"></asp:Label>
                    <asp:RequiredFieldValidator ID="vldContentRequired" runat="server" ForeColor="Red" ControlToValidate="content" ErrorMessage="내용을 입력해주세요" SetFocusOnError="True" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
             </tr>
            <tr>
                <td colspan="2" width="100%" height="500px"  bgcolor="#EFF3FB">
                    <asp:TextBox ID="content" CssClass="text-box" runat="server" width="100%" height="100%" mode="multiline" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </table>
        </div>
        <div align="right">
            <asp:Button ID="writeBtn" CssClass="write-btn" runat="server" Text="글쓰기" OnClick="btnWrite_Click" />
            <asp:Button ID="list" CssClass="write-btn" runat="server" Text="목록으로" PostBackUrl="MainPage.aspx" CausesValidation="false"/>
        </div>
    </div>
    </form>
</asp:Content>
