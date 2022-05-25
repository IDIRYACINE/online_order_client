package com.idir.online_order_client;

import android.content.Context;
import android.content.Intent;

import androidx.annotation.NonNull;

import com.idir.online_order_client.StatusService.OrderStatusService;

import java.util.Map;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.EventChannel.EventSink;

public class OrderStatusPlugin implements EventChannel.StreamHandler , MethodChannel.MethodCallHandler {
    private static final String LISTEN_TO_ORDER_STATUS = "listenToOrderStatus";
    private static final String CANCEL_ORDER_STATUS_SUBSCRIPTION = "cancelOrderStatusSubscription";
    private static final String CONFIGURE_NOTIFICATION = "configureNotification";

    private final Context appContext;

    public OrderStatusPlugin(Context context) {
        appContext = context;
    }

    @Override
    public void onListen(Object arguments, EventSink events) {
        OrderStatusService.setEventsSink(events);
    }

    @Override
    public void onCancel(Object arguments) {

    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {

        String userId = call.argument(OrderStatusService.USER_ID_KEY);

        switch (call.method){
            case LISTEN_TO_ORDER_STATUS: listenToOrderStatus(userId,result);
            break;

            case CANCEL_ORDER_STATUS_SUBSCRIPTION: cancelOrderStatus(result);
            break;

            case CONFIGURE_NOTIFICATION:configureNotification(call.argument("options"),result);
            break;
        }
    }



    private void listenToOrderStatus(String userId,MethodChannel.Result result){
        Intent intent = new Intent(appContext,OrderStatusService.class);
        intent.putExtra(OrderStatusService.COMMAND_KEY,OrderStatusService.LISTEN_TO_ORDER_STATUS);
        intent.putExtra(OrderStatusService.USER_ID_KEY,userId);
        appContext.startService(intent);
        result.success("done");
    }

    private void cancelOrderStatus(MethodChannel.Result result){
        Intent intent = new Intent(appContext,OrderStatusService.class);
        intent.putExtra(OrderStatusService.COMMAND_KEY,OrderStatusService.CANCEL_ORDER_STATUS_STREAM);
        appContext.startService(intent);
        result.success("done");
    }

    private void configureNotification(Object argument,MethodChannel.Result result){
        Map<String,Boolean> options = (Map<String, Boolean>) argument;
        Boolean enabled =  options.get("enabled");
        Boolean vibrate = options.get("vibrate");
        Boolean playSound = options.get("playSound");
        result.success("done");
    }

}
