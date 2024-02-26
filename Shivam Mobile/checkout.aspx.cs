using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shivam_Mobile
{
    public partial class checkout : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        string ck;
        string ss;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                ss = Session["user"].ToString();

                if (Request.QueryString["pd"] != null)
                {
                    ck = Request.QueryString["pd"].ToString();
                    connection();
                    cmd = new SqlCommand("select * from Add_product where Id ='" + ck + "'", con);
                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        lck.Text = dr.GetValue(1).ToString();
                        lnm.Text = dr.GetValue(2).ToString();
                        lram.Text = dr.GetValue(5).ToString();
                        lrom.Text = dr.GetValue(6).ToString();
                        lcolor.Text = dr.GetValue(4).ToString();
                        lprice.Text = dr.GetValue(8).ToString();
                        Image1.ImageUrl = dr.GetValue(10).ToString();
                    }
                    dr.Close();
                }

                else
                {
                    Response.Redirect("default.aspx");
                }
            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }

            public void connection()
            {
                con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""|DataDirectory|\SMDB.mdf"";Integrated Security=True");
                con.Open();
            }

            protected void submit_Click(object sender, EventArgs e)
            {
                connection();
                SqlCommand cmd1 = new SqlCommand("insert into Checkout(Username,Category,MName,Ram,Rom,Color,Price,CName,Email,Mobile,Address,Country,State,City,Zipcode,PMethod,Img) values('" + ss + "','" + lck.Text + "','" + lnm.Text + "','" + lram.Text + "','" + lrom.Text + "','" + lcolor.Text + "','" + lprice.Text + "','" + name.Text + "','" + email.Text + "','" + mobile.Text + "','" + address.Text + "','" + country.Text + "','" + state.Text + "','" + city.Text + "','" + zip.Text + "','" + pmethod.Text + "','" + Image1.ImageUrl + "')", con);
                cmd1.ExecuteNonQuery();
                Response.Write("<script>alert(' Order Submited Succsesfull.. ')</script>");
                Response.AppendHeader("Refresh","1;default.aspx");

        }


    } 
}