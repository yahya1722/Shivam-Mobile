using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shivam_Mobile.admin
{
    public partial class Clientdetails : System.Web.UI.Page
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
            cmd = new SqlCommand("select * from Checkout", con);
            dr = cmd.ExecuteReader();
            GridView.DataSource = dr;
            GridView.DataBind();
            dr.Close();
        }
        public void connection()
        {
            con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='E:\Shivam Mobile\Shivam Mobile\App_Data\SMDB.mdf'");
            con.Open();
        }

        protected void btnDelete_Command(object sender, CommandEventArgs e)
        {
            string Id = e.CommandArgument.ToString();
            deleteRecord(Id);
        }
        public void deleteRecord(string id)
        {
            cmd = new SqlCommand("delete from Checkout where Id = '" + id + "'", con);
            cmd.ExecuteNonQuery();
            displayData();
            Response.Write("<script>alert('Record Deleted...')</script>");
        }
    }
}