import pika

# 连接到RabbitMQ服务器
connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

# 声明一个队列
channel.queue_declare(queue='my_queue')

# 发送消息到队列
channel.basic_publish(
    exchange='',
    routing_key='my_queue',
    body='Hello, RabbitMQ!'
)

print("Message sent!")

# 关闭连接
connection.close()
