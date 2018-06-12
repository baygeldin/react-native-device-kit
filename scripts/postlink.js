#!/usr/bin/env node

const xcode = require('xcode');
const fs = require('fs');
const path = require('path');
const glob = require('glob');

const thisPath = process.cwd();
const iosPath = path.join(thisPath, 'ios');

// Patch Android
const androidPath = path.join(thisPath, 'android');

if (!fs.existsSync(androidPath)) {
  throw new Error(`Could not find ${androidPath}.`);
}

const gradlePath = path.join(androidPath, 'app/build.gradle');

if (!fs.existsSync(gradlePath)) {
  throw new Error(`Could not find ${gradlePath}.`);
}

const patch = `
repositories{
  flatDir{
      dirs "$rootDir/../node_modules/react-native-device-kit/android/libs"
  }
}
`;

if (!fs.readFileSync(gradlePath, 'utf-8').includes(patch)) {
  fs.appendFileSync(gradlePath, patch);
}

// Patch iOS

const iosPath = path.join(thisPath, 'ios');

if (!fs.existsSync(iosPath)) {
  throw new Error(`Could not find ${iosPath}.`);
}

const globs = glob.sync(path.join(iosPath, '*.xcodeproj/project.pbxproj'));
const pbxprojPath = globs[0];

if (!pbxprojPath) {
  throw new Error(
    `Could not find xcodeproj directory with a project.pbxproj in ${iosPath}`
  );
}

const pbxproj = xcode.project(pbxprojPath);
pbxproj.parseSync();
// proj.addBuildProperty(key, property);
// fs.writeFileSync(pbxprojPath, proj.writeSync());