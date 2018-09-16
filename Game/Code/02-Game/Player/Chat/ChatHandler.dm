mob
	var tmp
		ChatHandler/ChatHandler //Chat Handler reference

	Del() //Cleans up the Chat Handler
		if(ChatHandler) ChatHandler.Destroy()
		. = ..()

	proc/InitChatHandler()
		if(ChatHandler) return
		ChatHandler = new(src)

mob/ChatHandler //Chat-Related Verbs
	verb/OOC(msg as message)
		if(ChatHandler) ChatHandler.OOC(msg)

	verb/IC(msg as message)
		if(ChatHandler) ChatHandler.IC(msg)

ChatHandler //Manages Chat Features.
	var tmp
		mob/mob

	New(mob/mob) //Properly initializes the Chat Handler on the defined client.
		src.mob = mob
		if(src.mob) _AddVerbs()

	Del()
		if(mob) _RemoveVerbs()
		. = ..()

	proc/_AddVerbs()
		mob.verbs += typesof(/mob/ChatHandler/verb)

	proc/_RemoveVerbs()
		mob.verbs -= typesof(/mob/ChatHandler/verb)

	proc/OOC(msg) //Out-of-Character chat
		Game.MessageFilter("OOC", msg, mob)

	proc/IC(msg) //In-Character chat
		Game.MessageFilter("IC", msg, mob)
