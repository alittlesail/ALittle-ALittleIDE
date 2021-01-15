-- ALittle Generate Lua And Do Not Edit This Line!
do
if _G.ALittle == nil then _G.ALittle = {} end
local ALittle = ALittle
local Lua = Lua
local ___pairs = pairs
local ___ipairs = ipairs

ALittle.RegStruct(-667760585, "ALittle.WorkerMessage", {
name = "ALittle.WorkerMessage", ns_name = "ALittle", rl_name = "WorkerMessage", hash_code = -667760585,
name_list = {"id","rpc_id","msg","reason"},
type_list = {"int","int","any","string"},
option_map = {}
})

ALittle.IWorker = Lua.Class(nil, "ALittle.IWorker")

function ALittle.IWorker:IsStopped()
	return false
end

function ALittle.IWorker:Stop(reason)
end

function ALittle.IWorker:HandleMessage(worker_msg)
end

function ALittle.IWorker:SendMsg(T, msg)
	local rflt = T
	local info = {}
	info.id = rflt.hash_code
	info.msg = msg
	info.rpc_id = 0
	self:Send(info)
end

function ALittle.IWorker:Send(msg)
	Lua.Throw("IWorker Send not impl")
end

function ALittle.IWorker:SendRPC(thread, msg_id, msg_body)
end

function ALittle.IWorker.Invoke(msg_id, client, msg_body)
	local info = {}
	info.id = msg_id
	info.msg = msg_body
	info.rpc_id = 0
	client:Send(info)
end

function ALittle.IWorker.InvokeRPC(msg_id, client, msg_body)
	local ___COROUTINE = coroutine.running()
	if ___COROUTINE == nil then
		return "当前不是协程", nil
	end
	if client:IsStopped() then
		return "已停止", nil
	end
	client:SendRPC(___COROUTINE, msg_id, msg_body)
	return coroutine.yield()
end

local __all_worker_callback = {}
function ALittle.RegWorkerCallback(msg_id, callback)
	if __all_worker_callback[msg_id] ~= nil then
		ALittle.Error("RegWorkerCallback消息回调函数注册失败，名字为" .. msg_id .. "已存在")
		return
	end
	__all_worker_callback[msg_id] = callback
end

function ALittle.FindWorkerCallback(msg_id)
	return __all_worker_callback[msg_id]
end

local __all_worker_rpc_callback = {}
local __all_worker_rpc_return_id = {}
function ALittle.RegWorkerRpcCallback(msg_id, callback, return_id)
	if __all_worker_rpc_callback[msg_id] ~= nil then
		ALittle.Error("RegWorkerRpcCallback消息回调函数注册失败，名字为" .. msg_id .. "已存在")
		return
	end
	__all_worker_rpc_callback[msg_id] = callback
	__all_worker_rpc_return_id[msg_id] = return_id
end

function ALittle.FindWorkerRpcCallback(msg_id)
	return __all_worker_rpc_callback[msg_id], __all_worker_rpc_return_id[msg_id]
end

end