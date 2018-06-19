
/**********  判断门在哪个墙面  **********/

// door1和door2表示下面两个角的结构体实例，door3和door4表示上面两个角的结构体的实例，door1和door2 或 door3和door4 任选一组完整，另外一组至少一个，就可以确定门在墙面的位置。
func judgePositionOfDoor(_ door1: PointOfDoor, _ door2: PointOfDoor, _ door3: PointOfDoor, _ room: Room) -> Int? {

    if door1.y == 0 && door2.y == 0 && door3.y == 0 {
        return 1
    } else if door1.x == 0 && door2.x == 0 && door3.x == 0 {
        return 2
    } else if door1.x == room.lengthOfRoom && door2.x == room.lengthOfRoom && door3.x == room.lengthOfRoom {
        return 3
    } else if door1.y == room.widthOfRoom && door2.y == room.widthOfRoom && door3.y == room.widthOfRoom {
        return 4
    }
    return nil
}
