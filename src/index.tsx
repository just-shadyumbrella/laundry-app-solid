/* @refresh reload */
import { Router, Route } from '@solidjs/router'
import { render } from 'solid-js/web'
import { onMount } from 'solid-js'
import { createStore } from 'solid-js/store'

import './index.css'
import { NotFound } from './pages/ErrorPages'
import { Home } from './pages/Home'
import { Header, SideMenu } from './components/Sections'
import { Login } from './pages/Login'

function App() {
  // const [user, setUser] = createStore({})
  // onMount(async () => {
  //   try {
  //     const response = await fetch('/user/profile')
  //     const user = await response.json()
  //     setUser(user)
  //   } catch (error) {
  //     console.error('Error fetching user profile:', error)
  //   }
  // })
  return (
    <>
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
          <Route path='/*' component={Home} /> {/* Home and nested routes */}
          <Route path='/login' component={Login} />
          <Route path='*' component={NotFound} /> {/* Catch-all route */}
        </Router>
      </div>
    </>
  )
}

render(() => <App />, document.getElementById('app') as HTMLElement)
