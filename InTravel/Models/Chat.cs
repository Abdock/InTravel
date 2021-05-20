using System;

namespace InTravel.Models
{
    public class Chat
    {
        public int customer_id { get; set; }
        
        public int guide_id { get; set; }

        public string text { get; set; }
        
        public DateTime date { get; set; }

        public byte[] files { get; set; }
    }
}