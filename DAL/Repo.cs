using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace medicalshop.DAL
{
    public class Repo
    {
        string constring = ConfigurationManager.ConnectionStrings["constring"].ConnectionString;
        public DataTable Selectwholsalers()
        {

            DataTable datatable = new DataTable();
            SqlConnection con = new SqlConnection(constring);
            SqlDataAdapter dataAdapter = new SqlDataAdapter("select Id,Name from holesaler", con);
            dataAdapter.Fill(datatable);
            return datatable;



        }
        public DataTable Sampleexcellsheet()
        {

            DataTable datatable = new DataTable();
            SqlConnection con = new SqlConnection(constring);
            SqlDataAdapter dataAdapter = new SqlDataAdapter("exec medicalshopdata @flag=2", con);
            dataAdapter.Fill(datatable);
            return datatable;



        }
        public int Getcountofnames(string name)
        {
            int a = 0;
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("exec medicalshopdata @flag=14,@hs_Name=" + name); cmd.Connection = con;
            con.Open();
            a = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            return a;

        }



        public void AddWholesale(string name)
        {

            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("exec medicalshopdata @flag=1,@hs_Name=" + name);

            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {

                con.Close();
            }
        }

        public void Addproduct(Product obj, string str)
        {
            SqlConnection con = new SqlConnection(constring);
            //string sqlqry = "insert into product values(" + "'" + obj.Code + "'" + "," + "'" + obj.Spareparttype + "'" + "," + "'" + obj.Name + "'" + "," + obj.Percentage + "," + obj.Stockcount + str + "," + 0+ ")";
            string sqlqry = "insert into product values(" + "'" + obj.Code + "'" + "," + "'" + obj.Spareparttype + "'" + "," + "'" + obj.Name + "'" + "," + obj.Percentage + "," + obj.Stockcount + "," + 0 + str + ")";
            SqlCommand cmd = new SqlCommand(sqlqry);
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                string str1 = ex.Message;
                throw ex;
            }
            finally
            {

                con.Close();
            }
        }

        public DataTable Selectproducts()
        {

            DataTable datatable = new DataTable();
            SqlConnection con = new SqlConnection(constring);
            SqlDataAdapter dataAdapter = new SqlDataAdapter("exec medicalshopdata @flag=4", con);
            dataAdapter.Fill(datatable);
            return datatable;
        }
       
        public DataTable Selectproductwholesaleprice(int id = 0)
        {

            DataTable datatable = new DataTable();
            SqlConnection con = new SqlConnection(constring);
            SqlDataAdapter dataAdapter = new SqlDataAdapter("exec medicalshopdata @flag=5,@id=" + id, con);
            dataAdapter.Fill(datatable);
            return datatable;
        }



        public void Updateproductsalepercentage(double per, int id)
        {

            SqlConnection con = new SqlConnection(constring);
            string qry = "exec medicalshopdata @flag=6,@saleperc=" + per + ",@id=" + id;

            SqlCommand cmd = new SqlCommand(qry);

            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {

                con.Close();
            }
        }


        public void Updateproductstock(int count, int id, int flag)
        {

            SqlConnection con = new SqlConnection(constring);
            string qry = "exec medicalshopdata @flag=" + flag + ",@stockdetails=" + count + ",@id=" + id;
            SqlCommand cmd = new SqlCommand(qry);

            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {

                con.Close();
            }
        }
        public void Uploadbulkdata(DataTable dtExcelData)
        {
            int wholesalercount = Selectwholsalers().Rows.Count;
            string whsl = "wholesaler";
            string whslprice = "Wholesale";
            string whslprice1 = "price";
            Product obj = new Product();
            int dtcount = dtExcelData.Rows.Count;
            for (int i = 0; i < dtcount; i++)
            {
                obj.Code = dtExcelData.Rows[i]["code"].ToString();
                obj.Spareparttype = dtExcelData.Rows[i]["spareparttype"].ToString();
                obj.Name = dtExcelData.Rows[i]["sparename"].ToString();
                obj.Percentage = Convert.ToDouble(dtExcelData.Rows[i]["salepercentage"]);
                obj.Stockcount = Convert.ToInt32(dtExcelData.Rows[i]["stockdetails"]);
                string str = ",";
                for (int j = 0; j < wholesalercount; j++)
                {
                    int x = j + 1;
                    str = str + "'" + dtExcelData.Rows[i][whsl + x.ToString()] + "'" + "," + dtExcelData.Rows[i][whslprice + x + whslprice1] + ",";
                }

                str = str.TrimEnd(',');
                Addproduct(obj, str);
            }


       }
        public void Addorupdatebilldetails(Product obj)
        {
            SqlConnection con = new SqlConnection(constring);
            string sqlqry = "exec medicalshopdata @flag=10,@id=" + obj.Id + ",@Productcode=" + "'" + obj.Code + "'" + ",@Productname=" + "'" + obj.Name + "'" + ",@producttype=" + "'" + obj.Spareparttype + "'" + ",@productcount=" + obj.Stockcount;
            SqlCommand cmd = new SqlCommand(sqlqry);
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                string str1 = ex.Message;
                throw ex;
            }
            finally
            {

                con.Close();
            }
        }

        public DataTable Selectbilldetails()
        {

            DataTable datatable = new DataTable();
            SqlConnection con = new SqlConnection(constring);
            SqlDataAdapter dataAdapter = new SqlDataAdapter("exec medicalshopdata @flag=11", con);
            dataAdapter.Fill(datatable);
            return datatable;



        }

        public void Clearbill()
        {
            SqlConnection con = new SqlConnection(constring);
            string sqlqry = "exec medicalshopdata @flag=12";
            SqlCommand cmd = new SqlCommand(sqlqry);
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                string str1 = ex.Message;
                throw ex;
            }
            finally
            {

                con.Close();
            }
        }

        public void Updatetembillprice(int id, double price)
        {
            SqlConnection con = new SqlConnection(constring);
            string sqlqry = "exec medicalshopdata @flag=13,@product_price=" + price + ",@id=" + id;
            SqlCommand cmd = new SqlCommand(sqlqry);
            cmd.Connection = con;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                string str1 = ex.Message;
                throw ex;
            }
            finally
            {

                con.Close();
            }
        }
    }
}