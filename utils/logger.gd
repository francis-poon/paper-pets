class_name Logger
extends Node

static func fatal(msg: String):
	print("Fatal: " + msg)

static func error(msg: String):
	if DevConfig.debug_level < Constants.DebugLevel.ERROR:
		return
	print("Error: " + msg)

static func warn(msg: String):
	if DevConfig.debug_level < Constants.DebugLevel.WARN:
		return
	print("Warn: " + msg)

static func info(msg: String):
	if DevConfig.debug_level < Constants.DebugLevel.INFO:
		return
	print("Info: " + msg)

static func debug(msg: String):
	if DevConfig.debug_level < Constants.DebugLevel.DEBUG:
		return
	print("Debug: " + msg)

static func trace(msg: String):
	if DevConfig.debug_level < Constants.DebugLevel.TRACE:
		return
	print("Trace: " + msg)
