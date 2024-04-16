<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="membermanagement.aspx.cs" Inherits="LibraryManagement.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            //let table = new DataTable('#table');
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="row my-4 mx-1">
                    <div class="center-grid">
                        <img src="Icons/User.svg" width="125" class="my-1" />
                    </div>
                    <div class="center-grid">
                        <h4 class="my-2">
                            Member Detail
                        </h4>
                    </div>
                    <hr />
                    <div class="row my-2">
                        <div class="col-md-3">
                            <label>
                                Member ID
                            </label>
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="FindID" placeholder="ID" runat="server">
                                </asp:TextBox>
                                <asp:Button type="button" CssClass="btn btn-dark" Text="GO" ID="GO" runat="server" OnClick="GO_Click"/>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <label>
                                Full Name
                            </label>
                            <asp:TextBox CssClass="form-control" ID="FullName" ReadOnly="true" placeholder="Full Name" runat="server">
                            </asp:TextBox>
                        </div>

                        <div class="col-md-5">
                            <label>
                                Account Status
                            </label>
                            <div class="input-group">
                                <asp:TextBox CssClass="form-control" ID="AccountStatus" ReadOnly="true" placeholder="Status" runat="server">
                                </asp:TextBox>
                                <asp:LinkButton type="button" CssClass="btn btn-success" ID="Approved" runat="server" OnClick="Approved_Click">
                                    <i class="fa-solid fa-circle-check"></i>
                                </asp:LinkButton>
                                <asp:LinkButton type="button" CssClass="btn btn-warning" ID="Panding" runat="server" OnClick="Panding_Click">
                                    <i class="fa-solid fa-pause"></i>
                                </asp:LinkButton>
                                <asp:LinkButton type="button" CssClass="btn btn-danger" ID="Deactivate" runat="server" OnClick="Deactivate_Click">
                                    <i class="fa-solid fa-minus"></i>
                                </asp:LinkButton>
                            </div>

                        </div>
                    </div>


                    <div class="row my-2">
                        <div class="col-md-3">
                            <label>
                                Date of Birth
                            </label>
                            <asp:TextBox CssClass="form-control" ID="DateOfBirth" ReadOnly="true" placeholder="dd/mm/yyyy" TextMode="Date" runat="server">
                            </asp:TextBox>
                        </div>

                        <div class="col-md-4">
                            <label>
                                Contact Number
                            </label>
                            <asp:TextBox CssClass="form-control" ID="ContactNumber" ReadOnly="true" placeholder="Contact Number" runat="server">
                            </asp:TextBox>
                        </div>

                        <div class="col-md-5">
                            <label>
                                Email Address
                            </label>
                            <asp:TextBox CssClass="form-control" ID="EmailID" ReadOnly="true" placeholder="Email" runat="server">
                            </asp:TextBox>
                        </div>
                    </div>

                    <div class="row my-2">
                        <label>
                            Address
                        </label>
                        <asp:TextBox CssClass="form-control" TextMode="MultiLine" Rows="2" ID="Address" runat="server">
                        </asp:TextBox>
                    </div>

                    <div class="row my-2">
                        <div class="col-md-4">
                            <label>
                               State
                            </label>
                            <asp:TextBox CssClass="form-control" ID="State" ReadOnly="true" placeholder="State" runat="server">
                            </asp:TextBox>
                        </div>

                        <div class="col-md-4">
                            <label>
                                City
                            </label>
                            <asp:TextBox CssClass="form-control" ID="City" ReadOnly="true" placeholder="Contact Number" runat="server">
                            </asp:TextBox>
                        </div>

                        <div class="col-md-4">
                            <label>
                               Pin
                            </label>
                            <asp:TextBox CssClass="form-control" ID="Pin" ReadOnly="true" placeholder="Email" runat="server">
                            </asp:TextBox>
                        </div>
                    </div>

                    <div class="row my-2">
                        <div class="d-grid gap-2">
                            <asp:Button type="button" CssClass="btn btn-danger" text="Delete" ID="Delete" runat="server" OnClick="Delete_Click"/>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-md-7">
                <div class="card my-4">
                    <div class="card-body">
                        <div class="center-grid">
                            <span>
                                Member List
                            </span>
                        </div>
                        <hr />
                        <asp:SqlDataSource ID="MemberSource" runat="server" ConnectionString="<%$ ConnectionStrings:ElibraryDBConnectionString %>" SelectCommand="SELECT [full_name], [date_of_birth], [contact_number], [email], [member_id], [account_status], [state] FROM [members_table]">
                        </asp:SqlDataSource>
                        <div>
                            <asp:GridView class="table" ID="MemberList" runat="server" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="MemberSource">
                                <Columns>
                                    <asp:BoundField DataField="member_id" HeaderText="ID" ReadOnly="True" SortExpression="member_id" />
                                    <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name" />
                                    <asp:BoundField DataField="contact_number" HeaderText="Contact Number" SortExpression="contact_number" />
                                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                    <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                    <asp:BoundField DataField="account_status" HeaderText="account_status" SortExpression="account_status" />
                                </Columns>
                            </asp:GridView>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
