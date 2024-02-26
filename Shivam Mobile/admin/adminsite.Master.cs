using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Shivam_Mobile.admin
{
    public partial class adminsite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                string username = Session["admin"].ToString();

                ss.Text = "Welcome, " + username;
            }
            
            
        }

        protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
    }
}