from abc import ABC

class Database(ABC):
    @abstractmethod
    def connect(self):
        pass

    @abstractmethod
    def disconnect(self):
        pass

    def __del__(self):
        self.disconnect()

class MySQLDatabase(Database):
    def connect(self):
        print("Database connected")

    def disconnect(self):
        print("Database connection closed")

db = MySQLDatabase()
db.connect()

del db
