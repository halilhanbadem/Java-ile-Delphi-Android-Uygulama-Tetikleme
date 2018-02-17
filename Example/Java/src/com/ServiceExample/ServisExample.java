package com.ServiceExample;
 
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
 
public class ServisExample extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
            Intent TestLauncher = new Intent();
            TestLauncher.setClassName(context, "com.embarcadero.firemonkey.FMXNativeActivity");
            TestLauncher.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(TestLauncher);
    }
}