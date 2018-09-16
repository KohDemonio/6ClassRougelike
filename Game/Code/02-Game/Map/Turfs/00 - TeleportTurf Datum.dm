turf/TeleporterTurf //Turfs that teleport players to other places or act as a spawn.
	var tmp
		//Teleport/Spawn Related Variables//
		teleport_tag //The tag that this turf sends the player to.
		location_tag //The tag that this turf represents.

		enter_dir //The direction that the player will be in when they enter the turf. null value does nothing
		exit_dir //The direction that the player will be in when they exit the turf. null value does nothing

		//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//


	New() //Properly Initializes the Turf
		. = ..()
		SetLocationTag(location_tag)
		OnInit()

	Entered(atom/movable/Obj, atom/OldLoc) //Properly handles the Teleportation
		. = ..()
		if(!location_tag || !teleport_tag) return

		if(!CanTeleport(Obj,OldLoc)) return

		if(exit_dir) Obj.dir = exit_dir
		TeleportedFrom(Obj)

		var/turf/TeleporterTurf/teleport = locate(teleport_tag)
		if(!istype(teleport,/turf/TeleporterTurf)) return

		Obj.SetLoc(locate(teleport.x, teleport.y, teleport.z))
		if(teleport.enter_dir) Obj.dir = teleport.enter_dir
		teleport.TeleportedTo(Obj)

	proc/SetLocationTag(location_tag) //Properly sets the Location Tag, Do Not Manually Set the location_tag via the variable reference.
		src.location_tag = location_tag
		if(src.location_tag) tag = src.location_tag

	proc/SetTeleportTag(teleport_tag) //Properly sets the Teleport Tag
		src.teleport_tag = teleport_tag

	//Overridable Procs//
	proc/OnInit() //Handle Initialization Here

	proc/CanTeleport(atom/movable/o, atom/old_loc, turf/TeleporterTurf/source) //Return TRUE if obj o can teleport to this teleporter
		return TRUE

	proc/TeleportingFrom(atom/movable/o, turf/TeleporterTurf/dest) //When the obj o is preparing to teleport away from this teleporter
	proc/TeleportingTo(atom/movable/o, turf/TeleporterTurf/source) //When the obj o is preparing to teleport to this teleporter

	proc/TeleportedFrom(atom/movable/o, turf/TeleporterTurf/dest) //When the obj is teleported from this teleporter
	proc/TeleportedTo(atom/movable/o, turf/TeleporterTurf/source) //When the obj o teleported to this teleporter

	//~~~~~~~~~~~~~~~~~//