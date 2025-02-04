import './Sections.css'

export function SideMenu() {
  return (
    <>
      <button class='menu-button'>
        <svg xmlns='http://www.w3.org/2000/svg' width={20} height={20} viewBox='0 0 24 24'>
          <path
            fill='none'
            stroke='currentColor'
            stroke-linecap='round'
            stroke-linejoin='round'
            stroke-width={2}
            d='M4 6h16M4 12h16M4 18h16'></path>
        </svg>
      </button>
    </>
  )
}

export function Header() {
  return (
    <>
      <img src='/logo.png' style={{ height: '100%'}} />
    </>
  )
}