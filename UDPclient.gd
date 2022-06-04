extends Node


var udp = PacketPeerUDP.new()

func _ready():
#	var udp = PacketPeerUDP.new()
	udp.set_dest_address("192.168.31.182",8095)
#	udp.put_var("这是一条测试信息")


func _on_Button_pressed():
	var msg = $Control/TextEdit.text
	udp.put_var(msg)
	
