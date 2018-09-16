//World Startup Override//
world/New()
	. = ..()
	OnGameStart()
//~~~~~~~~~~~~~~~~~~~~~~//

//Game Startup//
proc/OnGameStart()
	//Game System Initialization//
	GameSystem.Init()
	//~~~~~~~~~~~~~~~~~~~~~~~~~~//

	//Update Loops Initialization//
	MainGameLoop.Init(Game.GAME_LOOP_PRIORITIES,"Main", "Game Loop")
	MainPhysicsLoop.Init(Game.PHYSICS_PRIORITIES, "Main", "Physics Loop")

	//~~~~~~~~~~~~~~~~~~~~~~~~~~~//

	//Update Loops Startup//
	MainGameLoop.Run(Game.GAME_LOOP_UPS)
	MainPhysicsLoop.Run(Game.PHYSICS_UPS)

	//~~~~~~~~~~~~~~~~~~~~//

	//Other System Initialization Goes Here//
	Game.InitGeneralSounds()

	//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

//~~~~~~~~~~~~//

//Player Login Override//
Player
	Login()
		//Admin/Ban Checks Go Here//


		//~~~~~~~~~~~~~~~~~~~~~~~~//

		GConnections.OnConnect(src)

	Logout()
		GConnections.Disconnect(src)

		//Post Disconnection Checks Go Here//


		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

		Destroy()

//~~~~~~~~~~~~~~~~~~~~~//

//Handles Player Connections
GConnections
	OnConnect(Player/player)
		if(!player.client) return
		var/client/client = player.client

		//Initializes the player//
		player.Init()
		//~~~~~~~~~~~~~~~~~~~~~~//

		//Initializes the assets//
		client.InitAssets()
		//~~~~~~~~~~~~~~~~~~~~~~//

		//Initialization of BYOND Boost Managers

		//Initializes the Window Manager//
		client.InitGWindowManager()
		client.GetGWindowManager().SetDefaultMacro(Game.MAIN_MACRO_ID)
		client.GetGWindowManager().ClearWindows()

		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

		//Initializes the Camera Manager//
		client.InitGCameraManager()
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

		//Initializes the GUIObj Manager//
		client.InitGUIObjManager()
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

		//Initializes the Sound Manager//
		client.InitGSoundManager()
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

		//Initializes the Game Display Manager//
		client.InitGDisplayManager()
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

		//Initializes the Key Handler//
		client.InitGKeyHandler(Game.MAIN_MACRO_ID)
		MainGameLoop.AddUpdateObj(client.GetGKeyHandler())

		//~~~~~~~~~~~~~~~~~~~~~~~~~~~//

		//Initializes the Scene Manager//
		client.InitGSceneManager()
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

		//Initializes the startup windows and scenes//
		client.InitStartupDisplays()
		client.InitStartupWindows()
		client.InitStartupScenes()

		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

		//Connection Code Goes Here//
		client.GetGSceneManager().LoadScene("Main")
		//~~~~~~~~~~~~~~~~~~~~~~~~~//

	OnDisconnect(Player/player)
		//Disconnection Code Goes Here//


		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

		//De-Initializes the Player//
		player.DeInit()
		//~~~~~~~~~~~~~~~~~~~~~~~~~//


client
	proc/InitAssets()
		//Client Assets Initialization Goes Here//


		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

	proc/InitStartupDisplays()
		//Startup Display Initialization Goes Here//
		new /MainDisplayMap(src)
		new /MainDisplayWindow(src)

		GetGDisplayManager().SetMainDisplayWindow(Game.MAIN_WINDOW_ID)
		GetGDisplayManager().SetMainDisplayMap(Game.MAIN_MAP_ID)

		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

	proc/InitStartupWindows()
		//Startup Windows Initialization Goes Here//
		new /MainWindow(src)

		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

	proc/InitStartupScenes()
		//Startup Scenes Initialization Goes Here//
		new /GScene/Main(src)

		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
