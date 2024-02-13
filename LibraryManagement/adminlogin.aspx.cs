using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace LibraryManagement
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        string strdb = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection connect = new SqlConnection(strdb);
                if (connect.State == ConnectionState.Closed)
                    connect.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM admin_login_table where " +
                    "username='" + TextBox1.Text.Trim() + "' " +
                    "AND password='" + TextBox2.Text.Trim() + "'", connect);
                SqlDataReader sqlDataReader = cmd.ExecuteReader();

                if (sqlDataReader.HasRows)
                {
                    while (sqlDataReader.Read())
                    {
                        Response.Write("<script>alert('" + sqlDataReader.GetValue(0).ToString() + "');</script>");
                        Session["username"] = sqlDataReader.GetValue(0);
                        Session["role"] = "Admin";
                    }
                    Response.Redirect("index.aspx");
                }
                else
                    Response.Write("<script>alert('Member ID or password does not match.');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(" + ex.Message + ");</script>");
            }
        }
    }
}