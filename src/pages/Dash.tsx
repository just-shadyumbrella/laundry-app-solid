import { Header, SideMenu } from '../components/Sections'
import { Route, Router } from '@solidjs/router';

export function Dash() {
  return (
    <div class="container">
      <div class='grid'>
        <img src='/logo.jpg' style={{ height: '100%' }} />
      </div>
      <header class='grid'>
        <Header />
      </header>
      <div class='grid'>
        <SideMenu />
      </div>
      <div class='grid'>
        <Router>
          <Route path='/login' component={Login} />
        </Router>
      </div>
    </div>
  )
}
