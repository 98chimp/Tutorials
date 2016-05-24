//: Playground - noun: a place where people can play

import UIKit

func switcheroo <T> (inout a: T, inout b: T)
{
    let tempA = a
    a = b
    b = tempA
}

var five = 5
var ten = 10

switcheroo(&five, b: &ten)

five
ten


var fivePt = 5.5
var tenPt = 10.5

switcheroo(&fivePt, b: &tenPt)

fivePt
tenPt


//Base Class
class GuestCheck
{
    
    var roomNo: Int?
    var chargeType: ChargeType?
    var note: String?
    var subtotal = 10.0
    var gratuity = 0.0
    var tax: Double
        {
        return subtotal * 0.05
    }
    var total: Double
        {
        return subtotal + gratuity + tax
    }
    
    enum ChargeType
    {
        case Restaurant
        case RoomService
        case SpaServices
        case Entertainment
        case Fitness
    }
}

class RestaurantCheck: GuestCheck{
    
    var foodSubtl = 0.0
    var bevSubtl = 0.0
    var tableNo: Int
    
    init(tableNo: Int){
        self.tableNo = tableNo
        super.init()
        self.chargeType = .RoomService
    }
    
}

class SpaCheck: GuestCheck{
    
    var therapistID: Int?
    var productsPurchased = []
    var servicesPurchased = []
    
    override init(){
        super.init()
        self.chargeType = .SpaServices
    }
    
    enum SpaServices {
        case massage
        case mudBath
        case manicure
        case pedicure
    }
    
    enum SpaProducts {
        case massage
        case mudBath
        case manicure
        case pedicure
    }
}

func guestRetroDiscount(discount: Double, guestCheck: GuestCheck) -> GuestCheck
{
    guestCheck.subtotal = guestCheck.subtotal * (1 - discount)
    return guestCheck
}

struct Team
{
    
    var name: String
    var city: String
    var winPCT: Double = 0.0
    
    init(name: String, city: String)
    {
        self.name = name
        self.city = city
    }
}

class StatGroup
{
    
    var members = [Team]()
    var title: String
    
    init(title: String, members: [Team])
    {
        self.title = title
        self.members = members
    }
}

var blazers = Team(name: "Blazers", city: "Portanld")
var nuggets = Team(name: "Nuggets", city: "Denver")

var hoopsUS = StatGroup(title: "NBA West", members: [blazers, nuggets])
hoopsUS.members

