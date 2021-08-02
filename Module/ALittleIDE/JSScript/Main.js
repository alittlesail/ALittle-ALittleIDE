{
if (typeof ALittleIDE === "undefined") window.ALittleIDE = {};


ALittleIDE.__Browser_Setup = async function(layer_group, control, module_base_path, script_base_path) {
	ALittle.DeleteLog(7);
	let [window_width, window_height, flag, scale] = ALittle.System_CalcLandscape(1200, 600, (0x00000080 | 0x00000020));
	ALittle.System_CreateView("ALittleIDE", window_width, window_height, flag, scale);
	ALittle.System_SetViewIcon(module_base_path + "Other/ic_launcher.png");
	await A_ModuleSystem.LoadModule(module_base_path, "ALittleIDE");
}

ALittleIDE.__Browser_AddModule = function(module_name, layer_group, module_info) {
}

ALittleIDE.__Browser_Shutdown = function() {
}

ALittleIDE.g_Control = undefined;
ALittleIDE.g_AUIPluinControl = undefined;
ALittleIDE.g_LayerGroup = undefined;
ALittleIDE.g_ModuleBasePath = undefined;
ALittleIDE.g_ScriptBasePath = undefined;
ALittleIDE.g_ModuleBasePathEx = undefined;
ALittleIDE.g_IDEConfig = undefined;
ALittleIDE.g_IDEServerConfig = undefined;
ALittleIDE.g_MainLayer = undefined;
ALittleIDE.g_DialogLayer = undefined;
ALittleIDE.__Module_Setup = async function(layer_group, control, module_base_path, script_base_path) {
	ALittleIDE.g_Control = control;
	ALittleIDE.g_LayerGroup = layer_group;
	ALittleIDE.g_ModuleBasePath = module_base_path;
	ALittleIDE.g_ModuleBasePathEx = ALittle.File_BaseFilePath() + module_base_path;
	ALittleIDE.g_ScriptBasePath = script_base_path;
	ALittle.DeleteLog(1);
	ALittleIDE.g_AUIPluinControl = await A_ModuleSystem.LoadPlugin("AUIPlugin");
	ALittleIDE.g_IDEConfig = ALittle.CreateConfigSystem("ALittleIDE.cfg");
	ALittleIDE.g_IDEServerConfig = ALittle.CreateConfigSystem(ALittleIDE.g_ModuleBasePath + "/Other/Server.cfg");
	ALittle.Math_RandomSeed(ALittle.Time_GetCurTime());
	ALittle.System_SetThreadCount(5);
	ALittleIDE.g_MainLayer = ALittle.NewObject(ALittle.DisplayLayout, ALittleIDE.g_Control);
	ALittleIDE.g_MainLayer.width_type = 4;
	ALittleIDE.g_MainLayer.height_type = 4;
	ALittleIDE.g_LayerGroup.AddChild(ALittleIDE.g_MainLayer);
	ALittleIDE.g_DialogLayer = ALittle.NewObject(ALittle.DisplayLayout, ALittleIDE.g_Control);
	ALittleIDE.g_DialogLayer.width_type = 4;
	ALittleIDE.g_DialogLayer.height_type = 4;
	ALittleIDE.g_LayerGroup.AddChild(ALittleIDE.g_DialogLayer);
	let require = ALittle.NewObject(ALittle.Require);
	require.AddPaths(script_base_path, "Data/", [["IDEEnum"]
		,["IDEProject"]
		,["IDEUIManager"]]);
	require.AddPaths(script_base_path, "Dialog/", [["IDEExport"]
		,["IDEImageSelectDialog"]
		,["IDEProjectExportDialog"]
		,["IDEProjectFindFileDialog"]
		,["IDEProjectNewDialog"]
		,["IDEProjectOpenDialog"]
		,["IDEProjectSettingDialog"]
		,["IDEVersionList"]]);
	require.AddPaths(script_base_path, "IDE/", [["CodeEdit/IDECodeTabChild","IDEContentEdit"]
		,["CodeEdit/IDECodeUtility"]
		,["CodeEdit/IDEUICodeList"]
		,["CodeEdit/Tree/IDECodeTree","CodeEdit/Tree/IDECodeTreeLogic"]
		,["CodeEdit/Tree/IDECodeTreeItem","CodeEdit/Tree/IDECodeTreeLogic"]
		,["CodeEdit/Tree/IDECodeTreeLogic"]
		,["ControlEdit/IDEControlUtility"]
		,["ControlEdit/IDEUIControlList"]
		,["ControlEdit/Tree/IDEControlTree","ControlEdit/Tree/IDEControlTreeLogic"]
		,["ControlEdit/Tree/IDEControlTreeItem","ControlEdit/Tree/IDEControlTreeLogic"]
		,["ControlEdit/Tree/IDEControlTreeLogic"]
		,["IDECenter"]
		,["IDEContentEdit"]
		,["IDEUIAccount"]
		,["IDEUICenter"]
		,["IDEUIMainMenu"]
		,["IDEUIProjectDropdown"]
		,["IDEUIProjectList"]
		,["IDEUtility"]
		,["TileEdit/Dialog/IDETileSettingDialog"]
		,["TileEdit/IDETileRevocation"]
		,["TileEdit/IDETileTabChild","IDEContentEdit"]
		,["TileEdit/IDEUITileBrushEdit"]
		,["TileEdit/IDEUITileBrushList"]
		,["TileEdit/IDEUITileList"]
		,["UIEdit/Dialog/IDEAttrControlDialog"]
		,["UIEdit/Dialog/IDEAttrEventDialog"]
		,["UIEdit/Dialog/IDEAttrTextDialog"]
		,["UIEdit/IDEUIControlAnti"]
		,["UIEdit/IDEUIControlTree"]
		,["UIEdit/IDEUIRevocation"]
		,["UIEdit/IDEUITabChild","IDEContentEdit"]
		,["UIEdit/IDEUIUtility"]
		,["UIEdit/Setting/DialogS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/DisplayLayoutS","UIEdit/Setting/DisplayObjectS"]
		,["UIEdit/Setting/DisplayObjectS"]
		,["UIEdit/Setting/DisplayViewS","UIEdit/Setting/DisplayObjectS"]
		,["UIEdit/Setting/DropDownS","UIEdit/Setting/TextCheckButtonS"]
		,["UIEdit/Setting/FramePlayS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/Grid3S","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/Grid9ImageS","UIEdit/Setting/Grid9S"]
		,["UIEdit/Setting/Grid9S","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/ImageEditS","UIEdit/Setting/TextEditS"]
		,["UIEdit/Setting/ImageInputS","UIEdit/Setting/TextInputS"]
		,["UIEdit/Setting/ImagePlayS","UIEdit/Setting/DisplayObjectS"]
		,["UIEdit/Setting/ImageS","UIEdit/Setting/DisplayObjectS"]
		,["UIEdit/Setting/LinearS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/PiechartS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/QuadS","UIEdit/Setting/DisplayObjectS"]
		,["UIEdit/Setting/RichAreaS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/RichEditS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/RichInputS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/ScrollBarS","UIEdit/Setting/Grid3S"]
		,["UIEdit/Setting/ScrollListS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/ScrollScreenS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/SliderS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/SpringTextButtonS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/SpriteNumberS","UIEdit/Setting/DisplayObjectS"]
		,["UIEdit/Setting/SpritePlayS","UIEdit/Setting/SpriteS"]
		,["UIEdit/Setting/SpriteS","UIEdit/Setting/DisplayObjectS"]
		,["UIEdit/Setting/TabS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/TextAreaS","UIEdit/Setting/TextS"]
		,["UIEdit/Setting/TextButtonS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/TextCheckButtonS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/TextEditS","UIEdit/Setting/TextS"]
		,["UIEdit/Setting/TextInputS","UIEdit/Setting/TextEditS"]
		,["UIEdit/Setting/TextRadioButtonS","UIEdit/Setting/TextCheckButtonS"]
		,["UIEdit/Setting/TextS","UIEdit/Setting/DisplayObjectS"]
		,["UIEdit/Setting/TileTableS","UIEdit/Setting/DisplayLayoutS"]
		,["UIEdit/Setting/TriangleS","UIEdit/Setting/DisplayObjectS"]
		,["UIEdit/Setting/VertexImageS","UIEdit/Setting/DisplayObjectS"]
		,["UIEdit/Tree/IDEUITree","UIEdit/Tree/IDEUITreeLogic"]
		,["UIEdit/Tree/IDEUITreeItem","UIEdit/Tree/IDEUITreeLogic"]
		,["UIEdit/Tree/IDEUITreeLogic"]]);
	await require.Start();
	ALittleIDE.g_IDEImageSelectDialog.Setup();
	ALittleIDE.g_IDEImageManagerDialog.Setup();
	await ALittleIDE.g_IDECenter.Setup();
}

ALittleIDE.__Module_Shutdown = function() {
	ALittleIDE.g_IDEProject.CloseProject();
	ALittleIDE.g_IDECenter.Shutdown();
	ALittleIDE.g_IDEImageSelectDialog.Shutdown();
	ALittleIDE.g_IDEImageManagerDialog.Shutdown();
	ALittleIDE.g_IDEEditImageDialog.Shutdown();
}

ALittleIDE.__Module_GetInfo = function(control, module_base_path, script_base_path) {
	let info = {};
	info.title = "ALittle集成开发环境";
	info.icon = undefined;
	info.width_type = 4;
	info.width_value = 0;
	info.height_type = 4;
	info.height_value = 0;
	return info;
}

}