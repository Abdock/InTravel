using System;
using System.ComponentModel.DataAnnotations;

namespace InTravel.Models
{
    public class History
    {
        [Key]
        public int history_id { get; set; }
        
        public string title { get; set; }
        
        public string description { get; set; }
        
        public DateTime date { get; set; }
        
        public byte[] data { get; set; }
    }
}