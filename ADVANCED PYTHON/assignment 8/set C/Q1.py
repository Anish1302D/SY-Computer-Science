import psycopg2

try:
    conn = psycopg2.connect(
        host="localhost",
        database="testdb",
        user="postgres",
        password="your_password"
    )

    cursor = conn.cursor()

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS products(
    pid SERIAL PRIMARY KEY,
    pname VARCHAR(50),
    price INT,
    qty INT
    )
    """)

    conn.commit()

    while True:
        print("\n1.Add\n2.Search\n3.Update\n4.Delete\n5.Show Price > X\n6.Exit")

        choice = input("Enter choice: ")

        try:
            if choice == '1':
                pname = input("Enter product name: ")
                price = int(input("Enter price: "))
                qty = int(input("Enter quantity: "))

                if price <= 0 or qty <= 0:
                    print("Price and Quantity must be positive")
                    continue

                cursor.execute(
                    "INSERT INTO products(pname,price,qty) VALUES(%s,%s,%s)",
                    (pname, price, qty)
                )
                conn.commit()
                print("Product added")

            elif choice == '2':
                name = input("Enter name to search: ")
                cursor.execute("SELECT * FROM products WHERE pname=%s", (name,))
                result = cursor.fetchone()

                if result:
                    print(result)
                else:
                    print("Record not found")

            elif choice == '3':
                name = input("Enter product name: ")
                qty = int(input("Enter new quantity: "))

                cursor.execute("UPDATE products SET qty=%s WHERE pname=%s", (qty, name))
                conn.commit()
                print("Updated")

            elif choice == '4':
                name = input("Enter product name to delete: ")
                cursor.execute("DELETE FROM products WHERE pname=%s", (name,))
                conn.commit()
                print("Deleted")

            elif choice == '5':
                price = int(input("Enter price: "))
                cursor.execute("SELECT * FROM products WHERE price > %s", (price,))

                for row in cursor.fetchall():
                    print(row)

            elif choice == '6':
                break

            else:
                print("Invalid choice")

        except ValueError:
            print("Invalid numeric input")

except psycopg2.Error as e:
    print("Database error:", e)

finally:
    print("Program Ended")