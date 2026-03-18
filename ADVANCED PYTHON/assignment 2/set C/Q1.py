from abc import ABC, abstractmethod


class Database(ABC):

    @abstractmethod
    def connect(self):
        pass

    @abstractmethod
    def disconnect(self):
        pass


class MySQLDatabase(Database):

    def connect(self):
        print("Database Connected")

    def disconnect(self):
        print("Database Connection Closed")


db = MySQLDatabase()

db.connect()

del db