extends CanvasLayer

@onready var nome: LineEdit = $VBoxContainer/Nome
@onready var senha: LineEdit = $VBoxContainer/Senha
@onready var http_request: HTTPRequest = $HTTPRequest
	


func _on_entrar_pressed() -> void:
	var url = ""
	var headers = ["Content-Type: application/json"]
	var data = {"username": nome.text, "password": senha.text}

	http_request.request(url, headers, HTTPClient.METHOD_GET, JSON.stringify(data))
	

func _on_HTTPRequest_request_completed(result, response_code, _headers, body):
	var json = JSON.new()
	if response_code == 200:
		var response_data = json.parse(body.get_string_from_utf8())
		if response_data.error == OK:
			print("Resposta recebida com sucesso!")
			print(response_data.result)
		else:
			print("Erro no paser: ", response_data.error_string)
	else:
		print("Erro na requisição: ", response_code)


func _on_voltar_pressed() -> void:
	LoginMenu.hide()
	PauseMenu.show()
