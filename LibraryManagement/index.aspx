<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="LibraryManagement.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/index.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="banner pitch">
            <img src="Images/Library.jpg" class="banner-card" />
            <div class="banner-text dark-green">
                <h1 class="raised-shadow title pitch">
                    Book Heaven Library
                </h1>
                <p class="raised-shadow pitch">
                    Beyond Books, Beyond Borders: Where Ideas Take Flight!
                </p>
            </div>
            <div class="features-banner pitch">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="features-icon">
                                <img height="125" src="Icons/New_peach_icon.svg"/>
                            </div>
                            <h3 class="text-uppercase raised-shadow text-center">
                                Up to Date
                            </h3>
                            <p class="text-center">
                                Stay current with the latest trends, knowledge, and discoveries across various fields. 
                                Our library curates a dynamic collection of up-to-date books, ensuring you have access 
                                to the most recent information on diverse topics.
                            </p>
                        </div>
                        <div class="col-md-4">
                            <div class="features-icon">
                                <img height="125" src="Icons/Book_peach_borrw.svg"/>
                            </div>
                            <h3 class="text-uppercase raised-shadow text-center">
                                Free Brrow
                            </h3>
                            <p  class="text-center">
                                Enjoy the freedom to explore and learn without any financial barriers. 
                                With our free borrowing policy, you can take home up to three books for a 
                                generous two-week period, allowing ample time to delve deep into your chosen subjects.
                            </p>
                        </div>
                        <div class="col-md-4">
                            <div class="features-icon">
                                <img height="125" src="Icons/Leaf_peach_icon.svg"/>
                            </div>
                            <h3 class="text-uppercase raised-shadow text-center">
                                Nature Enviroment
                            </h3>
                            <p  class="text-center">
                                 Immerse yourself in the tranquility of our library's garden section, where you can 
                                escape into the serenity of nature while exploring our extensive collection of books 
                                on environmental topics.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="">
        <div class="container">
            <div class="row">
                <div class="col-12 my-4">
                    <h2 class="text-center raised-shadow text-uppercase">
                        Become member today
                    </h2>
                    <p class="text-center raised-shadow">
                        You borrow, access latest book and much more
                    </p>
                </div>
            </div>
            <div class="row my-4">
                <div class="col-md-4">
                    <div class="features-icon">
                        <img width="150" height="150" src="Icons/Register.svg"/>
                    </div>
                    <h3 class="text-uppercase raised-shadow text-center">
                        Register Online
                    </h3>
                    <p class="text-center">
                        Visit our website and navigate to the sign-up page. Fill in your details, 
                        including your name, email address, and any other required information. 
                        This step allows us to create your membership profile and ensure we have 
                        the necessary information to contact you.
                    </p>
                </div>
                <div class="col-md-4">
                    <div class="features-icon">
                        <img width="150" height="150" src="Icons/Wait_for_approvel.svg"/>
                    </div>
                    <h3 class="text-uppercase raised-shadow text-center">
                        Wait for Approval
                    </h3>
                    <p  class="text-center">
                        After submitting your registration details, please allow up to three days for our administrative 
                        team to review and approve your application. During this time, we verify the information provided 
                        to ensure the security and integrity of our membership system. You will receive a confirmation email
                        once your registration is approved.
                    </p>
                </div>
                <div class="col-md-4">
                    <div class="features-icon">
                        <img width="150" height="150" src="Icons/Id.svg"/>
                    </div>
                    <h3 class="text-uppercase raised-shadow text-center">
                        Member
                    </h3>
                    <p  class="text-center">
                        Once your registration is approved, congratulations! You are now a member of our library. You will gain
                        access to our extensive collection of books, including the latest releases and popular titles. Simply 
                        log in to your account to explore our catalogue, reserve books, and borrow materials. Enjoy the benefits 
                        of membership, including borrowing privileges, access to special events, and more.
                    </p>
                </div>
            </div>
        </div>
    </section>

</asp:Content>