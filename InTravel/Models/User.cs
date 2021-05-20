using System;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.CodeAnalysis;

namespace InTravel.Models
{
    public class User
    {
        [Key]
        public int user_id { get; set; }
        
        public DateTime registered_date { get; set; }

        public string email { get; set; }

        public string password { get; set; }
        
        public int address_id { get; set; }
        
        public string icon_url { get; set; }
        
        public string name { get; set; }
        
        public string surname { get; set; }
        
        public string phone { get; set; }
    }
}