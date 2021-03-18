﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zhaoxi.CourseManagement.Model
{
    public class CourseModel
    {
        public string CourseName { get; set; }
        public string Cover { get; set; }
        public string Url { get; set; }
        public string Description { get; set; }

        public List<string> Teachers { get; set; }

        public bool IsShowSkeleton { get; set; }
    }
}
