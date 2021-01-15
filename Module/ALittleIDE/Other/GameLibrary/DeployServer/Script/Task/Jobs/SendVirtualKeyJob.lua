-- ALittle Generate Lua And Do Not Edit This Line!
do
if _G.DeployServer == nil then _G.DeployServer = {} end
local DeployServer = DeployServer
local Lua = Lua
local ALittle = ALittle
local ___pairs = pairs
local ___ipairs = ipairs


assert(DeployServer.Job, " extends class:DeployServer.Job is nil")
DeployServer.SendVirtualKeyJob = Lua.Class(DeployServer.Job, "DeployServer.SendVirtualKeyJob")

function DeployServer.SendVirtualKeyJob:Execute(build_info)
	local ___COROUTINE = coroutine.running()
	local msg = {}
	msg.detail = self._info.detail
	local error, rsp = ALittle.IWorkerCommon.InvokeRPC(578143398, DeployServer.g_JobWorker, msg)
	if error ~= nil then
		return error, nil
	end
	return nil, rsp.content
end

end