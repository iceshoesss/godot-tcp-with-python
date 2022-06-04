import socket
import threading


if __name__ == '__main__':
    # 1.创建服务端套接字对象
    # AF_INET表示ipv4，SOCK_STREAM表示TCP协议
    socketserver = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # 设置端口复用，端口复用后不会出现关闭套接字后端口被占用的情况
    socketserver.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,True)
    # 2.绑定ip地址和端口号
    socketserver.bind(('0.0.0.0', 8095))
    # 3.设置监听，5表示最大排队数量为5
    socketserver.listen(5)

    # 循环结构，使客户端可以一直连入
    while True:
        # 4.等待客户端的连接请求
        # accept会阻塞
        # 返回一个用以与和客户端通信的socket和客户端的ip地址
        clientsocket,addr = socketserver.accept()
        print(addr)
        # 5.接收数据
 #       while True:
        recvmsg = clientsocket.recv(1024)
        # 将收到的数据转码并打印
        strData = recvmsg.decode("utf-8")
        print('收到：',strData)

        clientsocket.send('OKabsd'.encode("utf-8"))

        clientsocket.close()
      #  break


    socketserver.close()