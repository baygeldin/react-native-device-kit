[react-native-device-kit](../README.md) > [DeviceKit](../classes/devicekit.md)

# Class: DeviceKit

## Hierarchy

 `EventEmitter`

**↳ DeviceKit**

## Index

### Constructors

* [constructor](devicekit.md#constructor)

### Properties

* [defaultMaxListeners](devicekit.md#defaultmaxlisteners)

### Methods

* [addDevice](devicekit.md#adddevice)
* [addListener](devicekit.md#addlistener)
* [cancelPairings](devicekit.md#cancelpairings)
* [emit](devicekit.md#emit)
* [eventNames](devicekit.md#eventnames)
* [fetchDevices](devicekit.md#fetchdevices)
* [getMaxListeners](devicekit.md#getmaxlisteners)
* [listenerCount](devicekit.md#listenercount)
* [listeners](devicekit.md#listeners)
* [off](devicekit.md#off)
* [on](devicekit.md#on)
* [once](devicekit.md#once)
* [prependListener](devicekit.md#prependlistener)
* [prependOnceListener](devicekit.md#prependoncelistener)
* [rawListeners](devicekit.md#rawlisteners)
* [register](devicekit.md#register)
* [removeAllListeners](devicekit.md#removealllisteners)
* [removeDevice](devicekit.md#removedevice)
* [removeListener](devicekit.md#removelistener)
* [setMaxListeners](devicekit.md#setmaxlisteners)
* [startCollection](devicekit.md#startcollection)
* [startScan](devicekit.md#startscan)
* [stopCollection](devicekit.md#stopcollection)
* [stopScan](devicekit.md#stopscan)
* [listenerCount](devicekit.md#listenercount-1)

---

## Constructors

<a id="constructor"></a>

###  constructor

⊕ **new DeviceKit**(): [DeviceKit](devicekit.md)

*Defined in [index.ts:50](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L50)*

**Returns:** [DeviceKit](devicekit.md)

___

## Properties

<a id="defaultmaxlisteners"></a>

### `<Static>` defaultMaxListeners

**● defaultMaxListeners**: *`number`*

*Inherited from EventEmitter.defaultMaxListeners*

*Defined in node_modules/@types/node/index.d.ts:1012*

___

## Methods

<a id="adddevice"></a>

###  addDevice

▸ **addDevice**(device: *[Device](../interfaces/device.md)*): `Promise`<`void`>

*Defined in [index.ts:73](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L73)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| device | [Device](../interfaces/device.md) |

**Returns:** `Promise`<`void`>

___
<a id="addlistener"></a>

###  addListener

▸ **addListener**(event: * `string` &#124; `symbol`*, listener: *`function`*): `this`

*Inherited from EventEmitter.addListener*

*Overrides EventEmitter.addListener*

*Defined in node_modules/@types/node/index.d.ts:1014*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event |  `string` &#124; `symbol`|
| listener | `function` |

**Returns:** `this`

___
<a id="cancelpairings"></a>

###  cancelPairings

▸ **cancelPairings**(): `Promise`<`void`>

*Defined in [index.ts:85](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L85)*

**Returns:** `Promise`<`void`>

___
<a id="emit"></a>

###  emit

▸ **emit**(event: *[DATA](../#data)*, data: *[Reading](../interfaces/reading.md)*): `boolean`

▸ **emit**(event: *[DEVICE_EVENTS](../#device_events)*, data: *[Device](../interfaces/device.md)*): `boolean`

▸ **emit**(event: *[STATE_EVENTS](../#state_events)*): `boolean`

*Overrides EventEmitter.emit*

*Defined in [index.ts:43](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L43)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event | [DATA](../#data) |
| data | [Reading](../interfaces/reading.md) |

**Returns:** `boolean`

*Overrides EventEmitter.emit*

*Defined in [index.ts:44](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L44)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event | [DEVICE_EVENTS](../#device_events) |
| data | [Device](../interfaces/device.md) |

**Returns:** `boolean`

*Overrides EventEmitter.emit*

*Defined in [index.ts:45](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L45)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event | [STATE_EVENTS](../#state_events) |

**Returns:** `boolean`

___
<a id="eventnames"></a>

###  eventNames

▸ **eventNames**(): `Array`< `string` &#124; `symbol`>

*Inherited from EventEmitter.eventNames*

*Overrides EventEmitter.eventNames*

*Defined in node_modules/@types/node/index.d.ts:1027*

**Returns:** `Array`< `string` &#124; `symbol`>

___
<a id="fetchdevices"></a>

###  fetchDevices

▸ **fetchDevices**(): `Promise`<[Device](../interfaces/device.md)[]>

*Defined in [index.ts:81](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L81)*

**Returns:** `Promise`<[Device](../interfaces/device.md)[]>

___
<a id="getmaxlisteners"></a>

###  getMaxListeners

▸ **getMaxListeners**(): `number`

*Inherited from EventEmitter.getMaxListeners*

*Overrides EventEmitter.getMaxListeners*

*Defined in node_modules/@types/node/index.d.ts:1023*

**Returns:** `number`

___
<a id="listenercount"></a>

###  listenerCount

▸ **listenerCount**(type: * `string` &#124; `symbol`*): `number`

*Inherited from EventEmitter.listenerCount*

*Overrides EventEmitter.listenerCount*

*Defined in node_modules/@types/node/index.d.ts:1028*

**Parameters:**

| Param | Type |
| ------ | ------ |
| type |  `string` &#124; `symbol`|

**Returns:** `number`

___
<a id="listeners"></a>

###  listeners

▸ **listeners**(event: * `string` &#124; `symbol`*): `Function`[]

*Inherited from EventEmitter.listeners*

*Overrides EventEmitter.listeners*

*Defined in node_modules/@types/node/index.d.ts:1024*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event |  `string` &#124; `symbol`|

**Returns:** `Function`[]

___
<a id="off"></a>

###  off

▸ **off**(event: * `string` &#124; `symbol`*, listener: *`function`*): `this`

*Inherited from EventEmitter.off*

*Overrides EventEmitter.off*

*Defined in node_modules/@types/node/index.d.ts:1020*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event |  `string` &#124; `symbol`|
| listener | `function` |

**Returns:** `this`

___
<a id="on"></a>

###  on

▸ **on**(event: *[DATA](../#data)*, fn: *`function`*): `this`

▸ **on**(event: *[DEVICE_EVENTS](../#device_events)*, fn: *`function`*): `this`

▸ **on**(event: *[STATE_EVENTS](../#state_events)*, fn: *`function`*): `this`

*Overrides EventEmitter.on*

*Defined in [index.ts:37](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L37)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event | [DATA](../#data) |
| fn | `function` |

**Returns:** `this`

*Overrides EventEmitter.on*

*Defined in [index.ts:38](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L38)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event | [DEVICE_EVENTS](../#device_events) |
| fn | `function` |

**Returns:** `this`

*Overrides EventEmitter.on*

*Defined in [index.ts:39](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L39)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event | [STATE_EVENTS](../#state_events) |
| fn | `function` |

**Returns:** `this`

___
<a id="once"></a>

###  once

▸ **once**(event: *[DATA](../#data)*, fn: *`function`*): `this`

▸ **once**(event: *[DEVICE_EVENTS](../#device_events)*, fn: *`function`*): `this`

▸ **once**(event: *[STATE_EVENTS](../#state_events)*, fn: *`function`*): `this`

*Overrides EventEmitter.once*

*Defined in [index.ts:40](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L40)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event | [DATA](../#data) |
| fn | `function` |

**Returns:** `this`

*Overrides EventEmitter.once*

*Defined in [index.ts:41](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L41)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event | [DEVICE_EVENTS](../#device_events) |
| fn | `function` |

**Returns:** `this`

*Overrides EventEmitter.once*

*Defined in [index.ts:42](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L42)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event | [STATE_EVENTS](../#state_events) |
| fn | `function` |

**Returns:** `this`

___
<a id="prependlistener"></a>

###  prependListener

▸ **prependListener**(event: * `string` &#124; `symbol`*, listener: *`function`*): `this`

*Inherited from EventEmitter.prependListener*

*Overrides EventEmitter.prependListener*

*Defined in node_modules/@types/node/index.d.ts:1017*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event |  `string` &#124; `symbol`|
| listener | `function` |

**Returns:** `this`

___
<a id="prependoncelistener"></a>

###  prependOnceListener

▸ **prependOnceListener**(event: * `string` &#124; `symbol`*, listener: *`function`*): `this`

*Inherited from EventEmitter.prependOnceListener*

*Overrides EventEmitter.prependOnceListener*

*Defined in node_modules/@types/node/index.d.ts:1018*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event |  `string` &#124; `symbol`|
| listener | `function` |

**Returns:** `this`

___
<a id="rawlisteners"></a>

###  rawListeners

▸ **rawListeners**(event: * `string` &#124; `symbol`*): `Function`[]

*Inherited from EventEmitter.rawListeners*

*Overrides EventEmitter.rawListeners*

*Defined in node_modules/@types/node/index.d.ts:1025*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event |  `string` &#124; `symbol`|

**Returns:** `Function`[]

___
<a id="register"></a>

###  register

▸ **register**(key: *`string`*): `Promise`<`void`>

*Defined in [index.ts:61](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L61)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| key | `string` |

**Returns:** `Promise`<`void`>

___
<a id="removealllisteners"></a>

###  removeAllListeners

▸ **removeAllListeners**(event: *[EVENTS](../#events)*): `this`

*Overrides EventEmitter.removeAllListeners*

*Defined in [index.ts:47](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L47)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event | [EVENTS](../#events) |

**Returns:** `this`

___
<a id="removedevice"></a>

###  removeDevice

▸ **removeDevice**(device: *[Device](../interfaces/device.md)*): `Promise`<`void`>

*Defined in [index.ts:77](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L77)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| device | [Device](../interfaces/device.md) |

**Returns:** `Promise`<`void`>

___
<a id="removelistener"></a>

###  removeListener

▸ **removeListener**(event: *[EVENTS](../#events)*, fn: *`function`*): `this`

*Overrides EventEmitter.removeListener*

*Defined in [index.ts:46](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L46)*

**Parameters:**

| Param | Type |
| ------ | ------ |
| event | [EVENTS](../#events) |
| fn | `function` |

**Returns:** `this`

___
<a id="setmaxlisteners"></a>

###  setMaxListeners

▸ **setMaxListeners**(n: *`number`*): `this`

*Inherited from EventEmitter.setMaxListeners*

*Overrides EventEmitter.setMaxListeners*

*Defined in node_modules/@types/node/index.d.ts:1022*

**Parameters:**

| Param | Type |
| ------ | ------ |
| n | `number` |

**Returns:** `this`

___
<a id="startcollection"></a>

###  startCollection

▸ **startCollection**(): `Promise`<`void`>

*Defined in [index.ts:89](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L89)*

**Returns:** `Promise`<`void`>

___
<a id="startscan"></a>

###  startScan

▸ **startScan**(): `Promise`<`void`>

*Defined in [index.ts:65](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L65)*

**Returns:** `Promise`<`void`>

___
<a id="stopcollection"></a>

###  stopCollection

▸ **stopCollection**(): `Promise`<`void`>

*Defined in [index.ts:93](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L93)*

**Returns:** `Promise`<`void`>

___
<a id="stopscan"></a>

###  stopScan

▸ **stopScan**(): `Promise`<`void`>

*Defined in [index.ts:69](https://github.com/baygeldin/react-native-device-kit/blob/a5cf411/index.ts#L69)*

**Returns:** `Promise`<`void`>

___
<a id="listenercount-1"></a>

### `<Static>` listenerCount

▸ **listenerCount**(emitter: *`EventEmitter`*, event: * `string` &#124; `symbol`*): `number`

*Inherited from EventEmitter.listenerCount*

*Defined in node_modules/@types/node/index.d.ts:1011*

*__deprecated__*: since v4.0.0

**Parameters:**

| Param | Type |
| ------ | ------ |
| emitter | `EventEmitter` |
| event |  `string` &#124; `symbol`|

**Returns:** `number`

___

