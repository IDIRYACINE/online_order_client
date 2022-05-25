package com.idir.online_order_client;

import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;


import com.facebook.FacebookSdk;
import com.google.firebase.FirebaseApp;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String ONLINE_ORDER_CLIENT_ORDER_STATUS = "online_order_client/order_status";
    private static final String ONLINE_ORDER_CLIENT_ORDER_CONTROLS = "online_order_client/controls";
    public static final String ACTION_OPEN_ORDER_STATUS_SCREEN = "online_order_client/order_status_screen";

    @Override
    protected void onNewIntent(@NonNull Intent intent) {
        if(intent.getAction().equals(ACTION_OPEN_ORDER_STATUS_SCREEN)){
            getFlutterEngine();
        }
    }

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        FacebookSdk.fullyInitialize();

    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        OrderStatusPlugin orderStatusPlugin = new OrderStatusPlugin(getApplicationContext());

        EventChannel statusChannel =  new EventChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), ONLINE_ORDER_CLIENT_ORDER_STATUS);
        statusChannel.setStreamHandler(orderStatusPlugin);

        MethodChannel methodChannel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), ONLINE_ORDER_CLIENT_ORDER_CONTROLS);
        methodChannel.setMethodCallHandler(orderStatusPlugin);
    }


}
