# Employee Management React App

This is a simple React application built with Vite that integrates with a backend API to list, get details, and create employees.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Running the Project](#running-the-project)
- [Building for Production](#building-for-production)

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed [Node.js](https://nodejs.org/) (v14 or later) and [npm](https://www.npmjs.com/) (v6 or later).
- You have a running backend API to connect to.

## Setup

1. Clone the repository:

    ```sh
    git clone https://github.com/your-username/employee-management-app.git
    cd employee-management-app
    ```

2. Install dependencies:

    ```sh
    npm install
    ```

3. Create a `.env` file in the root directory and add your backend API base URL:

    ```env
    # .env
    VITE_API_BASE_URL=https://your-api-url.com
    ```

## Running the Project

1. Start the development server:

    ```sh
    npm run dev
    ```

2. Open your browser and navigate to [http://localhost:5173](http://localhost:5173) (or the URL provided by Vite).

## Building for Production

To build the app for production, run:

```sh
npm run build
