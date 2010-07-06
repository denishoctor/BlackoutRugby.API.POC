<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">Show API Response &amp; Request</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <article class="body content">
        <h2>API Request:</h2>
        <pre style="font-size:12px;">
            <% if (ViewData["ApiRequest"] != null) { %>
            <a href="<%= Html.Encode(ViewData["ApiRequest"])%>"><%= Html.Encode(ViewData["ApiRequest"])%></a>
            <% } else { %>
            No request set recieved by the server. Woops! If this keeps happening give us a shout!
            <% } %>
        </pre>
        <h2>API Response:</h2>
        <pre style="font-size:12px;">
            <% if (ViewData["ApiResponse"] != null) { %>
            <%= Html.Encode(ViewData["ApiResponse"])%>
            <% } else { %>
            No response set by the server. Maybe check your input details.
            <% } %>
        </pre>
    </article>
</asp:Content>
