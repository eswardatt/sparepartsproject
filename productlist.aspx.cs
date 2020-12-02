using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text.html;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using medicalshop.DAL;
using System.Collections;
using System.Web.Services;

namespace medicalshop
{
    public partial class productlist : System.Web.UI.Page
    {
        Repo repo = new Repo();
       
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                bindgrod(); gridprint.DataSource = Getbilllist();
                gridprint.DataBind(); hideprintbutton();
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        void bindgrod()
        {
            try
            {
                if (repo.Selectproducts().Rows.Count > 0)
                {
                    grid.DataSource = repo.Selectproducts(); grid.DataBind(); grid.UseAccessibleHeader = true;
                    grid.HeaderRow.TableSection = TableRowSection.TableHeader;
                    DataTable datatable = new DataTable();
                    for (int i = 0; i < grid.Rows.Count; i++)
                    {
                        GridView gvwholsale = grid.Rows[i].FindControl("gvwholsale") as GridView;
                        Label lblid = grid.Rows[i].FindControl("lblid") as Label;
                        int id = Convert.ToInt32(lblid.Text);
                        gvwholsale.DataSource = Selectproductwholesaleprice(id);
                        gvwholsale.DataBind();

                    }
                }
                

            }
            catch (Exception ex)
            {
                errordiv.Visible = true;
                errormsg.InnerText = ex.Message;
            }


        }
       
        DataTable Selectproductwholesaleprice(int id = 0)
        {
            DataTable datatable = new DataTable();
            try
            {
                return repo.Selectproductwholesaleprice(id);
            }
            catch (Exception ex)
            {
                errordiv.Visible = true;
                errormsg.InnerText = ex.Message;
            }
            return datatable;
        }

        protected void grid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = grid.Rows[rowIndex];
                string id = (row.FindControl("lblid") as Label).Text;
                int pid = Convert.ToInt32(id);
                Session["productid"] = pid;
                if (e.CommandName == "update_sale")
                {
                    string salepercentage = (row.FindControl("txtsale") as TextBox).Text;
                    double saleperc = Convert.ToDouble(salepercentage);
                    repo.Updateproductsalepercentage(saleperc, pid); 
                }
                else if (e.CommandName == "sub_stock")
                {
                    string txtitems = (row.FindControl("txtitems") as TextBox).Text;
                    string txtccode = (row.FindControl("lblformno") as Label).Text;
                    string txtname = (row.FindControl("lblname") as Label).Text;
                    string txttype = (row.FindControl("lbltype") as Label).Text;
                    Product obj = new Product();

                    obj.Name = txtname;
                    obj.Spareparttype = txttype;
                    obj.Code = txtccode;
                    obj.Id = pid;

                    int stocco = Convert.ToInt32(txtitems);

                    obj.Stockcount = stocco;
                    repo.Updateproductstock(stocco, pid, 7);
                    repo.Addorupdatebilldetails(obj);
                    gridprint.DataSource = Getbilllist();
                    gridprint.DataBind();
                }
                else if (e.CommandName == "add_stock")
                {
                    string txtitems = (row.FindControl("txtitems") as TextBox).Text;
                    int stocco = Convert.ToInt32(txtitems);
                    repo.Updateproductstock(stocco, pid, 8); 
                }

                Response.Redirect("productlist.aspx");
                errordiv.Visible = false;
                bindgrod();
            }
            catch (Exception ex)
            {
                errordiv.Visible = true;
                errormsg.InnerText = ex.Message; bindgrod();
            }
            
           
           
        }

       


        DataTable Getbilllist()
        {
            DataTable dt = new DataTable();
            dt= repo.Selectbilldetails();
            if (dt.Rows.Count==0)
            {
                divcontent.Visible = false;
            }
            return dt;

        }
        protected void btnprint_Click(object sender, EventArgs e)
        {
            try
            {

                
                Response.ContentType = "application/pdf";

                Response.Cache.SetCacheability(HttpCacheability.NoCache);

                StringWriter stringWriter = new StringWriter();
                HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);
                gridprint.RenderControl(htmlTextWriter);

                StringReader stringReader = new StringReader(stringWriter.ToString());
                Document Doc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
                HTMLWorker htmlparser = new HTMLWorker(Doc);
                PdfWriter.GetInstance(Doc, Response.OutputStream);
                Random rd = new Random();
                PdfWriter.GetInstance(Doc, new FileStream(Server.MapPath("~/bills/" + "bill" + rd.Next(000001, 999999) + ".pdf"), FileMode.Create));
                Doc.Open();
                htmlparser.Parse(stringReader); repo.Clearbill();
                Doc.Close();
                Response.Write(Doc);
               


            }
            catch (Exception ex)
            {
                errordiv.Visible = true;
                errormsg.InnerText = ex.Message;
            }

        }

        void hideprintbutton()
        {
            if (gridprint.Rows.Count>0)
            {
                btnprint.Visible = true;
            } 
        }
        

      
       
    }
}