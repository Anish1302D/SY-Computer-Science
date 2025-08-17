# Parent class
class Animal:
    def speak(self):
        print("Animal speaks")

# Child class (inherits from Animal)
class Dog(Animal):
    def bark(self):
        print("Dog barks")

# Create an object of Dog
d = Dog()

# Call methods
d.speak()  # Inherited from Animal
d.bark()   # Defined in Dog
