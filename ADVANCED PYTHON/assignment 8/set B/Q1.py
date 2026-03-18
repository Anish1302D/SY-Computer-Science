import sqlite3

conn = sqlite3.connect("college.db")
cursor = conn.cursor()

while True:
    print("\n1.Insert\n2.Display\n3.Update\n4.Delete\n5.Exit")

    choice = input("Enter choice: ")

    try:
        if choice == '1':
            id = int(input("Enter ID: "))
            name = input("Enter Name: ")
            marks = int(input("Enter Marks: "))

            cursor.execute("INSERT INTO students VALUES (?,?,?)", (id, name, marks))
            conn.commit()
            print("Inserted Successfully")

        elif choice == '2':
            cursor.execute("SELECT * FROM students")
            for row in cursor.fetchall():
                print(row)

        elif choice == '3':
            id = int(input("Enter ID to update: "))
            marks = int(input("Enter new marks: "))

            cursor.execute("UPDATE students SET marks=? WHERE id=?", (marks, id))
            conn.commit()
            print("Updated Successfully")

        elif choice == '4':
            id = int(input("Enter ID to delete: "))

            cursor.execute("DELETE FROM students WHERE id=?", (id,))
            conn.commit()
            print("Deleted Successfully")

        elif choice == '5':
            break

        else:
            print("Invalid choice")

    except Exception as e:
        print("Error:", e)

conn.close()