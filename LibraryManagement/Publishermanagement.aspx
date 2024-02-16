<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="Publishermanagement.aspx.cs" Inherits="LibraryManagement.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="row">
            <div class="col-md-4 my-4">
                <div class="center-grid">
                    <img src="Icons/Publisher.svg" width="150" class="my-2"/>
                    <h4 class="d-block my-1">
                        Publisher Details
                    </h4>
                </div>
                <hr />

                <div class="row">
                    <div class="col-md-4">
                        <label class="my-1">
                            Publisher ID
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
                            Publisher Name
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
                        Publisher List
                    </h4>
                </div>
                <hr />
                <asp:SqlDataSource ID="SQLdata" runat="server" ConnectionString="<%$ ConnectionStrings:ElibraryDBConnectionString4 %>" SelectCommand="SELECT * FROM [publisher_table]">
                </asp:SqlDataSource>
                <div class="row">
                    <div class="col-md-12 my-2">
                        <asp:GridView class="table" ID="Publisher" runat="server" AutoGenerateColumns="False" DataSourceID="SQLdata">
                            <Columns>
                                <asp:BoundField DataField="publisher_id" HeaderText="publisher_id" SortExpression="publisher_id" />
                                <asp:BoundField DataField="publisher_name" HeaderText="publisher_name" SortExpression="publisher_name" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
