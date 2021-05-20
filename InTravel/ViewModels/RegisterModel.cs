using System.ComponentModel.DataAnnotations;

namespace InTravel.ViewModels
{
    public class RegisterModel
    {
        [Required(ErrorMessage = "Email is empty")]
        public string Email { get; set; }
        
        [Required(ErrorMessage = "Name is empty")]
        public string Name { get; set; }
        
        [Required(ErrorMessage = "Surname is empty")]
        public string Surname { get; set; }
        
        [Required(ErrorMessage = "Password is empty")]
        public string Password { get; set; }
        
        [Required(ErrorMessage = "Please confirm your password")]
        public string ConfirmPassword { get; set; }
        
        [Required(ErrorMessage = "Phone is empty")]
        public string Phone { get; set; }
    }
}