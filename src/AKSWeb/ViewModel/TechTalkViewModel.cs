﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace AKSWeb.ViewModel
{
    public class TechTalkViewModel
    {
        public int Id { get; set; }
        public string TechTalkName { get; set; }
        public int CategoryId { get; set; }

        public int LevelId { get; set; }

        public List<SelectListItem> Levels { get; } = new List<SelectListItem>
        {
            new SelectListItem {Value = "1", Text = "100 - Beginner"},
            new SelectListItem {Value = "2", Text = "200 - Intermediate"},
            new SelectListItem {Value = "3", Text = "300 - Advanced"},
            new SelectListItem {Value = "4", Text = "400 - Expert"}
        };

        public List<SelectListItem> Categories { get; } = new List<SelectListItem>
        {
            new SelectListItem { Value = "1", Text = "AKS Meetup" },
            new SelectListItem { Value = "2", Text = "Kongsberg Tech Conference" },
            new SelectListItem { Value = "3", Text = "ThoughtWorks Conference"  },
            new SelectListItem { Value = "4", Text = "Kongsberg Hackathon"  },
            new SelectListItem { Value = "5", Text = "Golang Conference"  },
        };
    }
}
