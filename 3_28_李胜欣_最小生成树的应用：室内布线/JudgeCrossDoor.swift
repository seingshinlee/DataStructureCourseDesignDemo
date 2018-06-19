
/******  判断两个插座间连线是否穿门 ******/

func judgeCrossDoor(_ a: Outlet, _ b: Outlet, _ pointOfDoor1: PointOfDoor, _ pointOfDoor2: PointOfDoor, _ pointOfDoor3: PointOfDoor, _ room: Room) -> Bool? {

    // 插座和墙位置不明情况，如果插座在地脚线，或者只要插座坐标z大于门上面两角坐标z，则无论插座与墙的位置如何，均不穿过门。
    if a.z == 0 || b.z == 0 || (a.z >= pointOfDoor3.z && b.z >= pointOfDoor3.z) {
        return false
    }

    // 门的在墙的位置确定情况，进一步判断插座与门的位置关系
    if myPositionOfDoor == 1 { // 门在墙1
        if a.y != 0 && b.y != 0 { // 先去掉不再墙1的两个插座，直接判断不穿门
            return false
        } else if (a.x <= pointOfDoor1.x && b.x <= pointOfDoor1.x) {
            return false
        } else if (a.x >= pointOfDoor2.x && b.x >= pointOfDoor2.x) {
            return false
        } else if (a.x <= pointOfDoor1.x && b.x >= pointOfDoor2.x) || (a.x >= pointOfDoor2.x && b.x <= pointOfDoor1.x) {
            return false
        } else {
            return true
        }
    } else if myPositionOfDoor == 2 { // 门在墙2
        if a.x != 0 && b.x != 0 { // 先去掉不再墙2的两个插座，直接判断不穿门
            return false
        } else if (a.y >= pointOfDoor2.y && b.y >= pointOfDoor2.y) {
            return false
        } else if (a.y <= pointOfDoor1.y && b.y <= pointOfDoor1.y) {
            return false
        } else if (a.y <= pointOfDoor1.y && b.y >= pointOfDoor2.y) || (a.y >= pointOfDoor2.y && b.y <= pointOfDoor1.y) {
            return false
        } else {
            return true
        }
    } else if myPositionOfDoor == 3 { // 门在墙3
        if a.x != room.lengthOfRoom && b.y != room.lengthOfRoom { // 先去掉不再墙3的两个插座，直接判断不穿门
            return false
        } else if (a.y <= pointOfDoor1.y && b.y <= pointOfDoor1.y) {
            return false
        } else if (a.y >= pointOfDoor2.y && b.y >= pointOfDoor2.y) {
            return false
        } else if (a.y <= pointOfDoor1.y && b.y >= pointOfDoor2.y) || (a.y >= pointOfDoor2.y && b.y <= pointOfDoor1.y) {
            return false
        } else {
            return true
        }
    } else if myPositionOfDoor == 4 { // 门在墙4
        if a.y != room.widthOfRoom && b.x != room.lengthOfRoom { // 先去掉不再墙4的两个插座，直接判断不穿门
            return false
        } else if (a.x >= pointOfDoor2.x && b.x >= pointOfDoor2.x) {
            return false
        } else if (a.x <= pointOfDoor1.x && b.x <= pointOfDoor1.x) {
            return false
        } else if (a.x <= pointOfDoor1.x && b.x >= pointOfDoor2.x) || (a.x >= pointOfDoor2.x && b.x <= pointOfDoor1.x) {
            return false
        } else {
            return true
        }
    }
    return nil
}
