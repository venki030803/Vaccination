    package com.example.medicalproject;

    import androidx.appcompat.app.AppCompatActivity;
    import android.content.Intent;
    import android.net.Uri;
    import android.os.Bundle;
    import android.view.View;
    import android.widget.Button;

    public class ArticleHomeActivity extends AppCompatActivity {

        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);
            setContentView(R.layout.activity_articlehome);

            Button button4 = findViewById(R.id.button4);
            button4.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    openUrl("https://www.cdc.gov/vaccinesafety/vaccines/pneumococcal-vaccine.html");
                }
            });

            Button button5 = findViewById(R.id.button5);
            button5.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    openUrl("https://www.cdc.gov/tb/publications/factsheets/prevention/bcg.htm");
                }
            });

            Button button6 = findViewById(R.id.button6);
            button6.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    openUrl("https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www.cdc.gov/vaccines/parents/diseases/index.html&ved=2ahUKEwi28s-1uZGBAxWysFYBHZ_WBRAQFnoECBMQBQ&usg=AOvVaw37AdJ--iquApWEuqtNFohj");
                }
            });
        }

        private void openUrl(String url) {
            // Create an intent with the URL
            Intent intent = new Intent(Intent.ACTION_VIEW);
            intent.setData(Uri.parse(url));

            // Start the activity with the intent
            startActivity(intent);
        }
    }
