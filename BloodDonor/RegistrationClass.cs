using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BloodDonor
{
    public class RegistrationClass
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string DonateStatus { get; set; }
        public string District { get; set; }
        public string Area { get; set; }
        public string Mobile { get; set; }
        public string BloodGroup { get; set; }
        public int Publish { get; set; }
        public int Status { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime UpdateDate { get; set; }
        public string Address { get; set; }
    }
}