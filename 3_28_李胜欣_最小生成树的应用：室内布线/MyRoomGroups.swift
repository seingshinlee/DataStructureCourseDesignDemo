
/// 顺序1 房子的创建

func myRoomGroups(_ indexOfMyRoomSets: Int) -> Room {

    // 创建一间房子的实例
    let roomSets: [Room] = [
                            Room(lengthOfRoom: 10, widthOfRoom: 10, heightOfRoom: 10), // 房子1（默认组）
                            Room(lengthOfRoom: 20, widthOfRoom: 15, heightOfRoom: 20), // 房子2
                            Room(lengthOfRoom: 10, widthOfRoom: 20, heightOfRoom: 30), // 房子3
                            // -> 在这里插入新增的房子的长、宽、高
    ]

    // 异常检查代码
    if roomSets[indexOfMyRoomSets].lengthOfRoom < 0 ||
        roomSets[indexOfMyRoomSets].widthOfRoom < 0 ||
        roomSets[indexOfMyRoomSets].heightOfRoom < 0 {
        print("❌出现负值，请重新修改原来房子的长、宽、高的值，覆盖原来的值\n")
    } else {
        print("######### 第一步：房子创建好了 ###########\n")
    }

    return roomSets[indexOfMyRoomSets]
}
