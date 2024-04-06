using Employee.Dapper;
using Employee.Models.Constants;
using Employee.Models.Responses;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Newtonsoft.Json;
using System.Data;
using System.Linq.Dynamic.Core;

namespace Employee.Demo.Pages
{
    public class IndexModel : PageModel
    {
        private IDapperRepository DapperRepository { get; set; }

        public IndexModel(IDapperRepository dapperRepository)
        {
            DapperRepository = dapperRepository;
        }

        public async Task OnGetAsync()
        {
        }

        public async Task<JsonResult> OnGetGetAllEmployees()
        {
            var employees = (await DapperRepository.GetTableAsync<EmployeesModel>(SpConsts.Employee.EmployeeList)).ToList();
            return new JsonResult(employees);
        }

        public async Task<JsonResult> OnGetGetEmployeeById(int id)
        {
            var employees = await DapperRepository.FindAsync<EmployeesModel>(SpConsts.Employee.GetEmployeesByIds, new { Ids = ToDataTable(new List<int> { id }) });
            return new JsonResult(employees);
        }

        public async Task OnGetInsertUpdateEmployee(EmployeesModel employee)
        {
            await DapperRepository.FindAsync<EmployeesModel>(SpConsts.Employee.InsertOrUpdateEmployee, new
            {
                employee.Id,
                employee.Name,
                employee.Department,
                employee.DOB,
                employee.Gender
            });
        }

        public async Task OnGetDeleteEmployee(int id)
        {
            await DapperRepository.AddOrUpdateAsync(
                SpConsts.Employee.DeleteEmployee, new { Id = id });
        }

        public async Task<JsonResult> OnGetGetEmployeeByIds(string ids)
        {
            List<int> employeeIds = JsonConvert.DeserializeObject<List<int>>(ids)!;
            var employees = await DapperRepository.FindListAsync<EmployeesModel>(SpConsts.Employee.GetEmployeesByIds, new { Ids = ToDataTable(employeeIds) }, System.Data.CommandType.StoredProcedure);
            return new JsonResult(employees);
        }

        private DataTable ToDataTable(List<int> ids)
        {
            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("Id", typeof(int));
            foreach (int id in ids)
            {
                dataTable.Rows.Add(id);
            }
            return dataTable;
        }
    }
}