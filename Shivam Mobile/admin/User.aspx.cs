using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shivam_Mobile.admin
{
    public partial class User : System.Web.UI.Page
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
            cmd = new SqlCommand("select * from Register", con);
            dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            dr.Close();
        }
        public void connection()
        {
            con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='E:\Shivam Mobile\Shivam Mobile\App_Data\SMDB.mdf'");
            con.Open();
        }

        protected void Button1_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            cmd = new SqlCommand("delete from Register where Id = '" + id + "'", con);
            cmd.ExecuteNonQuery();
            displayData();
            Response.Write("<script>alert('Record Deleted...')</script>");
        }
    }
}