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
import android.widget.ImageView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class year1qa2 extends AppCompatActivity {
    String cmt ,cmt2 = " ";
    private Button bt3;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_year1qa2);
        String username= getIntent().getStringExtra("username");
        cmt=getIntent().getStringExtra("cmt");
        System.out.println(cmt+"   xxxxx  x");
        fetchData(username);
        Button bt4 = findViewById(R.id.button12);
        bt3=findViewById(R.id.button11);
        bt3.setOnClickListener(view -> {
            bt3.setBackground(this.getDrawable(R.drawable.greenbgbox));
            bt4.setBackground(this.getDrawable(R.drawable.whitebgbox));
            cmt2="1";
        });

        bt4.setOnClickListener(view -> {

            Dialog myDialog = new Dialog(year1qa2.this);
            myDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            myDialog.setContentView(R.layout.popupxml);
            myDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            myDialog.show();


        });
        if(cmt2 .equals("0") ){
            System.out.println("xxxx");
            bt4.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Dialog myDialog = new Dialog(year1qa2.this);
                    myDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
                    myDialog.setContentView(R.layout.popupxml);
                    myDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                    myDialog.show();

                }
            });

        }
        ImageView t1= findViewById(R.id.imageView34);
        t1.setOnClickListener(view -> {
            Intent it1 = new Intent(this, year1qa3.class);
            System.out.println(cmt);
            it1.putExtra("cmt",cmt);
            it1.putExtra("cmt2",cmt2);
            it1.putExtra("username",username);
            startActivity(it1);
        });

    }

    private void fetchData(String username) {
        // Replace "http://192.168.156.100:80/login/prof.php" with your actual API endpoint
        String apiUrl = ip.ipt +"year1show_2.php";

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
    private void handleError(VolleyError error) {
        System.out.println("boooooo");
    }
}