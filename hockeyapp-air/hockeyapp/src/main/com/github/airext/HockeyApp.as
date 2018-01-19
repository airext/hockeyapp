/**
 * Created by max.rozdobudko@gmail.com on 1/17/18.
 */
package com.github.airext {
import com.github.airext.core.hockeyapp;

import flash.external.ExtensionContext;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

use namespace hockeyapp;

public class HockeyApp {

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    hockeyapp static const EXTENSION_ID:String = "com.github.airext.HockeyApp";

    //--------------------------------------------------------------------------
    //
    //  Class properties
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  context
    //-------------------------------------

    private static var _context:ExtensionContext;
    hockeyapp static function get context():ExtensionContext {
        if (_context == null) {
            _context = ExtensionContext.createExtensionContext(EXTENSION_ID, null);
        }
        return _context;
    }

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  isSupported
    //-------------------------------------

    public static function get isSupported():Boolean {
        return context != null && context.call("isSupported");
    }

    //-------------------------------------
    //  sharedInstance
    //-------------------------------------

    private static var instance: HockeyApp;

    public static function get shared(): HockeyApp {
        if (instance == null) {
            new HockeyApp();
        }
        return instance;
    }

    //-------------------------------------
    //  extensionVersion
    //-------------------------------------

    private static var _extensionVersion:String = null;

    /**
     * Returns version of extension
     * @return extension version
     */
    public static function extensionVersion():String
    {
        if (_extensionVersion == null) {
            try {
                var extension_xml:File = ExtensionContext.getExtensionDirectory(EXTENSION_ID).resolvePath("META-INF/ANE/extension.xml");
                if (extension_xml.exists) {
                    var stream:FileStream = new FileStream();
                    stream.open(extension_xml, FileMode.READ);

                    var extension:XML = new XML(stream.readUTFBytes(stream.bytesAvailable));
                    stream.close();

                    var ns:Namespace = extension.namespace();

                    _extensionVersion = extension.ns::versionNumber;
                }
            } catch (error:Error) {
                // ignore
            }
        }

        return _extensionVersion;
    }

    //-------------------------------------
    //  sdkVersion
    //-------------------------------------

    public static function sdkVersion(): String {
        return context.call("version") as String;
    }

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    public function HockeyApp() {
        super();
        instance = this;
    }

    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    public function configure(identifier: String): void {
        context.call("configure", identifier);
    }

    public function start(): void {
        context.call("start");
    }
}
}
