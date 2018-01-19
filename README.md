# hockeyapp
AIR native extension for HockeyApp platform

## Installation 

1. Download [hockeyapp.ane](https://github.com/airext/hockeyapp/releases) ANE and [add it as dependencies](http://bit.ly/2xTSJry) to your project. 

2. Edit your [Application Descriptor](http://help.adobe.com/en_US/air/build/WS5b3ccc516d4fbf351e63e3d118666ade46-7ff1.html) file with registering new native extensions like this:
```xml
<extensions>
    <extensionID>com.github.airext.HockeyApp</extensionID>
</extensions>
```
Set iOS minimum version to 8.0 in iPhone InfoAdditions:
```xml
<iPhone>
    <!-- A list of plist key/value pairs to be added to the application Info.plist -->
    <InfoAdditions>
        <![CDATA[
        <key>MinimumOSVersion</key>
        <string>8.0</string>
        ]]>
    </InfoAdditions>
</iPhone>
```

Ensure next Android permissions are added into corresponded section:
```xml
<android>
    <manifestAdditions>
        <![CDATA[
        <manifest android:installLocation="auto">
            <uses-permission android:name="android.permission.INTERNET"/>
            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
            ...
        </manifest>
        ]]>
    </manifestAdditions>
</android>
```

## Usage

To make it run you call `configure(appId: Stirng): void` and `start()` methods of HockeyApp shared instance:

```as3
if (HockeyApp.isSupported) {
    HockeyApp.shared.configure("HOCKEYAPP_APP_ID");
    HockeyApp.shared.start();
}
```

Helper methods:

```as3
HockeyApp.extensionVersion(); // returns version of this extension
HockeyApp.sdkVersion(); // returns version of the native Hockey SDK this extension build with
```
