//THESE DEBUG RELATED COMMANDS ONLY OCCUR DURING DEBUG MODE.
#ifdef DEBUG

//Debug Message//
#define DEBUG_MSG(MESSAGE) DebugManager.Message(MESSAGE)
//~~~~~~~~~~~~~//

//Debug Timer//
#define DEBUG_TIMER_START(LABEL) DebugManager.TimerStart(LABEL) //Starts a Timer for said label
#define DEBUG_TIMER_END DebugManager.TimerEnd() //Ends the Timer for said label
//~~~~~~~~~~~//

#else

//Disables The Commands During Release//
#define DEBUG_MSG(MESSAGE)
#define DEBUG_TIMER_START(LABEL)
#define DEBUG_TIMER_END
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//

#endif

