using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace Shivam_Mobile.admin
{
    public partial class updateproduct : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        string up;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Request.QueryString["upd"] != null)
            {
                connection();
                up = Request.QueryString["upd"].ToString();
                if (!IsPostBack)
                {
                    connection();
                    cmd = new SqlCommand("select * from Add_product where Id ='" + up + "'", con);
                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        Id.Text = dr.GetValue(0).ToString();
                        category.Text = dr.GetValue(1).ToString();
                        productname.Text = dr.GetValue(2).ToString();
                        productimei.Text = dr.GetValue(3).ToString();
                        productcolor.Text = dr.GetValue(4).ToString();
                        productram.SelectedValue = dr.GetValue(5).ToString();
                        productrom.SelectedValue = dr.GetValue(6).ToString();
                        productqty.Text = dr.GetValue(7).ToString();
                        productprice.Text = dr.GetValue(8).ToString();
                        productdescription.Text = dr.GetValue(9).ToString();


                    }
                    dr.Close();
                    con.Close();

                }
            }
            else
            {
                Response.Redirect("viewproduct.aspx");

            }
                
            
        }

        public void connection()
        {
            con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""|DataDirectory|\SMDB.mdf"";Integrated Security=True");
            con.Open();
        }

        protected void add_Click(object sender, EventArgs e)
        {

        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string res=category.Text;
            
            if (img1.HasFile)
            {
                connection();
                string pimg1 = "~/admin/productimg/image1/" + img1.FileName;
                img1.SaveAs(MapPath(pimg1));
               
                cmd = new SqlCommand("update Add_product set Image1= '"+pimg1+"' where Id='"+ up +"'", con);
                cmd.ExecuteNonQuery();
                con.Close();

            }
            if (img2.HasFile)
            {
                connection();
                string pimg2 = "~/admin/productimg/image2/" + img2.FileName;
                img2.SaveAs(MapPath(pimg2));

                cmd = new SqlCommand("update Add_product set Image2= '" + pimg2 + "' where Id='" + up + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            if(img3.HasFile)
            {
                connection();
                string pimg3 = "~/admin/productimg/image3/" + img3.FileName;
                img3.SaveAs(MapPath(pimg3));

                cmd = new SqlCommand("update Add_product set Image3= '" + pimg3 + "' where Id='" + up + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Response.Write(up);
          
            SqlCommand cmd2 = new SqlCommand("update Add_product set Category= '" + category.Text + "', Name = '"+ productname.Text +"' , Imei = '"+ productimei.Text +"' , Color = '"+ productcolor.Text +"' , Ram = '"+ productram.Text +"', Rom = '"+ productrom.Text +"' , Qty = '"+ productqty.Text +"' , Price = '"+ productprice.Text +"' , Description = '"+ productdescription.Text +"' where Id='" + up + "'", con); 
           
            cmd2.ExecuteNonQuery();
          
         
           Response.Write("<script>alert('Product Updated Succsesfully..')</script>");
           Response.Redirect("viewproduct.aspx");
        }
    }
}