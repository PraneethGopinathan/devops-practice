import axios from 'axios';

const API_BASE_URL = import.meta.env.VITE_API_BASE_URL;

export const listEmployees = async () => {
  try {
    const response = await axios.get(`${API_BASE_URL}/employees/`);
    return response.data;
  } catch (error) {
    throw new Error('Failed to fetch employees');
  }
};

export const getEmployeeDetails = async (id) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/employees/${id}/`);
    return response.data;
  } catch (error) {
    throw new Error('Failed to fetch employee details');
  }
};

export const createEmployee = async (employee) => {
  try {
    const response = await axios.post(`${API_BASE_URL}/employees/`, employee, {
      headers: {
        'Content-Type': 'application/json',
      },
    });
    return response.data;
  } catch (error) {
    throw new Error('Failed to create employee');
  }
};
