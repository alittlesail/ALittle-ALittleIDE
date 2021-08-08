-- ALittle Generate Lua And Do Not Edit This Line!
do
if _G.ALittleIDE == nil then _G.ALittleIDE = {} end
local ALittleIDE = ALittleIDE
local Lua = Lua
local ALittle = ALittle
local ___pairs = pairs
local ___ipairs = ipairs


function ALittleIDE.__Browser_Setup(layer_group, control, module_base_path, script_base_path)
	ALittle.DeleteLog(7)
	local window_width, window_height, flag, scale = ALittle.System_CalcLandscape(1200, 600, 0x00000080 | 0x00000020)
	ALittle.System_CreateView("ALittleIDE", window_width, window_height, flag, scale)
	ALittle.System_SetViewIcon(module_base_path .. "Other/ic_launcher.png")
	A_ModuleSystem:LoadModule(module_base_path, "ALittleIDE")
end
ALittleIDE.__Browser_Setup = Lua.CoWrap(ALittleIDE.__Browser_Setup)

function ALittleIDE.__Browser_AddModule(module_name, layer_group, module_info)
end

function ALittleIDE.__Browser_Shutdown()
end

ALittleIDE.g_Control = nil
ALittleIDE.g_AUIPluinControl = nil
ALittleIDE.g_LayerGroup = nil
ALittleIDE.g_ModuleBasePath = nil
ALittleIDE.g_ScriptBasePath = nil
ALittleIDE.g_ModuleBasePathEx = nil
ALittleIDE.g_IDEConfig = nil
ALittleIDE.g_IDEServerConfig = nil
ALittleIDE.g_MainLayer = nil
ALittleIDE.g_DialogLayer = nil
function ALittleIDE.__Module_Setup(layer_group, control, module_base_path, script_base_path)
	ALittleIDE.g_Control = control
	ALittleIDE.g_LayerGroup = layer_group
	ALittleIDE.g_ModuleBasePath = module_base_path
	ALittleIDE.g_ModuleBasePathEx = ALittle.File_BaseFilePath() .. module_base_path
	ALittleIDE.g_ScriptBasePath = script_base_path
	ALittle.DeleteLog(1)
	ALittleIDE.g_AUIPluinControl = A_ModuleSystem:LoadPlugin("AUIPlugin")
	ALittleIDE.g_IDEConfig = ALittle.CreateConfigSystem("ALittleIDE.cfg")
	ALittleIDE.g_IDEServerConfig = ALittle.CreateConfigSystem(ALittleIDE.g_ModuleBasePath .. "/Other/Server.cfg")
	ALittle.Math_RandomSeed(ALittle.Time_GetCurTime())
	ALittle.System_SetThreadCount(5)
	ALittleIDE.g_MainLayer = ALittle.DisplayLayout(ALittleIDE.g_Control)
	ALittleIDE.g_MainLayer.width_type = 4
	ALittleIDE.g_MainLayer.height_type = 4
	ALittleIDE.g_LayerGroup:AddChild(ALittleIDE.g_MainLayer)
	ALittleIDE.g_DialogLayer = ALittle.DisplayLayout(ALittleIDE.g_Control)
	ALittleIDE.g_DialogLayer.width_type = 4
	ALittleIDE.g_DialogLayer.height_type = 4
	ALittleIDE.g_LayerGroup:AddChild(ALittleIDE.g_DialogLayer)
	local require = ALittle.Require()
	require:AddPaths(script_base_path, "Data/", {{"IDEEnum"}
		,{"IDEProject"}
		,{"IDEUIManager"}})
	require:AddPaths(script_base_path, "Dialog/", {{"IDEExport"}
		,{"IDEImageSelectDialog"}
		,{"IDEProjectExportDialog"}
		,{"IDEProjectFindFileDialog"}
		,{"IDEProjectNewDialog"}
		,{"IDEProjectOpenDialog"}
		,{"IDEProjectSettingDialog"}
		,{"IDEVersionList"}})
	require:AddPaths(script_base_path, "IDE/", {{"CodeEdit/IDECodeTabChild","IDEContentEdit"}
		,{"CodeEdit/IDECodeUtility"}
		,{"CodeEdit/IDEUICodeList"}
		,{"CodeEdit/Tree/IDECodeTree","CodeEdit/Tree/IDECodeTreeLogic"}
		,{"CodeEdit/Tree/IDECodeTreeItem","CodeEdit/Tree/IDECodeTreeLogic"}
		,{"CodeEdit/Tree/IDECodeTreeLogic"}
		,{"ControlEdit/IDEControlUtility"}
		,{"ControlEdit/IDEUIControlList"}
		,{"ControlEdit/Tree/IDEControlTree","ControlEdit/Tree/IDEControlTreeLogic"}
		,{"ControlEdit/Tree/IDEControlTreeItem","ControlEdit/Tree/IDEControlTreeLogic"}
		,{"ControlEdit/Tree/IDEControlTreeLogic"}
		,{"IDECenter"}
		,{"IDEContentEdit"}
		,{"IDEUIAccount"}
		,{"IDEUICenter"}
		,{"IDEUIMainMenu"}
		,{"IDEUIProjectDropdown"}
		,{"IDEUIProjectList"}
		,{"IDEUtility"}
		,{"TileEdit/Dialog/IDETileSettingDialog"}
		,{"TileEdit/IDETileRevocation"}
		,{"TileEdit/IDETileTabChild","IDEContentEdit"}
		,{"TileEdit/IDEUITileBrushEdit"}
		,{"TileEdit/IDEUITileBrushList"}
		,{"TileEdit/IDEUITileList"}
		,{"UIEdit/Dialog/IDEAttrControlDialog"}
		,{"UIEdit/Dialog/IDEAttrEventDialog"}
		,{"UIEdit/Dialog/IDEAttrTextDialog"}
		,{"UIEdit/IDEUIControlAnti"}
		,{"UIEdit/IDEUIControlTree"}
		,{"UIEdit/IDEUIRevocation"}
		,{"UIEdit/IDEUITabChild","IDEContentEdit"}
		,{"UIEdit/IDEUIUtility"}
		,{"UIEdit/Setting/DialogS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/DisplayLayoutS","UIEdit/Setting/DisplayObjectS"}
		,{"UIEdit/Setting/DisplayObjectS"}
		,{"UIEdit/Setting/DisplayViewS","UIEdit/Setting/DisplayObjectS"}
		,{"UIEdit/Setting/DropDownS","UIEdit/Setting/TextCheckButtonS"}
		,{"UIEdit/Setting/FramePlayS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/Grid3S","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/Grid9ImageS","UIEdit/Setting/Grid9S"}
		,{"UIEdit/Setting/Grid9S","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/ImageEditS","UIEdit/Setting/TextEditS"}
		,{"UIEdit/Setting/ImageInputS","UIEdit/Setting/TextInputS"}
		,{"UIEdit/Setting/ImagePlayS","UIEdit/Setting/DisplayObjectS"}
		,{"UIEdit/Setting/ImageS","UIEdit/Setting/DisplayObjectS"}
		,{"UIEdit/Setting/LinearS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/PiechartS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/QuadS","UIEdit/Setting/DisplayObjectS"}
		,{"UIEdit/Setting/RichAreaS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/RichEditS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/RichInputS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/ScrollBarS","UIEdit/Setting/Grid3S"}
		,{"UIEdit/Setting/ScrollListS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/ScrollScreenS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/SliderS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/SpringTextButtonS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/SpriteNumberS","UIEdit/Setting/DisplayObjectS"}
		,{"UIEdit/Setting/SpritePlayS","UIEdit/Setting/SpriteS"}
		,{"UIEdit/Setting/SpriteS","UIEdit/Setting/DisplayObjectS"}
		,{"UIEdit/Setting/TabS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/TextAreaS","UIEdit/Setting/TextS"}
		,{"UIEdit/Setting/TextButtonS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/TextCheckButtonS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/TextEditS","UIEdit/Setting/TextS"}
		,{"UIEdit/Setting/TextInputS","UIEdit/Setting/TextEditS"}
		,{"UIEdit/Setting/TextRadioButtonS","UIEdit/Setting/TextCheckButtonS"}
		,{"UIEdit/Setting/TextS","UIEdit/Setting/DisplayObjectS"}
		,{"UIEdit/Setting/TileTableS","UIEdit/Setting/DisplayLayoutS"}
		,{"UIEdit/Setting/TriangleS","UIEdit/Setting/DisplayObjectS"}
		,{"UIEdit/Setting/VertexImageS","UIEdit/Setting/DisplayObjectS"}
		,{"UIEdit/Tree/IDEUITree","UIEdit/Tree/IDEUITreeLogic"}
		,{"UIEdit/Tree/IDEUITreeItem","UIEdit/Tree/IDEUITreeLogic"}
		,{"UIEdit/Tree/IDEUITreeLogic"}})
	require:Start()
	ALittleIDE.g_IDEImageSelectDialog:Setup()
	ALittleIDE.g_IDEImageManagerDialog:Setup()
	ALittleIDE.g_IDECenter:Setup()
end
ALittleIDE.__Module_Setup = Lua.CoWrap(ALittleIDE.__Module_Setup)

function ALittleIDE.__Module_Shutdown()
	ALittleIDE.g_IDEProject:CloseProject()
	ALittleIDE.g_IDECenter:Shutdown()
	ALittleIDE.g_IDEImageSelectDialog:Shutdown()
	ALittleIDE.g_IDEImageManagerDialog:Shutdown()
	ALittleIDE.g_IDEEditImageDialog:Shutdown()
end

function ALittleIDE.__Module_GetInfo(control, module_base_path, script_base_path)
	local info = {}
	info.title = "ALittle集成开发环境"
	info.icon = nil
	info.width_type = 4
	info.width_value = 0
	info.height_type = 4
	info.height_value = 0
	return info
end

end