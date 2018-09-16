var/Game/Game = new //Singleton reference. Use Game functionalities here.

client
	var tmp
		//Connection Related Variables//
		game_reconnecting
		game_exiting

		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

Game //Game Datum, add global procedures and variables that only pertains to the Game here.
	var const
		//Main Interface Controls//
		MAIN_WINDOW_ID = "Main" //Main Window
		MAIN_CHILD_ID = "MainChild" //Main CHild
		MAIN_MAP_ID = "MainMap" //Main Map
		MAIN_MAP_PANE_ID = "MainMapPane" //Main Map Pane
		MAIN_MACRO_ID = "GameMacros" //Main Macro
		//~~~~~~~~~~~~~~~~~~~~~~~//

		GAME_LOOP_PRIORITIES = 4 //The Default Maximum Amount of Physics Loop Priorities
		GAME_LOOP_UPS = 0 //Default Game Loop Updates Per Second

		PHYSICS_PRIORITIES = 1 //The Default Maximum Amount of Physics Loop Priorities
		PHYSICS_UPS = 120 //Default Physics Loop Updates Per Second

		DEFAULT_WIDTH = 1024
		DEFAULT_HEIGHT = 640

	proc/Reconnect(client/client) //Makes the client reconnect
		if(client.game_reconnecting) return
		client.game_reconnecting = TRUE
		spawn(10) winset(client, null, "command=.reconnect") //1 second delay

	proc/Exit(client/client) //Makes the client exit the game
		if(client.game_exiting) return
		client.game_exiting = TRUE
		spawn(10) winset(client, null, "command=.quit") //1 second delay

	/**
	 * Filters Game Messages to be processed properly.
	 *
	 * Args:
	 * 		msg_type: The type of message being passed.
	 * 		message: The message being passed.
	 * 		speaker: The person that is speaking.
	 * 		hearers: The people that are hearing the message.
	 */
	proc/MessageFilter(msg_type, message, mob/speaker, hearers[])
		var/msg_time = time2text_plus(world.realtime, "HH:mm PM")
		switch(msg_type)
			if("OOC")
				Message(world,"\[[msg_time]] [speaker.name]: [(new /GEmojiText(message, 16, GEmoji.OUTPUT_CONTROL)).GetEmojiText()]")
			if("IC")
				Message(view(speaker),"\[[msg_time]] [speaker.name]: [(new /GEmojiText(message, 16, GEmoji.OUTPUT_CONTROL)).GetEmojiText()]")

	proc/Message(hearers[], message) //Sends a message to the defined list of hearers.
		hearers << message
