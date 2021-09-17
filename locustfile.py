# from locust import HttpUser, task
#
# class HelloWorldUser(HttpUser):
#     @task
#     def hello_world(self):
#         self.client.get("http://google.com")



from locust import task, between, HttpUser, SequentialTaskSet

class UserBehaviour(SequentialTaskSet):

    def __init__(self, parent):
        super().__init__(parent)

    @task()
    def create_task(self):
        self.client.get("/")


class MyUser(HttpUser):
    wait_time = between(1, 2)
    host = "http://google.com"
    tasks = [UserBehaviour]