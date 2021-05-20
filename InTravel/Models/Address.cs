using System.ComponentModel.DataAnnotations;

namespace InTravel.Models
{
    public class Address
    {
        [Key]
        public int address_id { get; set; }
        
        public int city_id { get; set; }
        
        public string street { get; set; }
    }
}