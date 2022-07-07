import Foundation


/*
 
 Класс Staff не должен иметь courses, т.к. они ничему не учат и не учатся
 одно из решений - убрать courses из Userr, и перенести в Teacher и
 Student.
 
 
class Userr {
    var name: String
    //var courses: [String]
    var isFullTime: Bool
    
    init(name: String, courses: [String], isFullTime: Bool) {
        self.name = name
        self.courses = courses
        self.isFullTime = isFullTime
    }
}

class Staff: Userr {
    
}

class Teacher: Userr {
    var courses: [String]
    ...
}

class Student: Userr {
    var courses: [String]
    ...
}
*/

// --- Решение на енумах ---


struct Studentt {
    let name: String
    let course: [String]
    let isFullTime: Bool
}

struct Teacherr {
    let name: String
    let course: [String]
    let isFullTime: Bool
}

struct Stafff {
    let name: String
    let isFullTime: Bool
}

struct InternationalStudent {
    let name: String
    let course: [String]
    let isFullTime: Bool
    let countryOfOrigin: String
}

enum Userr {
    case student(Studentt)
    case teacher(Teacherr)
    case staff(Stafff)
    case internationalStudent(InternationalStudent)
}
