{
if (typeof AUIPlugin === "undefined") window.AUIPlugin = {};
let ___all_struct = ALittle.GetAllStruct();

ALittle.RegStruct(-1479093282, "ALittle.UIEvent", {
name : "ALittle.UIEvent", ns_name : "ALittle", rl_name : "UIEvent", hash_code : -1479093282,
name_list : ["target"],
type_list : ["ALittle.DisplayObject"],
option_map : {}
})
ALittle.RegStruct(1094428778, "AUIPlugin.AUIFileRemoteSelectItemInfo", {
name : "AUIPlugin.AUIFileRemoteSelectItemInfo", ns_name : "AUIPlugin", rl_name : "AUIFileRemoteSelectItemInfo", hash_code : 1094428778,
name_list : ["name","frame","file","dir","button"],
type_list : ["ALittle.DisplayObject","ALittle.DisplayObject","ALittle.Image","ALittle.Image","ALittle.TextRadioButton"],
option_map : {}
})
ALittle.RegStruct(-1017774550, "AUIPlugin.AUIFileRemoteSelectItemUserData", {
name : "AUIPlugin.AUIFileRemoteSelectItemUserData", ns_name : "AUIPlugin", rl_name : "AUIFileRemoteSelectItemUserData", hash_code : -1017774550,
name_list : ["path","directory"],
type_list : ["string","bool"],
option_map : {}
})
ALittle.RegStruct(958494922, "ALittle.UIChangedEvent", {
name : "ALittle.UIChangedEvent", ns_name : "ALittle", rl_name : "UIChangedEvent", hash_code : 958494922,
name_list : ["target"],
type_list : ["ALittle.DisplayObject"],
option_map : {}
})
ALittle.RegStruct(-449066808, "ALittle.UIClickEvent", {
name : "ALittle.UIClickEvent", ns_name : "ALittle", rl_name : "UIClickEvent", hash_code : -449066808,
name_list : ["target","is_drag","count"],
type_list : ["ALittle.DisplayObject","bool","int"],
option_map : {}
})

if (ALittle.DisplayLayout === undefined) throw new Error(" extends class:ALittle.DisplayLayout is undefined");
AUIPlugin.AUIFileRemoteSelectLayout = JavaScript.Class(ALittle.DisplayLayout, {
	Ctor : function() {
		this._group = new Map();
	},
	Init : function(ext_list) {
		this._real_size = 100;
		this._thread = undefined;
		this._base_path = undefined;
		this._real_path = undefined;
		if (ext_list !== undefined) {
			this._ext_map = {};
			let ___OBJECT_1 = ext_list;
			for (let index = 1; index <= ___OBJECT_1.length; ++index) {
				let ext = ___OBJECT_1[index - 1];
				if (ext === undefined) break;
				this._ext_map[ALittle.String_Upper(ext)] = true;
			}
		}
		this._cur_selected = undefined;
	},
	Release : function() {
		if (this._thread !== undefined) {
			ALittle.Coroutine.Resume(this._thread, undefined);
			this._thread = undefined;
		}
		this._cur_selected = undefined;
	},
	get base_path() {
		return this._base_path;
	},
	ShowSelect : function() {
		return new Promise((function(___COROUTINE, ___) {
			this._thread = ___COROUTINE;
			return;
		}).bind(this));
	},
	System_SetVDragCursor : function(event) {
		ALittle.System_SetVDragCursor();
	},
	System_SetNormalCursor : function(event) {
		ALittle.System_SetNormalCursor();
	},
	System_SetHDragCursor : function(event) {
		ALittle.System_SetHDragCursor();
	},
	System_SetHVDragCursor : function(event) {
		ALittle.System_SetHVDragCursor();
	},
	CreateFileItem : function(file_name, rel_path, abs_path) {
		let ext = ALittle.File_GetFileExtByPath(file_name);
		if (this._ext_map !== undefined) {
			ext = ALittle.String_Upper(ext);
			if (this._ext_map[ext] === undefined) {
				return undefined;
			}
		}
		let info = {};
		let item = AUIPlugin.g_Control.CreateControl("file_remote_select_item", info);
		info.name.text = file_name;
		info.dir.visible = false;
		info.file.visible = true;
		info.button.drag_trans_target = this._scroll_list;
		info.button.AddEventListener(___all_struct.get(-449066808), this, this.HandleItemClick);
		info.button.AddEventListener(___all_struct.get(958494922), this, this.HandleItemSelected);
		info.button.group = this._group;
		let user_data = {};
		user_data.path = rel_path;
		user_data.directory = false;
		info.button._user_data = user_data;
		item._user_data = user_data;
		return item;
	},
	CreateDirItem : function(file_name, rel_path, abs_path) {
		let info = {};
		let item = AUIPlugin.g_Control.CreateControl("file_remote_select_item", info);
		info.name.text = file_name;
		info.file.visible = false;
		info.dir.visible = true;
		info.button.drag_trans_target = this._scroll_list;
		info.button.AddEventListener(___all_struct.get(-449066808), this, this.HandleItemClick);
		info.button.AddEventListener(___all_struct.get(958494922), this, this.HandleItemSelected);
		info.button.group = this._group;
		let user_data = {};
		user_data.path = rel_path;
		user_data.directory = true;
		info.button._user_data = user_data;
		item._user_data = user_data;
		return item;
	},
	HandleSelectConfirmClick : function(event) {
		if (this._cur_selected === undefined) {
			g_AUITool.ShowNotice("提示", "请先选中文件或者文件夹");
			return;
		}
		if (this._thread !== undefined) {
			ALittle.Coroutine.Resume(this._thread, this._base_path + "\\" + this._cur_selected.path);
			this._thread = undefined;
		}
	},
	GetNameListByDir : function(browser_path) {
		return new Promise((function(___COROUTINE, ___) {
			___COROUTINE({}); return;
		}).bind(this));
	},
	BrowserCollect : function(browser_path) {
		return new Promise((async function(___COROUTINE, ___) {
			let item_list_dir = [];
			let item_list_img = [];
			let file_map = await this.GetNameListByDir(browser_path);
			let ___OBJECT_2 = file_map;
			for (let file in ___OBJECT_2) {
				let info = ___OBJECT_2[file];
				if (info === undefined) continue;
				let path = browser_path + "\\" + file;
				let rel_path = ALittle.String_Sub(path, ALittle.String_Len(this._base_path) + 2);
				if (info.directory) {
					let item = this.CreateDirItem(file, rel_path, path);
					if (item !== undefined) {
						ALittle.List_Push(item_list_dir, item);
					}
				} else {
					let item = this.CreateFileItem(file, rel_path, path);
					if (item !== undefined) {
						ALittle.List_Push(item_list_img, item);
					}
				}
			}
			___COROUTINE([item_list_dir, item_list_img]); return;
		}).bind(this));
	},
	ItemListCmp : function(a, b) {
		let a_user_data = a._user_data;
		let b_user_data = b._user_data;
		return a_user_data.path < b_user_data.path;
	},
	CreateItemAndAddToList : function(item_list_dir, item_list_img) {
		ALittle.List_Sort(item_list_dir, AUIPlugin.AUIFileRemoteSelectLayout.ItemListCmp);
		ALittle.List_Sort(item_list_img, AUIPlugin.AUIFileRemoteSelectLayout.ItemListCmp);
		let item_list = [];
		let ___OBJECT_3 = item_list_dir;
		for (let index = 1; index <= ___OBJECT_3.length; ++index) {
			let item = ___OBJECT_3[index - 1];
			if (item === undefined) break;
			ALittle.List_Push(item_list, item);
		}
		let ___OBJECT_4 = item_list_img;
		for (let index = 1; index <= ___OBJECT_4.length; ++index) {
			let item = ___OBJECT_4[index - 1];
			if (item === undefined) break;
			ALittle.List_Push(item_list, item);
		}
		let col_count = ALittle.Math_Floor(this._scroll_list.width / this._real_size);
		let remain_count = 0;
		let container = undefined;
		let ___OBJECT_5 = item_list;
		for (let index = 1; index <= ___OBJECT_5.length; ++index) {
			let item = ___OBJECT_5[index - 1];
			if (item === undefined) break;
			if (remain_count === 0) {
				container = ALittle.NewObject(ALittle.Linear, AUIPlugin.g_Control);
				container.type = 1;
				container.height = item.height;
				this._scroll_list.AddChild(container);
				container.AddChild(item);
				remain_count = col_count - 1;
			} else {
				remain_count = remain_count - 1;
				container.AddChild(item);
			}
		}
	},
	Refresh : async function() {
		this._cur_selected = undefined;
		this._scroll_list.RemoveAllChild();
		this._path_input.text = ALittle.String_Sub(this._real_path, ALittle.String_Len(this._base_path) + 2);
		let [item_list_dir, item_list_img] = await this.BrowserCollect(this._real_path);
		this.CreateItemAndAddToList(item_list_dir, item_list_img);
	},
	SetPath : function(base_path, rel_path) {
		this._base_path = base_path;
		this._real_path = base_path;
		if (rel_path !== undefined && rel_path !== "") {
			this._real_path = this._real_path + "\\" + rel_path;
		}
		if (this._base_path !== undefined) {
			this.Refresh();
		} else {
			this._scroll_list.RemoveAllChild();
		}
		return true;
	},
	SetBasePath : function(base_path) {
		if (this._base_path === base_path) {
			return true;
		}
		return this.SetPath(base_path, "");
	},
	HandleSetPathClick : function(event) {
		this.SetPath(this._base_path, this._path_input.text);
	},
	HandleSetPrePathClick : function(event) {
		let rel_path = ALittle.String_Sub(this._real_path, ALittle.String_Len(this._base_path) + 2);
		if (rel_path === "") {
			return;
		}
		this.SetPath(this._base_path, ALittle.File_GetFilePathByPath(rel_path));
	},
	HandleItemClick : function(event) {
		let user_data = event.target._user_data;
		if (event.count > 1) {
			if (user_data.directory) {
				this._real_path = this._base_path + "\\" + user_data.path;
				this.Refresh();
			}
		}
	},
	HandleItemSelected : function(event) {
		this._cur_selected = event.target._user_data;
	},
	CheckResourceName : function(name) {
		let len = ALittle.String_Len(name);
		if (len === 0) {
			return [false, "命名只能支持字母数字下划线"];
		}
		for (let i = 1; i <= len; i += 1) {
			let byte = ALittle.String_Byte(name, i);
			let check_all = byte >= 65 && byte <= 90 || byte >= 97 && byte <= 122 || byte >= 48 && byte <= 57 || byte === 95;
			if (check_all === false) {
				return [false, "命名只能支持字母数字下划线"];
			}
		}
		return [true, undefined];
	},
}, "AUIPlugin.AUIFileRemoteSelectLayout");

}