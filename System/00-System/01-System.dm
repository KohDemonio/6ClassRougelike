var/GameSystem/GameSystem = new //Singleton reference for the Game System
/**
 * Game System Datum: Encapsulates the System.
 */
GameSystem
	var const
		PLAYER_GAME_FILE_PATH = ROOT_PATH + "Files/" + BUILD_PATH + "GameFiles/Players/"

	/*
	 * Define this in 00-Init.dm in the Init Folder
	 */
	proc/Init()