extends Label

func _process(delta):
	self.text = ("Points: " + str(Global.points))
