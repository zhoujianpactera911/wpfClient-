﻿using LiveCharts;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Zhaoxi.CourseManagement.Model
{
    public class CourseSeriesModel
    {
        public string CourseName { get; set; }

        public SeriesCollection SeriesColection { get; set; }

        public ObservableCollection<SeriesModel> SeriesList { get; set; }
    }
}
