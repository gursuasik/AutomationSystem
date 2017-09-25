<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMain.Master" AutoEventWireup="true" CodeBehind="StudentNotView.aspx.cs" Inherits="AutomationSystem.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div id="left">
        <div class="post">
            <%
                System.Data.OleDb.OleDbConnection connect = new System.Data.OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings["DBConnect"].ConnectionString);
                connect.Open();
                System.Data.OleDb.OleDbCommand command = new System.Data.OleDb.OleDbCommand("SELECT Posts.ID, Posts.PostContent, Users.UserName FROM Posts INNER JOIN Users ON Users.ID=Posts.UserID ORDER BY Posts.ID DESC", connect);
                System.Data.OleDb.OleDbDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
            %>
                    <div class="postleft">
                    </div>
                    <div class="postcontent">
                        <div class="postheader">
                            <span class="postmeta"><%= reader["UserName"] %></span>
                        </div>
                        <p><%= reader["PostContent"] %><br /><br /></p>
                    </div>
            <%       
                }
                connect.Close();
                reader.Close();
            %>
        </div>
        <div class="pagination clear">
            <div class="pre"><a href="#">Previous</a></div>
            <div class="next"><a href="#">next</a></div>
        </div>
        </div>
        <div id="sidebar">
        <div id="search">
            <h2>Search</h2>
            <form action="#">
            <div id="searchfield">
                <input type="text" name="s" class="keyword" />
                <input type="image" src="images/searchbutton.png" />
            </div>
            </form>
        </div>
        <div id="sb_container">
            <h2><span>Latest Posts</span></h2>
            <div class="posts">
            <ul>
                <li><a href="#">Pellentesque odio ante, mle stie</a></li>
                <li><a href="#">Curabitur et augue massa</a></li>
                <li><a href="#">Morbi Vitae Velit Ante</a></li>
                <li><a href="#">Dolar Sit Lorem Quisque Dictum Molestie</a></li>
                <li><a href="#">Sample blog post</a></li>
            </ul>
            </div>
        </div>
        </div>
        <div class="clear"></div>
    </div>
</asp:Content>
