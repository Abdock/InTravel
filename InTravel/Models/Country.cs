using System.ComponentModel.DataAnnotations;

namespace InTravel.Models
{
    public class Country
    {
        [Key]
        public int country_id { get; set; }
        
        public string name { get; set; }
    }
}