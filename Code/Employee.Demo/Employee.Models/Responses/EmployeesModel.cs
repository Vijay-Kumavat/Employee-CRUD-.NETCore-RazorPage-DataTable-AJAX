using Employee.Models.Responses.Base;
using Newtonsoft.Json;
using System;

namespace Employee.Models.Responses
{
    public class EmployeesModel : PaginationResponse
    {
        [JsonProperty("id")]
        public int Id { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("dob")]
        public DateTime DOB { get; set; }

        [JsonProperty("gender")]
        public string Gender { get; set; }

        [JsonProperty("department")]
        public string Department { get; set; }
    }
}
