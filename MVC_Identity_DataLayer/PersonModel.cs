using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC_Identity_DataLayer
{
    public class PersonModel
    {
        public int PersonID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Age { get; set; }
        public string EmailID { get; set; }
        public string Gender { get; set; }
        public int AddressID { get; set; }
    }
}