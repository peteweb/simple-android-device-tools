#Simple Android Device Tools

This repo is a simple set of Android device tools to make automation flows and processes a little bit easier. Each of these tools were developed following MVP principles - meaning - they each do the absolute minimum required to get a specific job done.

All tools unless otherwise specified require Android developer tooling to be installed, and the `adb` command to be present and available to the process thread(s) running these commands. Or if this is gibberish to you - make sure `adb` is available globally, and when you type in `android` into any terminal that the Android SDK Manager opens up.

If you want to be sure things will run okay inside a Jenkins instance - run the following command in a test job, and inspect the output for any failures:

`adb -h`

Should all go well - you'll only see a big mound of help text in your console output. Anything else indicates a probable error, and you should look into it before carrying on here.

## getAndroidDeviceName.sh

`./getAndroidDeviceName.sh nameOfEmulatorOrVM resultOutput.file`

When using a tool like [ Genymotion ](https://www.genymotion.com/) as part of an automated test flow, it can be extremely useful to spin up a device on demand and push a APK to it to run UIAutomator tests.

As many people know, if you have a business license for Genymotion, you can use a simple command like `gmtool device -n EMULATORNAME install path/to/apk.apk` to start this flow, and interact with the device further.

But what if you want to use normal adb commands as part of your automation workflow, or you can't afford a business license before your app takes off?

Enter *getAndroidDeviceName.sh* . As long as you have a `camelCaseName`, `TitleCaseName` or `underscore_separated_name` for the emulator you are trying to access (e.g. your Genymotion emulator is literally named something like 'lenovoPhone10' / 'LenovoPhone10' / 'Lenovo_Phone_10' - with no spaces, dashes or other special characters) - this tool will help you to use `adb` as you would with a real device.

Use *getAndroidDeviceName.sh* with: `./getAndroidDeviceName.sh lenovoPhone10 result.txt` - where the first parameter is the name of your Genymotion Android VM / emulator (`lenovoPhone10`), and the second is the name of the new file (`result.txt`) you would like to save the device identifier to - and *getAndroidDeviceName.sh* will search the output of `adb devices -l` and save the first matching identifier it finds. This then allows you (through your own scripts) to interact with your dynamically spooled emulator through a command like: `adb NAMEOFDEVICE install build/appname.apk`.

Be aware - if your VM / emulator name is too general (e.g. you want to find 'Nexus' but you have three VMs / emulators named 'Nexus', 'Nexus7', 'Nexus9') - the first result found will be returned - which may not be the device you want. Be as specific as you can with the name of the VM / emulator you are looking for, and make sure you are using a robust naming convention. If you're using Genymotion, to be sure you're looking for the right device names, use the [ Genymotion Shell ](https://docs.genymotion.com/Content/04_Tools/Genymotion_Shell/Genymotion_Shell.htm) and the `devices list` command within it.
