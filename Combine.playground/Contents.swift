import UIKit

class Person: ObservableObject {
    @Published var name: String
    @Published var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func mutateData() {
        self.name += "_new"
    }
}

let mike = Person(name: "Mike", age: 20)
mike.objectWillChange.sink { _ in
    print("Will update person info: name=\(mike.name), age=\(mike.age)")
}
mike.mutateData()
print(mike.name)
