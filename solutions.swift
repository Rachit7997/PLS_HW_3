import Foundation

struct NegativeAmountError: Error {}

typealias ChangeResult = Result<(Int, Int, Int, Int), NegativeAmountError>

func change(_ amount: Int) -> ChangeResult {
    if amount < 0 {
        return .failure(NegativeAmountError())
    }
    var a = amount
    var temp = [0,0,0,0]
    let values = [25,10,5,1]
    for i in 0...3{
        temp[i] = Int(a/values[i])
        a = a % values[i]
    }
    return .success((temp[0], temp[1], temp[2], temp[3]))
}


extension String {
    var stretched: String{
        get{
            var s1 = String(self.filter { !" \n\t\r".contains($0) })
            var result = ""
            var k = 1;
            for index in s1.indices{
                //print(self[index])
                for i in 1...k{
                    result += String(s1[index])
                }
                k+=1
            }
            return result
        }
    }
}

extension Array {
    func mapThenUnique<T>(mapper: (Element) -> T) -> Set<T> {
        return Set(self.map(mapper))
    }
}

func powers(of base: Int, through limit: Int, consume: (Int) -> Void) {
    var power = 1
    while power <= limit {
        consume(power)
        power *= base
    }
}

protocol Animal { //Looks like abstarct class in JAVA
    var name: String { get }
    var sound: String { get }
    func speak() -> String
}

extension Animal {
    func speak() -> String {
        return "\(name) says \(sound)"
    }
}

struct Cow: Animal {
    let name: String
    let sound = "moooo"
}

struct Horse: Animal {
    let name: String
    let sound = "neigh"
}

struct Sheep: Animal {
    let name: String
    let sound = "baaaa"
}

struct Sayer {
    let phrase: String
    func and(_ word: String) -> Sayer {
        return Sayer(phrase: "\(self.phrase) \(word)")
    }
}

func say(_ word: String) -> Sayer {
    return Sayer(phrase: word)
}

func twice<T>(_ f: (T) -> T, appliedTo x: T) -> T {
    return f(f(x))
}

func uppercasedFirst(of a: [String], longerThan n: Int) -> String? {
    return a.first(where: { $0.count > n })?.uppercased()
}
