using System.ComponentModel.DataAnnotations;

namespace InTravel.Models
{
    public class Sight
    {
        [Key]
        public int sight_id { get; set; }
        
        public int city_id { get; set; }
        
        public string name { get; set; }
        
        public string description { get; set; }
    }
}