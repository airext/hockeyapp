package com.github.airext.hockeyapp.functions;

import android.app.Activity;
import com.adobe.fre.*;
import net.hockeyapp.android.CrashManager;
import net.hockeyapp.android.CrashManagerListener;
import net.hockeyapp.android.UpdateManager;

/**
 * Created by max on 1/19/18.
 */

public class ConfigureFunction implements FREFunction {

    @Override
    public FREObject call(FREContext context, FREObject[] args) {

        Activity activity = context.getActivity();

        if (args.length > 0) {
            try {
                String appId = args[0].getAsString();
                CrashManager.register(activity, appId, new DefaultCrashManagerListener());
                UpdateManager.register(activity, appId);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            CrashManager.register(activity, new DefaultCrashManagerListener());
            UpdateManager.register(activity);
        }

        return null;
    }
}

class DefaultCrashManagerListener extends CrashManagerListener {
    @Override
    public boolean shouldAutoUploadCrashes() {
        return true;
    }
}