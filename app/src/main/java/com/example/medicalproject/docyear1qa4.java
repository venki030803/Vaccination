package com.example.medicalproject;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
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

public class docyear1qa4 extends AppCompatActivity {
    String cmt, cmt2="0", cmt3 = "0", cmt4= "0"; // Initialize cmt2 with a default value
    private Button bt3;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_docyear1qa4);
        String username = getIntent().getStringExtra("username");
        cmt = getIntent().getStringExtra("cmt");
        cmt2= getIntent().getStringExtra("cmt2");
        cmt3= getIntent().getStringExtra("cmt3");
        System.out.println(cmt + "   xxxxx  x");
        fetchData(username);
        ImageView t1 = findViewById(R.id.imageView34);
        t1.setOnClickListener(view -> {
            Intent it1 = new Intent(this,docyear1qa5.class);
            System.out.println(cmt);
            it1.putExtra("cmt", cmt);
            it1.putExtra("cmt2", cmt2);
            it1.putExtra("cmt3", cmt3);
            it1.putExtra("cmt4", cmt4);
            it1.putExtra("username", username);
            startActivity(it1);
        });
    }
    private void fetchData(String username) {
        String apiUrl = ip.ipt + "year1show_4.php";

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