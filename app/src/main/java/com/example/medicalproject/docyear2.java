package com.example.medicalproject;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.Dialog;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.CalendarView;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class docyear2 extends AppCompatActivity {

    String mdate;
    private int q1=0;
    private String URL= ip.ipt +"year2dose.php";


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_docyear2);
        String username= getIntent().getStringExtra("username");

        RelativeLayout im2 = findViewById(R.id.r1);

        TextView t1= findViewById(R.id.textView43);
        Drawable[] drawables = t1.getCompoundDrawables();

        Drawable newDrawable = getDrawable(R.drawable.tickimg);
        newDrawable.setBounds(0, 0, newDrawable.getIntrinsicWidth(), newDrawable.getIntrinsicHeight());

        drawables[2] = newDrawable;
        t1.setOnClickListener(v -> {
            t1.setCompoundDrawablesWithIntrinsicBounds(drawables[0], drawables[1], drawables[2], drawables[3]);
            q1=1;
        });


        im2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Dialog myDialog = new Dialog(docyear2.this);
                myDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
                myDialog.setContentView(R.layout.calender);
                myDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                myDialog.show();

                // Initialize the CalendarView
                CalendarView calendar = myDialog.findViewById(R.id.calendar1);

                if (calendar != null) {
                    calendar.setOnDateChangeListener(new CalendarView.OnDateChangeListener() {
                        @Override
                        public void onSelectedDayChange(
                                @NonNull CalendarView view,
                                int year,
                                int month,
                                int dayOfMonth) {
                            // Store the value of date with
                            // format in String type Variable
                            // Add 1 in month because month
                            // index is start with 0
                            String date = dayOfMonth + "-" + (month + 1) + "-" + year;
                            mdate = year + "-" + (month + 1) + "-" + dayOfMonth;
                            // set this date in TextView for Display
                        }
                    });
                }
            }
        });
        RelativeLayout im3 = findViewById(R.id.r2);
        im3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Dialog myDialog = new Dialog(docyear2.this);
                myDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
                myDialog.setContentView(R.layout.calender);
                myDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                myDialog.show();

                // Initialize the CalendarView
                CalendarView calendar = myDialog.findViewById(R.id.calendar1);

                if (calendar != null) {
                    calendar.setOnDateChangeListener(new CalendarView.OnDateChangeListener() {
                        @Override
                        public void onSelectedDayChange(
                                @NonNull CalendarView view,
                                int year,
                                int month,
                                int dayOfMonth) {
                            // Store the value of date with
                            // format in String type Variable
                            // Add 1 in month because month
                            // index is start with 0
                            String date = dayOfMonth + "-" + (month + 1) + "-" + year;
                            mdate = year + "-" + (month + 1) + "-" + dayOfMonth;
                            // set this date in TextView for Display
                        }
                    });
                }
            }
        });
        ImageView tt1= findViewById(R.id.imageView44);
        tt1.setOnClickListener(view -> {
            Intent it1 = new Intent(this, year2qaActivity.class);
            it1.putExtra("username",username);
            startActivity(it1);
        });
        ImageView im=findViewById(R.id.imageView44);
        im.setOnClickListener(v -> {
            sendLoginRequest(username);
        });

    }

    private void sendLoginRequest(final String username) {
        StringRequest stringRequest = new StringRequest(Request.Method.POST, URL,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        handleResponse(response,username);
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                handleError(error);
            }
        }) {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                // Send the username and password as POST parameters
                Map<String, String> data = new HashMap<>();
                System.out.println(username+" "+String.valueOf(q1));
                data.put("username", username);
                data.put("q1", String.valueOf(q1));


                return data;
            }
        };

        // Customize the retry policy
        stringRequest.setRetryPolicy(new DefaultRetryPolicy(
                60000, DefaultRetryPolicy.DEFAULT_MAX_RETRIES, DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));

        // Initialize the Volley request queue and add the request
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        requestQueue.add(stringRequest);
    }

    // Handle the JSON response
    private void handleResponse(String response,String username) {
        Log.d("JSON Response", response);

        // Handle your JSON response here without assuming a 'status' field
        // You can parse the response and handle success/failure accordingly
        try {
            // Example: Check if the response contains "success"
            if (response.toLowerCase().contains("success")) {
                Toast.makeText(this, "Sign Up successful", Toast.LENGTH_SHORT).show();

                Intent intent = new Intent(docyear2.this, PatientLoginActivity.class);
                intent.putExtra("username", username);
                startActivity(intent);
                System.out.println("aaa "+username);

                finish();
            } else {
                Toast.makeText(this, "Sign Up failed", Toast.LENGTH_SHORT).show();
            }
        } catch (Exception e) {
            e.printStackTrace();
            Toast.makeText(this, "Error parsing JSON", Toast.LENGTH_SHORT).show();
        }
    }

    // Handle network request errors
    private void handleError(VolleyError error) {
        if (error instanceof TimeoutError) {
            Toast.makeText(this, "Request timed out. Check your internet connection.", Toast.LENGTH_SHORT).show();
        } else {
            Toast.makeText(this, error.toString().trim(), Toast.LENGTH_SHORT).show();
        }

    }
}