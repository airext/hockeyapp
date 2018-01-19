package com.github.airext.hockeyapp;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.github.airext.hockeyapp.functions.ConfigureFunction;
import com.github.airext.hockeyapp.functions.IsSupportedFunction;
import com.github.airext.hockeyapp.functions.StartFunction;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by max on 1/19/18.
 */

public class ExtensionContext extends FREContext {

    @Override
    public Map<String, FREFunction> getFunctions() {
        Map<String, FREFunction> functions = new HashMap<String, FREFunction>();
        functions.put("isSupported", new IsSupportedFunction());
        functions.put("configure", new ConfigureFunction());
        functions.put("start", new StartFunction());
        return functions;
    }

    @Override
    public void dispose() {

    }
}
