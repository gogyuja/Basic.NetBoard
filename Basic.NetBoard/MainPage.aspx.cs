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

            
            /*var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Basic.NetBoardConnectionString"];

            using(SqlConnection conn = new SqlConnection(connectionFromConfiguration.ConnectionString))
            {
                try{
                    conn.Open();
                    ltConnectionMessage.Text = "Connection successful";
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
            string id = boardGrid.SelectedRow.Cells[0].Text;
            Response.Redirect(String.Format("InfoPage.aspx?id="+id));
        }

        protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(boardGrid, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }
    }
   
}