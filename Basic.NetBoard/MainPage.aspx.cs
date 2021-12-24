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
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["Basic.NetBoardConnectionString"];

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
                                testSql.Text += "success";
                            }
                        }
                    }
                    catch (SqlException ex)
                    {
                        testSql.Text += "fail";
                    }
                }catch(SqlException ex){
                    ltConnectionMessage.Text = "Connection failed : " + ex.Message;
                }
                finally{
                    conn.Close();  
                    conn.Dispose();
                }
            }
        }
    }
}