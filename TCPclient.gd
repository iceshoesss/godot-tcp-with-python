class_name TCP_connect
extends Node

# 1.新建TCP类
onready var client = StreamPeerTCP.new()
onready var status = client.get_status()

signal connected
signal connecting
signal disconnected
signal error
signal data

func _process(_delta):
	var current_status = client.get_status()
	if current_status != status:
		match current_status:
			client.STATUS_NONE:
				print('disconnect from host,please try again')
				emit_signal("disconnected")
			client.STATUS_CONNECTING:
				print('connecting to ')
				emit_signal("connecting")
			client.STATUS_CONNECTED:
				print('connected to ')
				emit_signal("connected")
			client.STATUS_ERROR:
				print('error with socket')
				emit_signal("error")
				

func _on_Button_pressed():
	var msg = $Control/TextEdit.text
	# 发送数据，将其转码为utf8，数据必须以bytes类型传输
	client.put_data(msg.to_utf8())


func _on_Button2_pressed():
	# 2.连接服务器，其中参数ip为str，端口为int
	client.connect_to_host('192.168.31.182',8095)


func _on_State_pressed():
	# 查询连接状态
	print(client.get_status())


func _on_Disconnect_pressed():
	# 端开连接
	client.disconnect_from_host()



func _on_Getdata_pressed():
	# 3.接收数据
	# rev_num获得数据的字节长度
	var rev_num = client.get_available_bytes()
#	print(rev_num)
	# 将byte转为string并且打印出来
	var data = client.get_utf8_string(rev_num)
	print(data)
