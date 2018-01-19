/**
 * Created by max.rozdobudko@gmail.com on 1/17/18.
 */
package com.github.airext {
import com.github.airext.core.hockeyapp;

use namespace hockeyapp;

public class HockeyApp {

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    //-------------------------------------
    //  isSupported
    //-------------------------------------

    public static function get isSupported(): Boolean {
        return false;
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

    /**
     * Returns version of extension
     * @return extension version
     */
    public static function extensionVersion(): String {
        trace("[airext] HockeyApp extension is not supported on this platform.");
        return null;
    }

    //-------------------------------------
    //  sdkVersion
    //-------------------------------------

    public static function sdkVersion(): String {
        trace("[airext] HockeyApp extension is not supported on this platform.");
        return null;
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
        trace("[airext] HockeyApp extension is not supported on this platform.");
    }

    public function start(): void {
        trace("[airext] HockeyApp extension is not supported on this platform.");
    }
}
}
