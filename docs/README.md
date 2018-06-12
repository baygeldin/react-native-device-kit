
#  react-native-device-kit

## Index

### Classes

* [DeviceKit](classes/devicekit.md)

### Interfaces

* [Device](interfaces/device.md)
* [Reading](interfaces/reading.md)

### Type aliases

* [AMBIGUOUS_DEVICE_FOUND](#ambiguous_device_found)
* [COLLECTION_FINISHED](#collection_finished)
* [DATA](#data)
* [DEVICE_CONNECTED](#device_connected)
* [DEVICE_DISCONNECTED](#device_disconnected)
* [DEVICE_EVENTS](#device_events)
* [DEVICE_FOUND](#device_found)
* [EVENTS](#events)
* [SCAN_FINISHED](#scan_finished)
* [STATE_EVENTS](#state_events)

### Variables

* [deviceKitModule](#devicekitmodule)
* [eventEmitter](#eventemitter)

---

## Type aliases

<a id="ambiguous_device_found"></a>

###  AMBIGUOUS_DEVICE_FOUND

**ΤAMBIGUOUS_DEVICE_FOUND**: *"ambiguousDeviceFound"*

*Defined in [index.ts:21](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L21)*

___
<a id="collection_finished"></a>

###  COLLECTION_FINISHED

**ΤCOLLECTION_FINISHED**: *"collectionFinished"*

*Defined in [index.ts:23](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L23)*

___
<a id="data"></a>

###  DATA

**ΤDATA**: *"data"*

*Defined in [index.ts:17](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L17)*

___
<a id="device_connected"></a>

###  DEVICE_CONNECTED

**ΤDEVICE_CONNECTED**: *"deviceConnected"*

*Defined in [index.ts:19](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L19)*

___
<a id="device_disconnected"></a>

###  DEVICE_DISCONNECTED

**ΤDEVICE_DISCONNECTED**: *"deviceDisconnected"*

*Defined in [index.ts:20](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L20)*

___
<a id="device_events"></a>

###  DEVICE_EVENTS

**ΤDEVICE_EVENTS**: * [DEVICE_FOUND](#device_found) &#124; [DEVICE_CONNECTED](#device_connected) &#124; [DEVICE_DISCONNECTED](#device_disconnected) &#124; [AMBIGUOUS_DEVICE_FOUND](#ambiguous_device_found)
*

*Defined in [index.ts:24](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L24)*

___
<a id="device_found"></a>

###  DEVICE_FOUND

**ΤDEVICE_FOUND**: *"deviceFound"*

*Defined in [index.ts:18](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L18)*

___
<a id="events"></a>

###  EVENTS

**ΤEVENTS**: * [DATA](#data) &#124; [DEVICE_EVENTS](#device_events) &#124; [STATE_EVENTS](#state_events)
*

*Defined in [index.ts:30](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L30)*
*Defined in [index.ts:34](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L34)*

___
<a id="scan_finished"></a>

###  SCAN_FINISHED

**ΤSCAN_FINISHED**: *"scanFinished"*

*Defined in [index.ts:22](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L22)*

___
<a id="state_events"></a>

###  STATE_EVENTS

**ΤSTATE_EVENTS**: * [SCAN_FINISHED](#scan_finished) &#124; [COLLECTION_FINISHED](#collection_finished)
*

*Defined in [index.ts:29](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L29)*

___

## Variables

<a id="devicekitmodule"></a>

### `<Const>` deviceKitModule

**● deviceKitModule**: *`any`* =  NativeModules.RNDeviceKit

*Defined in [index.ts:32](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L32)*

___
<a id="eventemitter"></a>

### `<Const>` eventEmitter

**● eventEmitter**: *`EventEmitter`* =  new NativeEventEmitter(deviceKitModule)

*Defined in [index.ts:33](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L33)*

___

