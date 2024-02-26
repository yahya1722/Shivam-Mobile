using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Shivam_Mobile.admin
{
    public partial class adm_contact : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                connection();
                displayData();
            }
            else
            {    
                Response.Redirect("default.aspx");

            }



}

        public void displayData()
        {
            cmd = new SqlCommand("select * from Contact", con);
            dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            dr.Close();
        }

        protected void btnDelete_Command1(object sender, CommandEventArgs e)
        {
            string Id = e.CommandArgument.ToString();
            deleteRecord(Id);
        }

        public void deleteRecord(string id)
        {
            cmd = new SqlCommand("delete from Contact where Id = '"+id+"'",con);
            cmd.ExecuteNonQuery();
            displayData();
            Response.Write("<script>alert('Record Deleted...')</script>");
        }

        public void connection()
        {
            con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='E:\Shivam Mobile\Shivam Mobile\App_Data\SMDB.mdf'");
            con.Open();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Textsearch.Text != "")
            {
                string sc = Textsearch.Text;
                cmd = new SqlCommand("select * from Contact where  Mobile LIKE '" + sc + "%' ", con); 
                dr = cmd.ExecuteReader();


                if (dr.HasRows == true)
                {
                    record.Visible = false;
                    emp.Visible = false;
                    GridView1.DataSource = dr;
                    GridView1.DataBind();
                    dr.Close();

                }
                else
                {
                    record.Visible = true;
                    emp.Visible = false;
                    connection();
                    displayData();

                }
            }
            else
            {
                emp.Visible = true;
                record.Visible = false;
                connection();
                displayData();
            }
        }
    }
}