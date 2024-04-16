<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="Authermanagement.aspx.cs" Inherits="LibraryManagement.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            //let table = new DataTable('#table');
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="row">
            <div class="col-md-4 my-4">
                <div class="center-grid">
                    <img src="Icons/Author.svg" width="75" class="my-2 mx-4"/>
                    <h4 class="d-block my-1">
                        Author Details
                    </h4>
                </div>
                <hr />

                <div class="row">
                    <div class="col-md-4">
                        <label class="my-1">
                            Author ID
                        </label>
                        <div class="center-grid">
                            <div class="input-group my-2">
                                <asp:TextBox CssClass="form-control" ID="TextBox1" placeholder="ID" runat="server">
                                </asp:TextBox>
                                <asp:Button type="button" class="btn btn-dark" text="GO" ID="GO" runat="server" OnClick="GO_Click"/>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-8">
                        <label class="my-1">
                            Author Name
                        </label>
                        <div class="center-grid my-2">
                            <asp:TextBox CssClass="form-control" ID="TextBox2" placeholder="Name" runat="server">
                            </asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row my-4">
                    <div class="col-md-4 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-success" Text="Add" ID="add" runat="server" OnClick="add_Click"/>
                    </div>
                    <div class="col-md-4 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-info" Text="Update" ID="update" runat="server" OnClick="update_Click"/>
                    </div>
                    <div class="col-md-4 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-danger" Text="Delete" ID="delete" runat="server" OnClick="delete_Click"/>
                    </div>
                </div>
            </div>

            <div class="col-md-8 my-4">
                <div class="center-grid">
                    <h4 class="d-block my-3">
                        Author List
                    </h4>
                </div>
                <hr />
                <asp:SqlDataSource ID="SQLDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ElibraryDBConnectionString %>" ProviderName="<%$ ConnectionStrings:ElibraryDBConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [author_table]">
                </asp:SqlDataSource>
                <div class="row">
                    <div class="col my-2">
                        <asp:GridView class="table" ID="author" runat="server" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SQLDataSource1">
                            <Columns>
                                <asp:BoundField DataField="author_id" HeaderText="author_id" ReadOnly="True" SortExpression="author_id" />
                                <asp:BoundField DataField="author_name" HeaderText="author_name" SortExpression="author_name" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
