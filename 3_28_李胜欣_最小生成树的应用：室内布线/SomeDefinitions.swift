
/**********  一些相关变量的定义 **********/

// 自定义字符串可转换协议CustomStringConvertible
// 房子的长，宽，高的结构体
public struct Room: CustomStringConvertible {
    public var lengthOfRoom: Double // 房间的长
    public var widthOfRoom: Double // 房间的宽
    public var heightOfRoom: Double // 房间的高
    public var description: String {
        return "房子 -> [长 \(lengthOfRoom) 宽 \(widthOfRoom) 高 \(heightOfRoom)]\n"
    }
}

// 门角的一组三维坐标的结构体
public struct PointOfDoor: CustomStringConvertible {
    public var x: Double // 门角x坐标
    public var y: Double // 门的y坐标
    public var z: Double // 门的z坐标
    public var description: String {
        return "(x:\(x) y:\(y) z:\(z))"
    }
}

// 含有一组三维坐标的插座的结构体
public struct Outlet: CustomStringConvertible {
    public var x: Double // 插座坐标x
    public var y: Double // 插座坐标y
    public var z: Double // 插座坐标z
    public var description: String {
        return "(x:\(x) y:\(y) z:\(z))"
    }
}

// 插线含头尾两端两个插座和权值的结构体
public struct Wire<T>: CustomStringConvertible {
    public let head: T
    public let tail: T
    public let weight: Double
    public var description: String {
        return "[\(head)-\(tail), \(weight)]"
    }
}

