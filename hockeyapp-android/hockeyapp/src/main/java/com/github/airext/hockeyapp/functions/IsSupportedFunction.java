package com.github.airext.hockeyapp.functions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;
import com.adobe.fre.FREWrongThreadException;

/**
 * Created by max on 1/19/18.
 */

public class IsSupportedFunction implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {
        try {
            return FREObject.newObject(true);
        } catch (FREWrongThreadException e) {
            e.printStackTrace();
            return null;
        }
    }
}
