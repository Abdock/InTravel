using Microsoft.EntityFrameworkCore;

namespace InTravel.Data
{
    public sealed class Database : DbContext
    {
        public static string ConnectionString { get; } =
            "Host=localhost;Port=5500;Username=postgres;Password=12345;Database=InTravel";
        
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