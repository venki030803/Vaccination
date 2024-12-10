package com.example.medicalproject;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;
import android.content.pm.PackageManager;
import android.util.Log;

public class AlarmReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        showNotification(context);
    }

    private void showNotification(Context context) {
        // Check if the app has the required notification permissions
        if (context.checkSelfPermission(android.Manifest.permission.VIBRATE) == PackageManager.PERMISSION_GRANTED &&
                context.checkSelfPermission(android.Manifest.permission.WAKE_LOCK) == PackageManager.PERMISSION_GRANTED) {

            // Create a notification
            NotificationCompat.Builder builder = new NotificationCompat.Builder(context, "default_channel_id")
                    .setSmallIcon(R.drawable.bluenoti)
                    .setContentTitle("Notification Title")
                    .setContentText("Your notification text here.")
                    .setPriority(NotificationCompat.PRIORITY_DEFAULT);

            NotificationManagerCompat notificationManager = NotificationManagerCompat.from(context);
            notificationManager.notify(1, builder.build());

        } else {
            // Handle the case where the app does not have the required permissions
            // You may prompt the user to grant the permissions or handle it accordingly
            // For example, you can show a log message or display a message to the user.
            Log.e("Permission Error", "Notification permissions not granted.");
        }
    }

}
