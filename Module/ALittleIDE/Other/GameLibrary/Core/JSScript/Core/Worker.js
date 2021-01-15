{
if (typeof ALittle === "undefined") window.ALittle = {};

ALittle.RegStruct(-667760585, "ALittle.WorkerMessage", {
name : "ALittle.WorkerMessage", ns_name : "ALittle", rl_name : "WorkerMessage", hash_code : -667760585,
name_list : ["id","rpc_id","msg","reason"],
type_list : ["int","int","any","string"],
option_map : {}
})

ALittle.IWorker = JavaScript.Class(undefined, {
	IsStopped : function() {
		return false;
	},
	Stop : function(reason) {
	},
	HandleMessage : function(worker_msg) {
	},
	SendMsg : function(T, msg) {
		let rflt = T;
		let info = {};
		info.id = rflt.hash_code;
		info.msg = msg;
		info.rpc_id = 0;
		this.Send(info);
	},
	Send : function(msg) {
		throw new Error("IWorker Send not impl");
	},
	SendRPC : function(thread, msg_id, msg_body) {
	},
	Invoke : function(msg_id, client, msg_body) {
		let info = {};
		info.id = msg_id;
		info.msg = msg_body;
		info.rpc_id = 0;
		client.Send(info);
	},
	InvokeRPC : function(msg_id, client, msg_body) {
		return new Promise(function(___COROUTINE, ___) {
			if (___COROUTINE === undefined) {
				___COROUTINE(["当前不是协程", undefined]); return;
			}
			if (client.IsStopped()) {
				___COROUTINE(["已停止", undefined]); return;
			}
			client.SendRPC(___COROUTINE, msg_id, msg_body);
			return;
		});
	},
}, "ALittle.IWorker");

let __all_worker_callback = new Map();
ALittle.RegWorkerCallback = function(msg_id, callback) {
	if (__all_worker_callback.get(msg_id) !== undefined) {
		ALittle.Error("RegWorkerCallback消息回调函数注册失败，名字为" + msg_id + "已存在");
		return;
	}
	__all_worker_callback.set(msg_id, callback);
}

ALittle.FindWorkerCallback = function(msg_id) {
	return __all_worker_callback.get(msg_id);
}

let __all_worker_rpc_callback = new Map();
let __all_worker_rpc_return_id = new Map();
ALittle.RegWorkerRpcCallback = function(msg_id, callback, return_id) {
	if (__all_worker_rpc_callback.get(msg_id) !== undefined) {
		ALittle.Error("RegWorkerRpcCallback消息回调函数注册失败，名字为" + msg_id + "已存在");
		return;
	}
	__all_worker_rpc_callback.set(msg_id, callback);
	__all_worker_rpc_return_id.set(msg_id, return_id);
}

ALittle.FindWorkerRpcCallback = function(msg_id) {
	return [__all_worker_rpc_callback.get(msg_id), __all_worker_rpc_return_id.get(msg_id)];
}

}