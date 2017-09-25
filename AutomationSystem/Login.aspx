<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MicroBlog.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MikroBlog</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <!-- START PAGE SOURCE -->
        <div id="wrap">
          <div id="wrap-container">
            <div id="topnav">
              <h1 id="sitename">Mikro Blog</h1>
              <ul id="nav">
                <li><a href="Main.aspx">Ana Sayfa</a></li>
                <li><a href="Post.aspx">Yayınlar</a></li>
                <li><a href="Login.aspx">Giriş</a></li>
                <li><a href="SignIn.aspx">Kayıt</a></li>
              </ul>
            </div>
            <div id="header">
              <div id="featuredpost">
                <div id="featuredthumb"> <img src="images/featuredimage.jpg" width="200" height="135" alt="" class="shadow" /></div>
                <div id="featuredcontent">
                  <h2><span>
                      <%
                          if (Request.QueryString["Login"] != null && Request.QueryString["Login"]=="False")
                          {
                              Response.Write("Yanlış Giriş Yaptınız");
                          }
                          else
                          {
                              Response.Write("Giriş Yapınız");
                          }         
                      %>
                      </span></h2>
                  <p>Lütfen Kullanıcı Adınız ve Şifreniz ile Giriş Yapınız...</p>
                </div>
                <div class="clear"></div>
              </div>
            </div>
            <div id="content">
              <div id="left">
                <div class="post">
                  <div class="postleft">
                    <div class="comments"> &nbsp;</div>
                  </div>
                  <div class="postcontent">
                    <div class="postheader">
                      &nbsp;</div>
                    &nbsp;&nbsp;
                    <div class="comments-form">
                        <table>
                            <tr>
                                <td><div>Kullanıcı Adı :</div></td>
                                <td><asp:TextBox ID="TextBox1" runat="server" CssClass="formid"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><div>Şifre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :</div></td>
                                <td><asp:TextBox ID="TextBox2" runat="server" CssClass="formemail" TextMode="Password"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><asp:Button ID="Button1" runat="server" Text="Giriş" CssClass="button" OnClick="Button1_Click" /></td>
                            </tr>
                        </table>
                    </div>
                  </div>
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
                  <h2>Son Yayınlar</h2>
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
          </div>
          <div id="bottom">
            <div id="container">
              <div id="about">
                <div id="authorimage"><img src="images/authorimg.png" width="108" height="108" alt="" /> </div>
                <div id="authorbio">
                  <h2>About</h2>
                  <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin vel porttitor purus. Ut id mi vel mauris volutpat volutpat et vitae lorem. Duis nisi neque, ultricies scelerisque placerat ut, elementum eu elit. Quisque molestie velit at nisl aliquet id lobortis lorem euismod.</p>
                </div>
              </div>
              <div id="tags">
                <h2 class="title">Tag Cloud</h2>
                <div class="content"> <a href="#" class="level6">inspiration</a> <a href="#" class="level5">daily inspiration</a> <a href="#" class="level4">photography</a> <a href="#" class="level4">tutorial</a> <a href="#" class="level4">illustration</a> <a href="#" class="level4">design</a> <a href="#" class="level3">best of the week</a> <a href="#" class="level3">iphone</a> <a href="#" class="level3">Typography</a> <a href="#" class="level3">photoshop</a> <a href="#" class="level3">wallpaper</a> <a href="#" class="level2">architecture</a> <a href="#" class="level2">web design</a> <a href="#" class="level2">interview</a> <a href="#" class="level2">video</a> <a href="#" class="level2">free</a> <a href="#" class="level2">wallpaper of the week</a> <a href="#" class="level2">sites of the week</a> <a href="#" class="level2">graphic design</a> <a href="#" class="level2">freebie</a> <a href="#" class="level2">fonts</a> <a href="#" class="level2">case study</a> <a href="#" class="level2">logo</a> <a href="#" class="level2">giveaway</a> <a href="#" class="level2">art</a> <a href="#" class="level1">hdr</a> <a href="#" class="level1">digital art</a> <a href="#" class="level1">poster</a> <a href="#" class="level1">fireworks</a> <a href="#" class="level1">posters</a> <a href="#" class="level1">illustrator</a> <a href="#" class="level1">gadgets</a> <a href="#" class="level1">photo manipulation</a> <a href="#" class="level1">ads</a> <a href="#" class="level1">logo design</a> <a href="#" class="level1">FFFF</a> <a href="#" class="level1">3d</a> <a href="#" class="level1">video of the week</a> <a href="#" class="level1">offices</a> <a href="#" class="level1">product design</a> </div>
              </div>
              <div class="clear"></div>
            </div>
            <div id="credits">
              <div class="leftalign">Copyright &copy; 2010 YourSiteName.com</div>
              <div class="rightalign"><a href="http://all-free-download.com/free-website-templates/">Free CSS Templates</a> by <a href="http://cssheaven.org">CSSHeaven.org</a></div>
            </div>
          </div>
        </div>
        <!-- END PAGE SOURCE -->
    </div>
    </form>
</body>
</html>
