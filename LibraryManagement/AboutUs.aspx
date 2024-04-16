<%@ Page Title="" Language="C#" MasterPageFile="~/Mas.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="LibraryManagement.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/AboutUs.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <img src="Images/Lab1.jpg" class="AboutUsLibrary"/>
    <div class="container">

        <div class="row my-2">
            <div class="col-12">
                <div class="center-grid my-4 mx-4">
                    <h2 class="text-center my-4">
                       Discover Your Literary Paradise at Book Heaven Library: Where Every Page Holds a New Adventure!
                    </h2>
                </div>


            </div>
            <div class="col-12">
                <p class="text-center my-2">
                    Welcome to Book Heaven Library, where every page holds a new adventure and every shelf whispers tales of wonder!
                    At Book Heaven, we're not just a bookstore and library; we're a sanctuary for book lovers, 
                    a community hub for literary enthusiasts of all ages.
                </p>
                <p  class="text-center my-2">
                    Imagine stepping into a world where the possibilities are endless, where you can lose yourself in the captivating 
                    stories of your favorite authors or discover new voices that ignite your imagination. Whether you're seeking a 
                    thrilling mystery to unravel, a heartwarming romance to swoon over, or a thought-provoking classic to ponder, 
                    Book Heaven has something for every reader's soul.
                </p>
            </div>
            <div class="col-12 center-grid">
                <asp:Button type="button" class="btn btn-info my-3" Text="EXPLORE" runat="server" ID="HomeButton" OnClick="HomeButton_Click"/>
            </div>
        </div>

        <div class="row my-2">

            <div class="col-md-6 my-2">
                <div class="card">
                    <div class="card-body">
                        <h3 class="center-grid my-2">
                            Our Purpose
                        </h3>
                        <p class="text-center mx-2">
                            Opening Doors to Knowledge for Everyone, Regardless of Who You Are. Because we believe that knowledge 
                            knows no boundaries and that by fostering a culture of inclusivity, we can unlock the full potential of 
                            every individual, cultivating a more informed, empowered, and interconnected society for generations to 
                            come, where the pursuit of knowledge is a beacon of hope and opportunity.
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-6 my-2">
                <div class="card">
                    <div class="card-body">
                        <h3 class="center-grid my-2">
                            Our Positioning
                        </h3>
                        <p class="text-center mx-2">
                            our mission goes beyond mere access. We believe in the transformative power of knowledge to spark imagination, 
                            foster empathy, and ignite positive change. Through our curated collections, knowledgeable staff, 
                            and engaging events, we aim to inspire a lifelong love of learning and a thirst for discovery in all who walk through our doors.
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row my-4">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h3 class="center-grid my-2">
                            Our Environment
                        </h3>
                        <p class="text-center mx-2">
                            our mission goes beyond mere access. We believe in the transformative power of knowledge to spark imagination, 
                            foster empathy, and ignite positive change. Through our curated collections, knowledgeable staff, 
                            and engaging events, we aim to inspire a lifelong love of learning and a thirst for discovery in all who walk through our doors.
                        </p>

                        <div class="container-fluid">
                            <div class="row">

                                <div class="col-lg-4">
                                    <div class="center-grid">
                                        <img src="Icons/Silence.svg" height="200" class="mb-3"/>
                                    </div>
                                    <h4 class="center-grid">
                                        Silent Section
                                    </h4>
                                    <p class="text-center">
                                        Dive into a realm of uninterrupted focus and captivating tales within our Silent Section—a sanctuary 
                                        where the only sounds are the gentle rustle of pages turning and the whisper of imagination.
                                    </p>
                                </div>

                                <div class="col-lg-4">
                                    <div class="center-grid">
                                        <img src="Icons/Discussion.svg" height="200" class="mb-3"/>
                                    </div>
                                    <h4 class="center-grid">
                                        Discussion Space
                                    </h4>
                                    <p class="text-center">
                                        Spark creativity and collaboration in our dynamic Discussion Space—a hub where ideas flourish,
                                        connections thrive, and minds converge to shape the future.
                                    </p>
                                </div>

                                <div class="col-lg-4">
                                    <div class="center-grid">
                                        <img src="Icons/Leaf_peach_icon.svg" height="200" class="mb-3"/>
                                    </div>
                                    <h4 class="text-center">
                                        Garden Section
                                    </h4>
                                    <p class="text-center">
                                        Immerse yourself in the beauty of nature as you explore our Garden Section—a tranquil retreat where the scent of flowers inspires, 
                                        and the embrace of greenery rejuvenates, creating the perfect backdrop for literary escapades.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
