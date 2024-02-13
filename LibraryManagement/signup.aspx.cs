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
    public partial class WebForm3 : System.Web.UI.Page
    {
        string strdb = ConfigurationManager.ConnectionStrings["database"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SingUp_Click(object sender, EventArgs e)
        {
            if (Check_Member_Exist())
                Response.Write("<script>alert('Member ID already exist, please try another member ID');</script>");
            else
                Sign_Up();
        }

        bool Check_Member_Exist()
        {
            try
            {
                SqlConnection connect = new SqlConnection(strdb);
                if (connect.State == System.Data.ConnectionState.Closed)
                    connect.Open();

                SqlCommand cmd = new SqlCommand("SELECT * from members_table WHERE  member_id='" + TextBox8.Text.Trim() + "';", connect);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                if (dataTable.Rows.Count >= 1)
                    return true;
                return false;

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            return false;
        }

        void Sign_Up()
        {
            try
            {
                SqlConnection connect = new SqlConnection(strdb);
                if (connect.State == System.Data.ConnectionState.Closed)
                    connect.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO members_table (full_name,date_of_birth,contact_number,email,full_address,state,city,pincode,member_id,password,account_status) Values (@full_name,@date_of_birth,@contact_number,@email,@address,@state,@city,@pincode,@member_id,@password,@account_status)", connect);

                cmd.Parameters.AddWithValue("@full_name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@date_of_birth", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@contact_number", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@email", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@address", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@state", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@pincode", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@member_id", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@password", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@account_status", "pending");

                cmd.ExecuteNonQuery();
                connect.Close();
                Response.Write("<script>alert('Sign Up Successful.');</script>");

            }
            catch (Exception E)
            {
                Response.Write("<script>alert('" + E.Message + "');</script>");
            }
        }
    }
}