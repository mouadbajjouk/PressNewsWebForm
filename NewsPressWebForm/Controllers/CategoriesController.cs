using NewsPressWebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace NewsPressWebForm.Controllers
{
    //[EnableCorsAttribute("*", "*", "*")]
    [AllowAnonymous]
    public class CategoriesController : ApiController
    {        
        // GET: api/Categories
        public IEnumerable<Categories> Get()
        {
            using (var context = new PressNewsContext())
            {
                return context.Categories.ToList();
            }
        }

        // GET: api/Categories/5
        public string Get(int id)
        {
            return "value";
        }

        [BasicAuthentication]
        // POST: api/Categories
        public IHttpActionResult Post([FromBody]Categories category)
        {
            using (var context = new PressNewsContext())
            {
                context.Categories.Add(category);

                context.SaveChanges();

                return Ok("Record saved!");
            }
                        
        }

        [BasicAuthentication]
        // PUT: api/Categories/5
        public IHttpActionResult Put(int id, [FromBody] Categories category)
        {
            using (var context = new PressNewsContext())
            {
                var cat = context.Categories.Where(x => x.Id == id).FirstOrDefault();

                cat.ImagePath = category.ImagePath;
                cat.Name = category.Name;

                context.SaveChanges();

                return Ok("Record saved!");
            }
        }

        [BasicAuthentication]
        // DELETE: api/Categories/5
        public void Delete(int id)
        {
            using (var context = new PressNewsContext())
            {
                var cat = context.Categories.Where(x => x.Id == id).FirstOrDefault();
                context.Categories.Remove(cat);

                context.SaveChanges();
            }
        }
    }
}
