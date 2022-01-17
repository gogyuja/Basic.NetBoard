using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basic.NetBoard
{
    public partial class ModifyPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["id"];
            string pw = Request["pw"];

            if (!IsPostBack)
            {
                if (id == null || pw == null)
                {
                    Response.Write("<script language=\"javascript\">alert('글수정을 위해서 id와 비밀번호 값을 입력해주세요.')</script>");
                    Response.Write("<script language=\"javascript\">window.location=\"MainPage.aspx\"</script>");
                }

                string selectString = "SELECT * from dbo.board where id=" + id + " and pw=" + pw;
                DBConn conn = new DBConn();
                SqlDataReader dr = conn.ExecuteReader(selectString);

                if (dr.Read())
                {
                    HiddenId.Value = Request["id"];
                    title.Text = dr["Title"].ToString();
                    writer.Text = dr["writer"].ToString();
                    content.Text = dr["content"].ToString();
                }
                else
                {
                    Response.Write("<script language=\"javascript\">alert('id 혹은 비밀번호 값이 틀렸습니다.')</script>");
                    Response.Write("<script language=\"javascript\">window.location=\"MainPage.aspx\"</script>");
                }
                dr.Close();
                conn.Close();
            }
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string updateString = "UPDATE dbo.board set writer=@writer, ";
                updateString += "title=@title, content=@content ";
                updateString += "WHERE id=" + Request["id"];

                System.Diagnostics.Debug.WriteLine(title.Text);
                System.Diagnostics.Debug.WriteLine(writer.Text);
                System.Diagnostics.Debug.WriteLine(content.Text);

                DBConn conn = new DBConn();
                SqlCommand cmd = new SqlCommand(updateString, conn.GetConn());
                cmd.Parameters.AddWithValue("@title", title.Text);
                cmd.Parameters.AddWithValue("@writer", writer.Text);
                cmd.Parameters.AddWithValue("@content", content.Text);
                cmd.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("/InfoPage.aspx?id=" + Request["id"]);
            }
            else
            {

            }
        }
    }
}