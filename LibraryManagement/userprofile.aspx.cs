using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        string strdb = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    FillUser();
                    ReserveBook();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        void ReserveBook()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                SqlCommand cmd = new SqlCommand("SELECT issue_id,book_name,issue_date,due_date,returned FROM book_issue_table " +
                    "WHERE member_id=@member_id", connection);

                cmd.Parameters.AddWithValue("@member_id", Session["username"]);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                BookReserve.DataSource = dataTable;
                BookReserve.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void FillUser()
        {
            SqlConnection connection = new SqlConnection(strdb);
            SqlCommand cmd = new SqlCommand("SELECT * FROM members_table " +
                "WHERE member_id=@member_id", connection);
            cmd.Parameters.AddWithValue("@member_id", Session["username"]);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);

            if (dataTable.Rows.Count >= 1)
            {
                switch (dataTable.Rows[0]["account_status"].ToString())
                {
                    case "Approved":
                        AccountStatus.Attributes.Add("class", "badge rounded-pill bg-success text-dark");
                        AccountStatus.Text = "Approved";
                        break;
                    case "Panding":
                        AccountStatus.Attributes.Add("class", "badge rounded-pill bg-info text-dark");
                        AccountStatus.Text = "Panding";
                        break;
                    case "Rejected":
                        AccountStatus.Attributes.Add("class", "badge rounded-pill bg-warning text-dark");
                        AccountStatus.Text = "Rejected";
                        break;
                }
                FullName.Text = dataTable.Rows[0]["full_name"].ToString();
                DateofBirth.Text = dataTable.Rows[0]["date_of_birth"].ToString();
                ContactNumber.Text = dataTable.Rows[0]["contact_number"].ToString();
                Email.Text = dataTable.Rows[0]["email"].ToString();
                Address.Text = dataTable.Rows[0]["full_address"].ToString();
                State.Text = dataTable.Rows[0]["state"].ToString();
                City.Text = dataTable.Rows[0]["city"].ToString();
                pincode.Text = dataTable.Rows[0]["pincode"].ToString();
            }
        }
    }
}