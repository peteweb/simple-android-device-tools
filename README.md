#Simple Android Device Tools

This repo is a simple set of Android device tools to make automation flows and processes a little bit easier. Each of these tools were developed following MVP principles - meaning - they each do the absolute minimum required to get a specific job done.

All tools unless otherwise specified require Android developer tooling to be installed, and the `adb` command to be present and available to the process thread(s) running these commands. Or if this is gibberish to you - make sure `adb` is available globally, and when you type in `android` into any terminal, the Android SDK Manager opens up.

If you want to be sure things will run okay inside a Jenkins instance - run the following command in a test job, and inspect the output for any failures:

`adb -h`

Should all go well - you'll only see a big mound of help text in your console output. Anything else indicates a probable error, and you should look into that before carrying on here.



## getAndroidDeviceName.sh

When using a tool like Genymotion as part of an automated test flow, it can be extremely useful to spin up a device on demand and push a APK to it to run UIAutomator tests. As many people know, if you have a business license for Genymotion, you can use a simple command like `gmtool device -n NAMEOFDEVICE install path/to/apk.apk` to start this flow, and interact with the device further.

But what if you want to use normal adb commands as part of your automation workflow, or you can't afford a business license just yet?

Enter getAndroidDeviceName.sh . As long as you have a `camelCaseName`, `TitleCaseName` or `underscore_separated_name` for the emulator you are trying to access (e.g. your Genymotion emulator is literally named something like 'lenovoPhone10' / 'LenovoPhone10' / 'Lenovo_Phone_10' - with no spaces) - this tool will help you to use adb as you would with a real device.

Just use a command like: `./getAndroidDeviceName.sh lenovoPhone10 result.txt` - and getAndroidDeviceName.sh will search thr
