using System;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI;
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
        // Add Hash password logic on register 
        protected void singup_Click(object sender, EventArgs e)
        {
            string username = newusername.Text;
            string email = newemail.Text;
            string password = HashPassword(newpassword.Text); // Hash the password

            SqlCommand cmd1 = new SqlCommand("select * from Register where Username ='" + username + "'", con);
            SqlDataReader dr1 = cmd1.ExecuteReader();

            if (dr1.HasRows == false)
            {
                con.Close();
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Register(Username, Email, Password) VALUES(@Username, @Email, @Password)", con);

                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                cmd.ExecuteNonQuery();
                con.Close();
                newusername.Text = "";
                newemail.Text = "";
                newpassword.Text = "";
                cpass.Text = "";

                // Send registration confirmation email
                SendRegistrationEmail(email);

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
        // Add mailtrap on this 
        private void SendRegistrationEmail(string toEmail)
        {
            toEmail = toEmail?.Trim();

            if (string.IsNullOrWhiteSpace(toEmail))
            {
                Debug.WriteLine("Error: toEmail is empty or null");
                return;
            }

            Debug.WriteLine($"Sending email to: {toEmail}");

            try
            {
                EmailService.SendRegistrationConfirmationEmail(toEmail);
                Debug.WriteLine("Email sent successfully");
            }
            catch (Exception ex)
            {
                Debug.WriteLine($"Error sending email: {ex.Message}");
                Debug.WriteLine(ex.StackTrace);
            }
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

    public class EmailService
    {
        public static void SendRegistrationConfirmationEmail(string toEmail)
        {
            try
            {
                using (SmtpClient smtpClient = new SmtpClient("smtp.mailtrap.io", 587))
                {
                    smtpClient.Credentials = new NetworkCredential("f4a523014fc3a5", "7548a3891a5585");
                    smtpClient.EnableSsl = true;

                    using (MailMessage mailMessage = new MailMessage())
                    {
                        mailMessage.From = new MailAddress("yahyadangra5@gmail.com"); // Replace with your sender email address
                        mailMessage.To.Add(toEmail);
                        mailMessage.Subject = "Registration Confirmation";
                        mailMessage.Body = "Thank you for registering with us! Your registration is now complete.";

                        smtpClient.Send(mailMessage);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error sending email", ex);
            }
        }
    }
}
