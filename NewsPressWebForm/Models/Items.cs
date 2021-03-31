using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace NewsPressWebForm.Models
{
    public partial class Items
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Text { get; set; }
        public DateTime? Date { get; set; }
        public string LinkUrl { get; set; }
        public int CategoryId { get; set; }

        public virtual Categories Category { get; set; }
    }
}
