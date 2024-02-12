<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="bookiventory.aspx.cs" Inherits="LibraryManagement.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row my-4">

            <div class="col-md-5">

                <div class="center-grid">
                    <h3>
                        Book Details
                    </h3>
                    <img src="Icons/Book_Borrow.svg" class="my-1" width="150">
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="mb-3">
                          <label for="formFile" class="form-label">Book Details</label>
                           <asp:FileUpload class="form-control" type="file" id="formFile" runat="server"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <label>
                            Book ID
                        </label>
                        <div class="input-group">
                            <asp:TextBox CssClass="form-control" ID="BookID" placeholder="Book ID" runat="server">
                            </asp:TextBox>
                            <asp:Button type="button" CssClass="btn btn-dark" Text="GO" ID="GO" runat="server"/>
                        </div>

                    </div>
                    <div class="col-md-8">
                        <label>
                            Book Name
                        </label>
                        <asp:TextBox CssClass="form-control" placeholder="Book Name" ID="BookName" runat="server">
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
                        <asp:TextBox CssClass="form-control" placeholder="dd/mm/yyyy" runat="server" ID="PublishDate">
                        </asp:TextBox>
                    </div>

                    <div class="col-md-4">
                        <label class="mt-2">
                            Genre
                        </label>
                        <asp:ListBox CssClass="form-control" ID="Genre" runat="server" Rows="5">
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
                        <asp:TextBox CssClass="form-control" placeholder="1st" ID="edition" TextMode="Number" runat="server">
                        </asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>
                            Book Cost(Per Unit)
                        </label>
                        <asp:TextBox CssClass="form-control" ID="PriceTag" TextMode="Number" runat="server">
                        </asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>
                            Pages
                        </label>
                        <asp:TextBox CssClass="form-control" ID="Pages" TextMode="Number" runat="server">
                        </asp:TextBox>
                    </div>
                </div>

                <div class="row my-3">
                    <div class="col-md-4">
                        <label>
                            Actual Stock
                        </label>
                        <asp:TextBox CssClass="form-control" TextMode="Number"  ID="AtualStock" runat="server">
                        </asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>
                            Current Stock
                        </label>
                        <asp:TextBox CssClass="form-control" TextMode="Number" ID="CurrentStock" runat="server">
                        </asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label>
                            Issued Book
                        </label>
                        <asp:TextBox CssClass="form-control" TextMode="Number" ID="IssuedBook" runat="server">
                        </asp:TextBox>
                    </div>
                </div>

                <div class="row my-3">
                    <div class="col-md-12">
                        <label>
                            Book Description
                        </label>
                        <asp:TextBox CssClass="form-control" placeholder="Book Detail" TextMode="MultiLine" row="2" runat="server">
                        </asp:TextBox>
                    </div>
                </div>

                <div class="row my-3">
                    <div class="col-md-4 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-success" text="Add" ID="Add" runat="server"/>
                    </div>
                    <div class="col-md-4 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-info" text="Update" ID="Update" runat="server"/>
                    </div>
                    <div class="col-md-4 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-danger" text="Delete" ID="Delete" runat="server"/>
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
                <div class="row">
                    <div class="col">
                        <asp:GridView class="tale" ID="BookInventory" runat="server">

                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
