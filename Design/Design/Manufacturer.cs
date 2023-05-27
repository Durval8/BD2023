using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Design
{
    internal class Manufacturer
    {
        private String _name;
        private int _phone;
        private String _address;
        private int _nif;

        public override String ToString()
        {
            return _name + "   " + _nif;
        }
        public String Name
        {
            get { return _name; }
            set { _name = value; }
        }
        public int NIF
        {
            get { return _nif; }
            set { _nif = value; }
        }
        public int Phone
        {
            get { return _phone; }
            set { _phone = value; }
        }
        public String Address
        {
            get { return _address; }
            set { _address = value; }
        }
    }
}
