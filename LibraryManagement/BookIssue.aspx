<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="BookIssue.aspx.cs" Inherits="LibraryManagement.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row my-4">

            <div class="col-md-5 my-1">
                <div class="center-grid">
                    <img src="Icons/Book_Borrow.svg" class="my-1" width="150">
                    <h4 class="my-1">
                        Book Report
                    </h4>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-6 my-1">
                        <label class="my-1">Member ID</label>
                        <asp:TextBox CssClass="form-control" ID="MemberID" placeholder="Meber ID" runat="server">
                        </asp:TextBox>
                    </div>
                    <div class="col-md-6 my-1">
                        <label class="my-1">
                            Book ID
                        </label>
                        <div class="input-group">
                            <asp:TextBox CssClass="form-control" ID="BookID" placeholder="Book ID" runat="server">
                            </asp:TextBox>
                            <asp:Button type="button" CssClass="btn btn-dark" Text="GO" ID="GO" runat="server"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 my-2">
                        <label class="my-1">Member Name</label>
                        <asp:TextBox CssClass="form-control" ID="MemberName" placeholder="Name" runat="server">
                        </asp:TextBox>
                    </div>

                    <div class="col-md-6 my-2">
                        <label class="my-1">
                            Book Name
                        </label>
                        <asp:TextBox CssClass="form-control" ID="BookName" placeholder="Book Name" runat="server">
                        </asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 my-2">
                        <label class="my-1">
                            Start Date
                        </label>
                        <asp:TextBox CssClass="form-control" ID="StartDate" TextMode="date" placeholder="dd/mm/yyyy" runat="server">
                        </asp:TextBox>
                    </div>
                    <div class="col-md-6 my-2">
                        <label class="my-1">
                            End Date
                        </label>
                        <asp:TextBox CssClass="form-control" ID="EndDate" TextMode="date" placeholder="dd/mm/yyyy" runat="server">
                        </asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 my-2 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-info" Text="Reserve" ID="Reserve" runat="server"/>
                    </div>
                    <div class="col-md-6 my-2 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-success" Text="Return" ID="Return" runat="server" />
                    </div>
                </div>

            </div>

            <div class="col-md-7">
                <div class="center-grid">
                    <h4 class="d-block my-3">
                        Book Reserve
                    </h4>
                </div>
                <hr />
                <div class="row">
                    <div class="col my-2">
                        <asp:GridView CssClass="table" ID="author" runat="server">

                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>