using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Design
{
    public partial class Design : Form
    {
        private SqlConnection cn;
        private bool DesignButtons;
        private bool newClient;

        public Design()
        {
            InitializeComponent();
            comboBox1.Visible = false;
            button9.Visible = false;
            comboBox5.Visible = false;
            button10.Visible = false;
            HideDesignerButtons();
            HideNewClientButtons();
            HideNewClientButtons2();
            listManufacturer.Visible= false;
            listDesigners.Visible= false;
        }

        private void Design_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            
        }

        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("Data Source=tcp:mednat.ieeta.pt\\SQLSERVER,8101;User ID=p1g5;Password=Lol.001#;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");
        }
        

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }

       

        private void button1_Click(object sender, EventArgs e)
        {
            listManufacturer.Visible = true;
            try
            {
                    if (!verifySGBDConnection())
                        return;

                SqlCommand cmd = new SqlCommand("SELECT c.Name, m.Quality FROM Design_Manufacturer m " +
                                         "INNER JOIN Design_Company c ON m.CompanyNIF = c.NIF", cn);

                listManufacturer.Items.Clear();                 
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        
                        string name = reader.GetString(0);
                        string quality = reader.GetString(1);

                        string manufacturerInfo = $" {name}    //      Quality: {quality}";
                        listManufacturer.Items.Add(manufacturerInfo);
                    }
                    reader.Close();
                    cn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            listManufacturer.Visible= true;
            if(comboBox1.Visible == true && button9.Visible == true)
            {
                comboBox1.Visible = false;
                button9.Visible = false;
            }
            else
            {
                comboBox1.Visible = true;
                button9.Visible = true;
            }
            try
            {
                if (!verifySGBDConnection())
                    return;

                SqlCommand cmd = new SqlCommand("SELECT c.[Name], m.[CompanyNIF] FROM Design_Manufacturer m " +
                                         "INNER JOIN Design_Company c ON m.[CompanyNIF] = c.[NIF]", cn);

                comboBox1.Items.Clear();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string companyName = reader["Name"].ToString();
                    comboBox1.Items.Add(companyName);
                    
                }

                reader.Close();
                cn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (DesignButtons == true)
            {
                HideDesignerButtons();
            }
            else
            {
                ShowDesignerButtons();
            }
        }

        public void ShowDesignerButtons ()
        {
            label1.Visible = true;
            label2.Visible = true;
            label3.Visible = true;  
            label4.Visible = true;
            label5.Visible = true;
            label6.Visible = true;
            label7.Visible = true;
            textBox1.Visible = true;
            textBox2.Visible = true;
            textBox3.Visible = true;
            textBox4.Visible = true;
            textBox5.Visible = true;
            textBox6.Visible = true;
            comboBox2 .Visible = true;
            DesignButtons = true;
        }

        public void HideDesignerButtons()
        {
            label1.Visible = false;
            label2.Visible = false;
            label3.Visible = false;
            label4.Visible = false;
            label5.Visible = false;
            label6.Visible = false;
            label7.Visible = false;
            textBox1.Visible = false;
            textBox2.Visible = false;
            textBox3.Visible = false;
            textBox4.Visible = false;
            textBox5.Visible = false;
            textBox6.Visible = false;
            comboBox2.Visible = false;
            DesignButtons = false;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            if (newClient == true)
            {
                HideNewClientButtons();
            }
            else
            {
                ShowNewClientButtons();
            }
        }

        public void HideNewClientButtons()
        {
            label8.Visible = false;
            label11.Visible = false;
            label12.Visible = false;
            label13.Visible = false;
            label14.Visible = false;
            textBox7.Visible = false;
            textBox9.Visible = false;
            textBox10.Visible = false;
            textBox11.Visible = false;
            textBox12.Visible = false;
            button11.Visible= false;
            
            newClient = false;
        }
        public void ShowNewClientButtons()
        {
            label8.Visible = true;
            label11.Visible = true;
            label12.Visible = true;
            label13.Visible = true;
            label14.Visible = true;
            textBox7.Visible = true;
            textBox9.Visible = true;
            textBox10.Visible = true;
            textBox11.Visible = true;
            textBox12.Visible = true;
            comboBox4.Visible = false;
            label10.Visible = false;

            button11.Visible = true;
            
            newClient = true;
        }
        public void HideNewClientButtons2()
        {
            label9.Visible = false;
            label10.Visible = false;
            comboBox3.Visible = false;
            comboBox4.Visible = false;
            comboBox6.Visible = false;
            label15.Visible = false;
            button13.Visible = false;
            button14.Visible = false;
            button12.Visible = false;
            newClient = false;
        }
        public void ShowNewClientButtons2()
        {
           
            label10.Visible = true;
           
            comboBox4.Visible = true;
            comboBox6.Visible = true;
            label15.Visible = true;
            button13.Visible = true;
            newClient = true;
        }
        private void button8_Click(object sender, EventArgs e)
        {
            listDesigners.Visible = true;

            try
            {
                if (!verifySGBDConnection())
                    return;

                SqlCommand cmd = new SqlCommand("SELECT m.CompanyNIF, c.Name, m.Reviews FROM Design_DesignersFirm m " +
                                         "INNER JOIN Design_Company c ON m.CompanyNIF = c.NIF", cn);

                listManufacturer.Items.Clear();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    int nif = reader.GetInt32(0);
                    string name = reader.GetString(1);
                    string reviews = reader.GetString(2);

                    string DesignerInfo = $"Name: {name}, NIF: {nif}, Quality: {reviews}";
                    listDesigners.Items.Add(DesignerInfo);
                }
                reader.Close();
                cn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void button7_Click(object sender, EventArgs e)
        {
            listDesigners.Visible = true;
            if (comboBox5.Visible == true && button10.Visible==true)
            {
                comboBox5.Visible = false;
                button10.Visible = false;
            }
            else
            {
                comboBox5.Visible = true;
                button10.Visible = true;
            }
            try
            {
                if (!verifySGBDConnection())
                    return;

                SqlCommand cmd = new SqlCommand("SELECT [CompanyNIF] FROM Design_DesignersFirm", cn);

                comboBox5.Items.Clear();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    comboBox5.Items.Add(reader["CompanyNIF"].ToString());
                }

                reader.Close();
                cn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void button9_Click(object sender, EventArgs e)
        {
            try
            {
                if (!verifySGBDConnection())
                    return;

                // Clear the listManufacturer ListBox
                listManufacturer.Items.Clear();

                string selectedManufacturerName = comboBox1.SelectedItem.ToString();

                // Retrieve the products from the chosen manufacturer
                SqlCommand cmd = new SqlCommand("SELECT p.CodeProduct, p.Name FROM Design_Products p " +
                                                 "INNER JOIN Design_Manufacturer m ON p.Manufacturer_NIF = m.CompanyNIF " +
                                                 "INNER JOIN Design_Company c ON m.CompanyNIF = c.NIF " +
                                                 "WHERE c.Name = @ManufacturerName", cn);
                cmd.Parameters.AddWithValue("@ManufacturerName", selectedManufacturerName);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    int codeProduct = reader.GetInt32(0);
                    string productName = reader.GetString(1);
                    string productInfo = $"Code: {codeProduct},       {productName}";

                    // Add the product information to the listManufacturer ListBox
                    listManufacturer.Items.Add(productInfo);
                }


                reader.Close();
                cn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button10_Click(object sender, EventArgs e)
        {
            try
            {
                if (!verifySGBDConnection())
                    return;

                // Clear the listManufacturer ListBox
                listDesigners.Items.Clear();

                // Get the selected manufacturer's NIF from comboBox1
                string selectedDesignerFirmNIF = comboBox5.SelectedItem.ToString();

                // Retrieve the products from the chosen manufacturer
                SqlCommand cmd = new SqlCommand("SELECT d.EmployeeCode, d.NumberOfClients " +
                                         "FROM Design_Designer d " +
                                         "INNER JOIN Design_DesignersFirm df ON d.Firm_NIF = df.CompanyNIF " +
                                         "WHERE df.CompanyNIF = @FirmNIF", cn);
                cmd.Parameters.AddWithValue("@FirmNIF", selectedDesignerFirmNIF);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    int employeeCode = reader.GetInt32(0);
                    int numberOfClients = reader.GetInt32(1);
                    string designerInfo = $"Employee Code: {employeeCode}, Number of Clients: {numberOfClients}";

                    // Add the product information to the listManufacturer ListBox
                    listDesigners.Items.Add(designerInfo);
                }


                reader.Close();
                cn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button11_Click(object sender, EventArgs e)
        {
            HideNewClientButtons();
            ShowNewClientButtons2();

            try
            {
                if (!verifySGBDConnection())
                    return;

                SqlCommand cmd = new SqlCommand("SELECT [CompanyNIF] FROM Design_DesignersFirm", cn);

                comboBox6.Items.Clear();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    comboBox6.Items.Add(reader["CompanyNIF"].ToString());
                }

                reader.Close();
                cn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            label10.Visible = false;
            comboBox4.Visible = false;
            
        }
        
            
        private void button13_Click(object sender, EventArgs e)
        {
            comboBox3.Items.Clear();
            string selectedFirmNIF = comboBox6.SelectedItem.ToString();

            if (selectedFirmNIF != null)
            {
                // Clear comboBox3 and populate it with designers from the selected firm
                comboBox3.Items.Clear();

                try
                {
                    if (!verifySGBDConnection())
                        return;

                    SqlCommand cmd = new SqlCommand("SELECT d.EmployeeCode, p.Name " +
                                                     "FROM Design_Designer d " +
                                                     "INNER JOIN Design_Person p ON d.Person_CCNumber = p.CCNumber " +
                                                     "WHERE d.Firm_NIF = @FirmNIF", cn);
                    cmd.Parameters.AddWithValue("@FirmNIF", selectedFirmNIF);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        string employeeCode = reader["EmployeeCode"].ToString();
                        string designerName = reader["Name"].ToString();
                        string designerInfo = $"{employeeCode} // {designerName}";

                        comboBox3.Items.Add(designerInfo);
                    }

                    reader.Close();

                }
                catch (Exception ex)
                {
                    MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
            }
            else
            {
                // Handle the case when no item is selected in comboBox6
                MessageBox.Show("Please select a firm.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }


            cn.Close();
            comboBox3.Visible= true;
            label9.Visible= true;
            label15.Visible= false;
            comboBox6.Visible= false;
            button14.Visible= true;
            button13.Visible = false;
            label10.Visible= false;
            comboBox4.Visible = false;
        }

        private void button14_Click(object sender, EventArgs e)
        {
            label9.Visible = false;
            comboBox3.Visible=false;
            label10.Visible = true;
            comboBox4.Visible = true;
            button14.Visible= false;
            button12.Visible= true;
            try
            {
                if (!verifySGBDConnection())
                    return;

                string selectedFirmNIF = comboBox6.SelectedItem?.ToString();
                if (selectedFirmNIF != null)
                {
                    SqlCommand cmd = new SqlCommand("SELECT ts.[Code] " +
                                                     "FROM Design_TypeStyle ts " +
                                                     "INNER JOIN Design_Style s ON ts.[Style_Code] = s.[Code] " +
                                                     "WHERE s.[Firm_NIF] = @FirmNIF", cn);
                    cmd.Parameters.AddWithValue("@FirmNIF", selectedFirmNIF);

                    SqlDataReader reader = cmd.ExecuteReader();

                    comboBox4.Items.Clear(); // Clear the combo box before adding new items

                    while (reader.Read())
                    {
                        int styleCode = (int)reader["Code"];
                        comboBox4.Items.Add(styleCode);
                    }

                    reader.Close();
                }
                else
                {
                    // Handle the case when no firm is selected in comboBox6
                    textBox1.Text = string.Empty;
                    textBox2.Text = string.Empty;
                    MessageBox.Show("Please select a firm.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

                cn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void button12_Click(object sender, EventArgs e)
        {
            // Get the values from TextBoxes
            int ccNumber = int.Parse(textBox12.Text);
            int cellphone = int.Parse(textBox10.Text);
            string name = textBox11.Text;
            int nif = int.Parse(textBox9.Text);
            int budget = int.Parse(textBox7.Text);
            int styleCode = 0;

            if (comboBox4.SelectedItem is int selectedStyleCode)
            {
                styleCode = selectedStyleCode;
            }
            else
            {
                MessageBox.Show("Please select a style.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            try
            {
                if (!verifySGBDConnection())
                    return;

                // Save the information to Design_Person table
                SqlCommand cmdPerson = new SqlCommand("INSERT INTO Design_Person ([CCNumber], [CellPhone], [Name], [NIF]) " +
                                                       "VALUES (@CCNumber, @CellPhone, @Name, @NIF)", cn);
                cmdPerson.Parameters.AddWithValue("@CCNumber", ccNumber);
                cmdPerson.Parameters.AddWithValue("@CellPhone", cellphone);
                cmdPerson.Parameters.AddWithValue("@Name", name);
                cmdPerson.Parameters.AddWithValue("@NIF", nif);
                cmdPerson.ExecuteNonQuery();

                // Save the information to Design_Client table
                SqlCommand cmdClient = new SqlCommand("INSERT INTO Design_Client ([Person_CCNumber], [Budget], [Style_code] ) " +
                                                       "VALUES (@CCNumber, @Budget, @StyleCode)", cn);
                cmdClient.Parameters.AddWithValue("@CCNumber", ccNumber);
                cmdClient.Parameters.AddWithValue("@Budget", budget);
                cmdClient.Parameters.AddWithValue("@StyleCode", styleCode);
                cmdClient.ExecuteNonQuery();

                MessageBox.Show("Information saved successfully.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred while saving the information: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                cn.Close();
            }
        }

        
    }
}
