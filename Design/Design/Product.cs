using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Design
{
    internal class Product
    {
        private int _code;
        private string _price;
        private string _quantity;

        public int Code { get { return _code; } set { _code = value; } }
        public String Price { get { return _price;} set { _price = value; } }
        public string Quantity { get { return _quantity;} set { _quantity = value; } }
            
    }
}
