fx_version 'cerulean'
game 'gta5'
lua54 'yes'

ui_page 'html/index.html'

client_scripts {
    'client.lua'

}
files {
	'html/main.js',
    'html/style.css',
    'html/index.html'
}

exports {
    "sendMissionText",
    "resetBar"
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}