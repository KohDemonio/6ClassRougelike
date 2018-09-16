MainDisplayMap
	parent_type = /GDisplayMap

	map_id = Game.MAIN_MAP_ID

	OnInit()
		SetViewSize(1024, 640)

		SetLetterbox(TRUE) //Has to be set, else by default the letterbox will show regardless of its settings in the interface file
		SetScaleSize(0)

		FitView() //Should be called if you want view size to be converted to client view size. This will only take effect on the Main Map Display.

	OnResize()
		//FitView() //Same reason again here, but should only be called when the client's view size needs to be updated