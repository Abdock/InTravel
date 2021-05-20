using System.ComponentModel.DataAnnotations;

namespace InTravel.Models
{
    public class Review
    {
        [Key] 
        public int review_id { get; set; }
        
        public int customer_id { get; set; }
        
        public int guide_id { get; set; }
        
        public double grade { get; set; }
        
        public string comment { get; set; }
    }
}