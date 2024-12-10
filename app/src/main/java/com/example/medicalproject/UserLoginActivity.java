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

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserLoginActivity extends AppCompatActivity {

    private TextView n;
    private String username;
    private TextView t,t1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_login); // Move this line up

        String parentname = getIntent().getStringExtra("parentname");
        username = getIntent().getStringExtra("username");

        t = findViewById(R.id.textView25);
        t1= findViewById(R.id.textView65);
        fetchData(username);

        n = findViewById(R.id.textView9);
        n.setText(parentname);

        Button t2 = findViewById(R.id.button9);
        t2.setOnClickListener(view -> {
            Intent it2 = new Intent(this, LoginActivity.class);
            startActivity(it2);
        });

        TextView a8 = findViewById(R.id.textView37);
        a8.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent i1 = new Intent(getApplicationContext(), FaqActivity.class);
                startActivity(i1);
            }
        });
    }
    private void fetchcom2(String username, String url, String k) {
        // Replace "http://192.168.156.100:80/login/prof.php" with your actual API endpoint
        String apiUrl = url;

        // Append the username as a parameter to the URL
        StringRequest stringRequest = new StringRequest(Request.Method.POST, apiUrl,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        handleResponses1(response,k);
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


    private void handleResponses1(String response, String k) {

        Log.d("JSON Response", response);
        String[] values = response.split(", ");

        LocalDate currentDate;
        currentDate = LocalDate.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate parsedDate = parseDate(values[0].substring(1,values[0].length()));

        // Formatting the LocalDate to a string
        String formattedDate = currentDate.format(formatter);
        int numberOfDaysToAdd = 90;
        LocalDate futureDate = parsedDate.plusDays(numberOfDaysToAdd);
        String formattedDat = futureDate.format(formatter);
        t1.setText(k+" is on "+formattedDat);
            // Calculate the number of days between today and the future dat// Initialize the CalendarView

    }

    public static LocalDate parseDate(String dateString) {
        List<String> possibleFormats = Arrays.asList(
                "yyyy-MM-dd",  // Standard ISO format
                "yyyy-M-d",    // No leading zeros for month and day
                "MM-d",        // Month and day without year
                "M-d",         // Single-digit month and day without year
                "MM-dd",       // Month and day with leading zeros
                "M-dd"         // Single-digit month with leading zero in day
        );

        for (String format : possibleFormats) {
            try {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
                return LocalDate.parse(dateString, formatter);
            } catch (DateTimeParseException ignored) {
                // Try the next format
            }
        }

        // If none of the formats work
        throw new IllegalArgumentException("Unable to parse the date: " + dateString);
    }

    private void fetchData(String username) {
        // Replace "http://192.168.156.100:80/login/prof.php" with your actual API endpoint
        String apiUrl = ip.ipt +"calculatecompleteddose.php";
        System.out.println(username);
        // Append the username as a parameter to the URL
        StringRequest stringRequest = new StringRequest(Request.Method.POST, apiUrl,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        System.out.println(response);
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
                int d = jsonResponse.getInt("total_completed_count");
                if(d==0){
                    String url=ip.ipt +"completed.php";
                    String k= "Week 6 Dose";
                    fetchcom2(username,url,k);
                }
                else if(d==1){
                    String url=ip.ipt +"completedweek7.php";
                    String k= "Week 10 Dose";
                    fetchcom2(username,url,k);
                }
                else if(d==2){
                    String url=ip.ipt +"completedweek14.php";
                    String k= "Week 14 Dose";
                    fetchcom2(username,url,k);
                }
                else if(d==3){
                    String url=ip.ipt +"completedmonth6.php";
                    String k= "Month 6 Dose";
                    fetchcom2(username,url,k);

                }
                else if(d==4){
                    String url=ip.ipt +"completedmonth9.php";
                    String k= "Month 9 Dose";
                    fetchcom2(username,url,k);

                }
                else if(d==5){
                    String url=ip.ipt +"completedyear1.php";
                    String k= "Year 1 Dose";
                    fetchcom2(username,url,k);
                }
                else if(d==6){
                    String url=ip.ipt +"completedmonth15.php";
                    String k= "Month 15 Dose";
                    fetchcom2(username,url,k);
                }
                else if(d==7){
                    String url=ip.ipt +"completedmonth18.php";
                    String k= "Month 18 Dose";
                    fetchcom2(username,url,k);
                }
                else if(d==8){
                    String url=ip.ipt +"completedyear2.php";
                    String k= "Year 2 Dose";
                    fetchcom2(username,url,k);
                }
                else if(d==9){
                    String url=ip.ipt +"completedyear3.php";
                    String k= "Year 3 Dose";
                    fetchcom2(username,url,k);
                }
                else if(d==10){
                    String url=ip.ipt +"completedyear4.php";
                    String k= "Year 4 Dose";
                    fetchcom2(username,url,k);
                }
                else if(d==11){
                    String url=ip.ipt +"completedyear5.php";
                    String k= "Year 5 Dose";
                    fetchcom2(username,url,k);
                }
            else{
                    t1.setText("All Doses Completed");
                }
                // Assuming you have an EditText with the id 'editTextResult' in your layout


                // Set the totalCompletedCount to the EditText
                t.setText(String.valueOf(d)+"/12");
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