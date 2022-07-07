import Foundation

struct Teacher {
    let name: String
    let courses: [String]
}

struct Student {
    let name: String
    let courses: [String]
    var grade: String?
}

enum User {
    case teacher(Teacher)
    case student(Student)
}



public class Polimorphism {
    
    public init() {}
    
    public func main() {
        let teacher = Teacher(name: "John Doe", courses: ["Math", "Science"])
        let student = Student(name: "Patrick Hoffman", courses: ["Math", "History"], grade: "5")
        
        // Способ на кастинге
        // - : нужно кастить
        // - : нужно указывать default
        let users: [Any] = [teacher, student]
        for user in users {
            switch user {
                case let user as Student:
                    print("Student grade is \(user.grade ?? "")")
                case let teacher as Teacher:
                    print("Teacher courses \(teacher.courses)")
                default:
                    print("Not student, nor teacher!")
            }
        }
        
        // Другой способ на енумах
        let allUsers:[User] = [User.teacher(teacher), User.student(student)]
        for user in allUsers {
            switch user {
            case .student(let student):
                print("Student grade is \(student.grade ?? "")")
            case .teacher(let teacher):
                print("Teacher courses \(teacher.courses)")
            }
        }
    }
}
