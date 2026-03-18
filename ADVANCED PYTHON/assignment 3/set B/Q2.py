class Teacher:
    def __init__(self, name, subject):
        self.__name = name
        self.__subject = subject

    @property
    def name(self):
        return self.__name

    @property
    def subject(self):
        return self.__subject

    def display_info(self):
        print("Teacher:", self.name, self.subject)


class Researcher:
    def __init__(self, field, publications):
        self.__field = field
        self.__publications = publications

    @property
    def field(self):
        return self.__field

    @property
    def publications(self):
        return self.__publications

    def display_info(self):
        print("Research Field:", self.field)
        print("Publications:", self.publications)


class Professor(Teacher, Researcher):
    def __init__(self, name, subject, field, publications):
        Teacher.__init__(self, name, subject)
        Researcher.__init__(self, field, publications)


p = Professor("Dr. Rao", "AI", "Machine Learning", 25)

p.display_info()

print("MRO:", Professor.__mro__)