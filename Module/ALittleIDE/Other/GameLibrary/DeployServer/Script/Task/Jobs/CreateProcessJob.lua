-- ALittle Generate Lua And Do Not Edit This Line!
do
if _G.DeployServer == nil then _G.DeployServer = {} end
local DeployServer = DeployServer
local Lua = Lua
local ALittle = ALittle
local ___pairs = pairs
local ___ipairs = ipairs


assert(DeployServer.Job, " extends class:DeployServer.Job is nil")
DeployServer.CreateProcessJob = Lua.Class(DeployServer.Job, "DeployServer.CreateProcessJob")

function DeployServer.CreateProcessJob:Execute(build_info)
	local ___COROUTINE = coroutine.running()
	local msg = {}
	msg.detail = self._info.detail
	local error, rsp = ALittle.IWorkerCommon.InvokeRPC(1248316265, DeployServer.g_JobWorker, msg)
	return error, nil
end

end