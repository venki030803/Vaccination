package com.example.medicalproject;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.SearchView;
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

public class TotaldoctorActivity extends AppCompatActivity {
    private List<Patient> patientList;
    private ListView listView;
    private EditText c;
    private String m;
    private PatientAdapter adapter;
    private SearchView searchView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_totaldoctor);

        // Initialize UI components
        listView = findViewById(R.id.myListView);
        searchView = findViewById(R.id.searchView);

        // Initialize patientList and adapter
        patientList = new ArrayList<>();
        adapter = new PatientAdapter(this, patientList);

        // Set item click listener to open pat_view activity with selected patient details
        adapter.setOnItemClickListener(new PatientAdapter.OnItemClickListener() {
            @Override
            public void onItemClick(int position) {
                Patient selectedPatient = patientList.get(position);
                Intent intent = new Intent(TotaldoctorActivity.this, PatientLoginActivity.class);
                intent.putExtra("username", selectedPatient.getuser());
                intent.putExtra("parentname", selectedPatient.getName());
                startActivity(intent);
            }
        });

        // Set the adapter for the ListView
        listView.setAdapter(adapter);

        // Set item click listener for ListView if needed
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                // Handle item click if needed
            }
        });

        // Set up SearchView
        setupSearchView();

        // Make a request to fetch patient data
        String url = ip.ipt + "patientlist.php";
        makeRequest(url);
    }

    // Method to set up the SearchView
    private void setupSearchView() {
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                // Filter the patient list based on the entered text
                filterPatientList(newText);
                return true;
            }
        });
    }

    // Method to filter the patient list based on the entered text
    private void filterPatientList(String searchText) {
        List<Patient> filteredList = new ArrayList<>();

        // Trim leading and trailing whitespaces
        searchText = searchText.trim().toLowerCase();

        for (Patient patient : patientList) {
            if (patient.getName().toLowerCase().contains(searchText)) {
                filteredList.add(patient);
            }
        }

        // Update the adapter with the filtered list
        adapter.setFilteredList(filteredList);
    }

    // Method to make a request to fetch patient data
    private void makeRequest(String url) {
        StringRequest stringRequest = new StringRequest(
                Request.Method.POST,
                url,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.d("Volley Response", response);
                        parseResponse(response);
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Log.e("Volley Error", error.toString());
                        Toast.makeText(TotaldoctorActivity.this, "Error fetching data", Toast.LENGTH_SHORT).show();
                    }
                }
        );

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    // Method to parse the response from the server and update the patientList
    private void parseResponse(String response) {
        try {
            JSONArray jsonArray = new JSONArray(response);

            if (jsonArray.length() > 0) {
                // Clear existing data
                patientList.clear();

                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject patientObject = jsonArray.getJSONObject(i);
                    String user = patientObject.getString("username");
                    String name = patientObject.getString("parentname");

                    // Add this patient to your patientList
                    patientList.add(new Patient(name, user));
                }

                // Notify your adapter that the data set has changed
                adapter.notifyDataSetChanged();
            } else {
                // Handle empty response
                Toast.makeText(this, "Empty response", Toast.LENGTH_SHORT).show();
            }
        } catch (JSONException e) {
            e.printStackTrace();
            // Handle JSON parsing error
            Toast.makeText(this, "Error parsing JSON", Toast.LENGTH_SHORT).show();
        }
    }
}
