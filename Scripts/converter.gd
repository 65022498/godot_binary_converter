extends Node
class_name Converter

# 10 -> 2
static func ConverBase10To2Base(arg: String) -> String:
	var num = arg.to_int()
	var binary = ""
	while num > 0:
		binary = str(num % 2) + binary
		num = num / 2
	return binary

# 10 -> 16
static func ConverBase10To16Base(arg: String) -> String:
	var num = arg.to_int()
	var hex = ""
	while num > 0:
		hex = str("0123456789ABCDEF"[num % 16]) + hex
		num = num / 16
	return hex

# 2 -> 10
static func ConverBase2To10Base(arg: String) -> String:
	var length = len(arg) - 1
	var decimal = 0
	for x in arg:
		var bit = x.to_int()
		decimal += (bit * (2 ** length))  
		length -= 1          
	return str(decimal)         

# 2 -> 16
static func ConverBase2To16Base(arg: String) -> String:
	var binaryGroup = len(arg)
	while binaryGroup % 4 == 0:
		binaryGroup = binaryGroup / 4
	binaryGroup = 4 if binaryGroup == 1 else binaryGroup
	var hex = ""
	for i in range(0, len(arg), binaryGroup):
		var binary = str(arg.substr(i, binaryGroup))  # ดึงเลขฐาน 2 ที่ละกลุ่ม 4 bit
		var decimal = Converter.ConverBase2To10Base(binary)
		hex += Converter.ConverBase10To16Base(decimal)
		binaryGroup = 4
	return hex

# 16 -> 2
static func ConverBase16To2Base(arg: String) -> String:
	var decimal = Converter.ConverBase16To10Base(arg)
	print(decimal)
	var binary = Converter.ConverBase10To2Base(decimal)
	return binary

# 16 -> 10
static func ConverBase16To10Base(arg: String) -> String:
	var decimal = 0
	var length = len(arg) - 1
	var hexToDec = {
		'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
		'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
	}
	for i in range(0, len(arg)):
		var hex = arg.substr(i, 1)
		decimal += hexToDec[hex] * (16 ** length)
		length -= 1
	return str(decimal)
