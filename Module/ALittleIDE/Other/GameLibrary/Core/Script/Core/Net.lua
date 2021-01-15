-- ALittle Generate Lua And Do Not Edit This Line!
do
if _G.ALittle == nil then _G.ALittle = {} end
local ALittle = ALittle
local Lua = Lua
local ___rawset = rawset
local ___pairs = pairs
local ___ipairs = ipairs


ALittle.IHttpFileReceiver = Lua.Class(nil, "ALittle.IHttpFileReceiver")

function ALittle.IHttpFileReceiver:StartReceiveFile(file_path, start_size)
	local ___COROUTINE = coroutine.running()
	return "not impl"
end

local __all_file_callback = {}
function ALittle.RegHttpFileCallback(method, callback)
	if __all_file_callback[method] ~= nil then
		ALittle.Error("RegHttpFileCallback消息回调函数注册失败，名字为" .. method .. "已存在")
		return
	end
	__all_file_callback[method] = callback
end

function ALittle.FindHttpFileReceiverCallback(method)
	return __all_file_callback[method]
end

ALittle.IHttpFileSender = Lua.Class(nil, "ALittle.IHttpFileSender")

function ALittle.IHttpFileSender:HandleSucceed()
end

function ALittle.IHttpFileSender:HandleProcess(cur_size, total_size)
end

function ALittle.IHttpFileSender:HandleFailed(reason)
end

function ALittle.IHttpFileSender:Stop()
end

function ALittle.IHttpFileSender:GetFilePath()
	return nil
end

function ALittle.IHttpFileSender:GetTotalSize()
	return 0
end

function ALittle.IHttpFileSender:GetCurSize()
	return 0
end

function ALittle.IHttpFileSender:SendDownloadRPC(thread, method, content, array_buffer)
	Lua.Throw("not impl")
end

function ALittle.IHttpFileSender:SendUploadRPC(thread, method, content, array_buffer)
	Lua.Throw("not impl")
end

function ALittle.IHttpFileSender.InvokeDownload(method, client, content, array_buffer)
	local ___COROUTINE = coroutine.running()
	if ___COROUTINE == nil then
		return "当前不是协程"
	end
	client:SendDownloadRPC(___COROUTINE, method, content, array_buffer)
	return coroutine.yield()
end

function ALittle.IHttpFileSender.InvokeUpload(method, client, content, array_buffer)
	local ___COROUTINE = coroutine.running()
	if ___COROUTINE == nil then
		return "当前不是协程"
	end
	client:SendUploadRPC(___COROUTINE, method, content, array_buffer)
	return coroutine.yield()
end

ALittle.IHttpReceiver = Lua.Class(nil, "ALittle.IHttpReceiver")

function ALittle.IHttpReceiver:Ctor(method)
	___rawset(self, "_method", method)
end

function ALittle.IHttpReceiver.__getter:method()
	return self._method
end

local __all_receiver_callback = {}
function ALittle.RegHttpCallback(method, callback)
	if __all_receiver_callback[method] ~= nil then
		ALittle.Error("RegHttpCallback消息回调函数注册失败，名字为" .. method .. "已存在")
		return
	end
	__all_receiver_callback[method] = callback
end

function ALittle.FindHttpCallback(method)
	return __all_receiver_callback[method]
end

local __all_download_callback = {}
local __download_callback_factory = nil
function ALittle.RegHttpDownloadCallback(method, callback)
	if __all_download_callback[method] ~= nil then
		ALittle.Error("RegHttpDownloadCallback消息回调函数注册失败，名字为" .. method .. "已存在")
		return
	end
	__all_download_callback[method] = callback
end

function ALittle.RegHttpDownloadCallbackFactory(value)
	__download_callback_factory = value
end

function ALittle.FindHttpDownloadCallback(method)
	local callback = __all_download_callback[method]
	if callback == nil and __download_callback_factory ~= nil then
		callback = __download_callback_factory(method)
	end
	return callback
end

ALittle.IHttpSender = Lua.Class(nil, "ALittle.IHttpSender")

function ALittle.IHttpSender:HandleSucceed()
end

function ALittle.IHttpSender:HandleFailed(reason)
end

function ALittle.IHttpSender:Stop()
end

function ALittle.IHttpSender:SendRPC(thread, method, content)
	Lua.Throw("not impl")
end

function ALittle.IHttpSender.Invoke(method, client, content)
	local ___COROUTINE = coroutine.running()
	if ___COROUTINE == nil then
		return "当前不是协程", nil
	end
	client:SendRPC(___COROUTINE, method, content)
	return coroutine.yield()
end

ALittle.IMessageWriteFactory = Lua.Class(nil, "ALittle.IMessageWriteFactory")

function ALittle.IMessageWriteFactory:WriteToStdFile(file_path)
	return false
end

function ALittle.IMessageWriteFactory:SetID(id)
end

function ALittle.IMessageWriteFactory:SetRpcID(id)
end

function ALittle.IMessageWriteFactory:ResetOffset()
end

function ALittle.IMessageWriteFactory:GetOffset()
	return 0
end

function ALittle.IMessageWriteFactory:SetInt(offset, value)
end

function ALittle.IMessageWriteFactory:WriteBool(value)
	return 0
end

function ALittle.IMessageWriteFactory:WriteInt(value)
	return 0
end

function ALittle.IMessageWriteFactory:WriteLong(value)
	return 0
end

function ALittle.IMessageWriteFactory:WriteString(value)
	return 0
end

function ALittle.IMessageWriteFactory:WriteDouble(value)
	return 0
end

ALittle.IMessageReadFactory = Lua.Class(nil, "ALittle.IMessageReadFactory")

function ALittle.IMessageReadFactory:GetDataSize()
	return 0
end

function ALittle.IMessageReadFactory:ReadBool()
	return false
end

function ALittle.IMessageReadFactory:ReadInt()
	return 0
end

function ALittle.IMessageReadFactory:ReadLong()
	return 0
end

function ALittle.IMessageReadFactory:ReadString()
	return ""
end

function ALittle.IMessageReadFactory:ReadDouble()
	return 0
end

function ALittle.IMessageReadFactory:GetReadSize()
	return 0
end

ALittle.IMsgCommon = Lua.Class(nil, "ALittle.IMsgCommon")

function ALittle.IMsgCommon:IsConnected()
	return false
end

function ALittle.IMsgCommon:Close(reason)
end

function ALittle.IMsgCommon:HandleConnectSucceed()
end

function ALittle.IMsgCommon:HandleDisconnected()
end

function ALittle.IMsgCommon:HandleConnectFailed(reason)
end

function ALittle.IMsgCommon:HandleMessage(id, rpc_id, factory)
end

function ALittle.IMsgCommon:SendMsg(T, msg)
	local rflt = T
	self:Send(rflt.hash_code, msg, 0)
end

function ALittle.IMsgCommon:Send(msg_id, msg_body, rpc_id)
	Lua.Throw("not impl")
end

function ALittle.IMsgCommon:SendRPC(thread, msg_id, msg_body)
end

function ALittle.IMsgCommon.Invoke(msg_id, client, msg_body)
	client:Send(msg_id, msg_body, 0)
end

function ALittle.IMsgCommon.InvokeRPC(msg_id, client, msg_body)
	local ___COROUTINE = coroutine.running()
	if ___COROUTINE == nil then
		return "当前不是协程", nil
	end
	if not client:IsConnected() then
		return "连接还没成功", nil
	end
	client:SendRPC(___COROUTINE, msg_id, msg_body)
	return coroutine.yield()
end

local __all_msg_callback = {}
function ALittle.RegMsgCallback(msg_id, callback)
	if __all_msg_callback[msg_id] ~= nil then
		ALittle.Error("RegMsgCallback消息回调函数注册失败，名字为" .. msg_id .. "已存在")
		return
	end
	__all_msg_callback[msg_id] = callback
end

function ALittle.FindMsgCallback(msg_id)
	return __all_msg_callback[msg_id]
end

local __all_rpc_callback = {}
local __all_rpc_return_id = {}
function ALittle.RegMsgRpcCallback(msg_id, callback, return_id)
	if __all_rpc_callback[msg_id] ~= nil then
		ALittle.Error("RegMsgRpcCallback消息回调函数注册失败，名字为" .. msg_id .. "已存在")
		return
	end
	__all_rpc_callback[msg_id] = callback
	__all_rpc_return_id[msg_id] = return_id
end

function ALittle.FindMsgRpcCallback(msg_id)
	return __all_rpc_callback[msg_id], __all_rpc_return_id[msg_id]
end

end