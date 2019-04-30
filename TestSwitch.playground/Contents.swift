protocol RemoteConfigParameters {}
protocol CorelibInitialProtocol {
    var remoteConfigParams: RemoteConfigParameters?{get}
    func initService(param: RemoteConfigParameters, baseURL: String)
}

final class RemoteConfig: CorelibInitialProtocol {
    static let shared = RemoteConfig()
    var remoteConfigParams: RemoteConfigParameters?
    
    func initService(param: RemoteConfigParameters, baseURL: String) {
        remoteConfigParams = param
    }
}


final class KVS: CorelibInitialProtocol {
    static let shared = KVS()
    var remoteConfigParams: RemoteConfigParameters?
    func initService(param: RemoteConfigParameters, baseURL: String) {
        remoteConfigParams = param
    }
}


final class BaseCorelib {
    static func register(param: RemoteConfigParameters, baseURL: String, services: CorelibInitialProtocol...) {
        services.forEach({
            $0.initService(param: param, baseURL: baseURL)
        })
    }
    
    static func resetServiceAPI(services: CorelibInitialProtocol...) {
        services.forEach({_ in
            //TODO
        })
    }
}

class Foo: RemoteConfigParameters {
    
}
BaseCorelib.register(param: Foo(), baseURL: " ",
                     services: RemoteConfig.shared,
                     KVS.shared)



