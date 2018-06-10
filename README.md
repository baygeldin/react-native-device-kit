
# react-native-device-kit

## Getting started

`$ npm install react-native-device-kit --save`

### Mostly automatic installation

`$ react-native link react-native-device-kit`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-device-kit` and add `RNDeviceKit.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNDeviceKit.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactnative.devicekit.RNDeviceKitPackage;` to the imports at the top of the file
  - Add `new RNDeviceKitPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-device-kit'
  	project(':react-native-device-kit').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-device-kit/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-device-kit')
  	```


## Usage
```javascript
import RNDeviceKit from 'react-native-device-kit';

// TODO: What to do with the module?
RNDeviceKit;
```
  