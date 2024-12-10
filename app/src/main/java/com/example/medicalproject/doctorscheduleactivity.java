package com.example.medicalproject;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

public class doctorscheduleactivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        String username=getIntent().getStringExtra("username");
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_doctorscheduleactivity);
        TextView a4 = findViewById(R.id.input1);
        a4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), docweek6dose.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        TextView a5 = findViewById(R.id.i2);
        a5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), docweek7dose.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        TextView a6 = findViewById(R.id.i3);
        a6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), docweek14dose.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        TextView a7 = findViewById(R.id.i4);
        a7.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), docmonth6.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        TextView a8 = findViewById(R.id.i5);
        a8.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), docmonth9.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        TextView a9 = findViewById(R.id.i6);
        a9.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), docyear1.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        TextView a10 = findViewById(R.id.i7);
        a10.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), docmonth15.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        TextView a11 = findViewById(R.id.i8);
        a11.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), docmonth18.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        TextView a12 = findViewById(R.id.i9);
        a12.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), docyear2.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        TextView a13 = findViewById(R.id.i10);
        a13.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), docyear3.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        TextView a14 = findViewById(R.id.i11);
        a14.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), docyear4.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        TextView a15 = findViewById(R.id.i12);
        a15.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), docyear5.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        ImageView imageView4 = findViewById(R.id.imageView4);
        imageView4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Create an intent to start the HomeActivity
                Intent intent = new Intent(doctorscheduleactivity.this, PatientLoginActivity.class);
                startActivity(intent);
                finish(); // Optional, to close the current activity if needed
            }
        });
    }
    }
