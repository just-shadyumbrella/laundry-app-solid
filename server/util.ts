import type { Request } from 'express'

export function isBrowserRequest(req: Request) {
  const ua = req.headers['user-agent'] || ''
  const accept = req.headers['accept'] || ''
  const secFetchMode = req.headers['sec-fetch-mode']

  // Check for browser-like User-Agent
  const isBrowserUA = /(Chrome|Firefox|Safari|Edge\/\d+)/i.test(ua) && !/bot|curl|wget/i.test(ua)
  console.log('isBrowserUA', isBrowserUA)

  // Check for text/html in Accept header
  const acceptsHTML = accept.includes('text/html')
  console.log('acceptsHTML', acceptsHTML)

  // Check for Fetch Metadata (modern browsers)
  const isNavigation = secFetchMode === 'navigate'
  console.log('isNavigation', isNavigation)

  return (isBrowserUA && acceptsHTML) || isNavigation
}
