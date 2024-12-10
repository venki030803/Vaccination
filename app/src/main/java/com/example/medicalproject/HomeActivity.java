package com.example.medicalproject;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.util.HashMap;
import java.util.Map;

public class HomeActivity extends AppCompatActivity {
    private String parentname;
    private TextView n;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        String username = getIntent().getStringExtra("username");
        fetchData(username);
        n=findViewById(R.id.textView37);


        ImageView a3 = findViewById(R.id.imageView29);
        a3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), ArticleHomeActivity.class);
                startActivity(i1);
            }
        });

        FrameLayout a4 = findViewById(R.id.frame1);
        a4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), MyChildActivity.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });

        FrameLayout a5 = findViewById(R.id.frame2);
        a5.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), RegisterActivity.class);
                startActivity(i1);
            }
        });

        FrameLayout a6 = findViewById(R.id.frame4);
        a6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), ScheduleActivity.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        n.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), UserLoginActivity.class);
                i1.putExtra("parentname",parentname);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
    }
    private void fetchData(String username) {
        // Replace "http://192.168.156.100:80/login/prof.php" with your actual API endpoint
        String apiUrl = ip.ipt +"profile.php";

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
        // Extract the values from the response string
        String[] values = response.split(", ");
        System.out.println("1 "+values[0]);
        // Display the values in the corresponding TextViews
        n.setText("Welcome, "+values[0].substring(1, values[0].length()));
        parentname=values[0].substring(1, values[0].length());
    }

    private void handleError(VolleyError error) {
        System.out.println("boooooo");
    }
}
