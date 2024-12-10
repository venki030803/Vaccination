package com.example.medicalproject;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class trashtotdoc extends AppCompatActivity {
    private List<Patient> patientList;
    private RecyclerView listView;

    private EditText c;

    private String m;
    private patientadapter2 adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_trashtotdoc);

        listView = findViewById(R.id.myListView);
        patientList = new ArrayList<>(); // Assuming Patient is a class representing patient details

        // Create a custom adapter for your patients
        adapter = new patientadapter2(this, patientList);

       TextView t1= findViewById(R.id.seemore);
        t1.setOnClickListener(view -> {
            Intent it1 = new Intent(this, TotaldoctorActivity.class);
            startActivity(it1);});

        // Set item click listener to open pat_view activity with selected patient details
        adapter.setOnItemClickListener(new patientadapter2.OnItemClickListener() {
            @Override
            public void onItemClick(int position) {
                Patient selectedPatient = patientList.get(position);
                Intent intent = new Intent(trashtotdoc.this, PatientLoginActivity.class);
                intent.putExtra("username", selectedPatient.getuser());
                intent.putExtra("parentname", selectedPatient.getName());


                startActivity(intent);
            }
        });



        listView.setAdapter(adapter);

        // Set item click listener for ListView
        String url = ip.ipt +"patientlist.php";
        makeRequest(url);

    }


    private void makeRequest(String url) {
        StringRequest stringRequest = new StringRequest(
                Request.Method.POST,
                url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        System.out.println(response);
                        Log.d("Volley Response", response);
                        parseResponse(response);
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Log.e("Volley Error", error.toString());
                        Toast.makeText(trashtotdoc.this, "Error fetching data", Toast.LENGTH_SHORT).show();
                    }
                }
        );

        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        requestQueue.add(stringRequest);
    }

    private void parseResponse(String response) {
        try {
            JSONArray jsonArray = new JSONArray(response);

            if (jsonArray.length() > 0) {
                // Clear existing data
                patientList.clear();

                for (int i = 0; i < 3; i++) {
                    JSONObject patientObject = jsonArray.getJSONObject(i);
                    String user = patientObject.optString("username", "");
                    String name = patientObject.optString("parentname", "");

                    // Add this patient to your patientList
                    patientList.add(new Patient(name, user));
                }

                // Notify your adapter that the data set has changed
                adapter.notifyDataSetChanged();
            } else {
                // Handle empty response
                Toast.makeText(trashtotdoc.this, "Empty response", Toast.LENGTH_SHORT).show();
            }
        } catch (JSONException e) {
            e.printStackTrace();
            // Handle JSON parsing error
            Toast.makeText(trashtotdoc.this, "Error parsing JSON", Toast.LENGTH_SHORT).show();
        }
    }
}