using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Runtime.InteropServices;
using System.Diagnostics.Eventing.Reader;

namespace Shivam_Mobile.admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""|DataDirectory|\SMDB.mdf"";Integrated Security=True");
        
        protected void Page_Load(object sender, EventArgs e)
        {


                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }

                con.Open();
            
        }

        protected void l_Button_Click(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand("select * from Ad_login where u_id = '" + userid.Text+ "' ", con);//and u_pass='"+ userpass.Text+"'
            SqlDataReader ans = cmd.ExecuteReader();

            if (ans.Read())  
            {
                string u = ans["u_id"].ToString();
                string p = ans["u_pass"].ToString();

                if (u == userid.Text)
                {
                    if (p == userpass.Text)
                    {
                        
                        Response.Write("<script>alert('login success')</script>");
                        Session["admin"] = userid.Text;                        
                        Response.Redirect("viewproduct.aspx");

                    }
                    else
                    {
                        Response.Write("<script>alert('Password Invalid')</script>");
                        userpass.Text = "";
                        userpass.Focus();

                    }
                }
                else
                {
                    Response.Write("<script>alert('User Id Not Found')</script>");
                    userid.Focus();
                    userid.Text = "";
                    userpass.Text = "";
                }

            }
            else
            {
                Response.Write("<script>alert('User Not Found')</script>");
                userid.Focus();
                userid.Text = "";
                userpass.Text = "";
            }
                

            
            
            ans.Close();
        }

       protected void userid_TextChanged(object sender, EventArgs e)
        {
           // SqlCommand cmd = new SqlCommand("select u_id from Ad_login where u_id = '"+ userid.Text +"'",con);
           // SqlDataReader dr = cmd.ExecuteReader();
           //  if (!dr.Read())
           //{
           //    Response.Write("<script>alert('User Not Found')</script>");
           //     userid.Text = "";
           //     dr.Close();
           //}
           //else
           //{
           //    dr.Close();
           //     passCheck();
               
           // }
            
        }

     
        public void passCheck()
        {
            SqlCommand cmd = new SqlCommand("select u_pass from Ad_login where u_pass = '" + userpass.Text + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (!dr.Read())
            {
                Response.Write("<script>alert('Password Invalid')</script>");
                userpass.Text = "";
            }
            dr.Close();
        }
    }
}