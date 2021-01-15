-- ALittle Generate Lua And Do Not Edit This Line!
do
if _G.DeployServer == nil then _G.DeployServer = {} end
local DeployServer = DeployServer
local Lua = Lua
local ALittle = ALittle
local ___pairs = pairs
local ___ipairs = ipairs

ALittle.RegStruct(2052715406, "DeployServer.QWaitProcessExitExecute", {
name = "DeployServer.QWaitProcessExitExecute", ns_name = "DeployServer", rl_name = "QWaitProcessExitExecute", hash_code = 2052715406,
name_list = {"detail"},
type_list = {"DeployServer.JobInfoDetail"},
option_map = {}
})
ALittle.RegStruct(-1941486856, "DeployServer.AWaitProcessExitExecute", {
name = "DeployServer.AWaitProcessExitExecute", ns_name = "DeployServer", rl_name = "AWaitProcessExitExecute", hash_code = -1941486856,
name_list = {},
type_list = {},
option_map = {}
})
ALittle.RegStruct(1870092216, "DeployServer.ABatchExecute", {
name = "DeployServer.ABatchExecute", ns_name = "DeployServer", rl_name = "ABatchExecute", hash_code = 1870092216,
name_list = {"exit_code","content"},
type_list = {"int","string"},
option_map = {}
})
ALittle.RegStruct(1447368920, "DeployServer.ACopyFileExecute", {
name = "DeployServer.ACopyFileExecute", ns_name = "DeployServer", rl_name = "ACopyFileExecute", hash_code = 1447368920,
name_list = {},
type_list = {},
option_map = {}
})
ALittle.RegStruct(-1431809884, "DeployServer.QBatchExecute", {
name = "DeployServer.QBatchExecute", ns_name = "DeployServer", rl_name = "QBatchExecute", hash_code = -1431809884,
name_list = {"detail"},
type_list = {"DeployServer.JobInfoDetail"},
option_map = {}
})
ALittle.RegStruct(1368739506, "DeployServer.AKillProcessExecute", {
name = "DeployServer.AKillProcessExecute", ns_name = "DeployServer", rl_name = "AKillProcessExecute", hash_code = 1368739506,
name_list = {},
type_list = {},
option_map = {}
})
ALittle.RegStruct(-1351236611, "DeployServer.QDeepCopyExecute", {
name = "DeployServer.QDeepCopyExecute", ns_name = "DeployServer", rl_name = "QDeepCopyExecute", hash_code = -1351236611,
name_list = {"detail"},
type_list = {"DeployServer.JobInfoDetail"},
option_map = {}
})
ALittle.RegStruct(1248316265, "DeployServer.QCreateProgressExecute", {
name = "DeployServer.QCreateProgressExecute", ns_name = "DeployServer", rl_name = "QCreateProgressExecute", hash_code = 1248316265,
name_list = {"detail"},
type_list = {"DeployServer.JobInfoDetail"},
option_map = {}
})
ALittle.RegStruct(1248316217, "DeployServer.ACreateProgressExecute", {
name = "DeployServer.ACreateProgressExecute", ns_name = "DeployServer", rl_name = "ACreateProgressExecute", hash_code = 1248316217,
name_list = {},
type_list = {},
option_map = {}
})
ALittle.RegStruct(1166148652, "DeployServer.QKillProcessExecute", {
name = "DeployServer.QKillProcessExecute", ns_name = "DeployServer", rl_name = "QKillProcessExecute", hash_code = 1166148652,
name_list = {"detail"},
type_list = {"DeployServer.JobInfoDetail"},
option_map = {}
})
ALittle.RegStruct(-876622592, "DeployServer.ADeepCopyExecute", {
name = "DeployServer.ADeepCopyExecute", ns_name = "DeployServer", rl_name = "ADeepCopyExecute", hash_code = -876622592,
name_list = {},
type_list = {},
option_map = {}
})
ALittle.RegStruct(578143414, "DeployServer.ASendVirtualKeyExecute", {
name = "DeployServer.ASendVirtualKeyExecute", ns_name = "DeployServer", rl_name = "ASendVirtualKeyExecute", hash_code = 578143414,
name_list = {"content"},
type_list = {"string"},
option_map = {}
})
ALittle.RegStruct(578143398, "DeployServer.QSendVirtualKeyExecute", {
name = "DeployServer.QSendVirtualKeyExecute", ns_name = "DeployServer", rl_name = "QSendVirtualKeyExecute", hash_code = 578143398,
name_list = {"detail"},
type_list = {"DeployServer.JobInfoDetail"},
option_map = {}
})
ALittle.RegStruct(-467409153, "DeployServer.QCopyFileExecute", {
name = "DeployServer.QCopyFileExecute", ns_name = "DeployServer", rl_name = "QCopyFileExecute", hash_code = -467409153,
name_list = {"detail"},
type_list = {"DeployServer.JobInfoDetail"},
option_map = {}
})

function DeployServer.HandleBatchWorker(sender, msg)
	local ___COROUTINE = coroutine.running()
	local detail = msg.detail
	local rsp = {}
	local cmd = ""
	if detail.batch_dir ~= nil and detail.batch_dir ~= "" then
		local index = ALittle.String_Find(detail.batch_dir, ":")
		if index ~= nil then
			cmd = cmd .. ALittle.String_Sub(detail.batch_dir, 1, index) .. " && "
		end
		if index ~= ALittle.String_Len(detail.batch_dir) then
			cmd = cmd .. "cd \"" .. detail.batch_dir .. "\" && "
		end
	end
	cmd = cmd .. detail.batch_cmd .. " " .. detail.batch_param
	local file = io.popen(cmd, "rb")
	Lua.Assert(file ~= nil, "命令执行失败:" .. cmd)
	rsp.content = file:read("*a")
	local result, error, status = file:close()
	Lua.Assert(result, error)
	rsp.exit_code = status
	return rsp
end

ALittle.RegWorkerRpcCallback(-1431809884, DeployServer.HandleBatchWorker, 1870092216)
function DeployServer.HandleDeepCopyWorker(sender, msg)
	local ___COROUTINE = coroutine.running()
	local detail = msg.detail
	local rsp = {}
	if detail.deepcopy_ext == "" then
		detail.deepcopy_ext = nil
	end
	local attr = ALittle.File_GetFileAttr(detail.deepcopy_src)
	Lua.Assert(attr ~= nil and attr.directory, "源目录不存在")
	ALittle.File_MakeDeepDir(detail.deepcopy_dst)
	attr = ALittle.File_GetFileAttr(detail.deepcopy_dst)
	Lua.Assert(attr ~= nil and attr.directory, "目标目录创建失败")
	ALittle.File_CopyDeepDir(detail.deepcopy_src, detail.deepcopy_dst, detail.deepcopy_ext)
	return rsp
end

ALittle.RegWorkerRpcCallback(-1351236611, DeployServer.HandleDeepCopyWorker, -876622592)
function DeployServer.HandleCopyFileWorker(sender, msg)
	local ___COROUTINE = coroutine.running()
	local detail = msg.detail
	local rsp = {}
	local attr = ALittle.File_GetFileAttr(detail.copyfile_src)
	Lua.Assert(attr ~= nil and attr.directory, "源目录不存在")
	ALittle.File_MakeDeepDir(detail.copyfile_dst)
	attr = ALittle.File_GetFileAttr(detail.copyfile_dst)
	Lua.Assert(attr ~= nil and attr.directory, "目标目录创建失败")
	local src = ALittle.File_PathEndWithSplit(detail.copyfile_src)
	local dst = ALittle.File_PathEndWithSplit(detail.copyfile_dst)
	for index, file_name in ___ipairs(detail.copyfile_file) do
		local result = ALittle.File_CopyFile(src .. file_name, dst .. file_name)
		Lua.Assert(result, "文件复制失败:" .. src .. file_name)
	end
	return rsp
end

ALittle.RegWorkerRpcCallback(-467409153, DeployServer.HandleCopyFileWorker, 1447368920)
function DeployServer.HandleSendVirtualKeyWorker(sender, msg)
	local ___COROUTINE = coroutine.running()
	local detail = msg.detail
	local cmd_list = msg.detail.virtualkey_cmd
	local rsp = {}
	local pids = carp.GetProcessIDByPath(detail.virtualkey_exepath)
	rsp.content = "发送的进程个数为:" .. ALittle.List_Len(pids) .. "\n"
	for index, pid in ___ipairs(pids) do
		for _, cmd in ___ipairs(cmd_list) do
			if ALittle.String_Sub(cmd, ALittle.String_Len(cmd)) ~= "\n" then
				cmd = cmd .. "\n"
			end
			rsp.content = rsp.content .. "向进程ID:" .. pid .. " 发送命令:" .. cmd
			Lua.Assert(carp.SendVirtualKey(pid, cmd), "发送失败")
		end
	end
	return rsp
end

ALittle.RegWorkerRpcCallback(578143398, DeployServer.HandleSendVirtualKeyWorker, 578143414)
function DeployServer.HandleWaitProcessExitWorker(sender, msg)
	local ___COROUTINE = coroutine.running()
	local detail = msg.detail
	local wait_map = {}
	for index, exe_path in ___ipairs(detail.wait_p_exit_exe_path) do
		wait_map[exe_path] = true
	end
	local remain_time = detail.wait_p_exit_max_time
	while true do
		local wait_remove
		for exe_path, _ in ___pairs(wait_map) do
			local pids = carp.GetProcessIDByPath(exe_path)
			if ALittle.List_Len(pids) == 0 then
				if wait_remove == nil then
					wait_remove = {}
				end
				wait_remove[exe_path] = true
			end
		end
		if wait_remove ~= nil then
			for exe_path, _ in ___pairs(wait_remove) do
				wait_map[exe_path] = nil
			end
		end
		if ALittle.IsEmpty(wait_map) then
			break
		end
		A_LoopSystem:Sleep(1000)
		Lua.Assert(remain_time ~= 1, "等待超时")
		if remain_time > 1 then
			remain_time = remain_time - 1
		end
	end
	return {}
end

ALittle.RegWorkerRpcCallback(2052715406, DeployServer.HandleWaitProcessExitWorker, -1941486856)
function DeployServer.HandleCreateProgressWorker(sender, msg)
	local ___COROUTINE = coroutine.running()
	local detail = msg.detail
	local work_path
	if detail.createprocess_dir ~= nil and detail.createprocess_dir ~= "" then
		work_path = detail.createprocess_dir
	end
	local result = carp.CreateProcess(detail.createprocess_cmd, detail.createprocess_param, work_path)
	Lua.Assert(result, "进程创建失败")
	return {}
end

ALittle.RegWorkerRpcCallback(1248316265, DeployServer.HandleCreateProgressWorker, 1248316217)
function DeployServer.HandleKillProcessWorker(sender, msg)
	local ___COROUTINE = coroutine.running()
	local detail = msg.detail
	for index, exe_path in ___ipairs(detail.killprocess_exe_path) do
		local pids = carp.GetProcessIDByPath(exe_path)
		for _, pid in ___ipairs(pids) do
			carp.KillProcessByID(pid)
		end
	end
	return {}
end

ALittle.RegWorkerRpcCallback(1166148652, DeployServer.HandleKillProcessWorker, 1368739506)
end