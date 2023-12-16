extends Label

func _ready():

	var leaderboard = ""
	GameManager.scoreboard.append(["you", GameManager.score])
	GameManager.scoreboard.sort_custom(sort_by_score)
	
	for person in GameManager.scoreboard:
		leaderboard = leaderboard + person[0] + "  " + str(int(person[1])) + "\n"
	
	text = leaderboard
	
func sort_by_score(a,b):
	if a[1] > b[1]:
		return true
	else:
		false
