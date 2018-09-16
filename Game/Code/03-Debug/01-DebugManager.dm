var/DebugManager/DebugManager = new
DebugManager
	var
		name = SYSTEM_GAME_NAME + " DEBUG"

		timer_running = FALSE

		timer_label
		timer_counter = 0
		timer_time = 0

	proc
		Message(message)
			world.log << "\[[name]]: [message]"

		TimerStart(label)
			set background = 1
			var/timer_id = ++timer_counter

			timer_running = TRUE
			timer_label = label
			timer_time = 0

			spawn for()
				if(timer_id!=timer_counter || !timer_running)
					break
				sleep(world.tick_lag)

				timer_time += world.tick_lag

		TimerEnd()
			timer_running = FALSE

			var/total_time = GMATH_FLOOR(timer_time*100)

			var/hours = GMATH_FLOOR(total_time/3600000)
			total_time%=3600000

			var/minutes = GMATH_FLOOR(total_time/60000)
			total_time%=60000

			var/seconds = GMATH_FLOOR(total_time/1000)
			total_time%=1000

			var/milli = total_time

			world.log << "\[[name] TIMER]\[[timer_label]]: Took hr: [hours]  min: [minutes] sec: [seconds] milli: [milli]"