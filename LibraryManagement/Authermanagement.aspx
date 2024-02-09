<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="Authermanagement.aspx.cs" Inherits="LibraryManagement.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="row">
            <div class="col-md-4 my-4">
                <div class="center-grid">
                    <img src="Icons/Author.svg" width="150" class="my-2"/>
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
                                <asp:Button type="button" class="btn btn-dark" text="GO" ID="GO" runat="server"/>
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
                        <asp:Button type="button" CssClass="btn btn-success" Text="Add" ID="add" runat="server"/>
                    </div>
                    <div class="col-md-4 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-info" Text="Update" ID="update" runat="server"/>
                    </div>
                    <div class="col-md-4 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-danger" Text="Delete" ID="delete" runat="server"/>
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
            </div>

            <div class="row">
                <div class="col-md-12 my-2">
                    <asp:GridView class="table" ID="author" runat="server">

                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
