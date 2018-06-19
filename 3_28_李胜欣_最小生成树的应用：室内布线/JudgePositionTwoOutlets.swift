
/**********  判断两插座位置关系  **********/

/// 判断是否在同一墙面
func isTogether(_ a: Outlet, _ b: Outlet, _ room: Room) -> Bool {
    // a和b均在2或3，a和b均在1或4
    if (a.x == b.x && (a.x == 0 || a.x == room.lengthOfRoom)) || (a.y == b.y && (a.y == 0 || a.y == room.widthOfRoom)) {
        return true
    } else {
        return false
    }
}

/// 判断是否在相邻墙面
func isBeside(_ a: Outlet, _ b: Outlet, _ room: Room) -> Bool? {
    if a.x == 0 || a.x == room.lengthOfRoom { // a在2或3，b在1或4
        if b.y == 0 || b.y == room.widthOfRoom {
            return true
        } else {
            return false
        }
    } else if a.y == 0 || a.y == room.widthOfRoom {  // a在1或4，b在2或3
        if b.x == 0 || b.x == room.lengthOfRoom {
            return true
        } else {
            return false
        }
    }
    return nil
}

/// 判断是否在相对墙面
func isAcross(_ a: Outlet, _ b: Outlet, _ room: Room) -> Bool {
    // （a在2，b在3）或（a在1，b在4）或（a在3，b在2）或（a在4，b在1）
    if (a.x == 0 && b.x == room.lengthOfRoom) || (a.y == 0 && b.y == room.widthOfRoom) || (a.x == room.lengthOfRoom && b.x == 0) || (a.y == room.widthOfRoom && b.y == 0) {
        return true
    } else {
        return false
    }
}
