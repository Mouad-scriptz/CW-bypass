for i, v in pairs(getgc(true)) do
    if typeof(v) == "table" and rawget(v, "getIsBodyMoverCreatedByGame") then
        v.getIsBodyMoverCreatedByGame = function(gg)
            return true
        end
    end
    if typeof(v) == "table" and rawget(v, "kick") then
        v.kick = function()
            return wait(9e9)
        end
    end
    if typeof(v) == "table" and rawget(v, "randomDelayKick") then
        v.randomDelayKick = function()
            return wait(9e9)
        end
    end
    if typeof(v) == "table" and rawget(v, "connectCharacter") then
        v.connectCharacter = function(gg)
            return wait(9e9)
        end
    end
    if typeof(v) == "table" and rawget(v, "Remote") then
		if v.Remote.Name ~= v.Name then
        	v.Remote.Name = v.Name
		end
    end
end
local oldnamecall -- anti kick because cw kicks u after u rename the remotes
oldnamecall =
    hookmetamethod(
    game,
    "__namecall",
    function(self, ...)
        local args = {...}
        local method = getnamecallmethod()

        if (method == "Kick" or method == "kick") and self == game.Players.LocalPlayer then
            return
        end

        return oldnamecall(self, unpack(args))
    end
)
