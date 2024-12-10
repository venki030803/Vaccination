package com.example.medicalproject;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

public class NotificationActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_notification);
        String parentname = getIntent().getStringExtra("parentname");
        String username = getIntent().getStringExtra("username");
        LinearLayout a6 = findViewById(R.id.frame1);
        a6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(),UserLoginActivity.class);
                i1.putExtra("username",username);
                startActivity(i1);
            }
        });
        LinearLayout a7 = findViewById(R.id.frame2);
        a7.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(),Notificationctivity2.class);
                startActivity(i1);
            }
        });
        LinearLayout a8 = findViewById(R.id.fram3);
        a8.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(),FaqActivity.class);
                startActivity(i1);
            }
        });
        LinearLayout a9= findViewById(R.id.frame4);
        a7.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(),ScheduleActivity.class);
                startActivity(i1);
            }
        });    }
}