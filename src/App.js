import React from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';
import V1 from './v1/index';
import V2 from './v2/index';
import V3 from './v3/index';
import V4 from './v4/index';

function App() {
  return (
    <Router>
      <div>
        <nav>
          <ul>
            <li><Link to="/v1">V1</Link></li>
            <li><Link to="/v2">V2</Link></li>
            <li><Link to="/v3">V3</Link></li>
            <li><Link to="/v4">V4</Link></li>
          </ul>
        </nav>
        <h1>This is the 0 Version</h1>
        <Routes>
          <Route path="/v1" element={<V1 />} />
          <Route path="/v2" element={<V2 />} />
          <Route path="/v3" element={<V3 />} />
          <Route path="/v4" element={<V4 />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
