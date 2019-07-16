using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace AKSApi.Model
{
    public class AKSDbContext : DbContext
    {
        public AKSDbContext(DbContextOptions<AKSDbContext> options) :base(options)
        {
            
        }

        public DbSet<TechTalk> TechTalk { get; set; }
        public DbSet<Level> Levels { get; set; }
        public DbSet<Category> Categories { get; set; }
    }
}
