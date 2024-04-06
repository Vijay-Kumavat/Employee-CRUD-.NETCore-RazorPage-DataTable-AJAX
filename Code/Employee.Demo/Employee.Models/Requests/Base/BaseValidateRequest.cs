using System;
using System.Text.Json.Serialization;

namespace Employee.Models.Requests.Base
{
    public class BaseValidateRequest
    {
        [JsonIgnore]
        public Guid? UserId { get; set; }

        [JsonIgnore]
        public string UniqueId { get; set; }
    }
}