# react-native-device-kit

A React Native wrapper for [MedM DeviceKit SDK](https://www.medm.com/sdk/). It allows to seamlessly connect to a great deal of medical sensors via Bluetooth and get such data as heart rate, blood pressure, temperature, spirometry, etc. And with React Native it's even better! Just think about it: one codebase that works on both major platforms (iOS and Android) and supports lots of medical devices right out of the box! Note that this is just a wrapper, so in order to use it you still have to purchase the original library.

## Getting started

```
$ npm install react-native-device-kit --save
```

### Injecting the MedM DeviceKit

In order for `react-native-device-kit` to work you have to provide the original MedM DeviceKit library:

```
$ npx inject-device-kit --android /path/to/MedMDeviceKit.aar --ios /path/to/MedMDeviceKit.framework
```

You could as well add it to your `package.json` scripts:

```
"postinstall": "inject-device-kit --android /path/to/MedMDeviceKit.aar --ios /path/to/MedMDeviceKit.framework"
```

Also, don't forget to embed MedM DeviceKit binaries into your application. In order to do that add `MedMDeviceKit.framework` to your project in Xcode, then in "General" tab of your target add it to "Embedded Binaries" section.

### Mostly automatic installation

```
$ react-native link
```

Alternatively:

```
$ react-native link react-native-device-kit
$ react-native link react-native-swift
```

Yes, `react-native-swift` peer dependency is required unless you already use Swift in your project.

### Manual installation

#### iOS

1.  In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2.  Go to `node_modules` ➜ `react-native-device-kit` and add `RNDeviceKit.xcodeproj`
3.  In XCode, in the project navigator, select your project. Add `libRNDeviceKit.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4.  Add `$(PROJECT_DIR)/../node_modules/react-native-device-kit/ios/Frameworks` to `FRAMEWORK_SEARCH_PATHS`.
5.  Run your project (`Cmd+R`)<

#### Android

1.  Open up `android/app/src/main/java/[...]/MainActivity.java`

- Add `import com.reactnative.devicekit.RNDeviceKitPackage;` to the imports at the top of the file
- Add `new RNDeviceKitPackage()` to the list returned by the `getPackages()` method

2.  Append the following lines to `android/settings.gradle`:
    ```
    include ':react-native-device-kit'
    project(':react-native-device-kit').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-device-kit/android')
    ```
3.  Insert the following lines inside the dependencies block in `android/app/build.gradle`:
    ```
      compile project(':react-native-device-kit')
    ```
4.  Add the following repository to your app level `build.gradle`:
    ```gradle
    repositories{
        flatDir{
            dirs "$rootDir/../node_modules/react-native-device-kit/android/libs"
        }
    }
    ```

## Usage

```javascript
import DeviceKit from 'react-native-device-kit';

const sdk = new DeviceKit()

sdk.register(process.env.MEDM_DEVICEKIT_LICENSE_KEY)
  .then(() => {
    // You're good to go.
  })
  .catch(() => {
    // Don't forget to provide a licence key!
  });
```

Check out the full API in [docs](docs).

## Notes

- There are no tests (_sigh_). MedM DeviceKit SDK itself is well tested, but writing tests for a wrapper is just too much pain: it needs a test react native app, SDK mock and also RNDeviceKit native module mock to test JavaScript side. Another solution is to use AWS Device Farm, but it's not free.
- If you're planning to use stream measurements (as opposed to scalar measurements like blood glucose) then you'll probably need your app to work in background. For Android you would have to create a [foreground service](https://developer.android.com/guide/components/services#Foreground). On iOS [it's easier](https://developer.apple.com/library/content/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/BackgroundExecution/BackgroundExecution.html): just add `bluetooth-central` mode to your `Info.plist`.
- Currently MedM DeviceKit returns measurements only as XML (documented [here](https://health.medm.com/docs/api/v3/index.html)), so you'll need to use something like [xmldom](https://github.com/jindw/xmldom).
