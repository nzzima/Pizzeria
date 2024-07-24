//
//  main.swift
//  Pizzeria
//
//  Created by Nikita Krylov on 24.07.2024.
//

import Foundation

let cashier = Employee(name: "Jhon", salary: 500, jobTitle: .cashier)
let cook = Employee(name: "George", salary: 2000, jobTitle: .cook)

var employees: [EmployeeProtocol] = []
employees.append(cashier)
employees.append(cook)

var pizzeria1 = Pizzeria(employees: employees)
pizzeria1.addEmployee(employee: Employee(name: "Chris", salary: 4000, jobTitle: .administrator))
pizzeria1.addEmployee(employee: Employee(name: "Haley", salary: 2300, jobTitle: .manager))
pizzeria1.addEmployee(employee: Employee(name: "Daniel", salary: 2100, jobTitle: .cook))
print(pizzeria1.getEmployees())
print(pizzeria1.tables)

var guests: Int = 20

func checkingPlaces() {
    print("\nTotal guests: \(guests)")
    var point = 1
    for table in pizzeria1.tables {
        var tablePlaces = table.getPlaces()
        print("\nTable \(point) is empty with \(tablePlaces) places")
        if guests > tablePlaces {
            guests -= tablePlaces
            print("\(guests) guests remaining...")
        }
        else if guests < tablePlaces && table.placesForGuests(guests: guests){
            tablePlaces -= guests
            guests = 0
            print("Left \(tablePlaces) empty place(s)")
        }
        point += 1
    }
    if guests > 0 {
        print("\nNot enough places for guests")
    }
}

checkingPlaces()
