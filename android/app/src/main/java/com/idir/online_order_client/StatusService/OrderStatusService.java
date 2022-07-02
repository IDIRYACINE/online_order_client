package com.idir.online_order_client.StatusService;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.widget.Toast;
import androidx.annotation.NonNull;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.idir.online_order_client.Notification.Notification;

import java.util.HashMap;

import io.flutter.plugin.common.EventChannel;

public class OrderStatusService extends Service {
    private static EventChannel.EventSink eventSink;


    public static final int LISTEN_TO_ORDER_STATUS = 1;
    public static final int CREATE_REALTIME_DATABASE = 2;
    public static final int CANCEL_ORDER_STATUS_STREAM = 3;

    public static final String COMMAND_KEY = "command";
    public static final String ORDERS_REF_PATH = "OrdersStatus";
    public static final String USER_ID_KEY = "userId";

    private ServiceHandler serviceHandler;
    private Context context;

    public static void setEventsSink(EventChannel.EventSink events) {
        eventSink = events;
    }

    // Handler that receives messages from the thread
    private final class ServiceHandler extends Handler {
        private DatabaseReference orderStatusRef;
        private Context context;
        public ServiceHandler(Looper looper,Context context) {
            super(looper);
            this.context = context;
        }

        @Override
        public void handleMessage(Message msg) {

            Bundle data = msg.getData();
            int command = data.getInt(COMMAND_KEY);
            String userId =  data.getString(OrderStatusService.USER_ID_KEY);

            if (command == LISTEN_TO_ORDER_STATUS) {
                listenToOrderStatus(userId);
            } else {
                cancelOrderStatusStream(command);
            }

        }

        //an issue of late initilization ? sometime it takes too long to receive on flutter
        private final ValueEventListener orderStatusListener = new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot snapshot) {
                HashMap<String,String> value = (HashMap<String, String>) snapshot.getValue(); // hashmap
                assert value != null;
                String status = value.get("status");
                if(eventSink != null){
                    eventSink.success(status);
                }
                //new Notification(context,status); //not done yet 
            }

            @Override
            public void onCancelled(@NonNull DatabaseError error) {

                orderStatusRef.removeEventListener(this);
            }
        };

        private void listenToOrderStatus(String userId){
            DatabaseReference firebaseRealTime = FirebaseDatabase.getInstance().getReference();
            orderStatusRef = firebaseRealTime.child(OrderStatusService.ORDERS_REF_PATH);
            orderStatusRef.child(userId).addValueEventListener(orderStatusListener);
        }


        private void cancelOrderStatusStream(int startId){

            stopSelf(startId);
        }

    }

    @Override
    public void onCreate() {
        // Start up the thread running the service. Note that we create a
        // separate thread because the service normally runs in the process's
        // main thread, which we don't want to block. We also make it
        // background priority so CPU-intensive work doesn't disrupt our UI.
        HandlerThread thread = new HandlerThread("ServiceStartArguments");
        thread.setPriority(Process.THREAD_PRIORITY_BACKGROUND);
        thread.start();

        // Get the HandlerThread's Looper and use it for our Handler
        Looper serviceLooper = thread.getLooper();
        serviceHandler = new ServiceHandler(serviceLooper,this);


    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        
        Message msg = serviceHandler.obtainMessage();
        msg.arg1 = startId;
        // forward user auth id
        Bundle data = new Bundle();
        data.putString(USER_ID_KEY,intent.getStringExtra(USER_ID_KEY));
        data.putInt(COMMAND_KEY,intent.getIntExtra(COMMAND_KEY,0));

        msg.setData(data);

        msg.obj = serviceHandler.sendMessage(msg);

        // If we get killed, after returning from here, restart
        return START_STICKY;
    }

    

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public void onDestroy() {
       
    }

}