using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AKSApi.Model;
using AKSApi.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace AKSApi.Controllers
{
    [Route("api/[controller]")]
    public class EventsAPIController : Controller
    {
        private readonly AKSDbContext _context;

        public EventsAPIController(AKSDbContext context)
        {
            _context = context;
        }

        // GET: api/EventsAPI
        [HttpGet]
        public IEnumerable<TechTalk> GetAll()
        {
            List<TechTalk> Events = _context.TechTalks
                .Include(t => t.Category)
                .Include(t => t.Level)
                .ToList();

            return Events;

        }

        [HttpGet("{id}", Name = "GetTechTalkById", Order = 1)]
        //GET: api/EventsAPI/1
        public TechTalk GetById(int id)
        {
            var item = _context.TechTalks.FirstOrDefault(o => o.Id.Equals(id));
            return item;
        }

        // POST api/EventsAPI
        [HttpPost]
        public IActionResult Create([FromBody]TechTalkVM techTalkVm)
        {
            if (techTalkVm == null)
            {
                return BadRequest();
            }

            TechTalk techTalk = new TechTalk
            {
                TechTalkName = techTalkVm.TechTalkName,
                CategoryId = techTalkVm.CategoryId,
                Category = _context.Categories.FirstOrDefault(x => x.Id == techTalkVm.CategoryId),
                LevelId = techTalkVm.LevelId,
                Level = _context.Levels.FirstOrDefault(x => x.Id == techTalkVm.LevelId)
            };

            try
            {
                _context.TechTalks.Add(techTalk);
                _context.Entry(techTalk.Category ?? throw new InvalidOperationException()).State = EntityState.Unchanged;
                _context.Entry(techTalk.Level ?? throw new InvalidOperationException()).State = EntityState.Unchanged;
                _context.SaveChanges();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Exception Occured : {ex.Message} - inner exception:- {ex.InnerException}");
            }


            return Ok();
        }

        // PUT api/EventsAPI/5
        [HttpPut("{id}")]
        public IActionResult Update(int id, [FromBody]TechTalk item)
        {
            if (item == null || !item.Id.Equals(id))
            {
                return BadRequest();
            }

            var techTalk = _context.TechTalks.FirstOrDefault(t => t.Id.Equals(id));
            if (techTalk == null)
            {
                return NotFound();
            }

            techTalk.TechTalkName = item.TechTalkName;

            _context.TechTalks.Update(techTalk);
            _context.SaveChanges();
            return new NoContentResult();
        }

        // DELETE api/EventsAPI/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var techTalk = _context.TechTalks
                        .FirstOrDefault(t => t.Id.Equals(id));

            if (techTalk == null)
            {
                return NotFound();
            }

            _context.TechTalks.Remove(techTalk);
            _context.SaveChanges();

            return new NoContentResult();
        }
    }
}