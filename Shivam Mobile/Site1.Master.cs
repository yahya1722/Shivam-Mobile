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

    public partial class Site1 : System.Web.UI.MasterPage
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader dr;
        string ss;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""|DataDirectory|\SMDB.mdf"";Integrated Security=True");

            if (Session["user"] != null)
            {
                ss = Session["user"].ToString();
                Label1.Text = Session["user"].ToString();
                HyperLink1.Visible = true;
                HyperLink2.Visible = false;

                cartdisplay();
                ckdisplay();
            }


        }



        protected void Menu_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
        public void cartdisplay()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Cart where  Username ='" + ss + "'", con);
            SqlDataReader dr = cmd.ExecuteReader();

            ShoppingCartDataList.DataSource = dr;
            ShoppingCartDataList.DataBind();
            con.Close();
        }
        public void ckdisplay()
        {
            con.Open();
            SqlCommand cmd1 = new SqlCommand("select * from Checkout where  Username ='" + ss + "'", con);
            SqlDataReader dr1 = cmd1.ExecuteReader();

            DataList1.DataSource = dr1;
            DataList1.DataBind();
            con.Close();
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
        protected void serch_TextChanged(object sender, EventArgs e)
        {
            string s = search.Text;
            Response.Redirect("product.aspx?sc=" + s);

        }
        
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            string i = e.CommandArgument.ToString();
            con.Open();
            cmd = new SqlCommand("delete from Cart where Id = '" + i + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            cartdisplay();
        }

        protected void ImageButton2_Command(object sender, CommandEventArgs e)
        {
            string i = e.CommandArgument.ToString();
            con.Open();
            cmd = new SqlCommand("delete from Checkout where Id = '" + i + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            ckdisplay();
        }


    }
}