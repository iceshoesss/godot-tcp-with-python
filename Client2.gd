#extends Node
#var client = WebSocketClient.new()
#var websocket_url = '192.168.31.182:8095'
#func _ready():
##	client.connect_to_url(websocket_url)
#	var err = client.connect_to_url(websocket_url)
#	if err != OK:
#		print("Unable to connect")
#		set_process(false)
#	else:
##	print(client.is_connected_to_host())
#		client.get_peer(1).put_packet("Test packet".to_utf8())
#		print('connected')
	

extends Node

# The URL we will connect to
export var websocket_url = "ws://192.168.31.182:8095"
var _client = WebSocketClient.new()

func _ready():
	var err = _client.connect_to_url(websocket_url)
	var msg = _client.get_peer(1).put_packet("Test packet".to_utf8())


func _process(_delta):
	_client.poll()
