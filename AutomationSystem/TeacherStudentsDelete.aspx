<%@ Page Title="" Language="C#" MasterPageFile="~/TeacherMain.Master" AutoEventWireup="true" CodeBehind="TeacherStudentsDelete.aspx.cs" Inherits="AutomationSystem.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div id="left">
        <div class="post">


                    <%--<div class="postleft">
                        <div class="comments"> <span class="count"><a href="Post.aspx?LikePostID=<%= reader["ID"] %>">Beğen</a></span> </div>
                    </div>
                    <div class="postcontent">
                        <div class="postheader">
                            <span class="postmeta"><%= reader["UserName"] %></span>
                        </div>
                        <p><%= reader["PostContent"] %><br /><br /></p>
                    </div>--%>


            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" ShowFooter="True" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                <Columns>

                    <asp:TemplateField HeaderText="Adı" SortExpression="Adi">
                        <ItemTemplate> <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserName") %>'/></ItemTemplate>
                        <EditItemTemplate><asp:TextBox ID="txtAdi" runat="server" Text='<%# Bind("UserName") %>'/></EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Vize Notu" >
                        <ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Eval("Vize") %>' /></ItemTemplate>
                        <EditItemTemplate><asp:TextBox ID="txtVize" runat="server" Text='<%# Bind("Vize") %>' /></EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Final Notu" >
                        <ItemTemplate><asp:Label ID="Label3" runat="server" Text='<%# Eval("Final") %>' /></ItemTemplate>
                        <EditItemTemplate><asp:TextBox ID="txtFinal" runat="server" Text='<%# Bind("Final") %>' /></EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField HeaderText="Sil" ShowDeleteButton="True" DeleteText="Sil" ShowHeader="True" />

                </Columns>
            </asp:GridView>


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
