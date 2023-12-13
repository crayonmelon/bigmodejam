extends Label

var new_score_text = preload("res://scenes/score_text.tscn")
@onready var v_box_container = $VBoxContainer
var raw_score

var words = ["cool guy", "gnarly", "femur", "radical"]


func _ready():
	update_text()
	GameManager.Score_Updated.connect(update_text)
	GameManager.enemy_killed.connect(add_kill_text)
	GameManager.near_miss.connect(add_near_miss_text)
	add_score_text(words.pick_random(), 100)

func update_text():
	text = str(GameManager.score)

func _process(delta):
	GameManager._change_score_val(delta*30)
	text = str(int(GameManager.score))

func add_score_text(source: String, value: int):
	var new_text = new_score_text.instantiate()
	
	new_text.text = source + " +" + str(value)

	v_box_container.add_child(new_text)
	v_box_container.move_child(new_text, 0)
	new_text.get_child(0).connect("animation_finished", destroy_last_score)
	
func add_kill_text():
	GameManager._change_score_val(GameManager.KILL_VALUE)
	add_score_text("Kill", GameManager.KILL_VALUE)
	
func add_near_miss_text():
	GameManager._change_score_val(GameManager.NEAR_MISS_VALUE)
	add_score_text("Near Miss", GameManager.NEAR_MISS_VALUE)

func destroy_last_score(anim_name):
	v_box_container.get_child(v_box_container.get_child_count()-1).queue_free()
