using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Shivam_Mobile
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\SMDB.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand ("insert into Contact(Name,Email,Mobile,Message) values('"+name.Text+"','"+email.Text+"','"+mobile.Text+"','"+message.Text+"')",con);
            cmd.ExecuteNonQuery();

            name.Text = "";
            email.Text = "";
            mobile.Text = "";
            message.Text = "";

            Response.Write("<script>alert('Your Query Has SuccessFully Submited..')</script>");
        }
    }
}