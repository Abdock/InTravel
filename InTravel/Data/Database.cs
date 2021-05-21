using InTravel.Models;
using Microsoft.EntityFrameworkCore;

namespace InTravel.Data
{
    public sealed class Database : DbContext
    {
        public static string ConnectionString { get; } =
            "Host=localhost;Port=5500;Username=postgres;Password=12345;Database=InTravel";
        
        public DbSet<User> user { get; set; }
        
        public DbSet<Address> address { get; set; }
        
        public DbSet<City> city { get; set; }
        
        public DbSet<Country> counrty { get; set; }
        
        public Database(DbContextOptions<Database> options) : base(options)
        {
            Database.EnsureCreated();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseNpgsql(ConnectionString);
        }
    }
}