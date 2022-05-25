package com.idir.online_order_client.Notification;

import android.annotation.SuppressLint;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

import androidx.core.app.NotificationCompat;
import androidx.core.graphics.drawable.IconCompat;

import com.idir.online_order_client.MainActivity;
import com.idir.online_order_client.R;

public class Notification {
    private NotificationCompat.Builder notificationBuilder;
    private final String CHANNEL_ID = "OrderStatus";

    public Notification(Context context,String orderStatus) {
        notificationSettings(context,orderStatus);
        createNotification(context);
    }

    private void notificationSettings(Context context,String orderStatus) {

        Intent openOrderStatusScreen  =  new Intent(context, MainActivity.class);
        openOrderStatusScreen.setAction(MainActivity.ACTION_OPEN_ORDER_STATUS_SCREEN);
        PendingIntent intent =  PendingIntent.getBroadcast(context, 0, openOrderStatusScreen, PendingIntent.FLAG_UPDATE_CURRENT);

        notificationBuilder = new NotificationCompat.Builder(context, CHANNEL_ID)
                .setContentTitle(context.getString(R.string.notification_title))
                .setSmallIcon(R.drawable.launch_background)
                .setOngoing(false)
                .setSilent(true)
                .setAutoCancel(true)
                .setContentText(orderStatus)
                .setContentIntent(intent)
                .setPriority(NotificationCompat.PRIORITY_HIGH);

    }

    private void createNotification(Context context){
        CharSequence CHANNEL_NAME = "OrderStatus";
        String CHANNEL_DESCRIPTION = "OrderStatus";
        NotificationManager notificationManager = context.getSystemService(NotificationManager.class);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel(CHANNEL_ID, CHANNEL_NAME,  NotificationManager.IMPORTANCE_DEFAULT);
            channel.setDescription(CHANNEL_DESCRIPTION);
            notificationManager.createNotificationChannel(channel);

        }
        int NOTIFICATION_ID = 11;
        notificationManager.notify(NOTIFICATION_ID, notificationBuilder.build());
    }
}
