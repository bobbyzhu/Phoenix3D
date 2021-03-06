-- functions.lua

function e_OnNewProject()
	E_MainFrame:OnNewProject();
end

function e_OnOpenProject()
	E_MainFrame:OnOpenProject();
end

function e_OnSaveProject()
	E_MainFrame:OnSaveProject();
end

function e_OnSaveAsProject()
	E_MainFrame:OnSaveProjectAs();
end

function e_OnCloseProject()
	E_MainFrame:OnCloseProject();
end

function e_OnNewScene()
	E_MainFrame:OnNewScene();
end

function e_OnOpenScene()
	E_MainFrame:OnOpenScene();
end

function e_OnSaveScene()
	E_MainFrame:OnSaveScene();
end

function e_OnSaveAsScene()
	E_MainFrame:OnSaveSceneAs();
end

function e_OnCloseScene()
	E_MainFrame:OnCloseScene();
end

function e_OnExit()
	E_MainFrame:OnExit()
end

function e_OnUnDo()
	PX2_URM:UnDo()
end

function e_OnReDo()
	PX2_URM:ReDo()
end

function e_OnSetting()
	E_MainFrame:OnSetting()
end

function e_OnImport()
	
end

function e_OnExport()
end

function e_SelectEditAxisMode(selectAxisMode)
	if 0==selectAxisMode then
		PX2_EDIT:SetEditAxisMode(Edit.EAM_WORLD)
	elseif 1==selectAxisMode then
		PX2_EDIT:SetEditAxisMode(Edit.EAM_LOCAL)
	elseif 2==selectAxisMode then
		PX2_EDIT:SetEditAxisMode(Edit.EAM_PARENT)
	end
end

function e_OnSelect()
	E_MainFrame:OnSetEditMode(Edit.EM_SELECT)
end

function e_OnTranslate()
	E_MainFrame:OnSetEditMode(Edit.EM_TRANSLATE)
end

function e_OnRotate()
	E_MainFrame:OnSetEditMode(Edit.EM_ROLATE)
end

function e_OnScale()
	E_MainFrame:OnSetEditMode(Edit.EM_SCALE)
end

function e_OnCopy()
	PX2_EDIT:SetCopyObject(PX2_SELECTION:GetFirstObject())
end

function e_OnPaste()
	PX2_EDIT:PasteCopyedObject()
end

function e_OnDelete()
	PX2_EDIT:DeleteSelection()
end

function e_OnImportSelectedRes()
end

function e_OnImport()
	E_MainFrame:OnImport()
end

function e_OnExport()
	E_MainFrame:OnExport()
end

function e_AnimResetPlay()
	PX2_EDIT:AnimResetPlay()
end

function e_AnimPlayStop()
	PX2_EDIT:AnimPlayStop()
end

function e_AnimPlay()
	PX2_EDIT:AnimPlay()
end

function e_AnimStop()
	PX2_EDIT:AnimStop()
end

function e_AnimReset()
	PX2_EDIT:AnimReset()
end

function e_ShowWindow( windowStr )
	E_MainFrame:OnShowWindow(windowStr)
end

function e_OnEditorSimulate()
	E_MainFrame:OnEditorSimulate()
end

function e_OnEditorPlay()
	E_MainFrame:OnEditorPlay()
end

function e_OnEditorStop()
	E_MainFrame:OnEditorStop()
end

function e_OnPlay()
	E_MainFrame:OnPlay()
end

function e_OnPlayConfig()
	E_MainFrame:OnPlayConfig()
end

-- edit mode
function e_SetEditMode_Scene()
	PX2_EDIT:SetEditType(Edit.ET_SCENE)
end

function e_SetEditMode_Terrain()
	PX2_EDIT:SetEditType(Edit.ET_TERRAIN)
end

function e_SetEditMode_UI()
	PX2_EDIT:SetEditType(Edit.ET_UI)
end

-- Scene
function e_SceneActor_CreateRectangle()
	local scene = PX2_PROJ:GetScene()
	local pickPos = PX2_EDIT:GetPickPos()
	PX2_CREATER:CreateActor_Rectangle(scene, pickPos)
end

function e_SceneActor_CreateBox()
	local scene = PX2_PROJ:GetScene()
	local pickPos = PX2_EDIT:GetPickPos()
	PX2_CREATER:CreateActor_Box(scene, pickPos)
end

function e_SceneActor_CreateSphere()
	local scene = PX2_PROJ:GetScene()
	local pickPos = PX2_EDIT:GetPickPos()
	PX2_CREATER:CreateActor_Sphere(scene, pickPos)
end

function e_SceneActor_CreateActor()
	local scene = PX2_PROJ:GetScene()
	local pickPos = PX2_EDIT:GetPickPos()
	PX2_CREATER:CreateActor_Actor(scene, pickPos)
end

function e_SceneActor_CreateCharacter()
	local scene = PX2_PROJ:GetScene()
	local pickPos = PX2_EDIT:GetPickPos()
	PX2_CREATER:CreateActor_Character(scene, pickPos)
end

function e_SceneActor_CreateLight()
	local scene = PX2_PROJ:GetScene()
	local pickPos = PX2_EDIT:GetPickPos()
	PX2_CREATER:CreateActor_Light(scene, pickPos)
end

function e_SceneActor_CreateEffect()
	local scene = PX2_PROJ:GetScene()
	local pickPos = PX2_EDIT:GetPickPos()
	PX2_CREATER:CreateActor_Effect(scene, pickPos)
end

function e_SceneActor_CreateTrigger()
	local scene = PX2_PROJ:GetScene()
	local pickPos = PX2_EDIT:GetPickPos()
	PX2_CREATER:CreateActor_Trigger(scene, pickPos)
end

function e_SceneActor_CreateTerrain()
	local scene = PX2_PROJ:GetScene()
	local pickPos = PX2_EDIT:GetPickPos()
	E_MainFrame:OnCreateTerrain()
end

function e_SceneActor_CreateSky()
	local scene = PX2_PROJ:GetScene()
	local skyActor = scene:GetSkyActor()
	if nil==skyActor then
		PX2_CREATER:CreateActor_Sky(scene, APoint.ORIGIN)
	end
end

function e_SceneActor_CreateAmbientRegion()
end

-- General
function e_CreateRectangle(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		local mov = PX2_CREATER:CreateRectangle(node, pickPos, true, true, isWorld)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateBox(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		local mov = PX2_CREATER:CreateBox(node, pickPos, true, true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateSphere(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		local mov = PX2_CREATER:CreateSphere(node, pickPos, true, true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateParticles(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		local mov = PX2_CREATER:CreateParticleEmitter(node, pickPos, true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateBillboard(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		local mov = PX2_CREATER:CreateBillboard(node, pickPos, true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateBeam(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		local mov = PX2_CREATER:CreateBeamEmitter(node, pickPos, true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateRobbion(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		local mov = PX2_CREATER:CreateRibbonEmitter(node, pickPos, true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateSoundable(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		local mov = PX2_CREATER:CreateSoundable(node, pickPos, true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateNode()
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local mov = PX2_CREATER:CreateNode(node)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateUIPixBox(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		PX2_CREATER:CreateUIPicBox(node, pickPos, "Data/engine/default.png", true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateUIText(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		PX2_CREATER:CreateUIText(node, pickPos, true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateUIFrame(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		PX2_CREATER:CreateUIFrame(node, pickPos, true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateUIButton(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		PX2_CREATER:CreateUIButton(node, pickPos, true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateUICheckButton(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		PX2_CREATER:CreateUICheckButton(node, pickPos, true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateUIEditBox(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		PX2_CREATER:CreateUIEditBox(node, pickPos, true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateUIProgressBar(usePickPos)
	local selectObj = PX2_SELECTION:GetFirstObject()
	local node = PX2_CREATER:ConvertToNode(selectObj)
	if nil~=node then
		local pickPos = PX2_EDIT:GetPickPos()
		PX2_CREATER:CreateUIProgressBar(node, pickPos, true, usePickPos)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip1"))
	end
end

function e_CreateEffectableControllerModule(typeStr)
	NirMan:CreateEffectableControllerModule(typeStr)
end

-- controls
function e_CreateColorController()
	local selectObj = PX2_SELECTION:GetFirstObject()
	local mov = PX2_CREATER:ConvertToMovable(selectObj)
	if nil~=mov then
		PX2_CREATER:CreateICC_Color(mov)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip8"))
	end
end

function e_CreateAlphaController()
	local selectObj = PX2_SELECTION:GetFirstObject()
	local mov = PX2_CREATER:ConvertToMovable(selectObj)
	if nil~=mov then
		PX2_CREATER:CreateICC_Alpha(mov)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip8"))
	end
end

function e_CreateUniformScaleController()
	local selectObj = PX2_SELECTION:GetFirstObject()
	local mov = PX2_CREATER:ConvertToMovable(selectObj)
	if nil~=mov then
		PX2_CREATER:CreateICC_UniformScale(mov)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip8"))
	end
end

function e_CreateScaleController()
	local selectObj = PX2_SELECTION:GetFirstObject()
	local mov = PX2_CREATER:ConvertToMovable(selectObj)
	if nil~=mov then
		PX2_CREATER:CreateICC_Scale(mov)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip8"))
	end
end

function e_CreateRotateController()
	local selectObj = PX2_SELECTION:GetFirstObject()
	local mov = PX2_CREATER:ConvertToMovable(selectObj)
	if nil~=mov then
		PX2_CREATER:CreateICC_Rotate(mov)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip8"))
	end
end

function e_CreateTranslateController()
	local selectObj = PX2_SELECTION:GetFirstObject()
	local mov = PX2_CREATER:ConvertToMovable(selectObj)
	if nil~=mov then
		PX2_CREATER:CreateICC_Translate(mov)
	else
		NirMan:MessageBox(PX2_LM:GetValue("Notice"), PX2_LM:GetValue("Tip8"))
	end
end

-- add
function e_AddSceneActor_Actor()
	local scene = PX2_PROJ:GetScene()
	local resPathname = PX2_EDIT:GetSelectedResource().ResPathname;
	if "" ~= resPathname then
		local pickPos = PX2_EDIT:GetPickPos()
		PX2_CREATER:AddActor(scene, resPathname, pickPos)
	end
end

function e_AddSceneActor_Character()
	local scene = PX2_PROJ:GetScene()
	local resPath = PX2_EDIT:GetSelectedResource().ResPathname;
	if "" ~= resPath then
		local pickPos = PX2_EDIT:GetPickPos()
		PX2_CREATER:AddCharacter(scene, resPath, pickPos)
	end
end

function e_AddSceneActor_Effect()
	local scene = PX2_PROJ:GetScene()
	local resPath = PX2_EDIT:GetSelectedResource().ResPathname;
	if "" ~= resPath then
		local pickPos = PX2_EDIT:GetPickPos()
		PX2_CREATER:AddEffectActor(scene, resPath, pickPos)
	end
end

function e_AddSceneActor_Sound()
end

function e_OnMakeTimeLine()
	PX2_EDIT:MakeSelectTimeLineEdit()
end

-- scene view
function e_FindInSceneTree()
	PX2_EDIT:OnFindSelectInProjTree()
end

function e_FindInResTree()
	PX2_EDIT:OnFindSelectInResTree()
end

-- project view
function e_ProjectView_ShowHelpNode()
	NirMan:TaggleProjectShowHelpNode()
end

function e_ProjectView_ShowLevel (level)
	E_MainFrame:OnProjectTreeShowLevel(level)
end

function e_ProjectView_ExpandSelect()
	E_MainFrame:OnProjectExpandSelect()
end

function e_ProjectView_CollapseSelect()
	E_MainFrame:OnProjectCollapseSelect()
end

-- res view
function e_ResView_Refresh()
	E_MainFrame:OnResRefresh()
end

function e_ResView_Clear()
	E_MainFrame:OnResClear()
end

function e_ResView_Open()
	E_MainFrame:OnResOpen()
end

--Insp view
function e_InspView_ChangeWindow(windowType)
	E_MainFrame:InspChangeWindow(windowType)
end

-- timeline
function e_DeleteCurveGroup()
	E_MainFrame:TimeLine_UIGroup_Delete()
end

function e_DeleteAllCurveGroup()
	E_MainFrame:TimeLine_UIGroup_DeleteAll()
end

function e_SetInValue()
	E_MainFrame:TimeLine_SelectCtrl_InValue()
end

function e_SetOutValue()
	E_MainFrame:TimeLine_SelectCtrl_OutValue()
end

function e_DeleteCurveKeyPoint()
	E_MainFrame:TimeLine_SelectCtrl_Delete()
end

function e_TimeLine_FitHor()
	PX2_EDIT:GetTimeLineEdit():Fit_Hor()
end

function e_TimeLine_FitVer()
	PX2_EDIT:GetTimeLineEdit():Fit_Ver()
end

function e_TimeLine_FitAll()
	PX2_EDIT:GetTimeLineEdit():Fit_All()
end

function e_TimeLine_FitSelected()
	PX2_EDIT:GetTimeLineEdit():Fit_Selected()
end

function e_TimeLine_Pan()
	PX2_EDIT:GetTimeLineEdit():Pan()
end

function e_TimeLine_Zoom()
	PX2_EDIT:GetTimeLineEdit():Zoom()
end

function e_TimeLine_Auto()
	PX2_EDIT:GetTimeLineEdit():Auto()
end

function e_TimeLine_Clamped()
	PX2_EDIT:GetTimeLineEdit():Clamp()
end

function e_TimeLine_User()
	PX2_EDIT:GetTimeLineEdit():User()
end

function e_TimeLine_Break()
	PX2_EDIT:GetTimeLineEdit():Break()
end

function e_TimeLine_Linear()
	PX2_EDIT:GetTimeLineEdit():Linear()
end

function e_TimeLine_Constant()
	PX2_EDIT:GetTimeLineEdit():Constant()
end