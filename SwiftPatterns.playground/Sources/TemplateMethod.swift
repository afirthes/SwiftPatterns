import Foundation


class DriveVehicle {
    func startVehicle() {
        haveASeat()
        useProtection()
        lookAtTheMirror()
        turnSignal()
        driveForward()
    }
    
    func haveASeat() {
        preconditionFailure("this method should be overriden")
    }
    
    func closeTheDoor() {
        // 
    }
    
    func useProtection() {
        preconditionFailure("this method should be overriden")
    }
    
    func lookAtTheMirror() {
        preconditionFailure("this method should be overriden")
    }
    
    func turnSignal() {
        preconditionFailure("this method should be overriden")
    }
    
    func driveForward() {
        preconditionFailure("this method should be overriden")
    }
}

class Bicycle: DriveVehicle {
    override func haveASeat() {
        print("Sit down on a bicycle seat.")
    }
    
    override func useProtection() {
        print("Put on helm.")
    }
    
    override func lookAtTheMirror() {
        print("Look at mirror if you have one.")
    }
    
    override func turnSignal() {
        print("Show left hand.")
    }
    
    override func driveForward() {
        print("Pedal.")
    }
 }

class Car: DriveVehicle {
    override func haveASeat() {
        print("Sit down on a car seat.")
    }
    
    override func useProtection() {
        print("Fasten seat belt.")
    }
    
    override func lookAtTheMirror() {
        print("Look at the rearview mirror")
    }
    
    override func turnSignal() {
        print("Torn on left turn light.")
    }
    
    override func driveForward() {
        print("Push gas pedal.")
    }
 }


public func templateMethod() {
    let b = Bicycle()
    let c = Car()
    b.startVehicle()
    c.startVehicle()
}
