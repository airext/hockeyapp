package com.github.airext;

import android.util.Log;
import com.adobe.fre.FREContext;
import com.github.airext.hockeyapp.ExtensionContext;

/**
 * Created by max on 1/19/18.
 */
public class HockeyApp implements com.adobe.fre.FREExtension {

    private final static String TAG = "ANXHockeyApp";

    //--------------------------------------------------------------------------
    //
    //  Class variables
    //
    //--------------------------------------------------------------------------

    public static boolean debug = false;

    public static FREContext context;

    //--------------------------------------------------------------------------
    //
    //  Class methods
    //
    //--------------------------------------------------------------------------

    public static void dispatch(String code, String level) {
        if (context != null) {
            context.dispatchStatusEventAsync(code, level);
        }
    }

    public static void dispatchStatus(String code) {
        dispatch(code, "status");
    }

    public static void dispatchError(String code) {
        dispatch(code, "error");
    }

    //--------------------------------------------------------------------------
    //
    //  Methods
    //
    //--------------------------------------------------------------------------

    @Override
    public void initialize() {
        Log.d(TAG, "initialize()");
    }

    @Override
    public FREContext createContext(String s) {
        Log.d(TAG, "createContext()");
        context = new ExtensionContext();
        return context;
    }

    @Override
    public void dispose() {
        Log.d(TAG, "dispose()");
    }
}
