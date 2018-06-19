
/// 顺序3 一组插座的创建

func myOutletSetsGroups(_ indexOfOutletSets: Int, _ room: Room) -> [Outlet] {

    var setsOfOutletSets: [[Outlet]] = [

        // 第一组插座集合（默认插座集合组）
        [
            Outlet(x: 0, y: 1, z: 3.3), // 插座1 [0]
            Outlet(x: 2.5, y: 0, z: 2), // 插座2 [1]
            Outlet(x: 5, y: 0, z: 0.8), // 插座3 [2]
            Outlet(x: 5, y: 10, z: 1), // 插座4 [3]
            // -> 在这里给第一组的插座集合中插入新增的插座
        ],

        // 第二组插座集合
        [
            Outlet(x: 1, y: room.widthOfRoom, z: 3.3), // 插座1 [0]
            Outlet(x: 0, y: 7.5, z: 2), // 插座2 [1]
            Outlet(x: myRoom.lengthOfRoom, y: 5.5, z: 0.8), // 插座3 [2]
            Outlet(x: room.lengthOfRoom, y: 5, z: 3), // 插座4 [3]
            Outlet(x: 6, y: myRoom.widthOfRoom, z: 5), // 插座5 [4]
            // -> 在这里给第二组的插座集合中插入新增的插座
        ],

        // 第三组插座集合
        [
            Outlet(x: 1, y: room.widthOfRoom, z: 3.3), // 插座1 [0]
            Outlet(x: 0, y: 9.5, z: 2), // 插座2 [1]
            Outlet(x: 0, y: 5, z: 3.2), // 插座3 [2]
            Outlet(x: room.lengthOfRoom, y: 5, z: 2.7), // 插座4 [3]
            Outlet(x: 6, y: myRoom.widthOfRoom, z: 5), // 插座5 [4]
            Outlet(x: myRoom.lengthOfRoom, y: 6, z: 3), // 插座6 [7]
            Outlet(x: 8, y: 0, z: 0.1), // 插座7 [8]
            Outlet(x: 4, y: 0, z: 7), // 插座8 [9]
            Outlet(x: 1.5, y: myRoom.widthOfRoom, z: 5), // 插座9 [10]
            Outlet(x: myRoom.lengthOfRoom, y: 4, z: 5), // 插座10 [11]
            Outlet(x: 6, y: myRoom.widthOfRoom, z: 8), // 插座11 [12]
            Outlet(x: myRoom.lengthOfRoom, y: 7, z: myRoom.heightOfRoom), // 插座12 [13]
            Outlet(x: 0, y: myRoom.widthOfRoom, z: 9), // 插座13 [14]
            Outlet(x: 1, y: 0, z: 9), // 插座14 [15]
            Outlet(x: 0, y: 5.9, z: 2.8), // 插座15 [16]
            Outlet(x: 5.6, y: myRoom.widthOfRoom, z: 1), // 插座16 [12]
            Outlet(x: 0, y: 8.4, z: 5.2), // 插座17 [13]
            Outlet(x: 3, y: myRoom.widthOfRoom, z: 4.7), // 插座18 [14]
            Outlet(x: myRoom.lengthOfRoom, y: 2.6, z: 8), // 插座19 [15]
            Outlet(x: myRoom.lengthOfRoom, y: 8, z: 2.8), // 插座20 [16]
            // -> 在这里给第三组的插座集合中插入新增的插座
        ]

        // -> 在这里插入新增的一组插座集合

    ]

    // 异常检查代码
    for index in setsOfOutletSets[indexOfOutletSets] {
        if index.x < 0 || index.y < 0 || index.z < 0 {
            print("❌出现负值，请重新修改原来插座1的坐标的值，覆盖原来的值，再继续编译程序\n")
        } else if index.x > room.lengthOfRoom || index.y > room.widthOfRoom || index.z > room.heightOfRoom {
            print("❌超出范围，请重新修改原来插座1的坐标的值，覆盖原来的值，再继续编译程序\n")
        } else {
            continue
        }
    }

    print("######### 第三步：插座创建好了 ###########")

    // 依次输出一组插座中各个插座的三维坐标到控制台
    for (index, value) in setsOfOutletSets[indexOfOutletSets].enumerated() {
        print("插座\(index+1) -> \(value)")
    }

    print()

    return setsOfOutletSets[indexOfOutletSets]
}


