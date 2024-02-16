using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        string strdb = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_book;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                FillDropDown();

            BookInventory.DataBind();
        }

        protected void GO_Click(object sender, EventArgs e)
        {
            if (CheckBookExist())
                GetFillObject();
            else
                Response.Write("<script>alert('The book does not exist');</script>");
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            if (CheckBookExist())
                Response.Write("<script>alert('The book already Exist');</script>");
            else
                AddNewBook();
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            if (CheckBookExist())
                UpdateBook();
            else
                Response.Write("<scirpt>alert('The Book Does not Exist');</script>");

        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            if (CheckBookExist())
                DeleteBookID();
            else
                Response.Write("<script>alert('The Book Does not Exist');</script>");
        }

        void FillDropDown()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand authorcmd = new SqlCommand("SELECT author_name FROM author_table", connection);
                SqlDataAdapter authorsqlDataAdapter = new SqlDataAdapter(authorcmd);
                DataTable authordt = new DataTable();
                authorsqlDataAdapter.Fill(authordt);

                AuthorName.DataSource = authordt;
                AuthorName.DataValueField = "author_name";
                AuthorName.DataBind();

                SqlCommand publishercmd = new SqlCommand("SELECT publisher_name FROM publisher_table", connection);
                SqlDataAdapter publisherdataAdapter = new SqlDataAdapter(publishercmd);
                DataTable publisherdata = new DataTable();
                publisherdataAdapter.Fill(publisherdata);

                PublisherName.DataSource = publisherdata;
                PublisherName.DataValueField = "publisher_name";
                PublisherName.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GetFillObject()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM book_table WHERE book_id=@book_id", connection);
                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sqlDataAdapter.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    string[] MultiGenre = dt.Rows[0]["genre"].ToString().Trim().Split(',');

                    BookName.Text = dt.Rows[0]["book_name"].ToString();
                    PublishDate.Text = dt.Rows[0]["publish_date"].ToString();
                    edition.Text = dt.Rows[0]["edition"].ToString();
                    PriceTag.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    Pages.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    AtualStock.Text = dt.Rows[0]["actual_stock"].ToString().Trim();
                    CurrentStock.Text = dt.Rows[0]["current_stock"].ToString().Trim();
                    BookDetail.Text = dt.Rows[0]["book_description"].ToString();
                    AuthorName.SelectedValue = dt.Rows[0]["author_name"].ToString();
                    PublisherName.SelectedValue = dt.Rows[0]["publisher_name"].ToString();
                    Language.SelectedValue = dt.Rows[0]["language"].ToString();

                    Genre.ClearSelection();
                    for (int i = 0; i < MultiGenre.Length; i++)
                    {
                        for (int j = 0; j < Genre.Items.Count; j++)
                        {
                            if (Genre.Items[j].ToString() == MultiGenre[i])
                                Genre.Items[j].Selected = true;
                        }
                    }

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_book = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();
                    IssuedBook.Text = global_issued_book.ToString();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        bool CheckBookExist()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("SELECT * from book_table WHERE book_id=@book_id OR book_name=@book_name", connection);
                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", BookName.Text.Trim());
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                DataTable book = new DataTable();
                dataAdapter.Fill(book);

                if (book.Rows.Count >= 1)
                    return true;
                return false;
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
            return false;
        }

        void UpdateBook()
        {
            try
            {
                string MultipleGenre = SelectGenre();

                string filepath;
                string filename = Path.GetFileName(formFile.PostedFile.FileName);
                if (filename == "" || filename == null)
                    filepath = global_filepath;
                else
                {
                    formFile.SaveAs(Server.MapPath("Book_Image/" + filename));
                    filepath = "~/Book_Image/" + filename;
                }

                int total_stock = Convert.ToInt32(AtualStock.Text.Trim());
                int current_stock = Convert.ToInt32(CurrentStock.Text.Trim());

                if (total_stock != current_stock)
                {
                    if ( total_stock < global_issued_book)
                    {
                        Response.Write("<script>alert('Actual Stock cannot be less than Issued Books');</script>");
                        return;
                    }
                    else
                        current_stock = total_stock - global_issued_book;
                }

                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("UPDATE book_table SET " +
                    "book_name=@book_name, genre=@genre, author_name=@author_name, publisher_name=@publisher_name, publish_date=@publish_date," +
                    "language=@language, edition=@edition, book_cost=@book_cost, no_of_pages=@no_of_pages, book_description=@book_description, " +
                    "actual_stock=@actual_stock, current_stock=@current_stock,book_img_link=@book_img_link " +
                    "WHERE book_id=@book_id",
                    connection);
                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", BookName.Text.Trim());
                cmd.Parameters.AddWithValue("@author_name", AuthorName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", PublisherName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", PublishDate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", Language.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", edition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", PriceTag.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", Pages.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", AtualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", current_stock);
                cmd.Parameters.AddWithValue("@book_description", BookDetail.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", MultipleGenre);
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                connection.Close();

                ClearForm();
                BookInventory.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void AddNewBook()
        {
            try
            {
                string MultipleGenre = SelectGenre();

                //string filepath = "~/Icons/Book_Borrow.svg";
                string filepath;
                string filename = Path.GetFileName(formFile.PostedFile.FileName);
                formFile.SaveAs(Server.MapPath("Book_Image/" + filename));
                filepath = "~/Book_Image/" + filename;

                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO book_table " +
                    "(book_id,book_name,genre,author_name,publisher_name,publish_date,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link) " +
                    "VALUES " +
                    "(@book_id,@book_name,@genre,@author_name,@publisher_name,@publish_date,@language,@edition,@book_cost,@no_of_pages,@book_description,@actual_stock,@current_stock,@book_img_link)"
                    , connection);
                cmd.Parameters.AddWithValue("book_id", BookID.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", BookName.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", MultipleGenre);
                cmd.Parameters.AddWithValue("@author_name", AuthorName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publisher_name", PublisherName.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@publish_date", PublishDate.Text.Trim());
                cmd.Parameters.AddWithValue("@language", Language.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@edition", edition.Text.Trim());
                cmd.Parameters.AddWithValue("@book_cost", PriceTag.Text.Trim());
                cmd.Parameters.AddWithValue("@no_of_pages", Pages.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_stock", AtualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@current_stock", AtualStock.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", BookDetail.Text.Trim());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);

                cmd.ExecuteNonQuery();
                connection.Close();

                ClearForm();
                BookInventory.DataBind();
            }
            catch ( Exception ex )
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }

        void DeleteBookID()
        {
            try
            {
                SqlConnection connection = new SqlConnection(strdb);
                if (connection.State == ConnectionState.Closed)
                    connection.Open();

                SqlCommand cmd = new SqlCommand("DELETE FROM book_table WHERE book_id=@book_id", connection);
                cmd.Parameters.AddWithValue("@book_id", BookID.Text.Trim());
                cmd.ExecuteNonQuery();

                BookInventory.DataBind();
                connection.Close();
                ClearForm();
            }
            catch ( Exception ex )
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }

        string SelectGenre()
        {
            string MultipleGenre = "";
            foreach (int i in Genre.GetSelectedIndices())
            {
                MultipleGenre = MultipleGenre + Genre.Items[i] + ",";
            }
            MultipleGenre = MultipleGenre.Remove(MultipleGenre.Length - 1);
            return MultipleGenre;
        }

        void ClearForm()
        {
            BookID.Text = "";
            BookName.Text = "";
            AuthorName.Text = "";
            PublisherName.Text = "";
            PublishDate.Text = "";
            edition.Text = "";
            PriceTag.Text = "";
            Pages.Text = "";
            AtualStock.Text = "";
            CurrentStock.Text = "";
            IssuedBook.Text = "";
            BookDetail.Text = "";
        }
    }
}