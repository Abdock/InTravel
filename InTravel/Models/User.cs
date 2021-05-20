using System;
using System.ComponentModel.DataAnnotations;

namespace InTravel.Models
{
    public class User
    {
        [Key]
        public int user_id { get; set; }
        
        public DateTime registered_date { get; set; }
        
        public int second_id { get; set; }
        
        public string email { get; set; }
        
        public string type { get; set; }
        
        public string password { get; set; }

    }
}