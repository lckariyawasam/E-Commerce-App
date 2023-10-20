import logo from './logo.svg';
import './App.css';

import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';

import HomePage from './Screens/HomePage';
import RegisterPage from './Screens/RegisterPage';
import LoginPage from './Screens/LoginPage';
import Cart from './Screens/Cart';
import TempProduct from './Screens/TempProduct';
import TempProducts from './Screens/TempProducts';


function App() {
  return (
    <Router>
        <Routes>
          <Route path="/" Component={HomePage} />
          <Route path="/login" Component={LoginPage} />
          <Route path="/register" Component={RegisterPage} />
          <Route path="/cart" Component={Cart} />
          <Route path="/product/:id" Component={TempProduct} />
          <Route path="/products" Component={TempProducts} />
        </Routes>
    </Router>
  );
}

export default App;
