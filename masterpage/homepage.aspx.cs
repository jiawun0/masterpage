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
    public partial class homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["LoginId"] != null)
                {
                    string loginId = Session["LoginId"].ToString();

                    string username = Showusername(loginId);

                    Literal_someone.Text = "歡迎, " + username + "!";
                }
            }
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
    }
}