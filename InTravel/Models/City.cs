using System.ComponentModel.DataAnnotations;

namespace InTravel.Models
{
    public class City
    {
        [Key]
        public int city_id { get; set; }
        
        public int country_id { get; set; }

        public string name { get; set; }
    }
}