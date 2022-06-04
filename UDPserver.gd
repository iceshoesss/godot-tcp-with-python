extends Node

func _ready():
	var udp = PacketPeerUDP.new()
	udp.listen(8087,"127.0.0.1")
	udp.wait()
	var message = udp.get_var()
	print(message)
