using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AutomationSystem
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                DataSelect();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("AddNew"))
            {
                TextBox txtNewAdi = (TextBox)GridView1.FooterRow.FindControl("txtNewAdi");
                TextBox txtNewVize = (TextBox)GridView1.FooterRow.FindControl("txtNewVize");
                TextBox txtNewFinal = (TextBox)GridView1.FooterRow.FindControl("txtNewFinal");
                DataProcess("INSERT INTO Students (UserID, Lesson, Vize, Final) VALUES ('Database'" + txtNewVize + "','" + txtNewFinal + "')");
                DataSelect();
            }
        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox txtNewVize = (TextBox)GridView1.FooterRow.FindControl("Vize");
            TextBox txtNewFinal = (TextBox)GridView1.FooterRow.FindControl("Final");
            DataProcess("UPDATE Students SET Vize=" + Convert.ToInt16(txtNewVize.Text) + ", Final=" + Convert.ToInt16(txtNewFinal.Text) + " WHERE UserID=" + Convert.ToInt16(GridView1.DataKeys[e.RowIndex].Values[0].ToString()));
            GridView1.EditIndex = -1;
            DataSelect();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataProcess("DELETE * FROM Personel WHERE PersonelId =" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0].ToString()));
            DataSelect();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex; //Tıklanan satırın numarasını alıyor. Tıkladığım satırın hangi satır olduğunu alıyor.
            DataSelect();
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            DataSelect();
        }
        private void DataSelect()
        {
            OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["DBConnect"].ConnectionString);
            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }
            OleDbDataAdapter adapter = new OleDbDataAdapter("SELECT Users.ID, Users.UserName, Students.Vize, Students.Final FROM Students INNER JOIN Users ON Users.ID=Students.UserID", connection);
            DataTable table = new DataTable();
            adapter.Fill(table);
            if (table.Rows.Count > 0) //Eğer Okunan bilgi var ise
            {
                GridView1.DataSource = table;
                GridView1.DataBind();
            }
            else
            {
                table.Rows.Add(table.NewRow());
                GridView1.DataSource = table;
                GridView1.DataBind();
                int TotalColumns = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                GridView1.Rows[0].Cells[0].Text = "Kayıt Bulunamadı";
            }
        }
        public void DataProcess(string cmdtext)
        {
            OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["DBConnect"].ConnectionString);
            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }
            OleDbCommand command = new OleDbCommand(cmdtext, connection);
            command.ExecuteNonQuery();
            connection.Close();
            connection.Dispose();
        }
    }
}