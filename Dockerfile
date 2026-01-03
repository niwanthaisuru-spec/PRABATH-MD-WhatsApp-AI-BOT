const {
    default: makeWASocket,
    useMultiFileAuthState,
    DisconnectReason,
    fetchLatestBaileysVersion,
    generateForwardMessageContent,
    prepareWAMessageMedia,
    generateWAMessageFromContent,
    generateMessageID,
    downloadContentFromMessage,
    makeInMemoryStore,
    jidDecode,
    proto
} = require("@whiskeysockets/baileys")
const pino = require('pino')
const { Boom } = require('@hapi/boom')
const fs = require('fs')
const chalk = require('chalk')
const FileType = require('file-type')
const path = require('path')
const NodeCache = require("node-cache")
const readline = require("readline")

async function startBot() {
    const { state, saveCreds } = await useMultiFileAuthState(`./auth_info_baileys`)
    const { version, isLatest } = await fetchLatestBaileysVersion()
    
    const conn = makeWASocket({
        version,
        logger: pino({ level: 'silent' }),
        printQRInTerminal: true,
        auth: state,
        msgRetryCounterCache: new NodeCache()
    })

    conn.ev.on('creds.update', saveCreds)

    conn.ev.on('connection.update', async (update) => {
        const { connection, lastDisconnect } = update
        if (connection === 'close') {
            let reason = new Boom(lastDisconnect?.error)?.output.statusCode
            if (reason === DisconnectReason.loggedOut) { console.log(`Device Logged Out, Please Delete Session and Scan Again.`); process.exit(); }
            else { startBot() }
        } else if (connection === 'open') {
            console.log('✅ බොට් සාර්ථකව සම්බන්ධ විය (Connected)!')
        }
    })

    conn.ev.on('messages.upsert', async chatUpdate => {
        // බොට් එකේ පණිවිඩ හැසිරවීමේ කේතය මෙතැනට පැමිණේ
    })
}

startBot()
