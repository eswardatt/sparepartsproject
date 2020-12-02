using medicalshop.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;

namespace medicalshop
{
    /// <summary>
    /// Summary description for service
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class service : System.Web.Services.WebService
    {

        [WebMethod]
        public void Updateprice(double price, int id)
        {
            Repo repo = new Repo();
            repo.Updatetembillprice(price: price, id: id);
        }
        [WebMethod]
        public void Addexcell(string obj)
        {
            Repo repo = new Repo();
            DataTable dt = new DataTable();
            dt= JsonConvert.DeserializeObject<DataTable>(obj);
            repo.Uploadbulkdata(dt);
        }



    }
}
