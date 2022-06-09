import asyncio,socket

HOST = ''
PORT = 8095
ADDR = (HOST,PORT)
BUFSIZE = 1024
clientdict=[]

async def handle_client(client,addr,clientdict):
    print('connected to',addr)
    print(clientdict)
    loop = asyncio.get_event_loop()
    request = None
    while request != 'quit':
        request = (await loop.sock_recv(client,1024)).decode('utf-8')
        print('client send msg:',request)
        response = 'msg recved'.encode('utf-8')
        await loop.sock_sendall(client,response)
    client.close()

async def run_server():
    sk = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    sk.bind(ADDR)
    sk.listen(5)
    sk.setblocking(0)

    loop = asyncio.get_event_loop()

    while True:
        client,addr = await loop.sock_accept(sk)
        clientdict.append(addr)
        loop.create_task(handle_client(client,addr,clientdict))

asyncio.run(run_server())