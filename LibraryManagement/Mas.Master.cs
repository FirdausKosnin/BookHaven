using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class Mas : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null || Session["role"] == "")
                {
                    LinkButton5.Visible = true; // User Login
                    LinkButton7.Visible = true; // Sign Up

                    LinkButton9.Visible = false; // Log Out
                    LinkButton8.Visible = false; // User Name

                    LinkButton1.Visible = false; // Admin Author Management
                    LinkButton2.Visible = false; // Admin publish Management
                    LinkButton3.Visible = false; // Admin Book Issuing
                    LinkButton4.Visible = false; // Admin Member Management
                }
                else if (Session["role"].Equals("User"))
                {
                    LinkButton5.Visible = false; // User Login
                    LinkButton7.Visible = false; // Sign Up

                    LinkButton9.Visible = true; // Log Out
                    LinkButton8.Visible = true; // User Name
                    LinkButton9.Text = Session["username"].ToString();

                    LinkButton1.Visible = false; // Admin Author Management
                    LinkButton2.Visible = false; // Admin publish Management
                    LinkButton3.Visible = false; // Admin Book Issuing
                    LinkButton4.Visible = false; // Admin Member Management
                }
                else if (Session["role"].Equals("Admin"))
                {
                    LinkButton5.Visible = false; // User Login
                    LinkButton7.Visible = false; // Sign Up

                    LinkButton9.Visible = true; // Log Out
                    LinkButton8.Visible = true; // User Name
                    LinkButton9.Text = Session["username"].ToString();

                    LinkButton6.Visible = false; // Admin login
                    LinkButton1.Visible = true; // Admin Author Management
                    LinkButton2.Visible = true; // Admin publish Management
                    LinkButton3.Visible = true; // Admin Book Issuing
                    LinkButton4.Visible = true; // Admin Member Management
                }
            }
            catch (Exception E)
            {
                Response.Write("<script>alert'" + E.Message + ");</script>");
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Authermanagement.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Publishermanagement.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookIssue.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("membermanagement.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            Response.Redirect("index.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }
    }
}