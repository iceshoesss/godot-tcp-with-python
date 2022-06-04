class_name TCP_connect
extends Node

onready var client = StreamPeerTCP.new()
var recmsg

func _ready():
	pass
#	client.connect_to_host('192.168.31.182',8095)
#	client.set_stream_peer(1)

#func _process(delta):
#	if client.get_status() == client.STATUS_CONNECTED:
#		if client.get_available_bytes() >=3:
#			print(client.get_available_bytes())
#			print(client.get_utf8_string())


func _on_Button_pressed():
	var msg = $Control/TextEdit.text
	client.put_data(msg.to_utf8())
	print(typeof(msg.to_utf8()))

#	var msgrcv = client.get_data(1024)
#	print(msgrcv)


func _on_Button2_pressed():
	client.connect_to_host('192.168.31.182',8095)
func create_server():
	pass

func create_client():
	pass


func _on_State_pressed():
	print(client.get_status())


func _on_Disconnect_pressed():
	client.disconnect_from_host()



func _on_Getdata_pressed():
#	recmsg = client.get_data(6)[1]
#	var a = PoolByteArray([79, 75, 97, 98, 115, 100])
#	print(recmsg)
#	print(bytes2var(a))
	var rev_num = client.get_available_bytes()
	print(rev_num)
	var data = client.get_utf8_string(rev_num)
	print(data)


#		rev_num = client.get_available_bytes()
#		if rev_num > 0:
#			var data = client.get_utf8_string(rev_num)
#			print(data)
#			continue
