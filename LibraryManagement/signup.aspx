<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="LibraryManagement.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/form.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="center-grid">
        <div class="container">
            <div class="row">
                <div class="col-md-10 mx-auto">
                    <div class="card my-4">
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <center>
                                        <img src="Icons/User.svg" width="75" class="my-1" />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col m-1">
                                    <center>
                                        <h4 class="my-1">
                                            Sign Up
                                        </h4>
                                        <hr />
                                    </center>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    <label class="mt-3 mb-1">Full Name</label>
                                    <asp:TextBox CssClass="form-control" placeholder="Full Name" ID="TextBox1" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-6">
                                    <label class="mt-3 mb-1">Date of Birth</label>
                                    <asp:TextBox CssClass="form-control" TextMode="date" placeholder="dd-mm-yyyy" ID="TextBox2" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    <label class="mt-3 mb-1">Contact Number</label>
                                    <asp:TextBox CssClass="form-control" placeholder="Contact Number" TextMode="number" ID="TextBox3" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-6">
                                    <label class="mt-3 mb-1">Email</label>
                                    <asp:TextBox CssClass="form-control" placeholder="email" ID="TextBox4" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label class="mt-3 mb-1">Address</label>
                                    <asp:TextBox CssClass="form-control"  TextMode="MultiLine" Rows="2" ID="TextBox7" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    <label class="mt-3 mb-1 d-block">State</label>
                                    <asp:DropDownList ID="DropDownList1" class="form-control" runat="server"> 
                                        <asp:ListItem Text="Selangor" Value="Selangor"></asp:ListItem>
                                        <asp:ListItem Text="Kuala Lumpur" Value="Kuala Lumpur"></asp:ListItem>
                                        <asp:ListItem Text="Perak" Value="Perak"></asp:ListItem>
                                        <asp:ListItem Text="Negeri Sembilan" Value="Negeri Sembilan"></asp:ListItem>
                                        <asp:ListItem Text="Sabah" Value="Sabah"></asp:ListItem>
                                        <asp:ListItem Text="Sawarak" Value="Sawarak"></asp:ListItem>
                                        <asp:ListItem Text="kelantan" Value="kelantan"></asp:ListItem>
                                        <asp:ListItem Text="Pulau Pinang" Value="Pulau Pinang"></asp:ListItem>
                                        <asp:ListItem Text="Johor" Value="Johor"></asp:ListItem>
                                        
                                    </asp:DropDownList>
                                </div>
                                <div class="col-4">
                                    <label class="mt-3 mb-1">City</label>
                                    <asp:TextBox CssClass="form-control" placeholder="City" ID="TextBox6" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-4">
                                    <label class="mt-3 mb-1">Pin Code</label>
                                    <asp:TextBox CssClass="form-control" placeholder="Pin Code" TextMode="number" ID="TextBox9" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-6">
                                    <label class="mt-3 mb-1">User ID</label>
                                    <asp:TextBox CssClass="form-control" placeholder="User ID" ID="TextBox8" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-6">
                                    <label class="mt-3 mb-1">Password</label>
                                    <asp:TextBox CssClass="form-control" placeholder="Password" TextMode="password" ID="TextBox10" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="d-grid gap-2">
                                <a href="singup.aspx" class="btn btn-info d-block mt-4">
                                    Update
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
