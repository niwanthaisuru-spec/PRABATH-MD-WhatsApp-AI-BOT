const fs = require('fs');
if (fs.existsSync('config.env')) require('dotenv').config({ path: './config.env' });

function convertToBool(text, fault = 'true') {
    return text === fault ? true : false;
}

module.exports = {
    SESSION_ID: process.env.SESSION_ID || "PRABATH-MD~8LXbWCdbYxx2eCa",
    GITHUB_USERNAME: process.env.GITHUB_USERNAME || "jaime",
    GITHUB_AUTH_TOKEN: process.env.GITHUB_AUTH_TOKEN || "",
    MONGODB: process.env.MONGODB || "mongodb+srv://echo:echo@cluster0.v9mvk.mongodb.net/?retryWrites=true&w=majority",
};
