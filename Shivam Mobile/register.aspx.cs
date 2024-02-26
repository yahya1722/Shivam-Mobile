using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Data.SqlClient;
using System.Diagnostics;

namespace Shivam_Mobile
{
    public partial class register : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\SMDB.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
        }

        protected void singup_Click(object sender, EventArgs e)
        {
            string nw = newusername.Text;

            SqlCommand cmd1 = new SqlCommand("select * from Register where Username ='" + nw + "'", con);
            SqlDataReader dr1 = cmd1.ExecuteReader();

            if (dr1.HasRows == false)
            {
                con.Close();
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Register(Username, Email, Password) VALUES(@Username, @Email, @Password)", con);

                cmd.Parameters.AddWithValue("@Username", newusername.Text);
                cmd.Parameters.AddWithValue("@Email", newemail.Text);
                cmd.Parameters.AddWithValue("@Password", newpassword.Text); // Store plain text password

                cmd.ExecuteNonQuery();
                con.Close();
                newusername.Text = "";
                newemail.Text = "";
                newpassword.Text = "";
                cpass.Text = "";

                // Send registration confirmation email
                SendRegistrationEmail(newemail.Text);

                Response.Write("<script>alert('Thanks For Signing up!')</script>");
                Response.Redirect("login.aspx");
            }
            else
            {
                newusername.Focus();
                usl.Enabled = true;
                usl.Visible = true;
            }

            dr1.Close();
        }

        protected void login1_Click(object sender, EventArgs e)
        {
            // Your login code here
        }

        private void SendRegistrationEmail(string toEmail)
        {
            toEmail = toEmail?.Trim();

            if (string.IsNullOrWhiteSpace(toEmail))
            {
                Console.WriteLine("Error: toEmail is empty or null");
                return;
            }

            Console.WriteLine($"Sending email to: {toEmail}");

            try
            {
                using (SmtpClient smtpClient = new SmtpClient("smtp.mailtrap.io", 587))
                {
                    smtpClient.Credentials = new NetworkCredential("f4a523014fc3a5", "7548a3891a5585");
                    smtpClient.EnableSsl = true;

                    using (MailMessage mailMessage = new MailMessage())
                    {
                        mailMessage.From = new MailAddress("your-email@gmail.com"); // Replace with your sender email address
                        mailMessage.To.Add(toEmail);
                        mailMessage.Subject = "Registration Confirmation";
                        mailMessage.Body = "Thank you for registering with us! Your registration is now complete.";

                        smtpClient.Send(mailMessage);
                        Console.WriteLine("Email sent successfully");
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error sending email: {ex.Message}");
                Console.WriteLine(ex.StackTrace); // Print the st   ack trace for more details
            }
        }

    }
}
