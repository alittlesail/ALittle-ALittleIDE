-- ALittle Generate Lua And Do Not Edit This Line!
do
if _G.ALittleIDE == nil then _G.ALittleIDE = {} end
local ALittleIDE = ALittleIDE
local Lua = Lua
local ALittle = ALittle
local ___rawset = rawset
local ___pairs = pairs
local ___ipairs = ipairs


assert(ALittle.RevokeObject, " extends class:ALittle.RevokeObject is nil")
ALittleIDE.IDETileAddLayerRevoke = Lua.Class(ALittle.RevokeObject, "ALittleIDE.IDETileAddLayerRevoke")

function ALittleIDE.IDETileAddLayerRevoke:Ctor(tab_child, layer_info)
	___rawset(self, "_tab_child", tab_child)
	___rawset(self, "_layer_info", layer_info)
end

function ALittleIDE.IDETileAddLayerRevoke:Forward()
	self._tab_child.layer_edit.layer_list:AddChild(self._layer_info._item)
	ALittle.List_Push(self._layer_info._user_info.tile_map.layer_list, self._layer_info._layer)
end

function ALittleIDE.IDETileAddLayerRevoke:Back()
	self._tab_child.layer_edit.layer_list:RemoveChild(self._layer_info._item)
	local index = ALittle.List_IndexOf(self._layer_info._user_info.tile_map.layer_list, self._layer_info._layer)
	ALittle.List_Remove(self._layer_info._user_info.tile_map.layer_list, index)
end

assert(ALittle.RevokeObject, " extends class:ALittle.RevokeObject is nil")
ALittleIDE.IDETileDeleteLayerRevoke = Lua.Class(ALittle.RevokeObject, "ALittleIDE.IDETileDeleteLayerRevoke")

function ALittleIDE.IDETileDeleteLayerRevoke:Ctor(tab_child, layer_info, index)
	___rawset(self, "_tab_child", tab_child)
	___rawset(self, "_layer_info", layer_info)
	___rawset(self, "_index", index)
end

function ALittleIDE.IDETileDeleteLayerRevoke:Forward()
	self._tab_child.layer_edit.layer_list:RemoveChild(self._layer_info._item)
	local index = ALittle.List_IndexOf(self._layer_info._user_info.tile_map.layer_list, self._layer_info._layer)
	ALittle.List_Remove(self._layer_info._user_info.tile_map.layer_list, index)
	self._tab_child:RemoveLayer(self._layer_info._group)
end

function ALittleIDE.IDETileDeleteLayerRevoke:Back()
	self._tab_child.layer_edit.layer_list:AddChild(self._layer_info._item, self._index)
	ALittle.List_Insert(self._layer_info._user_info.tile_map.layer_list, self._index, self._layer_info._layer)
	self._tab_child:AddLayer(self._layer_info._group, self._index)
end

assert(ALittle.RevokeObject, " extends class:ALittle.RevokeObject is nil")
ALittleIDE.IDETileSetLayerIndexRevoke = Lua.Class(ALittle.RevokeObject, "ALittleIDE.IDETileSetLayerIndexRevoke")

function ALittleIDE.IDETileSetLayerIndexRevoke:Ctor(tab_child, layer_info, old_index, new_index)
	___rawset(self, "_tab_child", tab_child)
	___rawset(self, "_layer_info", layer_info)
	___rawset(self, "_old_index", old_index)
	___rawset(self, "_new_index", new_index)
end

function ALittleIDE.IDETileSetLayerIndexRevoke:Forward()
	self._tab_child.layer_edit.layer_list:SetChildIndex(self._layer_info._item, self._new_index)
	ALittle.List_Remove(self._layer_info._user_info.tile_map.layer_list, self._old_index)
	ALittle.List_Insert(self._layer_info._user_info.tile_map.layer_list, self._new_index, self._layer_info._layer)
	self._tab_child:SetLayerIndex(self._layer_info._group, self._new_index)
end

function ALittleIDE.IDETileSetLayerIndexRevoke:Back()
	self._tab_child.layer_edit.layer_list:SetChildIndex(self._layer_info._item, self._old_index)
	ALittle.List_Remove(self._layer_info._user_info.tile_map.layer_list, self._new_index)
	ALittle.List_Insert(self._layer_info._user_info.tile_map.layer_list, self._old_index, self._layer_info._layer)
	self._tab_child:SetLayerIndex(self._layer_info._group, self._old_index)
end

assert(ALittle.RevokeObject, " extends class:ALittle.RevokeObject is nil")
ALittleIDE.IDETileRenameLayerRevoke = Lua.Class(ALittle.RevokeObject, "ALittleIDE.IDETileRenameLayerRevoke")

function ALittleIDE.IDETileRenameLayerRevoke:Ctor(tab_child, layer_info, old_name, new_name)
	___rawset(self, "_tab_child", tab_child)
	___rawset(self, "_layer_info", layer_info)
	___rawset(self, "_old_name", old_name)
	___rawset(self, "_new_name", new_name)
end

function ALittleIDE.IDETileRenameLayerRevoke:Forward()
	self._layer_info._button.text = self._new_name
	self._layer_info._layer.name = self._new_name
end

function ALittleIDE.IDETileRenameLayerRevoke:Back()
	self._layer_info._button.text = self._old_name
	self._layer_info._layer.name = self._old_name
end

assert(ALittle.RevokeObject, " extends class:ALittle.RevokeObject is nil")
ALittleIDE.IDETileBrushCellRevoke = Lua.Class(ALittle.RevokeObject, "ALittleIDE.IDETileBrushCellRevoke")

function ALittleIDE.IDETileBrushCellRevoke:Ctor(tab_child, layer_info, cell, image, old_tex_path, new_tex_path)
	___rawset(self, "_tab_child", tab_child)
	___rawset(self, "_layer_info", layer_info)
	___rawset(self, "_cell", cell)
	___rawset(self, "_image", image)
	___rawset(self, "_old_tex_path", old_tex_path)
	___rawset(self, "_new_tex_path", new_tex_path)
end

function ALittleIDE.IDETileBrushCellRevoke:Forward()
	if self._new_tex_path ~= nil then
		local tex_id = self._layer_info._user_info.tex_id_map[self._new_tex_path]
		if tex_id == nil then
			tex_id = self._layer_info._user_info.tex_id_max + 1
			self._layer_info._user_info.tex_id_max = tex_id
			self._layer_info._user_info.tile_map.tex_map[tex_id] = self._new_tex_path
			self._layer_info._user_info.tex_id_map[self._new_tex_path] = tex_id
		end
		self._cell.tex_id = tex_id
		self._image:SetTextureCut("Module/" .. ALittleIDE.g_IDEProject.project.name .. "/Texture/" .. self._new_tex_path, 0, 0, true)
	else
		self._cell.tex_id = nil
		self._image:SetTextureCut(nil, 0, 0, true)
	end
end

function ALittleIDE.IDETileBrushCellRevoke:Back()
	if self._old_tex_path ~= nil then
		local tex_id = self._layer_info._user_info.tex_id_map[self._old_tex_path]
		if tex_id == nil then
			tex_id = self._layer_info._user_info.tex_id_max + 1
			self._layer_info._user_info.tex_id_max = tex_id
			self._layer_info._user_info.tile_map.tex_map[tex_id] = self._old_tex_path
			self._layer_info._user_info.tex_id_map[self._old_tex_path] = tex_id
		end
		self._cell.tex_id = tex_id
		self._image:SetTextureCut("Module/" .. ALittleIDE.g_IDEProject.project.name .. "/Texture/" .. self._old_tex_path, 0, 0, true)
	else
		self._cell.tex_id = nil
		self._image:SetTextureCut(nil, 0, 0, true)
	end
end

assert(ALittle.RevokeObject, " extends class:ALittle.RevokeObject is nil")
ALittleIDE.IDETileSelectCutRevoke = Lua.Class(ALittle.RevokeObject, "ALittleIDE.IDETileSelectCutRevoke")

function ALittleIDE.IDETileSelectCutRevoke:Ctor(tab_child, layer_info, clipboard, begin_row, begin_col, end_row, end_col)
	___rawset(self, "_tab_child", tab_child)
	___rawset(self, "_layer_info", layer_info)
	___rawset(self, "_clipboard", clipboard)
	___rawset(self, "_begin_row", begin_row)
	___rawset(self, "_begin_col", begin_col)
	___rawset(self, "_end_row", end_row)
	___rawset(self, "_end_col", end_col)
end

function ALittleIDE.IDETileSelectCutRevoke:Forward()
	local index = self._tab_child.layer_edit:GetLayerInfoIndex(self._layer_info)
	if index == nil then
		return
	end
	local row = self._begin_row
	while true do
		if not(row <= self._end_row) then break end
		local row_cell = self._layer_info._layer.cell_map[row]
		if row_cell ~= nil then
			local col = self._begin_col
			while true do
				if not(col <= self._end_col) then break end
				local cell = row_cell[col]
				if cell ~= nil then
					cell.tex_id = nil
				end
				local image = self._tab_child:GetImage(index, row, col)
				if image ~= nil then
					image:SetTextureCut(nil, 0, 0, true)
				end
				col = col+(1)
			end
		end
		row = row+(1)
	end
end

function ALittleIDE.IDETileSelectCutRevoke:Back()
	local index = self._tab_child.layer_edit:GetLayerInfoIndex(self._layer_info)
	if index == nil then
		return
	end
	local row = self._begin_row
	while true do
		if not(row <= self._end_row) then break end
		local row_cell = self._layer_info._layer.cell_map[row]
		if row_cell ~= nil then
			local col = self._begin_col
			while true do
				if not(col <= self._end_col) then break end
				local cell = row_cell[col]
				if cell ~= nil then
					local old_row_cell = self._clipboard.cell_map[row - self._begin_row + 1]
					if old_row_cell ~= nil then
						local old_cell = old_row_cell[col - self._begin_col + 1]
						if old_cell ~= nil then
							local old_tex_path = self._clipboard.tex_map[old_cell.tex_id]
							if old_tex_path ~= nil then
								local tex_id = self._layer_info._user_info.tex_id_map[old_tex_path]
								if tex_id == nil then
									tex_id = self._layer_info._user_info.tex_id_max + 1
									self._layer_info._user_info.tex_id_max = tex_id
									self._layer_info._user_info.tile_map.tex_map[tex_id] = old_tex_path
									self._layer_info._user_info.tex_id_map[old_tex_path] = tex_id
								end
								cell.tex_id = tex_id
								local image = self._tab_child:GetImage(index, row, col)
								if image ~= nil then
									image:SetTextureCut("Module/" .. ALittleIDE.g_IDEProject.project.name .. "/Texture/" .. old_tex_path, 0, 0, true)
								end
							end
						end
					end
				end
				col = col+(1)
			end
		end
		row = row+(1)
	end
end

assert(ALittle.RevokeObject, " extends class:ALittle.RevokeObject is nil")
ALittleIDE.IDETileSelectPasteRevoke = Lua.Class(ALittle.RevokeObject, "ALittleIDE.IDETileSelectPasteRevoke")

function ALittleIDE.IDETileSelectPasteRevoke:Ctor(tab_child, layer_info, old_clipboard, clipboard, begin_row, begin_col, end_row, end_col)
	___rawset(self, "_tab_child", tab_child)
	___rawset(self, "_layer_info", layer_info)
	___rawset(self, "_old_clipboard", old_clipboard)
	___rawset(self, "_clipboard", clipboard)
	___rawset(self, "_begin_row", begin_row)
	___rawset(self, "_begin_col", begin_col)
	___rawset(self, "_end_row", end_row)
	___rawset(self, "_end_col", end_col)
end

function ALittleIDE.IDETileSelectPasteRevoke:PasteImpl(paste_clipboard)
	local index = self._tab_child.layer_edit:GetLayerInfoIndex(self._layer_info)
	if index == nil then
		return
	end
	local row = self._begin_row
	while true do
		if not(row <= self._end_row) then break end
		local row_cell = self._layer_info._layer.cell_map[row]
		if row_cell ~= nil then
			local col = self._begin_col
			while true do
				if not(col <= self._end_col) then break end
				local cell = row_cell[col]
				if cell ~= nil then
					cell.tex_id = nil
					local image = self._tab_child:GetImage(index, row, col)
					if image ~= nil then
						image:SetTextureCut(nil, 0, 0, true)
					end
				end
				col = col+(1)
			end
		end
		row = row+(1)
	end
	local row = self._begin_row
	while true do
		if not(row <= self._end_row) then break end
		local paste_row_cell = paste_clipboard.cell_map[row - self._begin_row + 1]
		if paste_row_cell ~= nil then
			local col = self._begin_col
			while true do
				if not(col <= self._end_col) then break end
				local paste_cell = paste_row_cell[col - self._begin_col + 1]
				if paste_cell ~= nil then
					local old_tex_path = paste_clipboard.tex_map[paste_cell.tex_id]
					if old_tex_path ~= nil then
						local row_cell = self._layer_info._layer.cell_map[row]
						if row_cell == nil then
							row_cell = {}
							self._layer_info._layer.cell_map[row] = row_cell
						end
						local cell = row_cell[col]
						if cell == nil then
							cell = {}
							row_cell[col] = cell
						end
						local tex_id = self._layer_info._user_info.tex_id_map[old_tex_path]
						if tex_id == nil then
							tex_id = self._layer_info._user_info.tex_id_max + 1
							self._layer_info._user_info.tex_id_max = tex_id
							self._layer_info._user_info.tile_map.tex_map[tex_id] = old_tex_path
							self._layer_info._user_info.tex_id_map[old_tex_path] = tex_id
						end
						cell.tex_id = tex_id
						local image = self._tab_child:GetImage(index, row, col)
						if image ~= nil then
							image:SetTextureCut("Module/" .. ALittleIDE.g_IDEProject.project.name .. "/Texture/" .. old_tex_path, 0, 0, true)
						end
					end
				end
				col = col+(1)
			end
		end
		row = row+(1)
	end
end

function ALittleIDE.IDETileSelectPasteRevoke:Forward()
	self:PasteImpl(self._clipboard)
end

function ALittleIDE.IDETileSelectPasteRevoke:Back()
	self:PasteImpl(self._old_clipboard)
end

end