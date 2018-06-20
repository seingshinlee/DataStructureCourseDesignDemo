
/// 顺序2 门的创建

func myPointOfDoorGroups(_ indexOfMyPointOfDoorSets: Int, _ room: Room) -> [PointOfDoor] {

    // 多个门的数组集合，每个门又是门角的数组集合
    var setsOfMyPointOfDoorSets: [[PointOfDoor]] = [

        // 第一个门（默认门）
        [
            // ⚠️下面两个门角，输入时应确保z坐标相同
            PointOfDoor(x: 0, y: 0, z: 0),
            PointOfDoor(x: 1.5, y: 0, z: 0),
            // ⚠️上面两个门角，输入时应确保z坐标相同
            PointOfDoor(x: 1.5, y: 0, z: 3),
            PointOfDoor(x: 0, y: 0, z: 3)],

        // 第二个门
        [
            // ⚠️下面两个门角，输入时应确保z坐标相同
            PointOfDoor(x: 0, y: room.widthOfRoom, z: 0),
            PointOfDoor(x: 0, y: 8.5, z: 0),
            // ⚠️上面两个门角，输入时应确保z坐标相同
            PointOfDoor(x: 0, y: 8.5, z: 3),
            PointOfDoor(x: 0, y: room.widthOfRoom, z: 3)],

        // 第三个门
        [
            // ⚠️下面两个门角，输入时应确保z坐标相同
            PointOfDoor(x: room.lengthOfRoom, y: room.widthOfRoom, z: 0),
            PointOfDoor(x: room.heightOfRoom, y: 8.5, z: 0),
            // ⚠️上面两个门角，输入时应确保z坐标相同
            PointOfDoor(x: room.lengthOfRoom, y: 8.5, z: 4.3),
            PointOfDoor(x: room.lengthOfRoom, y: room.widthOfRoom, z: 4.3)],

        // -> 在这里插入新增的门的点的数组的集合

    ]

    print("######### 第二步：门创建好了 ############")

    // 依次输出一个门上的各个门角三维坐标到控制台
    for (index, value) in setsOfMyPointOfDoorSets[indexOfMyPointOfDoorSets].enumerated() {
        print("门角\(index+1) -> \(value)")
    }

    print()

    // 选取第几个门，对应其门的点的数组集合中的数组集合的索引
    return setsOfMyPointOfDoorSets[indexOfMyPointOfDoorSets]
}
