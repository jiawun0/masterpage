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
    public partial class LinkCategoryBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoginId"] != null)
                {
                    string loginId = Session["LoginId"].ToString();
                    bool isLinkM = (Session["IsLinkM"] != null) ? (bool)Session["IsLinkM"] : false;

                    if (loginId != null && isLinkM)
                    {
                        //顯示登入者
                        string username = Showusername(loginId);
                        Literal_someone.Text = "歡迎, " + username + "!";
                        ShowDB();
                    }
                    else
                    {
                        //非IsLinkM，請重新登入
                        Response.Redirect("Login2.aspx");
                    }
                }
                else
                {
                    //尚未登入，請登入
                    Response.Redirect("Login2.aspx");
                }
            }
        }

        protected void CreateLinkCategoryBtn_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectLinkCB2"].ConnectionString);

            if (connection.State != System.Data.ConnectionState.Open)
            {
                connection.Open();
            }

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = connection;

            string sql = $"insert into LinkCategory (CategoryName) values(@CategoryName)";

            sqlCommand.Parameters.AddWithValue("@CategoryName", TextBox_LinkCategoryName.Text);

            sqlCommand.CommandText = sql;

            sqlCommand.ExecuteNonQuery();

            connection.Close();

            Response.Redirect("LinkCategoryBack.aspx");
            ShowDB();
        }

        void ShowDB()
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectLinkCB2"].ConnectionString);

            if (connection.State != System.Data.ConnectionState.Open)
            {
                connection.Open();
            }

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = connection;

            string sql = "select * from LinkCategory ";

            sqlCommand.CommandText = sql;

            SqlDataReader reader = sqlCommand.ExecuteReader();

            GridView_LinkCategoryBack.DataSource = reader;

            GridView_LinkCategoryBack.DataBind();

            connection.Close();
        }

        string Showusername(string LoginId)
        {
            string username = "";

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectLogin"].ConnectionString);
            if (connection.State != System.Data.ConnectionState.Open)
            {
                connection.Open();
            }

            string sql = "select Username from Login where Id = @LoginId";

            SqlCommand sqlCommand = new SqlCommand(sql, connection);
            sqlCommand.Parameters.AddWithValue("@LoginId", LoginId);

            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    username = reader["Username"].ToString();
                    break;
                }
            }

            connection.Close();

            return username;
        }

        protected void GridView_LinkCategoryBack_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_LinkCategoryBack.EditIndex = e.NewEditIndex;
            ShowDB();
        }

        protected void GridView_LinkCategoryBack_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView_LinkCategoryBack.Rows[e.RowIndex];

            int boardId = Convert.ToInt32(GridView_LinkCategoryBack.DataKeys[e.RowIndex].Value);

            TextBox textBoxCN = row.FindControl("TextBox_TemplateCN") as TextBox;
            string changeTextCN = textBoxCN.Text;

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectLinkCB2"].ConnectionString);

            if (connection.State != System.Data.ConnectionState.Open)
            {
                connection.Open();
            }

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = connection;

            string sql = $"update LinkCategory set CategoryName = @CategoryName where Id = @BoardId ";

            sqlCommand.Parameters.AddWithValue("@CategoryName", changeTextCN);
            sqlCommand.Parameters.AddWithValue("@BoardId", boardId);
            sqlCommand.CommandText = sql;

            sqlCommand.ExecuteNonQuery();

            connection.Close();

            Response.Write("<script>alert('更新成功');</script>");
            GridView_LinkCategoryBack.EditIndex = -1;
            ShowDB();
        }

        protected void GridView_LinkCategoryBack_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int boardId = Convert.ToInt32(GridView_LinkCategoryBack.DataKeys[e.RowIndex].Value);

            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectLinkCB2"].ConnectionString);

            if (connection.State != System.Data.ConnectionState.Open)
            {
                connection.Open();
            }

            string deleteSql = $"delete from LinkCategory where Id = @boardId ";
            SqlCommand deleteCommand = new SqlCommand(deleteSql, connection);
            deleteCommand.Parameters.AddWithValue("@boardId", boardId);
            deleteCommand.ExecuteNonQuery();

            connection.Close();

            Response.Write("<script>alert('刪除成功');</script>");

            ShowDB();
        }

        protected void GridView_LinkCategoryBack_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_LinkCategoryBack.EditIndex = -1;
            ShowDB();
        }

        protected void BtnRedirect_Click(object sender, EventArgs e)
        {
            if (sender is Button btn)
            {
                string CategoryID = btn.CommandArgument;

                // 將 Id 添加到 QueryString 並進行重定向
                Response.Redirect("LinkBack.aspx?CategoryID=" + CategoryID);
            }
            else
            {
                // 如果 Id 為空，定義一個預設的重定向 URL
                Response.Redirect("LinkBack.aspx");
            }
        }
    }
}