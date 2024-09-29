﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObject.Model.Page
{
    public class CategoryModel
    {
        public int CateId { get; set; }

        public string CateName { get; set; } = null!;

        public string Keyword { get; set; } = null!;

        public int quantity { get; set; }

        public object FunctionContent { get; set; } // Object type to hold any UI element

        public bool IsAvailable { get; set; }
    }
}
