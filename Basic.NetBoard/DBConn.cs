using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

namespace Basic.NetBoard
{
    public class DBConn
    {
        //1.구성 파일로부터 데이터베이스 연결 문자열 얻기
        String conneectionString = WebConfigurationManager.ConnectionStrings["Basic.NetBoardConnectionString"].ConnectionString;

        public SqlConnection dbConn;

        //2. 생성자를 이용하여 생성과 동시에 데이터 접속
        public DBConn()
        {
            dbConn = new SqlConnection(conneectionString);
            dbConn.Open(); 
        }

        //3. DB 연결 닫기
        public void Close()
        {
            dbConn.Close();
        }

        //4. 연결 객체 반환 메소드
        public SqlConnection GetConn()
        {
            return dbConn;  
        }

        //5. ExecuteNonQuery 실행
        //매개변수를 이용하지 않는 UPDATE, DELETE, INSERT문에서 사용
        public void ExecuteNonQuery(string queryString)
        {
            SqlCommand cmd=new SqlCommand(queryString,dbConn);
            cmd.ExecuteNonQuery();
        }

        //6. ExecuteReader 실행
        //매개변수를 이용하지 않는 SELECT 문에서 사용
        public SqlDataReader ExecuteReader(string queryString)
        {
            SqlCommand cmd=new SqlCommand(queryString,dbConn); 
            return cmd.ExecuteReader();
        }

        //7. ExecuteScalar 실행
        //첫 행의 첫 열을 객체로 반환
        public object ExecuteScalar(string queryString)
        {
            SqlCommand cmd = new SqlCommand(queryString, dbConn);
            return cmd.ExecuteScalar();
        }
    }
}