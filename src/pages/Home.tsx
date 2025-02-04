import { Router, Route } from '@solidjs/router'

export function Home() {
  return (
    <Router>
      <Route path='/test' element={<p>Home Page Content</p>} /> {/* Root content */}
    </Router>
  )
}
