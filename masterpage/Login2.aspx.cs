using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterpage
{
    public partial class Login2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_login_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectLogin"].ConnectionString);

            if (connection.State != System.Data.ConnectionState.Open)
            {
                connection.Open();
            }

            //發送SQL語法，取得結果
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = connection;

            //查詢跟參數的部分很難寫成方法，需自行研究
            string sql = $"select Id, IsAlbumM, IsVideoM, IsLinkM from Login where Username = @Username and Password = @Password";

            //增加參數並設定值，記得用.叫出來
            sqlCommand.Parameters.AddWithValue("@Username", TextBox_Username.Text.Trim());
            sqlCommand.Parameters.AddWithValue("@Password", TextBox_Password.Text.Trim());

            //將準備的SQL指令給操作物件
            sqlCommand.CommandText = sql;

            //執行該SQL查詢，用reader接資料
            SqlDataReader reader = sqlCommand.ExecuteReader();

            //int count = Convert.ToInt32(sqlCommand.ExecuteScalar());
            //object result = sqlCommand.ExecuteScalar();

            //用read先叫出來，while也可以
            if (reader.Read())
            {
                //將是否為管理者設為boolean
                bool IsAlbumM = Convert.ToBoolean(reader["IsAlbumM"]);
                bool IsVideoM = Convert.ToBoolean(reader["IsVideoM"]);
                bool IsLinkM = Convert.ToBoolean(reader["IsLinkM"]);

                // 登入成功，取得使用者 ID，並存儲到 Session 中
                Session["LoginId"] = reader["Id"];

                Session["IsAlbumM"] = IsAlbumM;
                Session["IsVideoM"] = IsVideoM;
                Session["IsLinkM"] = IsLinkM;

                Response.Redirect("homepage.aspx");
                //if (IsAlbumM)
                //{
                //    Response.Write("<script>alert('登入成功');</script>");
                //    Response.Redirect("Backstage.aspx");
                //}
                //else if (IsVideoM)
                //{
                //    Response.Write("<script>alert('登入成功');</script>");
                //    Response.Redirect("Backstage.aspx");
                //}
                //else if (IsLinkM)
                //{
                //    Response.Write("<script>alert('登入成功');</script>");
                //    Response.Redirect("Backstage.aspx");
                //}
                //else
                //{
                //    Response.Write("<script>alert('登入成功');</script>");
                //    Response.Redirect("homepage.aspx");
                //}
            }
            else
            {
                // 登入失敗
                Response.Write("<script>alert('帳號或密碼錯誤，請重新輸入');</script>");
            }
            connection.Close();
        }

        protected void Button_loginnew_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}
