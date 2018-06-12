#!/usr/bin/env node

const program = require('commander');
const fs = require('fs');
const path = require('path');
const fsExtra = require('fs-extra');

program
  .description('Injects proprietary MedM DeviceKit SDK into RNDeviceKit build.')
  .option(
    '--android <path>',
    'Path to MedM DeviceKit SDK Android library (*.aar)'
  )
  .option(
    '--ios <path>',
    'Path to MedM DeviceKit SDK iOS framework (*.feamework)'
  )
  .parse(process.argv);

const thisPath = process.cwd();
const packagePath = 'node_modules/react-native-device-kit';

if (program.android) {
  fsExtra.copySync(
    program.android,
    path.join(thisPath, `${packagePath}/android/libs/MedMDeviceKit.aar`)
  );
}

if (program.ios) {
  fsExtra.copySync(
    program.ios,
    path.join(thisPath, `${packagePath}/ios/Frameworks/MedMDeviceKit.framework`)
  );
}
