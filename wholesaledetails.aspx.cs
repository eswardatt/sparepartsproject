using medicalshop.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace medicalshop
{
    public partial class wholesaledetails : System.Web.UI.Page
    {
        Repo repo = new Repo();
        protected void Page_Load(object sender, EventArgs e)
        {
            bindgrid();
        }
        protected void TimerTick(object sender, EventArgs e)
        {
           // lblTime.Text = "Last Refreshed: " + DateTime.Now.ToString();
            grid.DataBind();
        }
        void bindgrid()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = repo.Selectwholsalers();
                if (dt.Rows.Count == 0)
                {
                    grid.Visible = false;
                }
                else
                {
                    grid.DataSource = dt;
                    grid.DataBind();
                }
                errordiv.Visible = false;
            }
            catch (Exception ex)
            {
                errordiv.Visible = true;
                errormsg.InnerText = ex.Message;
            }

        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string whlname = txtwhlsname.Text;
                int a = repo.Getcountofnames(whlname);
                if (a>0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Wholesaler Already Exists')", true);

                }
                else
                {
                    repo.AddWholesale(whlname);
                    txtwhlsname.Text = "";
                    errordiv.Visible = false; bindgrid();
                }
                

               
            }
            catch (Exception ex)
            {
                errordiv.Visible = true;
                errormsg.InnerText = ex.Message;
            }

        }
    }
}