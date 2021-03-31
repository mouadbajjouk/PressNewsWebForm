using NewsPressWebForm.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace NewsPressWebForm.Controllers
{
    [AllowAnonymous]
    public class ItemsController : ApiController
    {
        // GET: api/Items
        public IEnumerable<Items> Get()
        {
            using (var context = new PressNewsContext())
            {
                return context.Items.ToList();
            }
        }

        // GET: api/Items/5
        public IEnumerable<Items> Get(int catId)
        {
            using (var context = new PressNewsContext())
            {
                return context.Items.Where(i => i.CategoryId == catId).ToList();
            }
        }

        [BasicAuthentication]
        // POST: api/Items
        public IHttpActionResult Post([FromBody]Items item)
        {
            using (var context = new PressNewsContext())
            {
                context.Items.Add(item);

                context.SaveChanges();

                return Ok("Record saved!");
            }
        }

        [BasicAuthentication]
        // PUT: api/Items/5
        public IHttpActionResult Put(int id, [FromBody] Items item)
        {
            using (var context = new PressNewsContext())
            {
                var itm = context.Items.Where(x => x.Id == id).FirstOrDefault();

                //itm.CategoryId = item.CategoryId;
                itm.Name = item.Name;
                itm.Date = item.Date;
                itm.LinkUrl = item.LinkUrl;
                itm.Text = item.Text;

                context.SaveChanges();

                return Ok("Record saved!");
            }
        }

        [BasicAuthentication]
        // DELETE: api/Items/5
        public void Delete(int id)
        {
            using (var context = new PressNewsContext())
            {
                var itm = context.Items.Where(x => x.Id == id).FirstOrDefault();
                context.Items.Remove(itm);

                context.SaveChanges();
            }
        }
    }
}
