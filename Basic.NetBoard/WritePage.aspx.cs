using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basic.NetBoard
{
    public partial class WritePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void pw_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnWrite_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string insertString = "INSERT INTO dbo.board(title, writer,pw,date,count,content)";
                insertString += "VALUES(@title, @writer, @pw,GETDATE(),0,@content )";
                string query2 = "Select @@Identity";

                DBConn conn = new DBConn();
                SqlCommand cmd = new SqlCommand(insertString, conn.GetConn());
                cmd.Parameters.AddWithValue("@title", title.Text);
                cmd.Parameters.AddWithValue("@writer", writer.Text);
                cmd.Parameters.AddWithValue("@pw", pw.Text);
                cmd.Parameters.AddWithValue("@content", content.Text);

                //insert후 신규등록된 id값을 가져온다.
                int id = -1;
                try
                {
                    cmd.ExecuteNonQuery();
                    cmd.CommandText = query2;
                    id = Convert.ToInt32(cmd.ExecuteScalar());
                } catch (Exception error)
                {
                    Response.Write(error.Message);
                }
                finally
                {
                    conn.Close();
                }
                Response.Redirect("/InfoPage.aspx?id=" + id);
            }
            else
            {

            }
        }

    }
}