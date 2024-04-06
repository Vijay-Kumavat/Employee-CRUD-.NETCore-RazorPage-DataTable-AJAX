using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;

namespace Employee.Models.Requests.Base
{
    public class BaseDeleteRequest
    {
        [Required(ErrorMessage = "bad_response_Id_required")]
        [JsonProperty("id")]
        public Guid Id { get; set; }

        public bool Deleted { get; set; } = true;
    }
}