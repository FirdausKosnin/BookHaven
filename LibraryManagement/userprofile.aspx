<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="LibraryManagement.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
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
                                        Profile
                                    </h4>
                                     <span>
                                         Account Status
                                     </span>
                                     <asp:Label ID="AccountStatus" runat="server" Text="Label">
                                         Active
                                     </asp:Label>
                                    <hr />
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <label class="mt-3 mb-1">Full Name</label>
                                <asp:TextBox CssClass="form-control" placeholder="Full Name" ID="FullName" ReadOnly="true" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-6">
                                <label class="mt-3 mb-1">Date of Birth</label>
                                <asp:TextBox CssClass="form-control" TextMode="date" placeholder="dd-mm-yyyy" ReadOnly="true" ID="DateofBirth" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <label class="mt-3 mb-1">Contact Number</label>
                                <asp:TextBox CssClass="form-control" placeholder="Contact Number" TextMode="number" ID="ContactNumber" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-6">
                                <label class="mt-3 mb-1">Email</label>
                                <asp:TextBox CssClass="form-control" placeholder="email" ID="Email" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <label class="mt-3 mb-1">Address</label>
                                <asp:TextBox CssClass="form-control"  TextMode="MultiLine" Rows="2" ID="Address" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-4">
                                <label class="mt-3 mb-1">State</label>
                                <asp:TextBox CssClass="form-control" placeholder="State" ID="State" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-4">
                                <label class="mt-3 mb-1">City</label>
                                <asp:TextBox CssClass="form-control" placeholder="City" ID="City" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-4">
                                <label class="mt-3 mb-1">Pin Code</label>
                                <asp:TextBox CssClass="form-control" placeholder="Pin Code" TextMode="number" ID="pincode" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-6">
                                <label class="mt-3 mb-1">Create New Password</label>
                                <asp:TextBox CssClass="form-control" placeholder="Password" TextMode="password" ID="CreateNewPassword" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="d-grid gap-2">
                            <asp:Button runat="server" type="button" CssClass="btn btn-info d-block mt-4" Text="Update"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card my-4">
                    <div class="card-body">
                        <div class="center-grid">
                            <img src="Icons/Book_Borrow.svg" class="my-4 d-block" width="200" />
                        </div>
                        <div class="center-grid">
                            <span>
                                Your Issued Books
                            </span>
                            <asp:Label Class="badge rounded-pill bg-info text-dark" text="Your Book Info" runat="server">

                            </asp:Label>
                        </div>
                        <hr />
                        <div>
                            <asp:GridView class="table" ID="BookReserve" runat="server">

                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>