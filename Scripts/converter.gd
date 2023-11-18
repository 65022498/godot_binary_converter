extends Node
class_name Converter

#10 -> 2
static func ConvertBase10To2Base(arg: String) -> String:
	var num = arg.to_int()
	var binary = ""
	while num > 0:
		binary = str(num % 2) + binary
		num = num / 2
	return binary

#10 -> 16
static func ConverBase10To16Base(arg: String) -> String:
	var num = arg.to_int()
	var hex = ""
	while num > 0:
		hex = str("0123456789ABCDEF"[num % 16]) + hex
		num = num / 16
	return hex

#2 -> 10
static func ConverBase2To10Base(arg: String) -> String:
	return arg;

#2 -> 16
static func ConverBase2To16Base(arg: String) -> String:
	return arg;

#16 -> 2
static func ConverBase16To2Base(arg: String) -> String:
	return arg;

#16 -> 10
static func ConverBase16To10Base(arg: String) -> String:
	return arg;
