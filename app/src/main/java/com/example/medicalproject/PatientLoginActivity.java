package com.example.medicalproject;

import static com.google.android.material.color.utilities.MaterialDynamicColors.error;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class PatientLoginActivity extends AppCompatActivity {
    private TextView t;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        String parentname = getIntent().getStringExtra("parentname");
        String username = getIntent().getStringExtra("username");
        setContentView(R.layout.activity_patient_login);
        TextView t1 = findViewById(R.id.textView22);
        t=findViewById(R.id.textView25);
        t1.setText(parentname);
        fetchData(username);
        LinearLayout a1 = findViewById(R.id.linearlayout9);
        a1.setOnClickListener(v -> {
            Intent i1 = new Intent(getApplicationContext(), doctorscheduleactivity.class);
            i1.putExtra("username", username);
            startActivity(i1);

        });
        LinearLayout a6 = findViewById(R.id.linearLayout8);
        a6.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), patientscheduleactivity.class);
                i1.putExtra("username", username);
                startActivity(i1);
            }
        });
        ImageView imageView4 = findViewById(R.id.imageView43);
        imageView4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Create an intent to start the HomeActivity
                Intent intent = new Intent(PatientLoginActivity.this, PatientLoginActivity.class);
                startActivity(intent);
                finish(); // Optional, to close the current activity if needed
            }
        });
    }

    private void fetchData(String username) {
        // Replace "http://192.168.156.100:80/login/prof.php" with your actual API endpoint
        String apiUrl = ip.ipt +"calculatecompleteddose.php";

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

        try {
            JSONObject jsonResponse = new JSONObject(response);

            String status = jsonResponse.getString("status");

            if ("success".equals(status)) {
                int totalCompletedCount = jsonResponse.getInt("total_completed_count");

                // Assuming you have an EditText with the id 'editTextResult' in your layout


                // Set the totalCompletedCount to the EditText
                t.setText(String.valueOf(totalCompletedCount)+"/12");
            } else {
                // Handle failure status if needed
                String message = jsonResponse.getString("message");
                // Handle failure status, e.g., show a Toast
                Toast.makeText(this, "Error: " + message, Toast.LENGTH_SHORT).show();
            }

        } catch (JSONException e) {
            e.printStackTrace();
            // Handle JSON parsing error if needed
        }
    }


    // Display the values in the corresponding TextViews

    private void handleError(VolleyError error) {
        System.out.println("boooooo");
    }
}



