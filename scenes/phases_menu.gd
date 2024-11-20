extends CanvasLayer

@onready var title: Label = $VBoxContainer/HBoxContainer/Display/Title
@onready var text: Label = $VBoxContainer/HBoxContainer/Display/Text

var TutorialT = "Treinamento Espeacial"
var TutorialTxt = "Aprenda a movimentação do bit e lide com os perigos da nave."

var phase1T = "Uma Ameaça foi Detectada"
var phase1Txt = "Bit viaja pelo espaço mas sua nave é atacada por alienígenas."

var phaseNT = "Em progresso..."
var phaseNTXT = "Talvez na próxima teremos mais fase, iremos lhe esperar."


func _on_tutorial_pressed() -> void:
	title.text = TutorialT
	text.text = TutorialTxt



func _on_phase_1_pressed() -> void:
	title.text = phase1T
	text.text = phase1Txt


func _on_phase_pressed() -> void:
	title.text = phaseNT
	text.text = phaseNTXT
