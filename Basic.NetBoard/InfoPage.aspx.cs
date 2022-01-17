using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Web.Script.Services;
using System.Net.Http;

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
                    //해당글의 id 번호
                    HiddenId.Value = Request["id"];
                    //목록보기를 눌렀을 때 이전에 보던 페이지를 보기위한 요소
                    HiddenPage.Value = Request["page"];
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
        public static int deleteBoard(int submitPw,int id)
        {
            bool check=comparePw(submitPw, id);
            if (check)
            {
                string delString = "DELETE FROM dbo.board where id=" + id;
                DBConn conn = new DBConn();
                SqlDataReader dr = conn.ExecuteReader(delString);
                conn.Close();
                //글삭제
                return 1;
            }
            else
            {
                //글삭제실패
                return 0;
            }
         }

        [System.Web.Services.WebMethod]
        public static int modifyBoard(int submitPw,int id)
        {
            bool check = comparePw(submitPw, id);
            if (check)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }

       
        public static bool comparePw(int submitPw,int id)
        {
            string selectString= "SELECT pw from dbo.board where id=" + id;
            int pw=-999;
            DBConn conn = new DBConn();
            SqlDataReader dr=conn.ExecuteReader(selectString);
            if (dr.Read())
            {
                pw = Int32.Parse(dr["pw"].ToString());
            }
            conn.Close();
            if (pw == submitPw)
                return true;
            else
                return false;
        }
    }
}