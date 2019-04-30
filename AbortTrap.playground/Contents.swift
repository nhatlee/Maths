func foo(extraData: (type: Int, appId: Int)?) {
    if let data = extraData {
        print(data.type)
        print(data.appId)
    }
}

foo(extraData: (10, 11))
