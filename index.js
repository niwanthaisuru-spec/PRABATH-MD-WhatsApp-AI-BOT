const fs = require('fs');
if (fs.existsSync('config.env')) require('dotenv').config({ path: './config.env' });

function convertToBool(text, fault = 'true') {
    return text === fault ? true : false;
}

module.exports = {
    SESSION_ID: process.env.SESSION_ID || "PRABATH-MD~8LXbWCdbYxx2eCa",
    AUTO_READ_STATUS: convertToBool(process.env.AUTO_READ_STATUS || "true"),
    MODE: process.env.MODE || "public",
    ALWAYS_ONLINE: convertToBool(process.env.ALWAYS_ONLINE || "true"),
    AUTO_TYPING: convertToBool(process.env.AUTO_TYPING || "false"),
    AUTO_RECORDING: convertToBool(process.env.AUTO_RECORDING || "false"),
    AUTO_STICKER: convertToBool(process.env.AUTO_STICKER || "false"),
    AUTO_REPLY: convertToBool(process.env.AUTO_REPLY || "false"),
    ALIVE_IMG: process.env.ALIVE_IMG || "https://telegra.ph/file/2a0d051e4484396ad22b1.png",
    ALIVE_MSG: process.env.ALIVE_MSG || "HII DEAR , I'M RELAZE-MD WHATSAPP BOT 😊",
    ANTI_LINK: convertToBool(process.env.ANTI_LINK || "true"),
    ANTI_BAD: convertToBool(process.env.ANTI_BAD || "true"),
    PREFIX: process.env.PREFIX || ".",
    FAKE_RECORDING: convertToBool(process.env.FAKE_RECORDING || "true"),
    AUTO_REACT: convertToBool(process.env.AUTO_REACT || "true"),
    HEART_REACT: convertToBool(process.env.HEART_REACT || "true"),
    OWNER_REACT: convertToBool(process.env.OWNER_REACT || "true"),
    BOT_NAME: process.env.BOT_NAME || "PRABATH-MD",
    OMDB_API_KEY: process.env.OMDB_API_KEY || "76cb7f19", // omdbapi.com
};
