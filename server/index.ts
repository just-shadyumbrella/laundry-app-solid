import express from 'express'
import cookieSession from 'cookie-session'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

const app = express()

app.use(express.json())
app.use(express.urlencoded({ extended: true }))
app.use(
  cookieSession({
    name: 'session',
    keys: ['OFYLnJKZ2ky9BXpTivo1qA', 'D3PTMVCdnkqeve4EO9AaDA', 'O18FVG-j1kyiBzOz7_UGvQ', 'iX6AMqsow0Sa-OYmeIR-yw'],

    // Cookie Options
    maxAge: 24 * 60 * 60 * 1000, // 24 hours
  })
)

app.get('/auth/status', async (req, res) => {
  const users = await prisma.users.findMany()
  if (users.length === 0) {
    return res.redirect('/login')
  }
})

export const handler = app
