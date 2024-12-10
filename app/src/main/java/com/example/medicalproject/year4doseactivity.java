package com.example.medicalproject;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Dialog;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.DefaultRetryPolicy;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.TimeoutError;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class year4doseactivity extends AppCompatActivity {

    String mdate;
    private String URL= ip.ipt +"year4err.php";
    private String username;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_year4doseactivity);
        username= getIntent().getStringExtra("username");
        RelativeLayout im2 = findViewById(R.id.r1);

        im2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                fetchcom2(username);
            }
        });
        RelativeLayout im3 = findViewById(R.id.r2);
        im3.setOnClickListener(new View.OnClickListener() {
            @Override

            public void onClick(View view) {
                fetchcom1(username);
            }
        });
        ImageView tt1= findViewById(R.id.imageView44);
        tt1.setOnClickListener(view -> {
            Intent it1 = new Intent(this,year4qaActivity.class);
            it1.putExtra("username",username);
            startActivity(it1);
        });
        ImageView im=findViewById(R.id.imageView44);
        im.setOnClickListener(v -> {
            sendLoginRequest(username);
        });

        fetchData(username);

    }



    private long getConstantDateMillis() {
        java.util.Calendar calendar = java.util.Calendar.getInstance();
        calendar.set(2024, 02, 21);
        return calendar.getTimeInMillis();
    }

    private void sendLoginRequest(final String username) {
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

                Intent intent = new Intent(year4doseactivity.this, year4qaActivity.class);
                intent.putExtra("username", username);
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


    private void fetchData(String username) {
        // Replace "http://192.168.156.100:80/login/prof.php" with your actual API endpoint
        String apiUrl = ip.ipt +"year4doseshow.php";

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
        String[] values = response.split(", ");
        if(response.equals("1")){
            TextView t1= findViewById(R.id.textView43);
            Drawable[] drawables = t1.getCompoundDrawables();

            Drawable newDrawable = getDrawable(R.drawable.tickimg);
            newDrawable.setBounds(0, 0, newDrawable.getIntrinsicWidth(), newDrawable.getIntrinsicHeight());

            drawables[2] = newDrawable;

            t1.setCompoundDrawablesWithIntrinsicBounds(drawables[0], drawables[1], drawables[2], drawables[3]);

        }



        // Handle your JSON response here without assuming a 'status' field
        // You can parse the response and handle success/failure accordingly

        // Display the values in the corresponding TextViews
    }

    private void fetchcom1(String username) {
        // Replace "http://192.168.156.100:80/login/prof.php" with your actual API endpoint
        String apiUrl = ip.ipt + "completedyear4.php";

        // Append the username as a parameter to the URL
        StringRequest stringRequest = new StringRequest(Request.Method.POST, apiUrl,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        handleResponses(response,username);
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


    private void handleResponses(String response,String username) {

        Log.d("JSON Response", response);
        String[] values = response.split(", ");
        if(values[1].equals("0")){
            Dialog myDialog = new Dialog(year4doseactivity.this);
            myDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            myDialog.setContentView(R.layout.popup3);
            myDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            myDialog.show();
        }
        else if(values[2].substring(0, values[2].length() - 1).equals("0")){

            Intent it1 = new Intent(this,calender_year_4.class);
            it1.putExtra("username",username);
            startActivity(it1);
        }
        else{
            Dialog myDialog = new Dialog(year4doseactivity.this);
            myDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            myDialog.setContentView(R.layout.popup2dose);
            myDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            myDialog.show();
        }
    }

    private void fetchcom2(String username) {
        // Replace "http://192.168.156.100:80/login/prof.php" with your actual API endpoint
        String apiUrl = ip.ipt + "completedyear4.php";

        // Append the username as a parameter to the URL
        StringRequest stringRequest = new StringRequest(Request.Method.POST, apiUrl,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        handleResponses1(response);
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


    private void handleResponses1(String response) {

        Log.d("JSON Response", response);
        String[] values = response.split(", ");

        if(values[1].equals("0")){
            Dialog myDialog = new Dialog(year4doseactivity.this);
            myDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            myDialog.setContentView(R.layout.popup3);
            myDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            myDialog.show();
        }
        else if(values[2].substring(0, values[2].length() - 1).equals("0")){

            LocalDate currentDate;
            currentDate = LocalDate.now();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate parsedDate = parseDate(values[0].substring(1,values[0].length()));

            // Formatting the LocalDate to a string
            String formattedDate = currentDate.format(formatter);
            int numberOfDaysToAdd = 90;
            LocalDate futureDate = parsedDate.plusDays(numberOfDaysToAdd);
            String formattedDat = futureDate.format(formatter);

            // Calculate the number of days between today and the future date
            long daysBetween = ChronoUnit.DAYS.between(currentDate, futureDate);
            int days = (int) daysBetween;

            Dialog myDialog = new Dialog(year4doseactivity.this);

            myDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            myDialog.setContentView(R.layout.popup1dose);
            TextView t1= myDialog.findViewById(R.id.textView50);
            t1.setText(formattedDat);
            TextView t2= myDialog.findViewById(R.id.textView52);
            t2.setText(Integer.toString(days));
            myDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            myDialog.show();

            // Initialize the CalendarView

        }
        else{
            Dialog myDialog = new Dialog(year4doseactivity.this);
            myDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
            myDialog.setContentView(R.layout.popup2dose);
            myDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            myDialog.show();
        }
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
}