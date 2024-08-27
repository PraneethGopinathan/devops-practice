import React, { useState, useEffect } from 'react';
import { listEmployees, getEmployeeDetails, createEmployee } from './api';
import './App.css';

function App() {
  const [employees, setEmployees] = useState([]);
  const [selectedEmployee, setSelectedEmployee] = useState(null);
  const [newEmployee, setNewEmployee] = useState({
    first_name: '',
    last_name: '',
    email: '',
    job_title: '',
    date_of_birth: ''
  });

  useEffect(() => {
    const fetchEmployees = async () => {
      try {
        const employees = await listEmployees();
        setEmployees(employees);
      } catch (error) {
        console.error('Error fetching employees:', error);
      }
    };

    fetchEmployees();
  }, []);

  const handleEmployeeClick = async (id) => {
    try {
      const employeeDetails = await getEmployeeDetails(id);
      setSelectedEmployee(employeeDetails);
    } catch (error) {
      console.error(`Error fetching details for employee ${id}:`, error);
    }
  };

  const handleCreateEmployee = async (e) => {
    e.preventDefault();
    try {
      const createdEmployee = await createEmployee(newEmployee);
      setEmployees([...employees, createdEmployee]);
      setNewEmployee({
        first_name: '',
        last_name: '',
        email: '',
        job_title: '',
        date_of_birth: ''
      });
    } catch (error) {
      console.error('Error creating employee:', error);
    }
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNewEmployee({ ...newEmployee, [name]: value });
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1>Employee Management</h1>
        <p>Manage your employees with ease.</p>

        <div className="container">
          <section className="employee-list">
            <h2>Employees</h2>
            <ul>
              {employees.map(employee => (
                <li key={employee.id} onClick={() => handleEmployeeClick(employee.id)}>
                  {employee.first_name} {employee.last_name}
                </li>
              ))}
            </ul>
          </section>

          <section className="employee-details">
            {selectedEmployee && (
              <div>
                <h3>Employee Details</h3>
                <p><strong>ID:</strong> {selectedEmployee.id}</p>
                <p><strong>First Name:</strong> {selectedEmployee.first_name}</p>
                <p><strong>Last Name:</strong> {selectedEmployee.last_name}</p>
                <p><strong>Email:</strong> {selectedEmployee.email}</p>
                <p><strong>Job Title:</strong> {selectedEmployee.job_title}</p>
                <p><strong>Date of Birth:</strong> {selectedEmployee.date_of_birth}</p>
              </div>
            )}
          </section>

          <section className="create-employee">
            <h2>Create New Employee</h2>
            <form onSubmit={handleCreateEmployee}>
              <div className="form-group">
                <label htmlFor="first_name">First Name</label>
                <input
                  type="text"
                  id="first_name"
                  name="first_name"
                  value={newEmployee.first_name}
                  onChange={handleInputChange}
                  placeholder="Enter first name"
                  required
                />
              </div>
              <div className="form-group">
                <label htmlFor="last_name">Last Name</label>
                <input
                  type="text"
                  id="last_name"
                  name="last_name"
                  value={newEmployee.last_name}
                  onChange={handleInputChange}
                  placeholder="Enter last name"
                  required
                />
              </div>
              <div className="form-group">
                <label htmlFor="email">Email</label>
                <input
                  type="email"
                  id="email"
                  name="email"
                  value={newEmployee.email}
                  onChange={handleInputChange}
                  placeholder="Enter email address"
                  required
                />
              </div>
              <div className="form-group">
                <label htmlFor="job_title">Job Title</label>
                <input
                  type="text"
                  id="job_title"
                  name="job_title"
                  value={newEmployee.job_title}
                  onChange={handleInputChange}
                  placeholder="Enter job title"
                  required
                />
              </div>
              <div className="form-group">
                <label htmlFor="date_of_birth">Date of Birth</label>
                <input
                  type="date"
                  id="date_of_birth"
                  name="date_of_birth"
                  value={newEmployee.date_of_birth}
                  onChange={handleInputChange}
                  required
                />
              </div>
              <button type="submit">Create Employee</button>
            </form>
          </section>
        </div>
      </header>
    </div>
  );
}

export default App;
