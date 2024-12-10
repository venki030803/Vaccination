            package com.example.medicalproject;

            import androidx.appcompat.app.AppCompatActivity;

            import android.os.Bundle;
            import android.util.Log;
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

            public class profilemyactivity extends AppCompatActivity {
                private TextView t;
                @Override
                protected void onCreate(Bundle savedInstanceState) {
                    super.onCreate(savedInstanceState);
                    setContentView(R.layout.activity_profilemyactivity);
                    String parentname = getIntent().getStringExtra("parentname");
                    String username = getIntent().getStringExtra("username");
                    TextView t1 = findViewById(R.id.textView22);
                    t=findViewById(R.id.textView25);
                    t1.setText(parentname);


                }

            }