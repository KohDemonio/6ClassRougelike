MainDisplayWindow
	parent_type = /GDisplayWindow

	window_id = Game.MAIN_WINDOW_ID

	OnInit()
		SetSize(Game.DEFAULT_WIDTH, Game.DEFAULT_HEIGHT)

		//These must be set upon initialization, else they will always default to TRUE, even if the window has them off.
		EnableTitleBar(TRUE)
		SetCanMinimize(TRUE)
		SetCanResize(TRUE)
		SetCanClose(TRUE)
		//

