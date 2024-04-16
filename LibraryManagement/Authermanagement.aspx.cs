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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string strdb = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //author.DataBind();
        }

        protected void GO_Click(object sender, EventArgs e)
        {
            if (CheckAuthorExist())
                GetAuthor();
            else
                Response.Write("<script>alert('Author does not Exist')</script>");
        }

        protected void add_Click(object sender, EventArgs e)
        {
            if (CheckAuthorExist())
                Response.Write("<script>alert('Author Already Exist')</script>");
            else
                AddAuthor();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            if(CheckAuthorExist())
                UpdateAuthor();
            else
                Response.Write("<script>alert('Author does not Exist')</script>");
        }

        protected void delete_Click(object sender, EventArgs e)
        {
            if (CheckAuthorExist())
                DeleteAuthor();
            else
                Response.Write("<script>alert('Author does not Exist')</script>");
        }

        void AddAuthor()
        {
            try
            {
                SqlConnection connect = new SqlConnection(strdb);
                if (connect.State == ConnectionState.Closed)
                    connect.Open();

                SqlCommand sqlCommand = new SqlCommand("INSERT INTO author_table (author_id,author_name) " +
                    "VALUES (@author_id,@author_name);", connect);

                sqlCommand.Parameters.AddWithValue("@author_id", TextBox1.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@author_name", TextBox2.Text.Trim());

                sqlCommand.ExecuteNonQuery();
                author.DataBind();
                connect.Close();
                ClearForm();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void UpdateAuthor()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand sqlCommand = new SqlCommand("UPDATE author_table SET author_name = @author_name WHERE author_id = @author_id",connection);

                sqlCommand.Parameters.AddWithValue("@author_id", TextBox1.Text.Trim());
                sqlCommand.Parameters.AddWithValue("@author_name", TextBox2.Text.Trim());

                sqlCommand.ExecuteNonQuery();
                connection.Close();
                author.DataBind();
                ClearForm();
            }
            catch (Exception E)
            {
                Response.Write("<script>alert(" + E.Message + ");</script>");
            }
        }

        void DeleteAuthor()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand sqlCommand = new SqlCommand("DELETE from author_table WHERE author_id = @author_id", connection);
                sqlCommand.Parameters.AddWithValue("@author_id", TextBox1.Text.Trim());
                sqlCommand.ExecuteNonQuery();
                author.DataBind();
                ClearForm();
            }
            catch (Exception E)
            {
                Response.Write("<script>alert(" + E.Message + ");</script>");
            }
        }

        void GetAuthor()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM author_table WHERE author_id=@author_id", connection);
                cmd.Parameters.AddWithValue("@author_id",TextBox1.Text.Trim());

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        TextBox2.Text = reader.GetValue(1).ToString();
                    }
                }
                connection.Close();
            }
            catch (Exception E)
            {
                Response.Write("<script>alert('" + E.Message + "');</script>");
            }
        }

        bool CheckAuthorExist()
        {
            try
            {
                SqlConnection connect = new SqlConnection(strdb);
                if (connect.State == System.Data.ConnectionState.Closed)
                    connect.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM author_table WHERE author_id=@author_id", connect);

                cmd.Parameters.AddWithValue("@author_id", TextBox1.Text.Trim());

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dataTable = new DataTable();
                adapter.Fill(dataTable);

                if (dataTable.Rows.Count >= 1)
                    return true;
                return false;

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            return false;
        }

        void ClearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }
    }
}