using Microsoft.CodeAnalysis;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ElasticsearchSample.Models
{
    public class DocWithHglModel
    {
        public string DocumentId { get; set; }
        public string DocumentName { get; set; }
        public string TextWithHgl { get; set; }
    }
}
