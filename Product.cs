using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace medicalshop
{
    public class Product
    {
        int _id;
        string _name;
        string _code;
        double percentage;
        string _spareparttype;
        int _stockcount;
        int _updatedcount;
        public int Id { get => _id; set => _id = value; }
        public string Name { get => _name; set => _name = value; }
        public string Code { get => _code; set => _code = value; }
        public double Percentage { get => percentage; set => percentage = value; }
        public string Spareparttype { get => _spareparttype; set => _spareparttype = value; }
        public int Stockcount { get => _stockcount; set => _stockcount = value; }
        public int Updatedcount { get => _updatedcount; set => _updatedcount = value; }
    }
}