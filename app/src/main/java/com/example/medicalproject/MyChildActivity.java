package com.example.medicalproject;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
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

public class MyChildActivity extends AppCompatActivity {
    TextView parentname,childname,age,phone,gender,bloodgroup,dob;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_child);
        String username= getIntent().getStringExtra("username");
        parentname= findViewById(R.id.textView27);
        childname=findViewById(R.id.textView37);
        age=findViewById(R.id.textView32);
        phone=findViewById(R.id.textView33);
        gender=findViewById(R.id.textView34);
        bloodgroup=findViewById(R.id.textView40);
        dob=findViewById(R.id.textView49);
        Button t2= findViewById(R.id.button11);
        t2.setOnClickListener(view -> {
            Intent it2 = new Intent(this, RegisterActivity.class);
            startActivity(it2);
        });
        ImageView t1= findViewById(R.id.imageView30);
        t1.setOnClickListener(view -> {
            Intent it1 = new Intent(this, HomeActivity.class);
            startActivity(it1);
        });
        fetchData(username);

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
        parentname.setText(values[0].substring(1, values[0].length()));
        childname.setText(values[1]);
        age.setText(values[2]);
        phone.setText(values[3]);
        gender.setText(values[4]);
        bloodgroup.setText(values[5]);
        dob.setText(values[6].substring(0, values[6].length() - 1));
    }

    private void handleError(VolleyError error) {
        System.out.println("boooooo");
    }
}