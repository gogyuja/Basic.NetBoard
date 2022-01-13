using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;

namespace Basic.NetBoard
{
    public partial class InfoPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            if (!IsPostBack)
            {
                //조회수 증가
                string updateString = "UPDATE dbo.board set count=count+1";
                updateString += "WHERE id=" + Request["id"];


                //쿼리 문자열로 받은 게시물 ID에 해당하는 데이터 행 선택
                string selectString = "SELECT * from dbo.board where id=" + Request["id"];

                DBConn conn = new DBConn();
                conn.ExecuteNonQuery(updateString);
                SqlDataReader dr = conn.ExecuteReader(selectString);

                if (dr.Read())
                {
                    title.Text = dr["Title"].ToString();
                    writer.Text = dr["writer"].ToString();
                    date.Text = dr["date"].ToString();
                    count.Text = dr["count"].ToString();
                    content.Text = dr["content"].ToString();
                }
            }
        }

        //여기서 Page_Load의 Request객체를 불러올 방법이없는가?
        [System.Web.Services.WebMethod]
        public static int deleteBoard(int submitPw)
        {
           /* DBConn conn=new DBConn();

            string pw = "SELECT pw from dbo.board where id=" + ;*/
            return submitPw;
        }
    }
}