<%--defense.aspx
這是inline code，沒有後置，也不需要page指示詞--%>

<% if (Session["Login"].ToString() == "OK")
    {
        Response.Write("<script>alert('登入成功');</script>");
    }
    else
    {
        Response.Write("<script>alert('帳號或密碼錯誤，請重新輸入');</script>");
        Response.End();
    }
%>