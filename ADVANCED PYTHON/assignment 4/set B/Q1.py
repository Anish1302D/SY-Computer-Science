data = {"name": "Madhura", "age": 20}

try:
    print(data["city"])

except KeyError:
    print("Key not found, default value used")