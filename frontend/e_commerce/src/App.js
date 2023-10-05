import logo from './logo.svg';
import './App.css';

import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';

import HomePage from './Screens/HomePage';
import RegisterPage from './Screens/RegisterPage';
import LoginPage from './Screens/LoginPage';


function App() {
  return (
    <Router>
        <Routes>
          <Route path="/" Component={HomePage} />
          <Route path="/login" Component={LoginPage} />
          <Route path="/register" Component={RegisterPage} />
        </Routes>
    </Router>
  );
}

export default App;
