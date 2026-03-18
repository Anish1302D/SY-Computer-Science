class Shape:
    def area(self):
        pass


class Rectangle(Shape):
    def __init__(self, l, w):
        self.l = l
        self.w = w

    def area(self):
        print("Area of Rectangle =", self.l * self.w)


class Triangle(Shape):
    def __init__(self, b, h):
        self.b = b
        self.h = h

    def area(self):
        print("Area of Triangle =", 0.5 * self.b * self.h)


r = Rectangle(5, 4)
t = Triangle(6, 3)

r.area()
t.area()