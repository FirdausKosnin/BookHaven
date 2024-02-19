using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        string strdb = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
        static DateTime today = DateTime.Today;
        static DateTime DueDate = today.AddDays(21);
        int day = today.Day;
        int month = today.Month;
        int year = today.Year;
        string yearid = today.ToString("dd-MM-yy");

        protected void Page_Load(object sender, EventArgs e)
        {
            BorrowBooks.DataBind();

            StartDate.Text = today.ToString("yyyy-MM-dd");
            EndDate.Text = DueDate.ToString("yyyy-MM-dd");
        }

        protected void GO_ID_Click(object sender, EventArgs e)
        {
            FindIssueID();
        }

        protected void GO_Member_Click(object sender, EventArgs e)
        {
            FindMemberID();
        }

        protected void GO_Book_Click(object sender, EventArgs e)
        {
            FindBookID();
        }

        protected void Reserve_Click(object sender, EventArgs e)
        {
            if (BookInLibrary() && MemberInLibrary())
                ReserveBook();
        }

        protected void Return_Click(object sender, EventArgs e)
        {
            if (ReserveInLibrary())
                ReturnBook();
        }

        void FindIssueID()
        {
            try
            {
                SqlConnection Connection = new SqlConnection(strdb);
                if (Connection.State == ConnectionState.Closed)
                    Connection.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_table WHERE issue_id=@issue_id",Connection);
                cmd.Parameters.AddWithValue("@issue_id", IssueID.Text.Trim());
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    BookID.Text = dt.Rows[0]["book_id"].ToString();
                    BookName.Text = dt.Rows[0]["book_name"].ToString();
                    MemberID.Text = dt.Rows[0]["member_id"].ToString();
                    MemberName.Text = dt.Rows[0]["member_name"].ToString();
                    StartDate.Text = dt.Rows[0]["issue_date"].ToString();
                    EndDate.Text = dt.Rows[0]["due_date"].ToString();
                }
                else
                    Response.Write("<script>alert('Book ID does not Exist');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void FindMemberID()
        {
            try
            {
                SqlConnection Connection = new SqlConnection(strdb);
                if (Connection.State == System.Data.ConnectionState.Closed)
                    Connection.Open();

                SqlCommand cmd = new SqlCommand("SELECT full_name FROM members_table " +
                    "WHERE member_id=@member_id", Connection);
                cmd.Parameters.AddWithValue("member_id", MemberID.Text.Trim());
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count >= 1)
                    MemberName.Text = dt.Rows[0]["full_name"].ToString();
                else
                Response.Write("<script>alert('Member ID does not Exist');</script>");
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
            }
        }

        void FindBookID()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("SELECT book_name FROM book_table " +
                    "WHERE book_id=@book_id", connection);
                cmd.Parameters.AddWithValue("book_id", BookID.Text.Trim());
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count >= 1)
                    BookName.Text = dt.Rows[0]["book_name"].ToString();
                else
                    Response.Write("<script>alert('Book ID does not Exist');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        bool ReserveInLibrary()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_issue_table " +
                    "WHERE issue_id=@issue_id", connection);
                cmd.Parameters.AddWithValue("@issue_id", IssueID.Text.Trim());
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count >= 1)
                    return true;
                return false;
            }
            catch (Exception E)
            {
                Response.Write("<script>alert('" + E.Message + "');</script>");
            }
            return false;
        }

        bool MemberInLibrary()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM members_table " +
                    "WHERE member_id=@member_id", connection);
                cmd.Parameters.AddWithValue("@member_id", MemberID.Text.Trim());
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count >= 1)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')");
            }
            return false;
        }

        bool BookInLibrary()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand command = new SqlCommand("SELECT * FROM book_table " +
                    "WHERE book_id=@book_id AND current_stock > 0", connection);
                command.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count >= 1)
                    return true;
                return false;
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
            }
            return false;
        }

        void ReserveBook()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO book_issue_table " +
                    "(issue_id,member_id,member_name,book_id,book_name,issue_date,due_date,returned) " +
                    "VALUES (@issue_id,@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date,@returned)", connection);

                string Issued_ID = MemberID.Text.Trim() + BookID.Text.Trim() + yearid;

                cmd.Parameters.AddWithValue("@issue_id", Issued_ID);
                cmd.Parameters.AddWithValue("@member_id", MemberID.Text.Trim());
                cmd.Parameters.AddWithValue("@member_name", MemberName.Text.Trim());
                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", BookName.Text.Trim());
                cmd.Parameters.AddWithValue("@issue_date", today.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@due_date", DueDate.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@returned", 0);

                cmd.ExecuteNonQuery();
                connection.Close();

                BorrowBooks.DataBind();
                clearform();
            }
            catch (Exception e)
            {
                Response.Write("<script>alert('" + e.Message + "');</script>");
            }
        }

        void ReturnBook()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("UPDATE book_issue_table " +
                    "SET return_date=@return_date," +
                    "returned=@returned " +
                    "WHERE issue_id=@issue_id", connection);

                cmd.Parameters.AddWithValue("@return_date", today.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@returned", 1);
                cmd.Parameters.AddWithValue("@issue_id",IssueID.Text.Trim());
                cmd.ExecuteNonQuery();
                BorrowBooks.DataBind();
                connection.Close();
                clearform();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message +"')</script>");
            }
        }

        void clearform()
        {
            IssueID.Text = "";
            MemberID.Text = "";
            MemberName.Text = "";
            BookID.Text = "";
            BookName.Text = "";
            StartDate.Text = today.ToString("yyyy-MM-dd");
            EndDate.Text = DueDate.ToString("yyyy-MM-dd");
        }
    }
}