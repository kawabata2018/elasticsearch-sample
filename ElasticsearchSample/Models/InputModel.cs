using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace ElasticsearchSample.Models
{
    public class InputModel
    {
        [DisplayName("会社ID（1か2か）")]
        public int CompanyId { get; set; }

        [DisplayName("キーワード")]
        [StringLength(20)]
        public string Keyword { get; set; }
    }
}
