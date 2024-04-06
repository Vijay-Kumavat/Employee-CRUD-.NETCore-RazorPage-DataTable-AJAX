var employee, employeeIds = [];

$(document).ready(function () {
    initializeDataTable();
});

function initializeDataTable() {
    $("#dt1").DataTable({
        "ajax": {
            "url": "/Index?handler=GetAllEmployees",
            "type": "GET",
            "contentType": "application/json; charset=utf-8",
            "dataSrc": ""
        },
        "columnDefs": [
            {
                "targets": -1,
                "data": null,
                "render": function (data, type, row, meta) {
                    return '<button class="btn btn-primary" onclick="editEmployee(' + row.id + ')">Edit</button> <button class="btn btn-danger" onclick="openDeletePopup(' + row.id + ')">Delete</button>';
                },
                "sortable": false
            },
            {
                "name": "Id", "data": "id", "targets": 0, "sortable": false,
                'render': function (data, type, row, meta) {
                    return '<input type="checkbox" name="checkbox" onclick="selectEmpId(' + row.id + ')" value="' + $('<div/>').text(data).html() + '">';
                }
            },
            { "name": "Name", "data": "name", "targets": 1 },
            { "name": "Department", "data": "department", "targets": 2 },
            {
                "name": "DOB", "data": "dob", "targets": 3,
                "render": function (data) {
                    var date = new Date(data);
                    var month = date.getMonth() + 1;
                    var day = date.getDate();
                    return date.getFullYear() + "/"
                        + (month.length > 1 ? month : "0" + month) + "/"
                        + ("0" + day).slice(-2);
                }
            }
        ],
        "order": [[0, "desc"]]
    });
}

function editEmployee(id) {
    $.ajax({
        url: "/Index?handler=GetEmployeeById",
        type: 'GET',
        data: { id: id },
        success: function (response) {
            $('#addEditId').val(response.id);
            $('#addEditName').val(response.name);
            $('#addEditDepartment').val(response.department);
            $('#addEditDob').val(formatDate(response.dob));

            var gender = response.gender;

            if (gender === 'Male') {
                $('#addEditFemale').prop('checked', false);
                $('#addEditMale').prop('checked', true);
            } else if (gender === 'Female') {
                $('#addEditMale').prop('checked', false);
                $('#addEditFemale').prop('checked', true);
            }

            $('#addEditEmployeeModal').modal('show');
        },
        error: function (xhr, status, error) {
            console.error(error);
        }
    });
};

function openAddEditPopup() {
    employee = {};
    $('#addEditId').val('');
    $('#addEditName').val('');
    $('#addEditDepartment').val('');
    $('#addEditDob').val(formatDate(new Date()));
    $('#addEditFemale').prop('checked', false);
    $('#addEditMale').prop('checked', true);
    $('#addEditEmployeeModal').modal('show');
}

function closePopup(value) {
    $('#' + value).modal('hide');
}

function formatDate(dateString) {
    var date = new Date(dateString);
    var year = date.getFullYear();
    var month = (date.getMonth() + 1).toString().padStart(2, '0');
    var day = date.getDate().toString().padStart(2, '0');
    return year + '-' + month + '-' + day;
}

function insertUpdateEmployee() {
    employee = {
        id: $('#addEditId').val(),
        name: $('#addEditName').val(),
        department: $('#addEditDepartment').val(),
        dob: $('#addEditDob').val(),
        gender: null
    };

    if ($('#addEditMale').is(':checked')) {
        employee.gender = 'Male';
    } else if ($('#addEditFemale').is(':checked')) {
        employee.gender = 'Female';
    }

    $.ajax({
        url: "/Index?handler=InsertUpdateEmployee",
        type: 'GET',
        data: employee,
        success: function (response) {
            $('#addEditEmployeeModal').modal('hide');
            $('#dt1').DataTable().destroy();
            initializeDataTable();
        },
        error: function (xhr, status, error) {
            console.error(error);
        }
    });
}

function onGenderChanged(value) {
    if (value === 'Male') {
        $('#addEditFemale').prop('checked', false);
        $('#addEditMale').prop('checked', true);
    } else if (value === 'Female') {
        $('#addEditMale').prop('checked', false);
        $('#addEditFemale').prop('checked', true);
    }
}

function openDeletePopup(id) {
    $('#deleteId').val(id);
    $('#deleteEmployeeModal').modal('show');
}

function deleteEmployee() {
    let id = $('#deleteId').val();

    $.ajax({
        url: "/Index?handler=DeleteEmployee",
        type: 'GET',
        data: { id: id },
        success: function (response) {
            $('#deleteEmployeeModal').modal('hide');
            $('#dt1').DataTable().destroy();
            initializeDataTable();
        },
        error: function (xhr, status, error) {
            console.error(error);
        }
    });
}

function selectEmpId(id) {
    var index = employeeIds.indexOf(id);
    if (index === -1) {
        employeeIds.push(id);
    } else {
        employeeIds.splice(index, 1);
    }
}

function openShowEmployeePopup() {
    $("#showEmployeeModal tbody").html("");
    showEmployees();
    $('#showEmployeeModal').modal('show');
}

function showEmployees() {
    $.ajax({
        url: "/Index?handler=GetEmployeeByIds",
        type: 'GET',
        dataType: 'json',
        contentType: 'application/json; charset=utf-8',
        data: { "ids": JSON.stringify(employeeIds) },
        success: function (response) {
            displayRecords(response);
        },
        error: function (xhr, status, error) {
            console.error(error);
        }
    });
}

function displayRecords(records) {
    $("#showEmployeeModal tbody").html("");
    $.each(records, function (index, record) {
        $('#showEmployeeModal tbody').append('<tr><td>' + record.name + '</td><td>' + record.department + '</td></tr>');
    });
}

function selectAllEmployees(bx) {
    $("#showEmployeeModal tbody").html("");
    var cbs = document.getElementsByName('checkbox');
    if ($('#isAllSelected').is(':checked')) {
        let ids = [];
        for (var i = 0; i < cbs.length; i++) {
            if (cbs[i].type == 'checkbox') {
                cbs[i].checked = bx.checked;
                ids.push(cbs[i].value);
            }
        }
        employeeIds = ids;
    } else {
        for (var i = 0; i < cbs.length; i++) {
            if (cbs[i].type == 'checkbox') {
                cbs[i].checked = false;
            }
        }
        employeeIds = [];
    }
}