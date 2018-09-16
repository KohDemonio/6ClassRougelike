//General Player Game Inputs//
GKeyHandler
	OnKeyPressed(key)
		switch(key)
			//Exits the Game
			if(GKEY_ESC) Game.Exit(client)

			//Toggles Fullscreen
			if(GKEY_F11) client.GetGDisplayManager().ToggleFullscreenMode()

			//Reconnects
			if(GKEY_F5) Game.Reconnect(client)

		. = ..()
//~~~~~~~~~~~~~~~~~~~~~~~~~~//