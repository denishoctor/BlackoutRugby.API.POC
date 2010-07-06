<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">Home Page</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <article class="body content">
        <p>Welcome, this is currently a simple Proof of Concept App for using the Blackout Rugby API. Below is a simple form that I will extend over time which allows you to enter your request details and see what comes back.</p>
        
        <p>Personally I have a preference for JSON as it's more flexible, lighter and lends it's to objects in a cleaner manner. Therefor I use a converter to transform the XML response. I'll add a switch for this soon.</p>
        
        <h2>API Test Form</h2>
        <form action="/home" method="post">
            <ul id="requestForm">
                <li>
                    <label for="requestParams">Request Params</label>
                    <input type="text" id="requestParams" name="requestParams" />
                </li>
                <li>
                    <label for="devKey">Developer Key</label>
                    <input type="text" id="devKey" name="devKey" />
                </li>
                <li>
                    <label for="devIV">Developer IV</label>
                    <input type="text" id="devIV" name="devIV" />
                </li>
                <li>
                    <label for="devID">Developer ID</label>
                    <input type="text" id="devID" name="devID" />
                </li>
                <li>
                    <input type="submit" value="Search" />
                </li>                
            </ul>
        </form>
        
        <p>You can find this <a href="http://github.com/denishoctor/BlackoutRugby.API.POC">project on github</a>. I'll update with more info including a Google Wave link shortly. I'm keen for anyone who has an interest in Blackout Rugby and/or HTML5 and all that has come to encompass that term to get involved!</p>
    
        <h2>Rough Application Road Map</h2>
        <ul class="noteList">
            <li class="first">Completed API POC</li>
            <li class="second">Format response for front end display</li>
            <li class="second">Setup <a href="http://datatables.net/">DataTable</a></li>
            <li class="second">Decide on data storage approach</li>            
            <li class="first">Setup live site</li>
            <li class="second">Pick URL & purchase</li>
            <li class="first">Start main management app</li>
        </ul>
    </article>
</asp:Content>

