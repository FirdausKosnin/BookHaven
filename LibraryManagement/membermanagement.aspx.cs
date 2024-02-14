using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string strdb = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            MemberList.DataBind();
        }

        protected void GO_Click(object sender, EventArgs e)
        {
            if (CheckMemberExist())
                FindMemberID();
            else
                Response.Write("<script>alert('Member Does not Exist');</script>");
        }

        protected void Approved_Click(object sender, EventArgs e)
        {
            if (CheckMemberExist())
                UpdateStatus("Approved");
            else
                Response.Write("<script>alert('Member Does not Exist');</script>");
        }
        protected void Panding_Click(object sender, EventArgs e)
        {
            if (CheckMemberExist())
                UpdateStatus("Panding");
            else
                Response.Write("<script>alert('Member Does not Exist');</script>");
        }
        protected void Deactivate_Click(object sender, EventArgs e)
        {
            if (CheckMemberExist())
                UpdateStatus("Rejected");
            else
                Response.Write("<script>alert('Member Does not Exist');</script>");
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            if (CheckMemberExist())
                DeleteMeber();
            else
                Response.Write("<script>alert('Member Does not Exist');</script>");
        }

        bool CheckMemberExist()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == System.Data.ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM members_table WHERE member_id=@member_id", connection);
                cmd.Parameters.AddWithValue("@member_id", FindID.Text.Trim());

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count >= 1)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            return false;
        }

        void FindMemberID()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == System.Data.ConnectionState.Closed)
                    connection.Open();

                SqlCommand sqlCommand = new SqlCommand("SELECT * FROM members_table WHERE member_id=@member_id", connection);
                sqlCommand.Parameters.AddWithValue("@member_id", FindID.Text.Trim());

                SqlDataReader reader = sqlCommand.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        FullName.Text = reader.GetValue(0).ToString();
                        AccountStatus.Text = reader.GetValue(10).ToString();
                        DateOfBirth.Text = reader.GetValue(1).ToString();
                        ContactNumber.Text = reader.GetValue(2).ToString();
                        EmailID.Text = reader.GetValue(3).ToString();
                        Address.Text = reader.GetValue(7).ToString();
                        State.Text = reader.GetValue(4).ToString();
                        City.Text = reader.GetValue(5).ToString();
                        Pin.Text = reader.GetValue(6).ToString();
                    }
                }
                connection.Close();
            }
            catch (Exception e)
            {
                Response.Write("<Script>alert('" + e.Message + "');</script>");
            }
        }

        void UpdateStatus(string status)
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == System.Data.ConnectionState.Closed)
                    connection.Open();

                SqlCommand sqlCommand = new SqlCommand("UPDATE members_table SET account_status=@status WHERE member_id=@member_id", connection);
                sqlCommand.Parameters.AddWithValue("@member_id", FindID.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@status", status);

                sqlCommand.ExecuteNonQuery();
                connection.Close();

                MemberList.DataBind();
                AccountStatus.Text = status;
            }
            catch (Exception E)
            {
                Response.Write("<script>alert('" + E.Message + "');</script>");
            }
        }

        void DeleteMeber()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == System.Data.ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("DELETE FROM members_table WHERE member_id=@member_id", connection);
                cmd.Parameters.AddWithValue("@member_id", FindID.Text.Trim());

                cmd.ExecuteNonQuery();
                connection.Close();

                ClearForm();
                MemberList.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void ClearForm() // not efficent.. how to fix this?
        {
            FindID.Text = "";
            FullName.Text = "";
            AccountStatus.Text = "";
            DateOfBirth.Text = "";
            ContactNumber.Text = "";
            EmailID.Text = "";
            Address.Text = "";
            State.Text = "";
            City.Text = "";
            Pin.Text = "";
        }
    }
}