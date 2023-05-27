﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

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
            HideDesignerButtons();
            HideNewClientButtons();
            listManufacturer.Visible= false;
        }

        private void Design_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();
            
        }

        private SqlConnection getSGBDConnection()
        {
            return new SqlConnection("data source=tcp:mednat.ieeta.pt\\SQLSERVER,8101;integrated security=true;initial catalog=p1g5");
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
            if (!verifySGBDConnection())
                return;

            listManufacturer.Visible= true;

            SqlCommand cmd = new SqlCommand("SELECT * FROM Manufacturer", cn);
            SqlDataReader reader = cmd.ExecuteReader();
            listManufacturer.Items.Clear();

            while (reader.Read())
            {
                Manufacturer M = new Manufacturer();
               
                M.Name = reader["name"].ToString();
                M.Address = reader["address"].ToString();
                //M.NIF = reader["nif"].ToString();
                //M.Phone = reader["phone"];
                listManufacturer.Items.Add(M);
            }
            cn.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if(comboBox1.Visible == true)
            {
                comboBox1.Visible = false;
            }
            else
            {
                comboBox1.Visible = true;
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
            label9.Visible = false;
            label10.Visible = false;
            label11.Visible = false;
            label12.Visible = false;
            label13.Visible = false;
            label14.Visible = false;
            textBox7.Visible = false;
            textBox9.Visible = false;
            textBox10.Visible = false;
            textBox11.Visible = false;
            textBox12.Visible = false;
            comboBox3.Visible = false;
            comboBox4.Visible = false;
            newClient = false;
        }
        public void ShowNewClientButtons()
        {
            label8.Visible = true;
            label9.Visible = true;
            label10.Visible = true;
            label11.Visible = true;
            label12.Visible = true;
            label13.Visible = true;
            label14.Visible = true;
            textBox7.Visible = true;
            textBox9.Visible = true;
            textBox10.Visible = true;
            textBox11.Visible = true;
            textBox12.Visible = true;
            comboBox3.Visible = true;
            comboBox4.Visible = true;
            newClient = true;
        }
    }
}