using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using ElasticsearchSample.Models;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace ElasticsearchSample.Controllers
{
    public class ElasticsearchController : Controller
    {
        private static readonly Uri baseUri = new Uri(Environment.GetEnvironmentVariable("ELASTICSEARCH_URI"));

        // GET: ElasticsearchController
        public ActionResult Index()
        {
            return View();
        }

        // POST: ElasticsearchController/Result
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Search([Bind("CompanyId", "Keyword")] InputModel inputModel)
        {
            var relativeUri = "sample_esg/_search";
            var requestUri = new Uri(baseUri, relativeUri);
            
            var jsonFilePath = Path.Combine("JsonTemplates", "query2.json");
            var jsonString = System.IO.File.ReadAllText(jsonFilePath);
            dynamic jsonObject = JsonConvert.DeserializeObject(jsonString);
            jsonObject["query"]["bool"]["must"][0]["match"]["company_id"] = inputModel.CompanyId;
            jsonObject["query"]["bool"]["must"][1]["match"]["text"] = inputModel.Keyword;

            var query = JsonConvert.SerializeObject(jsonObject);
            var content = new StringContent(query, Encoding.UTF8, "application/json");
            Console.WriteLine(query);

            HttpClient client = new HttpClient();
            try
            {
                HttpResponseMessage response = await client.PostAsync(requestUri, content);
                if (response.IsSuccessStatusCode)
                {
                    var responseContent = await response.Content.ReadAsStringAsync();
                    ViewData["searchResult"] = responseContent;
                }
                else
                {
                    return RedirectToAction(nameof(Index));
                }

                return View();
            }
            catch
            {
                throw;
            }
        }
    }
}
