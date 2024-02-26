using System;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;

namespace Shivam_Mobile
{
    public partial class login : System.Web.UI.Page
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

        protected void login1_Click(object sender, EventArgs e)
        {
            string enteredUsername = username.Text;
            string enteredPassword = password.Text;
            string hashedEnteredPassword = HashPassword(enteredPassword); // Hash the entered password

            SqlCommand cmd = new SqlCommand("SELECT * FROM Register WHERE Username = @Username", con);
            cmd.Parameters.AddWithValue("@Username", enteredUsername);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    string storedPasswordHash = dr["Password"].ToString();

                    // Compare hashed passwords
                    if (string.Equals(storedPasswordHash, hashedEnteredPassword, StringComparison.OrdinalIgnoreCase))
                    {
                        // Successful login
                        Session["user"] = enteredUsername;
                        Response.Redirect("default.aspx");
                    }
                    else
                    {
                        // Invalid login credentials
                        Response.Write("<script>alert('Username and Password do not match')</script>");
                        username.Focus();
                    }
                }
            }
            else
            {
                // Invalid login credentials
                Response.Write("<script>alert('Username not found')</script>");
                username.Text = "";
                password.Text = "";
                username.Focus();
            }

            dr.Close();
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
            }
        }
    }
}
