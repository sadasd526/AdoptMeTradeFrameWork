local l__load__1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load;
local u7 = l__load__1("RouterClient")
local module = {}

function module.AcceptRequest(plr)
	u7.get("TradeAPI/AcceptOrDeclineTradeRequest"):InvokeServer(plr, true);
end

-- make function to decline trade TradeTradeRequestReceived
function module.DeclineRequest(plr)
	u7.get("TradeAPI/AcceptOrDeclineTradeRequest"):InvokeServer(plr, false);
end

--make function to get trade get_data
function module.GetTradeData()
	return require(game.ReplicatedStorage.ClientModules.Core.ClientData).get_data()[game.Players.LocalPlayer.Name]['trade']
end


--make function to yield until trade is accepted
function module.WaitForAccept()
	local data = module.GetTradeData()
	repeat
		wait()
		data = module.GetTradeData()
	until data['sender_offer']['negotiated'] == true
end

--make function to yield until trade is confirmed
function module.WaitForConfirm()
	local data = module.GetTradeData()
	repeat
		wait()
		data = module.GetTradeData()
	until data['sender_offer']['confirmed'] == true
end

-- make function to AddItemToOffer
function module.AddItemToOffer(item)
	u7.get("TradeAPI/AddItemToOffer"):FireServer(item)
end

--make function to accept trade
function module.AcceptTrade()
	u7.get("TradeAPI/AcceptNegotiation"):FireServer()
end


--make function to accept trade
function module.ConfirmTrade()
	u7.get("TradeAPI/ConfirmTrade"):FireServer()
end
	
--make function to decline trade
function module.DeclineTrade()
	u7.get("TradeAPI/DeclineTrade"):FireServer()
end

--make function to remove item from offer
function module.RemoveItemFromOffer(item)
	u7.get("TradeAPI/RemoveItemFromOffer"):FireServer(item)
end

return module
