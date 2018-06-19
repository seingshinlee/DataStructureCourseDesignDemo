
/**********  求最短的布线长度  **********/

/// 求同墙两插座最短布线
func findTogetherLowcost(_ a: Outlet, _ b: Outlet, _ pointOfDoor1: PointOfDoor, _ pointOfDoor2: PointOfDoor, _ pointOfDoor3: PointOfDoor, _ room: Room) -> Double {

    if !judgeCrossDoor(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, room)! { // 两插座同墙且不穿门
        return (abs(a.x - b.x) + abs(a.y - b.y) + abs(a.z - b.z))
    } else { // 两插座同墙且穿门

        // 两插座布线会穿过门，门的位置不同
        if (judgePositionOfDoor(pointOfDoor1, pointOfDoor2, pointOfDoor3, room) == 1 ||
            judgePositionOfDoor(pointOfDoor1, pointOfDoor2, pointOfDoor3, room) == 4 ) { // 门位置在1或4
            return compareMinimumOfTwo((abs(a.x - b.x) + abs(pointOfDoor3.z - a.z) + abs(pointOfDoor3.z - b.z)), // 走门顶线
                (abs(a.x - b.x) + a.z + b.z)) // 走地脚线
        } else { // 门位置在2或3
            return compareMinimumOfTwo((abs(a.y - b.y) + abs(pointOfDoor3.z - a.z) + abs(pointOfDoor3.z - b.z)), // 走门顶线
                (abs(a.y - b.y) + a.z + b.z)) // 走地脚线
        }
    }
}

/// 求相邻墙两插座最短布线
func findBesideLowcost(_ a: Outlet, _ b: Outlet, _ pointOfDoor1: PointOfDoor, _ pointOfDoor2: PointOfDoor, _ pointOfDoor3: PointOfDoor, _ room: Room) -> Double {

    var temp: Outlet = a

    // 在两平面连接处找一个点（让其中一点x，y为0即可，转化为两个“同墙插座”问题）
    if (a.x == 0 && b.y == 0) || (b.x == 0 && a.y == 0) { // 一个插座在墙1，另外一个插座在墙2

        // 1<->2交边
        temp.x = 0
        temp.y = 0
        return (findTogetherLowcost(a, temp, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) +
            findTogetherLowcost(b, temp, pointOfDoor1, pointOfDoor2, pointOfDoor3, room)) // 临时相交墙边的点与两邻墙点的最短布线之和
    } else if (a.x == room.lengthOfRoom && b.y == 0) || (a.y == 0 && b.x == room.lengthOfRoom) { // 一个插座在墙1，另外一个插座在墙3

        // 1<->3交边
        temp.x = room.lengthOfRoom
        temp.y = 0
        return (findTogetherLowcost(a, temp, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) +
            findTogetherLowcost(b, temp, pointOfDoor1, pointOfDoor2, pointOfDoor3, room)) // 临时相交墙边的点与两邻墙点的最短布线之和
    } else if (a.x == 0 && b.y == room.widthOfRoom) || (b.x == 0 && a.y == room.widthOfRoom) { // 一个插座在墙2，另外一个插座在墙4

        // 2<->4交边
        temp.x = 0
        temp.y = room.widthOfRoom
        return (findTogetherLowcost(a, temp, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) +
            findTogetherLowcost(b, temp, pointOfDoor1, pointOfDoor2, pointOfDoor3, room)) // 临时相交墙边的点与两邻墙点的最短布线之和
    } else { // 一个插座在墙3，另外一个插座在墙4

        // 3<->4交边
        temp.x = room.lengthOfRoom
        temp.y = room.widthOfRoom
        return (findTogetherLowcost(a, temp, pointOfDoor1, pointOfDoor2, pointOfDoor3, room) +
            findTogetherLowcost(b, temp, pointOfDoor1, pointOfDoor2, pointOfDoor3, room)) // 临时相交墙边的点与两邻墙点的最短布线之和
    }
}

/// 求相对墙两插座最短布线
func findAcrossLowcost(_ a: Outlet, _ b: Outlet, _ pointOfDoor1: PointOfDoor, _ pointOfDoor2: PointOfDoor, _ pointOfDoor3: PointOfDoor, _ room: Room) -> Double {

    // 一个插座在墙1，另外一个插座在墙4
    if (a.y == 0 && b.y == room.widthOfRoom) || (b.y == 0 && a.y == room.widthOfRoom) {

        // -> temp1，temp2，temp3，temp4赋值为myOutletSets[0]，myOutletSets[1]，myOutletSets[2]，myOutletSets[3]

        // 判断门的位置，把门插入对应的墙上
        if judgePositionOfDoor(pointOfDoor1, pointOfDoor2, pointOfDoor3, room) == 1 { // 门插入墙1

            // -> temp1, temp2, temp3, temp4的x和y

            if judgePositionOutlet(a, room) == 1 { // 以在墙1的插座为开始
                return findCost13(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            } else { // 以在墙4的插座为开始
                return findCost24(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            }
        } else if judgePositionOfDoor(pointOfDoor1, pointOfDoor2, pointOfDoor3, room) == 2 { // 门插入墙2

            // -> temp1, temp2, temp3, temp4的x和y

            if judgePositionOutlet(a, room) == 1 { // 以在墙1的插座为开始
                return findCost13(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            } else { // 以在墙4的插座为开始
                return findCost24(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            }
        } else if judgePositionOfDoor(pointOfDoor1, pointOfDoor2, pointOfDoor3, room) == 3 { // 门插入墙3

            // -> temp1, temp2, temp3, temp4的x和y

            if judgePositionOutlet(a, room) == 1 { // 以在墙1的插座为开始
                return findCost13(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            } else { // 以在墙4的插座为开始
                return findCost24(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            }
        } else { // 门插入墙4

            // -> temp1, temp2, temp3, temp4的x和y

            if judgePositionOutlet(a, room) == 1 { // 以在墙1的插座为开始
                return findCost13(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            } else { // 以在墙4的插座为开始
                return findCost24(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            }
        }
    }

    // 一个插座在墙2，另外一个插座在墙3
    else {

        // -> temp1，temp2，temp3，temp4赋值为myOutletSets[0]，myOutletSets[1]，myOutletSets[2]，myOutletSets[3]

        // 判断门的位置，把门插入对应的墙上
        if judgePositionOfDoor(pointOfDoor1, pointOfDoor2, pointOfDoor3, room) == 1 { // 门插入墙1

            // -> temp1, temp2, temp3, temp4的x和y

            if judgePositionOutlet(a, room) == 2 { // 以在墙2的插座为开始
                return findCost12(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            } else { // 以在墙3的插座为开始
                return findCost34(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            }
        } else if judgePositionOfDoor(pointOfDoor1, pointOfDoor2, pointOfDoor3, room) == 2 { // 门插入墙2

            // -> temp1, temp2, temp3, temp4的x和y

            if judgePositionOutlet(a, room) == 2 { // 以在墙2的插座为开始
                return findCost12(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            } else { // 以在墙3的插座为开始
                return findCost34(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            }
        } else if judgePositionOfDoor(pointOfDoor1, pointOfDoor2, pointOfDoor3, room) == 3 { // 门插入墙3

            // -> temp1, temp2, temp3, temp4的x和y

            if judgePositionOutlet(a, room) == 2 { // 以在墙2的插座为开始
                return findCost12(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            } else { // 以在墙3的插座为开始
                return findCost34(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            }
        } else { // 门插入墙4

            // -> temp1, temp2, temp3, temp4的x和y

            if judgePositionOutlet(a, room) == 2 { // 以在墙2的插座为开始
                return findCost12(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            } else { // 以在墙3的插座为开始
                return findCost34(a, b, pointOfDoor1, pointOfDoor2, pointOfDoor3, myRoom)
            }
        }
    }
}
