using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Web.Services.Description;
using System.Xml.Linq;

namespace Shivam_Mobile.admin
{
    public partial class addproduct : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""|DataDirectory|\SMDB.mdf"";Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                if (con.State == ConnectionState.Open)
                {
                   con.Close();
                }

                con.Open();
            }
            else
            {
                Response.Redirect("default.aspx");

            }
        }


        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
        }
        protected void add_Click(object sender, EventArgs e)
        {
            
            con.Close();

            string pimg1 = "~/admin/productimg/image1/" + img1.FileName;
            img1.SaveAs(MapPath(pimg1));

            string pimg2 = "~/admin/productimg/image2/" + img2.FileName;
            img2.SaveAs(MapPath(pimg2));

            string pimg3 = "~/admin/productimg/image3/" + img3.FileName;
            img3.SaveAs(MapPath(pimg3));
            con.Open();

            SqlCommand cmd = new SqlCommand("insert into Add_product(Category,Name,Imei,Color,Ram,Rom,Qty,Price,Description,Image1,Image2,Image3) values('" + category.Text + "','" + productname.Text + "','" + productimei.Text + "','" + productcolor.Text + "','" + productram.Text + "','" + productrom.Text + "','" + productqty.Text + "','" + productprice.Text + "','" + productdescription.Text + "','" + pimg1 + "','" + pimg2 + "','" + pimg3 + "')", con);
            cmd.ExecuteNonQuery();
            category.Text = "";
            productname.Text = "";
            productimei.Text = "";
            productcolor.Text = "";
            productram.ClearSelection();
            productrom.ClearSelection();
            productqty.Text = "";
            productprice.Text = "";
            productdescription.Text = "";
            img1.Dispose();
            img2.Dispose();
            img3.Dispose();

            Response.Write("<script>alert('Product Add Succsesfully..')</script>");
        }

        protected void productimei_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
