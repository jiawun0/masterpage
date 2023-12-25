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
    public partial class LinkFront : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoginId"] != null)
                {
                    string loginId = Session["LoginId"].ToString();

                    //顯示登入者
                    string username = Showusername(loginId);
                    Literal_someone.Text = "歡迎, " + username + "!";

                    if (Request.QueryString["CategoryID"] != null)
                    {
                        string CategoryID = Request.QueryString["CategoryID"];

                        ShowDB(CategoryID);
                    }

                    else
                    {
                        //未抓取CategoryID，重新登入
                        Response.Redirect("Login2.aspx");
                    }
                }

                else
                {
                    //未登入
                    Response.Redirect("Login2.aspx");
                }
            }

        }


        void ShowDB(string CategoryID)
        {
            SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["ConnectLB"].ConnectionString);

            if (connection.State != System.Data.ConnectionState.Open)
            {
                connection.Open();
            }

            //發送SQL語法，取得結果
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = connection;

            //string sql = $"select PostTopic, PostAuthor, PostDate, ReplyDate from post, reply where post.Id = reply.postId";
            string sql = $"select l.Id, l.LinkName, l.LinkDescription, l.LinkCreatTime, l.LinkURL, l.LinkThumbnail " +
             $"from Link l " +
             $"join LinkCategory lc on l.CategoryID = lc.ID " +
             $"where l.CategoryID = @CategoryID ";

            //增加參數並設定值，記得用.叫出來
            sqlCommand.Parameters.AddWithValue("@CategoryID", CategoryID);

            //將準備的SQL指令給操作物件
            sqlCommand.CommandText = sql;

            //執行該SQL查詢，用reader接資料
            SqlDataReader reader = sqlCommand.ExecuteReader();

            //使用這個reader物件的資料來取得內容
            Repeater_link.DataSource = reader;

            //GridView進行資料連接
            Repeater_link.DataBind();


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
        protected string GetRelativeImagePath(string linkThumbnail)
        {
            if (!string.IsNullOrEmpty(linkThumbnail))
            {
                string relativePath = linkThumbnail.Replace(Server.MapPath("~"), "").Replace(Server.MapPath("\\"), "/");
                return relativePath;
            }
            return string.Empty;
        }

        protected void LinkBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("LinkCategoryFront.aspx");
        }
    }
}