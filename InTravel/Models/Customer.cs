using System.ComponentModel.DataAnnotations;

namespace InTravel.Models
{
    public class Customer
    {
        [Key]
        public int customer_id { get; set; }
        
        public int address_id { get; set; }
        
        public string name { get; set; }
        
        public string surname { get; set; }
        
        public string phone { get; set; }
    }
}