<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="bookview.aspx.cs" Inherits="LibraryManagement.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            //let table = new DataTable('#table');
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mb-3">
        <div class="row">
            <div class="col-md-12">
                <div class="center-grid">
                    <h2 class="my-3">
                        BOOK INVENTORY
                    </h2>
                </div>
                <hr />
                <asp:SqlDataSource ID="BookDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ElibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_table]">
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
