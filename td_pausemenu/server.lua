ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('td_pausemenu:server:getPlayerInfo', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = xPlayer.getJob()
    local jobs = #ESX.GetExtendedPlayers('job', 'police') 
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier,
	}, function(result)
        local info = {}
		for i=1, #result, 1 do
            info = {
                job = xPlayer.getJob(), 
                name = xPlayer.getName(), 
                money = xPlayer.getMoney(),
                bank = xPlayer.getAccount('bank'),
                MaxPlayers = GetConvarInt('sv_maxclients', 32),
                TotalPlayers = GetNumPlayerIndices(),
                Group = xPlayer.getGroup(),
                Police = jobs,
            }
		end
        
    cb(info)
	end)
end)