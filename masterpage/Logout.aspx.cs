using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace masterpage
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 清除 Session 範例
            Session.Clear();

            // 跳轉至登入頁面
            Response.Redirect("Login.aspx");
        }
    }
}