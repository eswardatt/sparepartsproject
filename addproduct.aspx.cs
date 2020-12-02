using medicalshop.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.IO;
using System.Data;
using System.Configuration;
using System.Drawing;

namespace medicalshop
{
    public partial class addproduct : System.Web.UI.Page
    {
        Repo repo = new Repo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindgrid();
            }

        }
        void bindgrid()
        {
            try
            {
                grid.DataSource = repo.Selectwholsalers();
                grid.DataBind();
            }
            catch (Exception ex)
            {
                errordiv.Visible = true;
                lblerrormsg.Text = ex.Message;
            }

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                Product product = new Product();
                product.Code = txtcode.Text;
                product.Name = txtsparepartname.Text;
                product.Spareparttype =txtspareparttype.Text;
                product.Percentage = Convert.ToDouble(txtsalepercentage.Text);
                product.Stockcount = Convert.ToInt32(txtstockcount.Text);
                int gcount = grid.Rows.Count;
                StringBuilder strb = new StringBuilder();

                for (int i = 0; i < gcount; i++)
                {
                    Label lblwhlsalername = grid.Rows[i].FindControl("lblwhlsalername") as Label;
                    TextBox txtprice = grid.Rows[i].FindControl("txtsalereprice") as TextBox;
                    int price = Convert.ToInt32(txtprice.Text);
                    strb.Append("," + "'" + lblwhlsalername.Text + "'");
                    strb.Append("," + price + "");
                }
                string str = strb.ToString();
                repo.Addproduct(product, str);
                txtsparepartname.Text = " ";
                txtstockcount.Text = " ";
                txtcode.Text = " ";
                

                errordiv.Visible = false;
                suucesdiv.Visible = true;

            }
            catch (Exception ex)
            {
                errordiv.Visible = true;
                lblerrormsg.Text = ex.Message;
            }

        }

        

        protected void btnsampleexcell_Click(object sender, EventArgs e)
        {
            GridView GridView1 = new GridView();
            GridView1.DataSource = repo.Sampleexcellsheet(); GridView1.DataBind();

           
        }
    }
}