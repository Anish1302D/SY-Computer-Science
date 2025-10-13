cities = []

with open("cities.txt", "r") as file:
    for line in file:
        name, code = line.strip().split(",")
        cities.append((name.strip(), code.strip()))

def get_city_name(city_data):
    return city_data[0]


cities.sort(key=get_city_name)

search_city = input("Enter city name to find STD code: ")

low = 0
high = len(cities) - 1
found = False

while low <= high:
    mid = (low + high) // 2
    city_name, std_code = cities[mid]

    if city_name.lower() == search_city.lower():
        print(f"STD code of {city_name} is {std_code}")
        found = True
        break
    elif city_name.lower() < search_city.lower():
        low = mid + 1
    else:
        high = mid - 1

if not found:
    print("City not found in the list.")
