{


let JSRequire = function(base_path, url, thread) {
	if (typeof(importScripts) !== "undefined") {
		importScripts("../../../" + base_path + url);
		thread(undefined);
		return;
	}
	if (typeof(require) !== "undefined") {
		require("../../../" + base_path + url);
		thread(undefined);
		return;
	}
	let script = document.createElement("script");
	script.type = "text/javascript";
	script.async = "async";
	let error = thread.bind("load failed:" + url);
	script.onabort = error;
	script.onerror = error;
	script.ontimeout = error;
	script.onload = thread.bind(undefined);
	script.src = base_path + url + ".js";
	document.body.appendChild(script);
}

window.Require = function(base_path, url) {
	return new Promise(function(___COROUTINE, ___) {
		JSRequire(base_path, url, ___COROUTINE);
		return;
	});
}

window.RunScript = function(script, path) {
	eval(script);
}

window.RequireFromPaths = function(base_path, rel_path, file_list) {
	return new Promise(async function(___COROUTINE, ___) {
		let ___OBJECT_1 = file_list;
		for (let index = 1; index <= ___OBJECT_1.length; ++index) {
			let path = ___OBJECT_1[index - 1];
			if (path === undefined) break;
			path = path.substring(0, path.length - 8);
			await Require(base_path, rel_path + path);
		}
		___COROUTINE();
	});
}

window.A_CoreBasePath = undefined;
window.RequireCore = function(base_path) {
	return new Promise(async function(___COROUTINE, ___) {
		A_CoreBasePath = base_path;
		await Require(base_path, "Core/Base");
		await Require(base_path, "Core/Reflect");
		await Require(base_path, "Core/JavaScript");
		await Require(base_path, "Core/Log");
		await Require(base_path, "Core/List");
		await Require(base_path, "Core/Map");
		await Require(base_path, "Core/Math");
		await Require(base_path, "Core/String");
		await Require(base_path, "Core/Time");
		await Require(base_path, "Core/Coroutine");
		await Require(base_path, "Core/Net");
		await Require(base_path, "Core/Worker");
		___COROUTINE();
	});
}

}