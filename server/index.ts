import express from 'express'
import cookieSession from 'cookie-session'
import dotenv from 'dotenv'
import { PrismaClient } from '@prisma/client'
import { isBrowserRequest } from './util'

dotenv.config()

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

if (Number(process.env.DEBUG) === 1) {
  app.use((req, res, next) => {
    console.log(process.env)
    console.log(req.headers)
    next()
  })
}

app.use((req, res, next) => {
  if(isBrowserRequest(req)) {
    console.log('Browser request')
  }
  next()
})

app.get('/auth/status', async (req, res) => {
  const users = await prisma.users.findMany()
  if (users.length === 0) {
    return res.redirect('/login')
  }
})

class ResponseData {
  constructor(
    public error: 'OK' | 'INVALID_JSON' | 'INVALID_REQUEST' | 'CRED_INVALID' | 'USER_NOT_FOUND' | 'SERVER_FAULT',
    public message?: string,
    public data?: any
  ) {}
}

export const handler = app
