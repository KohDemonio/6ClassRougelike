GScene/Main
	name = "Main"

	OnInit()
		//Initializes the Scene's Window, Map, KeyHandler, Hud, and Camera//
		SetWindow(client.GetGWindowManager()[Game.MAIN_WINDOW_ID])
		SetDisplayMap(client.GetGDisplayManager()[Game.MAIN_MAP_ID])
		SetKeyHandler(new /GSceneKeyHandler(src))
		SetCamera(new /GCamera(client))
		SetHud(new /GUIHud(client))

		GetHud().SetScreenMap(GetDisplayMap())

		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

		//Initializes the Transitions//
		new /MainScene/MainTransition(src)
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~//

	OnLoad()
		//Sets the Camera//
		GetCamera().SetTarget(locate("MainSpawn"))
		client.GetGCameraManager().SetMainCamera(GetCamera())
		MainGameLoop.AddUpdateObj(GetCamera())

		//~~~~~~~~~~~~~~~//

		GetWindow().Load() //Prepares the Window

		LoadGTransition("Main")

	OnUnload()
		GetWindow().Unload()