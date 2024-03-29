﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterpage
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Register_Click(object sender, EventArgs e)
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
            string sql = $"insert into Login (RealName, Username, Password) values (@RealName, @Username, @Password)";

            //增加參數並設定值，記得用.叫出來
            sqlCommand.Parameters.AddWithValue("@RealName", TextBox_RealName.Text.Trim());
            sqlCommand.Parameters.AddWithValue("@Username", TextBox_Username.Text.Trim());
            sqlCommand.Parameters.AddWithValue("@Password", TextBox_Password.Text.Trim());

            string Password = TextBox_Password.Text.Trim();
            string pwCheck = TextBox_pwCheck.Text.Trim();

            if (TextBox_Password.Text.Length < 6)
            {
                Response.Write("<script>alert('密碼必須至少包含 6 個字元');</script>");
                connection.Close();
                return;
            }

            if (Password != pwCheck)
            {
                Response.Write("<script>alert('密碼和確認密碼不相符');</script>");
                connection.Close();
                return;
            }

            //將準備的SQL指令給操作物件
            sqlCommand.CommandText = sql;

            int f = sqlCommand.ExecuteNonQuery();
            if (f != 0)
            {
                Response.Write("<script>alert('註冊成功');</script>");
            }
            else
            {
                Response.Write("<script>alert('註冊失敗');</script>");
            }

            connection.Close();

            Response.Redirect("homepage.aspx");
        }
    }
}