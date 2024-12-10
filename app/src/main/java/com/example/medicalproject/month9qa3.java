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

public class month9qa3 extends AppCompatActivity {

    String cmt, cmt2=" ", cmt3 = " "; // Initialize cmt2 with a default value
    private Button bt3;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_month9qa3);
        String username = getIntent().getStringExtra("username");
        cmt = getIntent().getStringExtra("cmt");
        cmt2= getIntent().getStringExtra("cmt2");
        System.out.println(cmt + "   xxxxx  x");
        fetchData(username);

        Button bt4 = findViewById(R.id.button12);
        bt3 = findViewById(R.id.button11);

        bt3.setOnClickListener(view -> {
            bt3.setBackground(this.getDrawable(R.drawable.greenbgbox));
            bt4.setBackground(this.getDrawable(R.drawable.whitebgbox));
            cmt3 = "1";
        });

        bt4.setOnClickListener(view -> {
            Dialog myDialog = new Dialog(month9qa3.this);
            myDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            myDialog.setContentView(R.layout.popupxml);
            myDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            myDialog.show();
        });
        System.out.println(cmt3);
        if (cmt3.equals("0")) {
            System.out.println("xxxx");
            bt4.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Dialog myDialog = new Dialog(month9qa3.this);
                    myDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
                    myDialog.setContentView(R.layout.popupxml);
                    myDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                    myDialog.show();
                }
            });
        }

        ImageView t1 = findViewById(R.id.imageView34);
        t1.setOnClickListener(view -> {
            Intent it1 = new Intent(this, month9qa4.class);
            System.out.println(cmt);
            it1.putExtra("cmt", cmt);
            it1.putExtra("cmt2", cmt2);
            it1.putExtra("cmt3", cmt3);
            it1.putExtra("username", username);
            startActivity(it1);
        });
    }

    private void fetchData(String username) {
        String apiUrl = ip.ipt + "month9show_3.php";

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
                Map<String, String> data = new HashMap<>();
                data.put("username", username);

                Log.d("Volley Request", "Params: " + data.toString());

                return data;
            }
        };

        Volley.newRequestQueue(this).add(stringRequest);
    }

    private void handleResponse(String response) {
        Log.d("JSON Response", response);

        System.out.println(response);
        String trimmedResponse = response.trim();
        int a = Integer.parseInt(String.valueOf(trimmedResponse.charAt(1)));
        System.out.println(a);

        if (a == 1) {
            Log.d("Debug", "Response is equal to '1'");
            System.out.println("aaaaa");
            bt3 = findViewById(R.id.button11);
            if (bt3 != null) {
                Log.d("Debug", "bt3 is not null");
                bt3.setBackground(this.getDrawable(R.drawable.greenbgbox));
            } else {
                Log.d("Debug", "bt3 is null");
            }
        } else {
            Log.d("Debug", "Response is NOT equal to '1'");
        }
    }

    private void handleError(VolleyError error) {
        System.out.println("boooooo");
    }

    }
