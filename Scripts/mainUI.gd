extends Control
class_name MainUI


@onready var option_obtn = %option_obtn;
@onready var result_l = $MarginContainer/VBoxContainer/result_l;
@onready var input_le = %input_le;

func _on_convert_btn_pressed():
	var opt_id : int = option_obtn.get_selected_id();
	var input :String = readInput();
	var result: String;
	print(opt_id)
	match opt_id:
		0: #10 -> 2
			result = Converter.ConverBase10To2Base(input);
		1: #10 -> 16
			result = Converter.ConverBase10To16Base(input)
		2: #2 -> 10
			result = Converter.ConverBase2To10Base(input);
		3: #2 -> 16
			result = Converter.ConverBase2To16Base(input);
		4: #16 -> 2
			result = Converter.ConverBase16To2Base(input);
		5: #16 -> 10
			result = Converter.ConverBase16To10Base(input);
		_:
			return;
	
	updateUI(result)

func readInput() -> String:
	var text = input_le.text
	input_le.clear()
	return text;

func updateUI(newStr: String):
	var temp : String = "Result: {a}"
	result_l.text = temp.format({"a":newStr});
