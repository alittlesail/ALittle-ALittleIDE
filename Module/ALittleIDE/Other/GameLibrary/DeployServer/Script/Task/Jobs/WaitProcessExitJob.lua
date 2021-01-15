-- ALittle Generate Lua And Do Not Edit This Line!
do
if _G.DeployServer == nil then _G.DeployServer = {} end
local DeployServer = DeployServer
local Lua = Lua
local ALittle = ALittle
local ___pairs = pairs
local ___ipairs = ipairs


assert(DeployServer.Job, " extends class:DeployServer.Job is nil")
DeployServer.WaitProcessExitJob = Lua.Class(DeployServer.Job, "DeployServer.WaitProcessExitJob")

function DeployServer.WaitProcessExitJob:Execute(build_info)
	local ___COROUTINE = coroutine.running()
	local msg = {}
	msg.detail = self._info.detail
	local error, rsp = ALittle.IWorkerCommon.InvokeRPC(2052715406, DeployServer.g_JobWorker, msg)
	return error, nil
end

end