import Foundation

@objc(RNDeviceKit)
class RNDeviceKit: RCTEventEmitter {
  private typealias `Self` = RNDeviceKit
  
  static let MODULE_NAME = "RNDeviceKit"
  
  static let INIT_ERROR = "INIT_ERROR"
  static let PAIR_ERROR = "PAIR_ERROR"
  static let UNKNOWN_ERROR = "UNKNOWN_ERROR"
  
  static let UNKOWN_ERROR_MSG = "Unknown runtime Objective-C error (RNDeviceKit)."
  
  static let DATA_EVENT = "data"
  static let DEVICE_FOUND_EVENT = "deviceFound"
  static let DEVICE_CONNECTED_EVENT = "deviceConnected"
  static let DEVICE_DISCONNECTED_EVENT = "deviceDisconnected"
  static let AMBIGUOUS_DEVICE_FOUND_EVENT = "ambiguousDeviceFound"
  static let SCAN_FINISHED_EVENT = "scanFinished"
  static let COLLECTION_FINISHED_EVENT = "collectionFinished"
  
  override func constantsToExport() -> [AnyHashable : Any] {
    return [
      "EVENTS": supportedEvents()
    ]
  }
  
  private var scannerToken: ScannerStopToken? = nil
  private var collectionToken: CollectorStopToken? = nil
  private var cancellationTokens: Array<DeviceAddingCancellationToken> = []
  
  private var scanerHandler: ScannerCallback?
  private var addDeviceHandler: AddDeviceCallback?
  private var dataHandler: DataCallback?
  private var deviceStatusHandler: DeviceStatusCallback?
  
  private var foundDevices: Array<DeviceInfo> = []
  
  private func emitEvent(_ eventName: String, withData data: Any?) {
    print(Self.MODULE_NAME, "Send \(eventName) event.")
    sendEvent(withName: eventName, body: data)
  }
  
  private func mapDeviceDescription(_ device: DeviceInfo) -> [String: Any] {
    return [
      "id": device.sku,
      "address": device.address,
      "name": device.name,
      "modelName": device.modelName,
      "manufacturer": device.manufacturer
    ]
  }
  
  @objc func initialize(_ key: String,
                        resolver resolve: RCTPromiseResolveBlock,
                        rejecter reject: RCTPromiseRejectBlock) {
    do {
      try ObjC.catchException {
        MedMDeviceKit.init(key)
      }
      resolve(nil)
    } catch {
      let msg = "Incorrect license key \"\(key)\" for MedM DeviceKit."
      reject(Self.INIT_ERROR, msg, error)
    }
  }
  
  private class ScanerHandler: NSObject, ScannerCallback {
    let onNewDeviceFoundDelegate: (DeviceInfo) -> ()
    let onAmbiguousDeviceFoundDelegate: (Array<DeviceInfo>) -> ()
    let onScanFinishedDelegate: () -> ()
    
    func onNewDeviceFound(_ device: DeviceInfo!) { onNewDeviceFoundDelegate(device) }
    func onAmbiguousDeviceFound(_ devices: Array<DeviceInfo>) { onAmbiguousDeviceFoundDelegate(devices) }
    func onScanFinished() { onScanFinishedDelegate() }
    
    init(onNewDeviceFound: @escaping (DeviceInfo) -> (),
         onAmbiguousDeviceFound: @escaping (Array<DeviceInfo>) -> (),
         onScanFinished: @escaping () -> ()) {
      self.onNewDeviceFoundDelegate = onNewDeviceFound
      self.onAmbiguousDeviceFoundDelegate = onAmbiguousDeviceFound
      self.onScanFinishedDelegate = onScanFinished
    }
  }
  
  @objc func startScan(_ resolve: RCTPromiseResolveBlock,
                       rejecter reject: RCTPromiseRejectBlock) {
    do {
      print(Self.MODULE_NAME, "Start scanning for devices.")
      scanerHandler = ScanerHandler(
        onNewDeviceFound: {
          device in
          self.foundDevices.append(device)
          self.emitEvent(Self.DEVICE_FOUND_EVENT, withData: self.mapDeviceDescription(device))
        },
        onAmbiguousDeviceFound: {
          devices in
          for d in devices {
            self.emitEvent(Self.AMBIGUOUS_DEVICE_FOUND_EVENT, withData: self.mapDeviceDescription(d))
          }
        },
        onScanFinished: { self.emitEvent(Self.SCAN_FINISHED_EVENT, withData: nil) }
      )
      try ObjC.catchException {
        self.scannerToken = MedMDeviceKit.getScanner().start(self.scanerHandler)
      }
      resolve(nil)
    } catch {
      reject(Self.UNKNOWN_ERROR, Self.UNKOWN_ERROR_MSG, error)
    }
  }
  
  @objc func stopScan(_ resolve: RCTPromiseResolveBlock,
                      rejecter reject: RCTPromiseRejectBlock) {
    do {
      print(Self.MODULE_NAME, "Stop scanning for devices.")
      try ObjC.catchException {
        self.scannerToken?.stopScan()
      }
      resolve(nil)
    } catch {
      reject(Self.UNKNOWN_ERROR, Self.UNKOWN_ERROR_MSG, error)
    }
  }
  
  private class AddDeviceHandler: NSObject, AddDeviceCallback {
    let onSuccessDelegate: (DeviceInfo) -> ()
    let onFailureDelegate: (DeviceInfo) -> ()
    
    func onSuccess(_ device: DeviceInfo!) { onSuccessDelegate(device) }
    func onFailure(_ device: DeviceInfo!) { onFailureDelegate(device) }
    
    init(onSuccess: @escaping (DeviceInfo) -> (),
         onFailure: @escaping (DeviceInfo) -> ()) {
      self.onSuccessDelegate = onSuccess
      self.onFailureDelegate = onFailure
    }
  }
  
  @objc func addDevice(_ sku: Int,
                       resolver resolve: @escaping RCTPromiseResolveBlock,
                       rejecter reject: @escaping RCTPromiseRejectBlock) {
    do {
      let device = foundDevices.first{ $0.sku == NSNumber(value: sku) }!
      print(Self.MODULE_NAME, "Pair \(device.modelName) device with \(device.sku) SKU.")
      addDeviceHandler = AddDeviceHandler(
        onSuccess: { device in resolve(nil) },
        onFailure: {
          device in
          let msg = "The device could not be paired: SKU \(device.sku), MAC \(device.address)."
          reject(Self.PAIR_ERROR, msg, NSError(domain: "", code: 0, userInfo: [ NSLocalizedDescriptionKey: msg ]))
        }
      )
      try ObjC.catchException {
        self.cancellationTokens.append(MedMDeviceKit.getDeviceManager().addDevice(self.addDeviceHandler, device))
      }
    } catch {
      reject(Self.UNKNOWN_ERROR, Self.UNKOWN_ERROR_MSG, error)
    }
  }
  
  @objc func removeDevice(_ address: String,
                          resolver resolve: RCTPromiseResolveBlock,
                          rejecter reject: RCTPromiseRejectBlock) {
    do {
      print(Self.MODULE_NAME, "Remove device with \(address) address.")
      try ObjC.catchException {
        MedMDeviceKit.getDeviceManager().removeDevice(byAddress: address)
      }
      resolve(nil)
    } catch {
      reject(Self.UNKNOWN_ERROR, Self.UNKOWN_ERROR_MSG, error)
    }
  }
  
  @objc func listDevices(_ resolve: @escaping RCTPromiseResolveBlock,
                         rejecter reject: RCTPromiseRejectBlock) {
    do {
      try ObjC.catchException {
        resolve(MedMDeviceKit.getDeviceManager().getDevicesList().map { self.mapDeviceDescription($0) })
      }
    } catch {
      reject(Self.UNKNOWN_ERROR, Self.UNKOWN_ERROR_MSG, error)
    }
    
  }
  
  @objc func cancelPairings(_ resolve: RCTPromiseResolveBlock,
                            rejecter reject: RCTPromiseRejectBlock) {
    do {
      print(Self.MODULE_NAME, "Cancel all pairings.")
      try ObjC.catchException {
        for token in self.cancellationTokens { token.cancel() }
      }
      resolve(nil)
    } catch {
      reject(Self.UNKNOWN_ERROR, Self.UNKOWN_ERROR_MSG, error)
    }
  }
  
  private class DataHandler: NSObject, DataCallback {
    let onNewDataDelegate: (DeviceInfo?, String) -> ()
    let onDataCollectionStoppedDelegate: () -> ()
    
    func onNewData(_ source: DeviceInfo?, _ reading: String) { onNewDataDelegate(source, reading) }
    func onDataCollectionStopped() { onDataCollectionStoppedDelegate() }
    
    init(onNewData: @escaping (DeviceInfo?, String) -> (),
         onDataCollectionStopped: @escaping () -> ()) {
      self.onNewDataDelegate = onNewData
      self.onDataCollectionStoppedDelegate = onDataCollectionStopped
    }
  }
  
  private class DeviceStatusHandler: NSObject, DeviceStatusCallback {
    let onConnectedDelegate: (DeviceInfo) -> ()
    let onDisconnectedDelegate: (DeviceInfo) -> ()
    
    func onConnected(_ device: DeviceInfo!) { onConnectedDelegate(device) }
    func onDisconnected(_ device: DeviceInfo!) { onDisconnectedDelegate(device) }
    
    init(onConnected: @escaping (DeviceInfo) -> (),
         onDisconnected: @escaping (DeviceInfo) -> ()) {
      self.onConnectedDelegate = onConnected
      self.onDisconnectedDelegate = onDisconnected
    }
  }
  
  @objc func startCollection(_ resolve: RCTPromiseResolveBlock,
                             rejecter reject: RCTPromiseRejectBlock) {
    do {
      print(Self.MODULE_NAME, "Start data collection.")
      dataHandler = DataHandler(
        onNewData: {
          device, reading in
          let deviceMap = device != nil ? self.mapDeviceDescription(device!) : nil
          let data: [String: Any?] = ["data": reading, "device": deviceMap]
          self.emitEvent(Self.DATA_EVENT, withData: data)
        },
        onDataCollectionStopped: { self.emitEvent(Self.COLLECTION_FINISHED_EVENT, withData: nil) }
      )
      deviceStatusHandler = DeviceStatusHandler(
        onConnected: {
          device in
          self.emitEvent(Self.DEVICE_CONNECTED_EVENT, withData: self.mapDeviceDescription(device))
        },
        onDisconnected: {
          device in
          self.emitEvent(Self.DEVICE_DISCONNECTED_EVENT, withData: self.mapDeviceDescription(device))
        }
      )
      try ObjC.catchException {
        self.collectionToken = MedMDeviceKit.getCollector().start(self.dataHandler, self.deviceStatusHandler)
      }
      resolve(nil)
    } catch {
      reject(Self.UNKNOWN_ERROR, Self.UNKOWN_ERROR_MSG, error)
    }
  }
  
  @objc func stopCollection(_ resolve: RCTPromiseResolveBlock,
                            rejecter reject: RCTPromiseRejectBlock) {
    do {
      print(Self.MODULE_NAME, "Stop data collection.")
      try ObjC.catchException {
        self.collectionToken?.stopCollect()
      }
      resolve(nil)
    } catch {
      reject(Self.UNKNOWN_ERROR, Self.UNKOWN_ERROR_MSG, error)
    }
  }
  
  override func supportedEvents() -> [String]! {
    return [
      Self.DATA_EVENT, Self.DEVICE_FOUND_EVENT, Self.DEVICE_CONNECTED_EVENT,
      Self.DEVICE_DISCONNECTED_EVENT, Self.AMBIGUOUS_DEVICE_FOUND_EVENT,
      Self.SCAN_FINISHED_EVENT, Self.COLLECTION_FINISHED_EVENT
    ]
  }
  
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
