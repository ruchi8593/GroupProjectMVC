using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVC_Identity_DataLayer.Models
{
    public class PersonModel
    {
        [Display(Name = "Id")]
        public int PersonID { get; set; }

        [Required(ErrorMessage ="Fisrt name is missing.")]
        public string FirstName { get; set; }


        [Required(ErrorMessage = "Fisrt name is missing.")]
        public string LastName { get; set; }

        public int Age { get; set; }

        public string EmailID { get; set; }

        public string Gender { get; set; }

        public int AddressID { get; set; }

        public string Message { get; set; }

    }
}