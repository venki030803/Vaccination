package com.example.medicalproject;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;


import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

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

public class RegisterActivity extends AppCompatActivity {

    private Spinner answerSpinner;
    private TextView resultTextView;
    Button btn;
    private EditText eid, epassword,epname,ecname,eage,ephone,ebg,edob;
    private String username, password,pname,cname,age,phone,gender,egender,bg,dob;
    private void vv(String s){
        username=s;
    }
    private String URL= ip.ipt +"register.php";
    @SuppressLint("MissingInflatedId")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register2);
        ImageView imageView4 = findViewById(R.id.imageView4);

// Set OnClickListener for ImageView 4
        imageView4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Create an intent to start the HomeActivity
                Intent intent = new Intent(RegisterActivity.this, HomeActivity.class);
                startActivity(intent);
                finish(); // Optional, to close the current activity if needed
            }
        });
        answerSpinner = findViewById(R.id.answerSpinner);




        // Define the options for the spinner
        String[] options = {"Male", "Female", "Other"};

        // Create an ArrayAdapter using the string array and a default spinner layout
        ArrayAdapter<String> adapter = new ArrayAdapter<>(this, android.R.layout.simple_spinner_item, options);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

        // Ensure that the Spinner is not null before calling setAdapter
        if (answerSpinner != null) {
            answerSpinner.setAdapter(adapter);
        }

        // Set a listener for item selections
        if (answerSpinner != null) {
            answerSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                @Override
                public void onItemSelected(AdapterView<?> parentView, View selectedItemView, int position, long id) {
                    String selectedAnswer = answerSpinner.getSelectedItem().toString();
                    egender = selectedAnswer;

                }

                @Override
                public void onNothingSelected(AdapterView<?> parentView) {
                    // Do nothing here
                }
            });
        }

        eid = findViewById(R.id.input1);
        epassword = findViewById(R.id.input2);
        epname = findViewById(R.id.input3);
        ecname = findViewById(R.id.input6);
        eage = findViewById(R.id.input4);
        ephone= findViewById(R.id.input5);
        ebg = findViewById(R.id.input7);
        btn = findViewById(R.id.button);
        edob = findViewById(R.id.input8);


        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                username = eid.getText().toString().trim();
                vv(username);
                password = epassword.getText().toString().trim();
                pname= epname.getText().toString().trim();
                cname= ecname.getText().toString().trim();
                age = eage.getText().toString().trim();
                phone = ephone.getText().toString().trim();
                gender= egender;
                bg= ebg.getText().toString().trim();
                dob= edob.getText().toString().trim();
                System.out.println(username);
                System.out.println(password);
                System.out.println(pname);
                System.out.println(cname);
                System.out.println(age);
                System.out.println(gender);
                System.out.println(bg);
                System.out.println(dob);
                if (username.isEmpty() || password.isEmpty() || pname.isEmpty() || cname.isEmpty() || age.isEmpty() || gender.isEmpty() || phone.isEmpty() || bg.isEmpty()) {
                    Toast.makeText(RegisterActivity.this, "Fields cannot be empty", Toast.LENGTH_SHORT).show();


                } else {
                    System.out.println(username);
                    sendRegistrationRequest(username, password);
                }
            }
        });

    }
    private void sendRegistrationRequest(final String username, final String password) {
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
                data.put("password", password);
                data.put("parentname", pname);
                data.put("childname", cname);
                data.put("age", age);
                data.put("phone", phone);
                data.put("gender", gender);
                data.put("bloodgroup", bg);
                data.put("dob", dob);
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

                Intent intent = new Intent(RegisterActivity.this, HomeActivity.class);
                intent.putExtra("username", username);
                intent.putExtra("password", password);
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