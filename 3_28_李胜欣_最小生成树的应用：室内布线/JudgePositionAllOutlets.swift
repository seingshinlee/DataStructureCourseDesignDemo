
/**********  判断插座在哪个墙面  **********/

func judgePositionOutlet(_ outlet: Outlet, _ room: Room) -> Int! {
    if outlet.y == 0 {
        return 1
    } else if outlet.x == 0 {
        return 2
    } else if outlet.x == room.lengthOfRoom {
        return 3
    } else if outlet.y == room.widthOfRoom {
        return 4
    }
    return nil
}
