using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Reflection;
using System.Runtime.ConstrainedExecution;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Shivam_Mobile
{
    public partial class Oneplus : System.Web.UI.Page
    {
        string im;
        string card;
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""|DataDirectory|\SMDB.mdf"";Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
           string search = Request.QueryString["sc"];
            if (Request.QueryString["pr"] != null)
            {
                string pnm = Request.QueryString["pr"];
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Add_product where Category ='" + pnm + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                dlProducts.DataSource = dr;
                dlProducts.DataBind();
                con.Close();
            }
            else if(search != null)
            {
                string pnm = Request.QueryString["pr"];
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Add_product where Category like'" + search + "%' or Name like'"+ search+"%'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows == true)
                {
                    dlProducts.DataSource = dr;
                    dlProducts.DataBind();
                    con.Close();
                }
                else
                {
                    
                    Response.Write("<script>alert('Sorry Your Search Are Note Found..')</script>");
                    SqlCommand cmd1 = new SqlCommand("select * from Add_product", con);
                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    dlProducts.DataSource = dr1;
                    dlProducts.DataBind();
                    con.Close();
                }
                
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Add_product order by Id desc", con);
                SqlDataReader dr = cmd.ExecuteReader();

                
                    dlProducts.DataSource = dr;
                    dlProducts.DataBind();
                
               con.Close() ;
            }
        }
       
        protected void dlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void Image2_DataBinding(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            im = e.CommandArgument.ToString();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal('show');", true);
          
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Add_product where Id ='" + im + "'  ", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                ViewState["card"] = dr[0].ToString();
                cat.Text = dr[1].ToString();
                name.Text = dr[2].ToString();
                clr.Text = dr[4].ToString();
                ram.Text = dr[5].ToString();
                rom.Text = dr[6].ToString();
                price.Text = dr[8].ToString();
                descripson.Text = dr[9].ToString();
                Image1.ImageUrl = dr.GetValue(10).ToString();
                Image2.ImageUrl=dr.GetValue(11).ToString();
                Image3.ImageUrl=dr.GetValue(12).ToString();
            }
            con.Close();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }
        protected void Button1_Command(object sender, CommandEventArgs e)
        {

            string id = e.CommandArgument.ToString();
            if (Session["user"] != null)
            {
                Response.Redirect("checkout.aspx?pd=" + id);
            }
            else
            {
                Response.Redirect("login.aspx");
            }     
        }

        protected void ck_Command(object sender, CommandEventArgs e)
        {
            card = e.CommandArgument.ToString();
           
            if (Session["user"] != null)
            {
                string ss = Session["user"].ToString();
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select * from Add_product where Id ='" + card + "' ", con);
                SqlDataReader dr1 = cmd1.ExecuteReader();
                
                if (dr1.Read())
                {
                   
                    string id = dr1[0].ToString();
                    string cat = dr1[1].ToString();
                    string name = dr1[2].ToString();
                    string clr = dr1[4].ToString();
                    string ram = dr1[5].ToString();
                    string rom = dr1[6].ToString();
                    string price = dr1[8].ToString();
                    string img1 = dr1.GetValue(10).ToString();
                    con.Close();
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand("insert into Cart(Id,Username,Category,Name,Ram,Rom,Color,Price,Image) values('"+ id +"','" + ss + "','" + cat + "','" + name + "','" + ram + "','" + rom + "','" + clr + "','" + price + "','" + img1 + "')", con);
                    cmd2.ExecuteNonQuery();
                    Response.Write("<script>alert(' Add To Cart Succsesfull.. ')</script>");

                    con.Close();
                }
                con.Close();

            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }


        protected void ck1_Click(object sender, EventArgs e)
        {

            if (Session["user"] != null)
            {
                string ss = Session["user"].ToString();
                con.Open();
                SqlCommand cmd1 = new SqlCommand("select * from Add_product where Id ='" + ViewState["card"] + "' ", con);
                SqlDataReader dr1 = cmd1.ExecuteReader();

                if (dr1.Read())
                {

                    string id = dr1[0].ToString();
                    string cat = dr1[1].ToString();
                    string name = dr1[2].ToString();
                    string clr = dr1[4].ToString();
                    string ram = dr1[5].ToString();
                    string rom = dr1[6].ToString();
                    string price = dr1[8].ToString();
                    string img1 = dr1.GetValue(10).ToString();
                    con.Close();
                    con.Open();
                    SqlCommand cmd2 = new SqlCommand("insert into Cart(Id,Username,Category,Name,Ram,Rom,Color,Price,Image) values('" + id + "','" + ss + "','" + cat + "','" + name + "','" + ram + "','" + rom + "','" + clr + "','" + price + "','" + img1 + "')", con);
                    cmd2.ExecuteNonQuery();
                    Response.Write("<script>alert(' Add To Cart Succsesfull.. ')</script>");

                    con.Close();
                }
                con.Close();

            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }
    }
}