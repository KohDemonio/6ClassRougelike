MainWindow
	parent_type = /GWindow

	main = TRUE //Treats this Window as the Main Window

	name = "Main"

	window_id = Game.MAIN_WINDOW_ID

	var const
		main_pane = Game.MAIN_MAP_PANE_ID

	OnLoad()
		winset(client, "[Game.MAIN_WINDOW_ID].[Game.MAIN_CHILD_ID]", {"left="[main_pane]""})

		Show()

	OnUnload()