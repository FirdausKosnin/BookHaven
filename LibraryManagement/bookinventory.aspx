<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="bookinventory.aspx.cs" Inherits="LibraryManagement.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script>
    $(document).ready(function () {
        //let table = new DataTable('#table');
        $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        //$('#Delete').click(function () {
        //    $('.box').each(function () {
        //        $(this).val('');
        //    });
        //});
    });

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#image_view').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row my-4">

            <div class="col-md-5">

                <div class="center-grid">
                    <h3>
                        Book Details
                    </h3>
                    <img id="image_view" src="Icons/Book_Borrow.svg" class="my-1" height="100">
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="mb-3">
                          <label for="formFile" class="form-label">Book Cover Page</label>
                           <asp:FileUpload onchange="readURL(this);" class="form-control" type="file" id="formFile" runat="server"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label>
                            Book ID
                        </label>
                        <div class="input-group">
                            <asp:TextBox CssClass="form-control box" ID="BookID" placeholder="Book ID" runat="server">
                            </asp:TextBox>
                            <asp:Button type="button" CssClass="btn btn-dark" Text="GO" ID="GO" runat="server" OnClick="GO_Click"/>
                        </div>

                    </div>
                    <div class="col-md-8">
                        <label>
                            Book Name
                        </label>
                        <asp:TextBox CssClass="form-control box" placeholder="Book Name" ID="BookName" runat="server">
                        </asp:TextBox>
                    </div>
                    <div class="row">

                    </div>

                </div>

                <div class="row my-3">
                    <div class="col-md-4">
                        <label class="mt-2">
                            Language
                        </label>
                        <asp:DropDownList CssClass="form-control" palceholder="Language" ID="Language" runat="server">
                            <asp:ListItem Value="English" Text="English"></asp:ListItem>
                            <asp:ListItem Value="Malay" Text="Malay"></asp:ListItem>
                            <asp:ListItem Value="cantonese" Text="cantonese"></asp:ListItem>
                        </asp:DropDownList>
                        <label class="mt-2">
                            Publisher Name
                        </label>
                        <asp:DropDownList CssClass="form-control" palceholder="Publisher" ID="PublisherName" runat="server">

                        </asp:DropDownList>
                    </div>

                    <div class="col-md-4">
                        <label class="mt-2">
                            Author Name
                        </label>
                        <asp:DropDownList CssClass="form-control" palceholder="Name" ID="AuthorName" runat="server">

                        </asp:DropDownList>
                        <label class="mt-2">
                            Publish Date
                        </label>
                        <asp:TextBox CssClass="form-control box" placeholder="dd/mm/yyyy" TextMode="date" runat="server" ID="PublishDate">
                        </asp:TextBox>
                    </div>

                    <div class="col-md-4">
                        <label class="mt-2">
                            Genre
                        </label>
                        <asp:ListBox CssClass="form-control" ID="Genre" runat="server" Rows="5" SelectionMode="Multiple">
                            <asp:ListItem Value="Adventure" Text="Adventure"></asp:ListItem>
                            <asp:ListItem Value="Comic" Text="Comic"></asp:ListItem>
                            <asp:ListItem Value="Self Help" Text="Self Help"></asp:ListItem>
                            <asp:ListItem Value="Motivation" Text="Motivation"></asp:ListItem>
                            <asp:ListItem Value="Healthy Living" Text="Healthy Living"></asp:ListItem>
                            <asp:ListItem Value="Wellness" Text="Wellness"></asp:ListItem>
                            <asp:ListItem Value="Crime" Text="Crime"></asp:ListItem>
                            <asp:ListItem Value="Drama" Text="Drama"></asp:ListItem>
                            <asp:ListItem Value="Fantasy" Text="Fantasy"></asp:ListItem>
                            <asp:ListItem Value="Horror" Text="Horror"></asp:ListItem>
                            <asp:ListItem Value="Poetory" Text="Poetory"></asp:ListItem>
                            <asp:ListItem Value="Personal" Text="Personal"></asp:ListItem>
                            <asp:ListItem Value="Romance" Text="Romance"></asp:ListItem>
                        </asp:ListBox>
                    </div>
                </div>

                <div class="row my-3">
                    <div class="col-md-4">
                        <label>
                            Edition
                        </label>
                        <asp:TextBox CssClass="form-control box" placeholder="1st" ID="edition" TextMode="Number" runat="server">
                        </asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>
                            Book Cost(Per Unit)
                        </label>
                        <asp:TextBox CssClass="form-control box" ID="PriceTag" TextMode="Number" runat="server">
                        </asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>
                            Pages
                        </label>
                        <asp:TextBox CssClass="form-control box" ID="Pages" TextMode="Number" runat="server">
                        </asp:TextBox>
                    </div>
                </div>

                <div class="row my-3">
                    <div class="col-md-4">
                        <label>
                            Actual Stock
                        </label>
                        <asp:TextBox CssClass="form-control box" TextMode="Number"  ID="AtualStock" runat="server">
                        </asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>
                            Current Stock
                        </label>
                        <asp:TextBox CssClass="form-control box" TextMode="Number" ID="CurrentStock" ReadOnly="true" runat="server">
                        </asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>
                            Issued Book
                        </label>
                        <asp:TextBox CssClass="form-control box" TextMode="Number" ID="IssuedBook" ReadOnly="true" runat="server">
                        </asp:TextBox>
                    </div>
                </div>

                <div class="row my-3">
                    <div class="col-md-12">
                        <label>
                            Book Description
                        </label>
                        <asp:TextBox CssClass="form-control box" ID="BookDetail" placeholder="Book Detail" TextMode="MultiLine" row="2" runat="server">
                        </asp:TextBox>
                    </div>
                </div>

                <div class="row my-3">
                    <div class="col-md-4 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-success" text="Add" ID="Add" runat="server" OnClick="Add_Click"/>
                    </div>
                    <div class="col-md-4 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-info" text="Update" ID="Update" runat="server" OnClick="Update_Click"/>
                    </div>
                    <div class="col-md-4 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-danger" text="Delete" ID="Delete" runat="server" OnClick="Delete_Click"/>
                    </div>
                </div>

            </div>
            <div class="col-md-7">
                <div class="center-grid">
                    <h4>
                        Book Inventory
                    </h4>
                </div>
                <hr />
                <asp:SqlDataSource ID="BookDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ElibraryDBConnectionString4 %>" SelectCommand="SELECT * FROM [book_table]">
                </asp:SqlDataSource>
                <div class="row">
                    <div class="col">
                        <asp:GridView class="table" ID="BookInventory" runat="server" AutoGenerateColumns="False" DataKeyNames="book_id" DataSourceID="BookDataSource">
                            <Columns>
                                <asp:BoundField DataField="book_id" HeaderText="book_id" ReadOnly="True" SortExpression="book_id" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <div class="container-fluid">
                                            <div class="row my-1">
                                                <div class="col-lg-10">

                                                    <div class="row">
                                                        <div class="col">
                                                            <asp:Label Font-Size="X-Large" Font-Bold="True" Text='<%# Eval("book_name") %>' ID="TitleDisplay" runat="server"></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row my-1">
                                                        <div class="col">
                                                            <span>
                                                                Author - 
                                                            </span>
                                                            <asp:Label ID="AuthorDisplay" runat="server" Font-Bold="True" Text='<%# Eval("author_name") %>'></asp:Label>

                                                          <span>
                                                              | Genre - 
                                                          </span>
                                                          <asp:Label ID="GenreDisplay" runat="server" Font-Bold="True" Text='<%# Eval("genre") %>'></asp:Label>

                                                          <span>
                                                              | Language - 
                                                          </span>
                                                          <asp:Label ID="LanguageDisplay" runat="server" Font-Bold="True" Text='<%# Eval("language") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row my-1">
                                                        <div class="col">
                                                            <span>
                                                                Publisher - 
                                                            </span>
                                                            <asp:Label ID="PublisherDisplay" runat="server" Font-Bold="True" Text='<%# Eval("publisher_name") %>'></asp:Label>

                                                          <span>
                                                              | Publish Date - 
                                                          </span>
                                                          <asp:Label ID="PublishDateDisplay" runat="server" Font-Bold="True" Text='<%# Eval("publish_date") %>'></asp:Label>

                                                          <span>
                                                              | Pages - 
                                                          </span>
                                                          <asp:Label ID="PagesDisplay" runat="server" Font-Bold="True" Text='<%# Eval("no_of_pages") %>'></asp:Label>

                                                          <span>
                                                              | Edition - 
                                                          </span>
                                                          <asp:Label ID="EditionDisplay" runat="server" Font-Bold="True" Text='<%# Eval("edition") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row my-1">
                                                        <div class="col">
                                                            <span>
                                                                Price - 
                                                            </span>
                                                            <asp:Label ID="PriceDisplay" runat="server" Font-Bold="True" Text='<%# Eval("book_cost") %>'></asp:Label>

                                                            <span>
                                                                | Actual Stock - 
                                                            </span>
                                                            <asp:Label ID="ActualStock" runat="server" Font-Bold="True" Text='<%# Eval("actual_stock") %>'></asp:Label>

                                                            <span>
                                                                | Available - 
                                                            </span>
                                                            <asp:Label ID="Available" runat="server" Font-Bold="True" Text='<%# Eval("current_stock") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                    <div class="row my-1">
                                                        <div class="col">
                                                            <asp:Label ID="Details" runat="server" Font-Size="Small" Font-Italic="true" Text='<%# Eval("book_description") %>'></asp:Label>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-lg-2">
                                                    <asp:Image class="img-fluid p-2" ID="BookCover" runat="server" ImageUrl='<%# Eval("book_img_link") %>'/>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
