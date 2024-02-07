<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="LibraryManagement.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center-grid">
        <div class="container">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card my-4">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img src="Icons/User.svg" width="150" class="my-1" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col m-3">
                                    <center>
                                        <h3 class="my-1">
                                            Admin Login
                                        </h3>
                                        <hr />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <div class="form-group">
                                            <label>Admin ID</label>
                                            <asp:TextBox CssClass="form-control my-3" placeholder="Admin ID" ID="TextBox1" runat="server"></asp:TextBox>
                                            <label>Password</label>
                                            <asp:TextBox CssClass="form-control my-3" TextMode="Password" placeholder="Password" ID="TextBox2" runat="server"></asp:TextBox>

                                            <div class="d-grid gap-2">
                                        
                                                <asp:Button ID="Button1" class="btn btn-success d-block my-1" text="Login" runat="server" />
                                                <a href="singup.aspx" class="btn btn-info d-block my-1">
                                                    Sign Up
                                                </a>
                                            </div>

                                        </div>
                                    </center>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
