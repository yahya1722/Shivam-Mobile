using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.ComponentModel;

namespace Shivam_Mobile.admin
{
    public partial class viewproduct : System.Web.UI.Page
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
            cmd = new SqlCommand("select * from Add_product order by Id desc", con);
            dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            dr.Close();
        }
        public void connection()
        {
             con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=""|DataDirectory|\SMDB.mdf"";Integrated Security=True");
            con.Open();
        }

             public void deleteRecord(string id)
        {
            cmd = new SqlCommand("delete from Add_product where Id = '" + id + "'", con);
            cmd.ExecuteNonQuery();
            displayData();
            Response.Write("<script>alert('Record Deleted...')</script>");
        }


        protected void Delete_Command1(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            deleteRecord(id);
        }

        protected void Delete_Click(object sender, EventArgs e)
        {

        }

        protected void Edit_DataBinding(object sender, EventArgs e)
        {

        }

        protected void Edit_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString(); 
            Response.Redirect("updateproduct.aspx?upd=" + id);
        }

        

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Textsearch.Text != "")
            {
               string sc = Textsearch.Text;
                cmd = new SqlCommand("select * from Add_product where  Category LIKE '" + sc + "%' or Name like '"+sc+"%' or Imei like '"+ sc +"%'"   , con);
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

        protected void Textsearch_TextChanged(object sender, EventArgs e)
        {
        }

        protected void Edit_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
