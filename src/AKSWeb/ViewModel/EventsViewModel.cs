using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AKSWeb.ViewModel
{
    public class EventsViewModel
    {
        public int Id { get; set; }
        public string TechTalkName { get; set; }
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public int LevelId { get; set; }
        public string LevelName { get; set; }
    }
}
