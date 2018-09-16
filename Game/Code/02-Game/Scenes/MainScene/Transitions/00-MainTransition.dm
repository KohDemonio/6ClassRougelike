MainScene //Scene Namespace
	MainTransition
		parent_type = /GSceneTransition

		name = "Main"

		OnLoad()
			var/Player/player = client.mob
			player.NullLoc()

		OnUnload()
			var/Player/player = client.mob
			player.NullLoc()