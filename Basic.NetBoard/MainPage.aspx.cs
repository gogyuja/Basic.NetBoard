using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Basic.NetBoard
{
    public partial class MainPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*int index = boardGrid.PageIndex;
            System.Diagnostics.Debug.WriteLine(index); */

            //글상세보기에서 page 뒤로가기를 위한 요소. 근데 에러다.
            /*
             처음에는 글 상세보기 이후에 목록보기 클릭시 정상적으로 작동하나 그 이후에 page요소가 변경되지 않는 문제가 있다.
             */
            if (!IsPostBack)
            {
                string page = Request["page"];
                if (page != null)
                {
                    boardGrid.SetPageIndex(Int32.Parse(page));
                }
            }

            /*var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Basic.NetBoardConnectionString"];
            using(SqlConnection conn = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try{
                    conn.Open();
                    try
                    {
                        SqlCommand command = new SqlCommand("select id,title,writer, format(date,'yy-MM-dd HH:MM'),count from board", conn);
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                String id=reader["id"].ToString();
                                testSql.Text += id;

                                String title=reader["title"].ToString();
                                testSql.Text += title;
                                String writer=reader["writer"].ToString();
                                testSql.Text += writer;

                                testSql.Text += "</br>";
                            }
                        }
                    }
                    catch (SqlException ex)
                    {
                        testSql.Text += "연결에 오류가 있습니다.";
                    }
                }catch(SqlException ex){
                    ltConnectionMessage.Text = "Connection failed : " + ex.Message;
                }
                finally{
                    conn.Close();  
                    conn.Dispose();
                }
            }*/


        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            //해당 글의 id
            string id = boardGrid.SelectedRow.Cells[0].Text;
            //현재페이지
            int page = Convert.ToInt32(boardGrid.PageIndex);

            Response.Redirect(String.Format("InfoPage.aspx?id=" + id + "&page="+ page));
        }

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(boardGrid, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
                e.Row.Cells[0].Width = Unit.Pixel(5);
                e.Row.Cells[1].Width = Unit.Pixel(50);
                e.Row.Cells[2].Width = Unit.Pixel(30);
                e.Row.Cells[3].Width = Unit.Pixel(60);
                e.Row.Cells[4].Width = Unit.Pixel(20);
                e.Row.Cells[5].Width = Unit.Pixel(150);
                
                //글의 내용부분이 너무 길때 .....으로 생략표시해준다.
                int length = e.Row.Cells[5].Text.Length;
                if (length > 10)
                {
                    String cut=e.Row.Cells[5].Text.Substring(0, 10);
                    cut += "...";
                    e.Row.Cells[5].Text = cut;
                }
                
            }
        }
    }
   
}