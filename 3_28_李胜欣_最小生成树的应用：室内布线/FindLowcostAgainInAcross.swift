
/**********  计算相对墙上两个插座的最短布线  **********/

// 插座a在墙1，在墙1与墙2相交墙边12插入一个临时插座temp1，在墙1与墙3相交墙边13插入一个临时插座temp3
func findCost13(_ a: Outlet, _ b: Outlet, _ pointOfDoor1: PointOfDoor, _ pointOfDoor2: PointOfDoor, _ pointOfDoor3: PointOfDoor, _ room: Room) -> Double {

    // <- findAcrossLowcost(_:_:_:_:_:_:) <- judgePositionOfDoor(_:_:_:_:)
    temp1.x = 0
    temp1.y = 0
    temp2.x = 0
    temp2.y = room.widthOfRoom
    temp3.x = room.lengthOfRoom
    temp3.y = 0
    temp4.x = room.widthOfRoom
    temp4.y = room.lengthOfRoom

    cost1 = findTogetherLowcost(a, temp1, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座a与墙边12上的temp1的最短布线
    cost2 = findTogetherLowcost(b, temp2, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座b与墙边24上的temp2的最短布线
    cost3 = findTogetherLowcost(a, temp3, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座a与墙边13上的temp3的最短布线
    cost4 = findTogetherLowcost(b, temp4, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座b与墙边24上的temp4的最短布线

    // 计算并比较求得三种布线中最短的一种
    return compareMinimumOfTwo(compareMinimumOfTwo((cost1 + cost2 + room.widthOfRoom),
                                                   (a.z + b.z + abs(a.x - b.x) + room.widthOfRoom)),
                               (cost3 + cost4 + room.widthOfRoom))
}

// 插座a在墙4，在墙4与墙2相交墙边24插入一个临时插座temp2，在墙4与墙3相交墙边34插入一个临时插座temp4
func findCost24(_ a: Outlet, _ b: Outlet, _ pointOfDoor1: PointOfDoor, _ pointOfDoor2: PointOfDoor, _ pointOfDoor3: PointOfDoor, _ room: Room) -> Double {

    // <- findAcrossLowcost(_:_:_:_:_:_:) <- judgePositionOfDoor(_:_:_:_:)
    temp1.x = 0
    temp1.y = 0
    temp2.x = 0
    temp2.y = room.widthOfRoom
    temp3.x = room.lengthOfRoom
    temp3.y = 0
    temp4.x = room.widthOfRoom
    temp4.y = room.lengthOfRoom

    cost1 = findTogetherLowcost(a, temp4, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座a与墙边24上的temp1的最短布线
    cost2 = findTogetherLowcost(b, temp3, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座b与墙边13上的temp1的最短布线
    cost3 = findTogetherLowcost(a, temp2, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座a与墙边34上的temp1的最短布线
    cost4 = findTogetherLowcost(b, temp1, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座b与墙边12上的temp1的最短布线

    // 计算并比较求得三种布线中最短的一种
    return compareMinimumOfTwo(compareMinimumOfTwo((cost1 + cost2 + room.widthOfRoom),
                                                   (a.z + b.z + abs(a.x - b.x) + room.widthOfRoom)),
                               (cost3 + cost4 + room.widthOfRoom))

}

// 插座a在墙2，在墙2与墙1相交墙边12插入一个临时插座temp1，在墙2与墙4相交墙边24插入一个临时插座temp2
func findCost12(_ a: Outlet, _ b: Outlet, _ pointOfDoor1: PointOfDoor, _ pointOfDoor2: PointOfDoor, _ pointOfDoor3: PointOfDoor, _ room: Room) -> Double {

    // <- findAcrossLowcost(_:_:_:_:_:_:) <- judgePositionOfDoor(_:_:_:_:)
    temp1.x = 0
    temp1.y = 0
    temp2.x = 0
    temp2.y = room.widthOfRoom
    temp3.x = room.lengthOfRoom
    temp3.y = 0
    temp4.x = room.widthOfRoom
    temp4.y = room.lengthOfRoom

    cost1 = findTogetherLowcost(a, temp1, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座a与墙边12上的temp1的最短布线
    cost2 = findTogetherLowcost(b, temp3, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座b与墙边13上的temp1的最短布线
    cost3 = findTogetherLowcost(a, temp2, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座a与墙边24上的temp1的最短布线
    cost4 = findTogetherLowcost(b, temp4, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座b与墙边34上的temp1的最短布线

    // 计算并比较求得三种布线中最短的一种
    return compareMinimumOfTwo(compareMinimumOfTwo((cost1 + cost2 + room.lengthOfRoom),
                                                   (a.z + b.z + abs(a.x - b.x) + room.lengthOfRoom)),
                               (cost3 + cost4 + room.lengthOfRoom))

}

// 插座a在墙3，在墙3与墙1相交墙边13插入一个临时插座temp3，在墙3与墙4相交墙边34插入一个临时插座temp4
func findCost34(_ a: Outlet, _ b: Outlet, _ pointOfDoor1: PointOfDoor, _ pointOfDoor2: PointOfDoor, _ pointOfDoor3: PointOfDoor, _ room: Room) -> Double {

    // <- findAcrossLowcost(_:_:_:_:_:_:) <- judgePositionOfDoor(_:_:_:_:)
    temp1.x = 0
    temp1.y = 0
    temp2.x = 0
    temp2.y = room.widthOfRoom
    temp3.x = room.lengthOfRoom
    temp3.y = 0
    temp4.x = room.widthOfRoom
    temp4.y = room.lengthOfRoom

    cost1 = findTogetherLowcost(a, temp3, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座a与墙边13上的temp1的最短布线
    cost2 = findTogetherLowcost(b, temp1, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座b与墙边12上的temp1的最短布线
    cost3 = findTogetherLowcost(a, temp4, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座a与墙边34上的temp1的最短布线
    cost4 = findTogetherLowcost(b, temp2, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) // 计算插座b与墙边24上的temp1的最短布线

    // 计算并比较求得三种布线中最短的一种
    return compareMinimumOfTwo(compareMinimumOfTwo((cost1 + cost2 + room.lengthOfRoom),
                                                   (a.z + b.z + abs(a.x - b.x) + room.lengthOfRoom)),
                               (cost3 + cost4 + room.lengthOfRoom))
}
