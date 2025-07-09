fx_version 'cerulean'
game 'gta5'

author 'RetroV Dev Team'
description 'Retro Core Framework - Lightweight Qbox Layer'
version '1.0.0'

shared_script '@ox_lib/init.lua'

client_script {
    'client/core.lua'
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    'server/core.lua'
}

files {
    'modules/*.lua'
}
