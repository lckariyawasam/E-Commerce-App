import logo from './logo.svg';
import './App.css';

import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';

import HomePage from './Screens/HomePage';
import RegisterPage from './Screens/RegisterPage';
import LoginPage from './Screens/LoginPage';
import ProductView from './Screens/ProductView';
import CategoryView from './Screens/CategoryView';
import Footer from './Components/Footer';
import ScrollToTop from './Components/ScrollToTop';
import Navbar from './Components/Navbar';
import NotFound from './Screens/NotFound';
import AdminPanel from './Screens/AdminPanel';
import Cart from './Screens/Cart';
import BillingPage from './Screens/BillingPage';
import Checkout from './Screens/Checkout';

import 'bootstrap/dist/css/bootstrap.min.css';
import 'font-awesome/css/font-awesome.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'bootstrap/dist/js/bootstrap.min.js';




function App() {

  const userIsLoggedIn = true;
  

  return (
    <Router>
      <ScrollToTop/>
      <Navbar isLoggedIn={userIsLoggedIn} />
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/login" element={<LoginPage />} />
          <Route path="/register" element={<RegisterPage />} />
          <Route path="/product/:productId" element={<ProductView />} />
          <Route path="/category/:categoryName" element={<CategoryView />} />
          <Route path="/admin" element={<AdminPanel />} />
          <Route path="/cart" element={<Cart />} />
          <Route path="/billing" element={<BillingPage />} />
          <Route path="/checkout" element={<Checkout />} />
          <Route path="*" element={<NotFound />} />
        </Routes>
        <Footer />
    </Router>
    
  );
}

export default App;
