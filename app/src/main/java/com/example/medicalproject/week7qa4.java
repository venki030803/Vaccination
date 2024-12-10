package com.example.medicalproject;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Dialog;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.Button;
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
import com.example.medicalproject.R;
import com.example.medicalproject.ScheduleActivity;
import com.example.medicalproject.ip;

import java.util.HashMap;
import java.util.Map;

public class week7qa4 extends AppCompatActivity {


    String cmt4,cmt3,cmt,cmt2;
    Button bt3;
    private String URL= ip.ipt +"week7.php";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_week7qa4);
        String username= getIntent().getStringExtra("username");
        cmt=getIntent().getStringExtra("cmt");
        cmt2=getIntent().getStringExtra("cmt2");
        cmt3=getIntent().getStringExtra("cmt3");
        cmt4=" ";
        fetchData(username);
        System.out.println(cmt);
        Button bt3 = findViewById(R.id.button11);
        Button bt4 = findViewById(R.id.button12);
        bt3.setOnClickListener(view -> {
            bt3.setBackground(this.getDrawable(R.drawable.greenbgbox));
            bt4.setBackground(this.getDrawable(R.drawable.whitebgbox));
            cmt4="1";
        });
        bt4.setOnClickListener(view -> {

            Dialog myDialog = new Dialog(week7qa4.this);
            myDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            myDialog.setContentView(R.layout.popupxml);
            myDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            myDialog.show();
        });
        Button t1= findViewById(R.id.button8);

        t1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                System.out.println(username+"vvv"+cmt+"vvv"+cmt2+"vvv"+cmt3+"vvv"+cmt4);
                if(cmt.equals(" ")){
                    cmt="1";
                }
                if(cmt2.equals(" ")){
                    cmt2="1";
                }
                if(cmt3.equals(" ") ){
                    cmt3="1";
                }
                if(cmt4.equals(" ") ){
                    cmt4="1";
                }
                if (username.isEmpty() || cmt.isEmpty() || cmt2.isEmpty() || cmt3.isEmpty()|| cmt4.isEmpty() ) {
                    Toast.makeText(week7qa4.this, "Fields cannot be empty", Toast.LENGTH_SHORT).show();


                } else {
                    System.out.println(username);
                    sendLoginRequest(username);
                }
            }
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
                data.put("username", username);
                data.put("q1", cmt);
                data.put("q2", cmt2);
                data.put("q3", cmt3);
                data.put("q4", cmt4);
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

                Intent intent = new Intent(week7qa4.this, ScheduleActivity.class);
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



    private void fetchData(String username) {
        // Replace "http://192.168.156.100:80/login/prof.php" with your actual API endpoint
        String apiUrl = ip.ipt +"week7show_4.php";

        // Append the username as a parameter to the URL
        StringRequest stringRequest = new StringRequest(Request.Method.POST, apiUrl,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        handleResponse(response);
                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                handleError(error);
            }
        }) {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                // Send the username as a POST parameter
                Map<String, String> data = new HashMap<>();
                data.put("username", username);

                // Log the parameters for debugging
                Log.d("Volley Request", "Params: " + data.toString());

                return data;
            }
        };

        Volley.newRequestQueue(this).add(stringRequest);

    }


    private void handleResponse(String response) {

        Log.d("JSON Response", response);

        // Handle your JSON response here without assuming a 'status' field
        // You can parse the response and handle success/failure accordingly
        System.out.println(response);
        String trimmedResponse = response.trim();
        int a =Integer.parseInt(String.valueOf(trimmedResponse.charAt(1)));
        // Extract the values from the response string
        System.out.println(a);
        if (a == 1) {
            Log.d("Debug", "Response is equal to '1'");
            System.out.println("aaaaa");
            bt3=findViewById(R.id.button11);
            if (bt3 != null) {
                Log.d("Debug", "bt3 is not null");
                bt3.setBackground(this.getDrawable(R.drawable.greenbgbox));
            } else {
                Log.d("Debug", "bt3 is null");
            }
        } else {
            Log.d("Debug", "Response is NOT equal to '1'");
        }
        // Display the values in the corresponding TextViews
    }

    // Display the values in the corresponding TextViews

}