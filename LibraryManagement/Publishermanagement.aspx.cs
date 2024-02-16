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
    public partial class WebForm7 : System.Web.UI.Page
    {
        string strdb = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Publisher.DataBind();
        }

        protected void GO_Click(object sender, EventArgs e)
        {
            if (CheckPublisherExist())
                GetPublisher();
            else
                Response.Write("<script>alert('Publisher does not exist');</script>");
        }

        protected void add_Click(object sender, EventArgs e)
        {
            if (CheckPublisherExist())
                Response.Write("<script>alert('Publisher already exist');</script>");
            else
                AddPublisher();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            if (CheckPublisherExist())
                UpdatePublisher();
            else
                Response.Write("<script>alert('Publisher does not exist');</script>");
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            if (CheckPublisherExist())
                DeletePublisher();
            else
                Response.Write("<script>alert('Publisher does not exist');</script>");
        }

        bool CheckPublisherExist()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == System.Data.ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_table WHERE publisher_id=@publisher_id", connection);
                cmd.Parameters.AddWithValue("@publisher_id", TextBox1.Text.Trim());
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count >= 1)
                    return true;
                return false;
            }
            catch (Exception E)
            {
                Response.Write("<script>alert('" + E.Message + "');<.script>");
            }
            return false;
        }

        void GetPublisher()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM publisher_table WHERE publisher_id=@publisher_id", connection);
                cmd.Parameters.AddWithValue("@publisher_id", TextBox1.Text.Trim());

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while(reader.Read())
                    {
                        TextBox2.Text = reader.GetValue(1).ToString();
                    }
                }
            }
            catch (Exception E)
            {
                Response.Write("<script>alert('" + E.Message + "');</script>");
            }
        }

        void UpdatePublisher()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("UPDATE publisher_table SET publisher_name=@publisher_name WHERE publisher_id=@publisher_id", connection);
                cmd.Parameters.AddWithValue("@publisher_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", TextBox2.Text.Trim());

                cmd.ExecuteNonQuery();
                Publisher.DataBind();
                connection.Close();
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
            }
        }

        void AddPublisher()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO publisher_table (publisher_id,publisher_name) VALUES (@publisher_id,@publisher_name)", connection);
                cmd.Parameters.AddWithValue("@publisher_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", TextBox2.Text.Trim());
                cmd.ExecuteNonQuery();
                Publisher.DataBind();
                connection.Close();
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
            }
        }

        void DeletePublisher()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("DELETE from publisher_table WHERE publisher_id=@publisher_id",connection);
                cmd.Parameters.AddWithValue("@publisher_id", TextBox1.Text.Trim());
                cmd.ExecuteNonQuery();
                Publisher.DataBind();
                connection.Close();
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + e.Message +"');</script>");
            }
        }
    }
}