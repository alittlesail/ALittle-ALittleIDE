{
if (typeof ALittleIDE === "undefined") window.ALittleIDE = {};


if (ALittle.RevokeObject === undefined) throw new Error(" extends class:ALittle.RevokeObject is undefined");
ALittleIDE.IDETileAddLayerRevoke = JavaScript.Class(ALittle.RevokeObject, {
	Ctor : function(tab_child, layer_info) {
		this._tab_child = tab_child;
		this._layer_info = layer_info;
	},
	Forward : function() {
		this._tab_child.layer_edit.layer_list.AddChild(this._layer_info._item);
		ALittle.List_Push(this._layer_info._user_info.tile_map.layer_list, this._layer_info._layer);
	},
	Back : function() {
		this._tab_child.layer_edit.layer_list.RemoveChild(this._layer_info._item);
		let index = ALittle.List_IndexOf(this._layer_info._user_info.tile_map.layer_list, this._layer_info._layer);
		ALittle.List_Remove(this._layer_info._user_info.tile_map.layer_list, index);
	},
}, "ALittleIDE.IDETileAddLayerRevoke");

if (ALittle.RevokeObject === undefined) throw new Error(" extends class:ALittle.RevokeObject is undefined");
ALittleIDE.IDETileDeleteLayerRevoke = JavaScript.Class(ALittle.RevokeObject, {
	Ctor : function(tab_child, layer_info, index) {
		this._tab_child = tab_child;
		this._layer_info = layer_info;
		this._index = index;
	},
	Forward : function() {
		this._tab_child.layer_edit.layer_list.RemoveChild(this._layer_info._item);
		let index = ALittle.List_IndexOf(this._layer_info._user_info.tile_map.layer_list, this._layer_info._layer);
		ALittle.List_Remove(this._layer_info._user_info.tile_map.layer_list, index);
		this._tab_child.RemoveLayer(this._layer_info._group);
	},
	Back : function() {
		this._tab_child.layer_edit.layer_list.AddChild(this._layer_info._item, this._index);
		ALittle.List_Insert(this._layer_info._user_info.tile_map.layer_list, this._index, this._layer_info._layer);
		this._tab_child.AddLayer(this._layer_info._group, this._index);
	},
}, "ALittleIDE.IDETileDeleteLayerRevoke");

if (ALittle.RevokeObject === undefined) throw new Error(" extends class:ALittle.RevokeObject is undefined");
ALittleIDE.IDETileSetLayerIndexRevoke = JavaScript.Class(ALittle.RevokeObject, {
	Ctor : function(tab_child, layer_info, old_index, new_index) {
		this._tab_child = tab_child;
		this._layer_info = layer_info;
		this._old_index = old_index;
		this._new_index = new_index;
	},
	Forward : function() {
		this._tab_child.layer_edit.layer_list.SetChildIndex(this._layer_info._item, this._new_index);
		ALittle.List_Remove(this._layer_info._user_info.tile_map.layer_list, this._old_index);
		ALittle.List_Insert(this._layer_info._user_info.tile_map.layer_list, this._new_index, this._layer_info._layer);
		this._tab_child.SetLayerIndex(this._layer_info._group, this._new_index);
	},
	Back : function() {
		this._tab_child.layer_edit.layer_list.SetChildIndex(this._layer_info._item, this._old_index);
		ALittle.List_Remove(this._layer_info._user_info.tile_map.layer_list, this._new_index);
		ALittle.List_Insert(this._layer_info._user_info.tile_map.layer_list, this._old_index, this._layer_info._layer);
		this._tab_child.SetLayerIndex(this._layer_info._group, this._old_index);
	},
}, "ALittleIDE.IDETileSetLayerIndexRevoke");

if (ALittle.RevokeObject === undefined) throw new Error(" extends class:ALittle.RevokeObject is undefined");
ALittleIDE.IDETileRenameLayerRevoke = JavaScript.Class(ALittle.RevokeObject, {
	Ctor : function(tab_child, layer_info, old_name, new_name) {
		this._tab_child = tab_child;
		this._layer_info = layer_info;
		this._old_name = old_name;
		this._new_name = new_name;
	},
	Forward : function() {
		this._layer_info._button.text = this._new_name;
		this._layer_info._layer.name = this._new_name;
	},
	Back : function() {
		this._layer_info._button.text = this._old_name;
		this._layer_info._layer.name = this._old_name;
	},
}, "ALittleIDE.IDETileRenameLayerRevoke");

if (ALittle.RevokeObject === undefined) throw new Error(" extends class:ALittle.RevokeObject is undefined");
ALittleIDE.IDETileBrushCellRevoke = JavaScript.Class(ALittle.RevokeObject, {
	Ctor : function(tab_child, layer_info, cell, image, old_tex_path, new_tex_path) {
		this._tab_child = tab_child;
		this._layer_info = layer_info;
		this._cell = cell;
		this._image = image;
		this._old_tex_path = old_tex_path;
		this._new_tex_path = new_tex_path;
	},
	Forward : function() {
		if (this._new_tex_path !== undefined) {
			let tex_id = this._layer_info._user_info.tex_id_map[this._new_tex_path];
			if (tex_id === undefined) {
				tex_id = this._layer_info._user_info.tex_id_max + 1;
				this._layer_info._user_info.tex_id_max = tex_id;
				this._layer_info._user_info.tile_map.tex_map.set(tex_id, this._new_tex_path);
				this._layer_info._user_info.tex_id_map[this._new_tex_path] = tex_id;
			}
			this._cell.tex_id = tex_id;
			this._image.SetTextureCut("Module/" + ALittleIDE.g_IDEProject.project.name + "/Texture/" + this._new_tex_path, 0, 0, true);
		} else {
			this._cell.tex_id = undefined;
			this._image.SetTextureCut(undefined, 0, 0, true);
		}
	},
	Back : function() {
		if (this._old_tex_path !== undefined) {
			let tex_id = this._layer_info._user_info.tex_id_map[this._old_tex_path];
			if (tex_id === undefined) {
				tex_id = this._layer_info._user_info.tex_id_max + 1;
				this._layer_info._user_info.tex_id_max = tex_id;
				this._layer_info._user_info.tile_map.tex_map.set(tex_id, this._old_tex_path);
				this._layer_info._user_info.tex_id_map[this._old_tex_path] = tex_id;
			}
			this._cell.tex_id = tex_id;
			this._image.SetTextureCut("Module/" + ALittleIDE.g_IDEProject.project.name + "/Texture/" + this._old_tex_path, 0, 0, true);
		} else {
			this._cell.tex_id = undefined;
			this._image.SetTextureCut(undefined, 0, 0, true);
		}
	},
}, "ALittleIDE.IDETileBrushCellRevoke");

if (ALittle.RevokeObject === undefined) throw new Error(" extends class:ALittle.RevokeObject is undefined");
ALittleIDE.IDETileSelectCutRevoke = JavaScript.Class(ALittle.RevokeObject, {
	Ctor : function(tab_child, layer_info, clipboard, begin_row, begin_col, end_row, end_col) {
		this._tab_child = tab_child;
		this._layer_info = layer_info;
		this._clipboard = clipboard;
		this._begin_row = begin_row;
		this._begin_col = begin_col;
		this._end_row = end_row;
		this._end_col = end_col;
	},
	Forward : function() {
		let index = this._tab_child.layer_edit.GetLayerInfoIndex(this._layer_info);
		if (index === undefined) {
			return;
		}
		for (let row = this._begin_row; row <= this._end_row; row += 1) {
			let row_cell = this._layer_info._layer.cell_map.get(row);
			if (row_cell !== undefined) {
				for (let col = this._begin_col; col <= this._end_col; col += 1) {
					let cell = row_cell.get(col);
					if (cell !== undefined) {
						cell.tex_id = undefined;
					}
					let image = this._tab_child.GetImage(index, row, col);
					if (image !== undefined) {
						image.SetTextureCut(undefined, 0, 0, true);
					}
				}
			}
		}
	},
	Back : function() {
		let index = this._tab_child.layer_edit.GetLayerInfoIndex(this._layer_info);
		if (index === undefined) {
			return;
		}
		for (let row = this._begin_row; row <= this._end_row; row += 1) {
			let row_cell = this._layer_info._layer.cell_map.get(row);
			if (row_cell !== undefined) {
				for (let col = this._begin_col; col <= this._end_col; col += 1) {
					let cell = row_cell.get(col);
					if (cell !== undefined) {
						let old_row_cell = this._clipboard.cell_map.get(row - this._begin_row + 1);
						if (old_row_cell !== undefined) {
							let old_cell = old_row_cell.get(col - this._begin_col + 1);
							if (old_cell !== undefined) {
								let old_tex_path = this._clipboard.tex_map.get(old_cell.tex_id);
								if (old_tex_path !== undefined) {
									let tex_id = this._layer_info._user_info.tex_id_map[old_tex_path];
									if (tex_id === undefined) {
										tex_id = this._layer_info._user_info.tex_id_max + 1;
										this._layer_info._user_info.tex_id_max = tex_id;
										this._layer_info._user_info.tile_map.tex_map.set(tex_id, old_tex_path);
										this._layer_info._user_info.tex_id_map[old_tex_path] = tex_id;
									}
									cell.tex_id = tex_id;
									let image = this._tab_child.GetImage(index, row, col);
									if (image !== undefined) {
										image.SetTextureCut("Module/" + ALittleIDE.g_IDEProject.project.name + "/Texture/" + old_tex_path, 0, 0, true);
									}
								}
							}
						}
					}
				}
			}
		}
	},
}, "ALittleIDE.IDETileSelectCutRevoke");

if (ALittle.RevokeObject === undefined) throw new Error(" extends class:ALittle.RevokeObject is undefined");
ALittleIDE.IDETileSelectPasteRevoke = JavaScript.Class(ALittle.RevokeObject, {
	Ctor : function(tab_child, layer_info, old_clipboard, clipboard, begin_row, begin_col, end_row, end_col) {
		this._tab_child = tab_child;
		this._layer_info = layer_info;
		this._old_clipboard = old_clipboard;
		this._clipboard = clipboard;
		this._begin_row = begin_row;
		this._begin_col = begin_col;
		this._end_row = end_row;
		this._end_col = end_col;
	},
	PasteImpl : function(paste_clipboard) {
		let index = this._tab_child.layer_edit.GetLayerInfoIndex(this._layer_info);
		if (index === undefined) {
			return;
		}
		for (let row = this._begin_row; row <= this._end_row; row += 1) {
			let row_cell = this._layer_info._layer.cell_map.get(row);
			if (row_cell !== undefined) {
				for (let col = this._begin_col; col <= this._end_col; col += 1) {
					let cell = row_cell.get(col);
					if (cell !== undefined) {
						cell.tex_id = undefined;
						let image = this._tab_child.GetImage(index, row, col);
						if (image !== undefined) {
							image.SetTextureCut(undefined, 0, 0, true);
						}
					}
				}
			}
		}
		for (let row = this._begin_row; row <= this._end_row; row += 1) {
			let paste_row_cell = paste_clipboard.cell_map.get(row - this._begin_row + 1);
			if (paste_row_cell !== undefined) {
				for (let col = this._begin_col; col <= this._end_col; col += 1) {
					let paste_cell = paste_row_cell.get(col - this._begin_col + 1);
					if (paste_cell !== undefined) {
						let old_tex_path = paste_clipboard.tex_map.get(paste_cell.tex_id);
						if (old_tex_path !== undefined) {
							let row_cell = this._layer_info._layer.cell_map.get(row);
							if (row_cell === undefined) {
								row_cell = new Map();
								this._layer_info._layer.cell_map.set(row, row_cell);
							}
							let cell = row_cell.get(col);
							if (cell === undefined) {
								cell = {};
								row_cell.set(col, cell);
							}
							let tex_id = this._layer_info._user_info.tex_id_map[old_tex_path];
							if (tex_id === undefined) {
								tex_id = this._layer_info._user_info.tex_id_max + 1;
								this._layer_info._user_info.tex_id_max = tex_id;
								this._layer_info._user_info.tile_map.tex_map.set(tex_id, old_tex_path);
								this._layer_info._user_info.tex_id_map[old_tex_path] = tex_id;
							}
							cell.tex_id = tex_id;
							let image = this._tab_child.GetImage(index, row, col);
							if (image !== undefined) {
								image.SetTextureCut("Module/" + ALittleIDE.g_IDEProject.project.name + "/Texture/" + old_tex_path, 0, 0, true);
							}
						}
					}
				}
			}
		}
	},
	Forward : function() {
		this.PasteImpl(this._clipboard);
	},
	Back : function() {
		this.PasteImpl(this._old_clipboard);
	},
}, "ALittleIDE.IDETileSelectPasteRevoke");

}