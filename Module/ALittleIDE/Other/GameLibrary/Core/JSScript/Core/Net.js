{
if (typeof ALittle === "undefined") window.ALittle = {};


ALittle.IHttpFileReceiver = JavaScript.Class(undefined, {
	StartReceiveFile : function(file_path, start_size) {
		return new Promise((function(___COROUTINE, ___) {
			___COROUTINE("not impl"); return;
		}).bind(this));
	},
}, "ALittle.IHttpFileReceiver");

let __all_file_callback = {};
ALittle.RegHttpFileCallback = function(method, callback) {
	if (__all_file_callback[method] !== undefined) {
		ALittle.Error("RegHttpFileCallback消息回调函数注册失败，名字为" + method + "已存在");
		return;
	}
	__all_file_callback[method] = callback;
}

ALittle.FindHttpFileReceiverCallback = function(method) {
	return __all_file_callback[method];
}

ALittle.IHttpFileSender = JavaScript.Class(undefined, {
	HandleSucceed : function() {
	},
	HandleProcess : function(cur_size, total_size) {
	},
	HandleFailed : function(reason) {
	},
	Stop : function() {
	},
	GetFilePath : function() {
		return undefined;
	},
	GetTotalSize : function() {
		return 0;
	},
	GetCurSize : function() {
		return 0;
	},
	SendDownloadRPC : function(thread, method, content, array_buffer) {
		throw new Error("not impl");
	},
	SendUploadRPC : function(thread, method, content, array_buffer) {
		throw new Error("not impl");
	},
	InvokeDownload : function(method, client, content, array_buffer) {
		return new Promise(function(___COROUTINE, ___) {
			if (___COROUTINE === undefined) {
				___COROUTINE("当前不是协程"); return;
			}
			client.SendDownloadRPC(___COROUTINE, method, content, array_buffer);
			return;
		});
	},
	InvokeUpload : function(method, client, content, array_buffer) {
		return new Promise(function(___COROUTINE, ___) {
			if (___COROUTINE === undefined) {
				___COROUTINE("当前不是协程"); return;
			}
			client.SendUploadRPC(___COROUTINE, method, content, array_buffer);
			return;
		});
	},
}, "ALittle.IHttpFileSender");

ALittle.IHttpReceiver = JavaScript.Class(undefined, {
	Ctor : function(method) {
		this._method = method;
	},
	get method() {
		return this._method;
	},
}, "ALittle.IHttpReceiver");

let __all_receiver_callback = {};
ALittle.RegHttpCallback = function(method, callback) {
	if (__all_receiver_callback[method] !== undefined) {
		ALittle.Error("RegHttpCallback消息回调函数注册失败，名字为" + method + "已存在");
		return;
	}
	__all_receiver_callback[method] = callback;
}

ALittle.FindHttpCallback = function(method) {
	return __all_receiver_callback[method];
}

let __all_download_callback = {};
let __download_callback_factory = undefined;
ALittle.RegHttpDownloadCallback = function(method, callback) {
	if (__all_download_callback[method] !== undefined) {
		ALittle.Error("RegHttpDownloadCallback消息回调函数注册失败，名字为" + method + "已存在");
		return;
	}
	__all_download_callback[method] = callback;
}

ALittle.RegHttpDownloadCallbackFactory = function(value) {
	__download_callback_factory = value;
}

ALittle.FindHttpDownloadCallback = function(method) {
	let callback = __all_download_callback[method];
	if (callback === undefined && __download_callback_factory !== undefined) {
		callback = __download_callback_factory(method);
	}
	return callback;
}

ALittle.IHttpSender = JavaScript.Class(undefined, {
	HandleSucceed : function() {
	},
	HandleFailed : function(reason) {
	},
	Stop : function() {
	},
	SendRPC : function(thread, method, content) {
		throw new Error("not impl");
	},
	Invoke : function(method, client, content) {
		return new Promise(function(___COROUTINE, ___) {
			if (___COROUTINE === undefined) {
				___COROUTINE(["当前不是协程", undefined]); return;
			}
			client.SendRPC(___COROUTINE, method, content);
			return;
		});
	},
}, "ALittle.IHttpSender");

ALittle.IMessageWriteFactory = JavaScript.Class(undefined, {
	WriteToStdFile : function(file_path) {
		return false;
	},
	SetID : function(id) {
	},
	SetRpcID : function(id) {
	},
	ResetOffset : function() {
	},
	GetOffset : function() {
		return 0;
	},
	SetInt : function(offset, value) {
	},
	WriteBool : function(value) {
		return 0;
	},
	WriteInt : function(value) {
		return 0;
	},
	WriteLong : function(value) {
		return 0;
	},
	WriteString : function(value) {
		return 0;
	},
	WriteDouble : function(value) {
		return 0;
	},
}, "ALittle.IMessageWriteFactory");

ALittle.IMessageReadFactory = JavaScript.Class(undefined, {
	GetDataSize : function() {
		return 0;
	},
	ReadBool : function() {
		return false;
	},
	ReadInt : function() {
		return 0;
	},
	ReadLong : function() {
		return 0;
	},
	ReadString : function() {
		return "";
	},
	ReadDouble : function() {
		return 0;
	},
	GetReadSize : function() {
		return 0;
	},
}, "ALittle.IMessageReadFactory");

ALittle.IMsgCommon = JavaScript.Class(undefined, {
	IsConnected : function() {
		return false;
	},
	Close : function(reason) {
	},
	HandleConnectSucceed : function() {
	},
	HandleDisconnected : function() {
	},
	HandleConnectFailed : function(reason) {
	},
	HandleMessage : function(id, rpc_id, factory) {
	},
	SendMsg : function(T, msg) {
		let rflt = T;
		this.Send(rflt.hash_code, msg, 0);
	},
	Send : function(msg_id, msg_body, rpc_id) {
		throw new Error("not impl");
	},
	SendRPC : function(thread, msg_id, msg_body) {
	},
	Invoke : function(msg_id, client, msg_body) {
		client.Send(msg_id, msg_body, 0);
	},
	InvokeRPC : function(msg_id, client, msg_body) {
		return new Promise(function(___COROUTINE, ___) {
			if (___COROUTINE === undefined) {
				___COROUTINE(["当前不是协程", undefined]); return;
			}
			if (!client.IsConnected()) {
				___COROUTINE(["连接还没成功", undefined]); return;
			}
			client.SendRPC(___COROUTINE, msg_id, msg_body);
			return;
		});
	},
}, "ALittle.IMsgCommon");

let __all_msg_callback = new Map();
ALittle.RegMsgCallback = function(msg_id, callback) {
	if (__all_msg_callback.get(msg_id) !== undefined) {
		ALittle.Error("RegMsgCallback消息回调函数注册失败，名字为" + msg_id + "已存在");
		return;
	}
	__all_msg_callback.set(msg_id, callback);
}

ALittle.FindMsgCallback = function(msg_id) {
	return __all_msg_callback.get(msg_id);
}

let __all_rpc_callback = new Map();
let __all_rpc_return_id = new Map();
ALittle.RegMsgRpcCallback = function(msg_id, callback, return_id) {
	if (__all_rpc_callback.get(msg_id) !== undefined) {
		ALittle.Error("RegMsgRpcCallback消息回调函数注册失败，名字为" + msg_id + "已存在");
		return;
	}
	__all_rpc_callback.set(msg_id, callback);
	__all_rpc_return_id.set(msg_id, return_id);
}

ALittle.FindMsgRpcCallback = function(msg_id) {
	return [__all_rpc_callback.get(msg_id), __all_rpc_return_id.get(msg_id)];
}

}