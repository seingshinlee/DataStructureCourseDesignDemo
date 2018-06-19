
/**********  计算墙上任意两个插座的最短布线  **********/

func findTwoLowcost(_ a: Outlet, _ b: Outlet, _ pointOfDoor1: PointOfDoor, _ pointOfDoor2: PointOfDoor, _ pointOfDoor3: PointOfDoor, _ room: Room) -> Double? {

    // 求得两个插座之间所有权值中最小的权值
    if isTogether(a, b, room) == true {
        let cost = findTogetherLowcost(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, room)
        return cost
    } else if isBeside(a, b, room) == true {
        let cost = findBesideLowcost(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, room)
        return cost
    } else if isAcross(a, b,room) == true {
        let cost = findAcrossLowcost(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, room)
        return cost
    }
    return nil
}
