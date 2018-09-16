Player
	parent_type = /mob


	pixel_x = -8
	var
		pwidth = 16
		pheight = 16


		health = 20
		max_health = 20
		grey_health = 0
		max_grey_health =10
		mana = 0
		max_mana = 0
		class = ""
		base_speed = 4
		attack_speed = 16
		power = 2
		speed = 5
		mind = 5
		defense = 2
		resistance = 4
		attack_distance = 6
		tmp/slowed = 0
		tmp/stunned = 0
		tmp/taunted = 0
		tmp/taunting
		tmp/Overlay/weapon
		tmp/Overlay/armor
	proc/Init()
		//Chat Handler Initialization//
		InitChatHandler()
		//~~~~~~~~~~~~~~~~~~~~~~~~~~~//

	proc/DeInit()
		if(ChatHandler) ChatHandler.Destroy()