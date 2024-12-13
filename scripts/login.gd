extends CanvasLayer

@onready var nome: LineEdit = $VBoxContainer/Nome
@onready var senha: LineEdit = $VBoxContainer/Senha
@onready var http_request: HTTPRequest = $HTTPRequest
const BASE64_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"


#func _ready() -> void:
	#var jwt = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
#
	#var decoded = decode_jwt(jwt)
	#if decoded:
		#print("Cabeçalho: ", decoded["header"])
		#print("Payload: ", decoded["payload"])


func _on_entrar_pressed() -> void:
	var url = "http://localhost:8000/api/token/"
	var headers = ["Content-Type: application/json"]
	var data = {"username": nome.text, "password": senha.text}

	http_request.request(url, headers, HTTPClient.METHOD_POST, JSON.stringify(data))
	

func _on_HTTPRequest_request_completed(_result, response_code, _headers, body):
	var json_parse = JSON.new()

	if response_code == 200:
		var body_str = body.get_string_from_utf8()
		var json_parse_result = json_parse.parse(body_str)
		
		if json_parse_result == OK:
			var json = json_parse.get_data()
			
			if json.has("access"):
				# Vem do front para ver os mesmos dados.
				var _access_token = json["access"]
			else: 
				print("A chave 'access' não foi encontrada na resposta JSON.")
				
			if json.has("refresh"):
				var _refresh_token = json["refresh"]
			else: 
				print("A chave 'refresh' não foi encontrada na resposta JSON.")
		else:
			print("Erro ao analisar JSON: ", json_parse.get_error_line())
	else:
		print("Erro na requisição, código da respota: ", response_code)

func decode_jwt(jwt: String) -> Dictionary:
	var parts = jwt.split(".")
	if parts.size() != 3:
		print("JWT inválido!")
		return {}
		
	var json_parser_header = JSON.new()
	var json_parser_payload = JSON.new()
	
	var header = decode_base64(parts[0])
	if header == null:
		print("Erro ao decodificar o cabeçalho do JWT!")
		return {}

	print("Cabeçalho decodificado: ", header)
	var header_parse_result = json_parser_header.parse(header)
	print(header_parse_result)
	if header_parse_result != OK:
		print("Erro ao analisar o cabeçalho do JWT: ", json_parser_header.get_error_line())
		return {}
	
	var header_json = json_parser_header.get_data()
	print(header_json)
	
	var payload = decode_base64(parts[1])
	if payload == null:
		print("Erro ao decodificar o payload do JWT!")
		return {}

	print("Payload decodificado: ", payload)
	var payload_parse_result = json_parser_payload.parse(payload)
	print(payload_parse_result)
	if payload_parse_result != OK:
		print("Erro ao analisar o payload do JWT: ", json_parser_payload.get_error_line())
		return {}
	
	var payload_json = json_parser_payload.get_data()
	print(payload_json)
	
	return {"header": header_json, "payload": payload_json}

func decode_base64(base64_str: String) -> String:
	var missing_padding = base64_str.length() % 4
	if missing_padding > 0:
		base64_str += "=".repeat(4 - missing_padding)
	
	var result = PackedByteArray()
	base64_str = base64_str.rstrip("=")
	for i in range(0, base64_str.length(), 4):
		var chunk = base64_str.substr(i, 4)
		var buffer = 0
		
		for charr in chunk:
			buffer = (buffer << 6) | BASE64_CHARS.find(charr)
		for j in range(16, -1, -8):
			result.push_back((buffer >> j) & 0xFF)
	return result.get_string_from_utf8()


func _on_voltar_pressed() -> void:
	LoginMenu.hide()
	PauseMenu.show()
