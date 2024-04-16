<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="BookIssue.aspx.cs" Inherits="LibraryManagement.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $('.table').prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        }
    </script>
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
                    <div class="col-md-12 my-1">
                        <label class="my-1">
                            Issue ID
                        </label>
                        <div class="input-group">
                            <asp:TextBox CssClass="form-control" ID="IssueID" placeholder="ID" runat="server">
                            </asp:TextBox>
                            <asp:Button type="button" CssClass="btn btn-dark" Text="FIND" ID="GO_ID" runat="server" OnClick="GO_ID_Click"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 my-1">
                        <label class="my-1">Member ID</label>
                        <div class="input-group">
                            <asp:TextBox CssClass="form-control" ID="MemberID" placeholder="Book ID" runat="server">
                            </asp:TextBox>
                            <asp:Button type="button" CssClass="btn btn-dark" Text="GO" ID="GO_Member" runat="server" OnClick="GO_Member_Click"/>
                        </div>
                    </div>
                    <div class="col-md-6 my-1">
                        <label class="my-1">
                            Book ID
                        </label>
                        <div class="input-group">
                            <asp:TextBox CssClass="form-control" ID="BookID" placeholder="Book ID" runat="server">
                            </asp:TextBox>
                            <asp:Button type="button" CssClass="btn btn-dark" Text="GO" ID="GO_Book" runat="server" OnClick="GO_Book_Click"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 my-2">
                        <label class="my-1">Member Name</label>
                        <asp:TextBox CssClass="form-control" ID="MemberName" placeholder="Name" ReadOnly="true" runat="server">
                        </asp:TextBox>
                    </div>

                    <div class="col-md-6 my-2">
                        <label class="my-1">
                            Book Name
                        </label>
                        <asp:TextBox CssClass="form-control" ID="BookName" placeholder="Book Name" ReadOnly="true" runat="server">
                        </asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 my-2">
                        <label class="my-1">
                            Start Date
                        </label>
                        <asp:TextBox CssClass="form-control" ID="StartDate" ReadOnly="true" TextMode="date" runat="server">
                        </asp:TextBox>
                    </div>
                    <div class="col-md-6 my-2">
                        <label class="my-1">
                            End Date
                        </label>
                        <asp:TextBox CssClass="form-control" ID="EndDate" ReadOnly="true" TextMode="date" runat="server">
                        </asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 my-2 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-info" Text="Reserve" ID="Reserve" runat="server" OnClick="Reserve_Click"/>
                    </div>
                    <div class="col-md-6 my-2 d-grid gap-2">
                        <asp:Button type="button" CssClass="btn btn-success" Text="Return" ID="Return" runat="server" OnClick="Return_Click" />
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
                <asp:SqlDataSource ID="borrowBookSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ElibraryDBConnectionString %>" SelectCommand="SELECT * FROM [book_issue_table]">
                </asp:SqlDataSource>
                <div class="row">
                    <div class="col my-2">
                        <asp:GridView CssClass="table" ID="BorrowBooks" runat="server" AutoGenerateColumns="False" DataSourceID="borrowBookSQL" DataKeyNames="issue_id">
                            <Columns>
                                <asp:BoundField DataField="issue_id" HeaderText="Reserve ID" SortExpression="issue_id" ReadOnly="True" />
                                <asp:TemplateField>
                                    <ItemTemplate>

                                        <div class="container-fluid">
                                            <div class="row my-1">
                                                <div class="col-md-2">
                                                    <span class="d-block font-weight-bold" style="font-weight: bold !important;">
                                                        Member ID:
                                                    </span>
                                                    <asp:Label ID="MemberIDTable" runat="server" Text='<%# Eval("member_id") %>'></asp:Label>
                                                    <span class="d-block font-weight-bold" style="font-weight: bold !important;">
                                                        Book ID:
                                                    </span>
                                                    <asp:Label ID="BookIDTable" runat="server" Text='<%# Eval("book_id") %>'></asp:Label>
                                                </div>

                                                <div class="col-md-6">
                                                    <span class="d-block font-weight-bold" style="font-weight: bold !important;">
                                                        Member:
                                                    </span>
                                                    <asp:Label ID="MemberNameTable" runat="server" Text='<%# Eval("member_name") %>'></asp:Label>
                                                    <span class="d-block font-weight-bold" style="font-weight: bold !important;">
                                                        Book:
                                                    </span>
                                                    <asp:Label ID="BookNameTable" runat="server" Text='<%# Eval("book_name") %>'></asp:Label>
                                                </div>
                                                
                                                <div class="col-md-2">
                                                    <span class="d-block font-weight-bold" style="font-weight: bold !important;">
                                                        Reserve:
                                                    </span>
                                                    <asp:Label ID="ReserveDateTable" runat="server" Text='<%# Eval("issue_date") %>'></asp:Label>
                                                    <span class="d-block font-weight-bold" style="font-weight: bold !important;">
                                                        Due:
                                                    </span>
                                                    <asp:Label ID="DueDateTable" runat="server" Text='<%# Eval("due_date") %>'></asp:Label>
                                                </div>

                                                <div class="col-md-2">
                                                    <span class="d-block font-weight-bold" style="font-weight: bold !important;">
                                                        Return Date:
                                                    </span>
                                                    <asp:Label ID="ReturnDateTable" runat="server" Text='<%# Eval("return_date") %>'></asp:Label>
                                                    <span class="d-block font-weight-bold" style="font-weight: bold !important;">
                                                        Returned:
                                                    </span>
                                                    <asp:Label ID="ReturnedDateTable" runat="server" Text='<%# Eval("returned") %>'></asp:Label>
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