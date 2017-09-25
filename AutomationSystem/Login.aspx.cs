using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MicroBlog
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            OleDbConnection connect = new OleDbConnection(ConfigurationManager.ConnectionStrings["DBConnect"].ConnectionString);
            connect.Open();
            OleDbCommand command = new OleDbCommand("SELECT ID, Authority, UserName, Pass FROM Users WHERE UserName=@UserName And Pass=@Pass", connect);
            command.Parameters.AddWithValue("@UserName", TextBox1.Text);
            command.Parameters.AddWithValue("@Pass", TextBox2.Text);
            OleDbDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                Session.Timeout = 1;
                Session["UserID"] = reader["ID"].ToString();
                if (reader["Authority"].ToString()=="0")//Teacher
                {
                    Response.Redirect("TeacherStudentsView.aspx");
                }
                if (reader["Authority"].ToString()=="1")//Student
                {
                    Response.Redirect("StudentNotView.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx?Login=False");
            }
            connect.Close();
            reader.Close();
        }
    }
}