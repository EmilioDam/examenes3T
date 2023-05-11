package com.emilio.webapp1

import android.os.Bundle
import android.webkit.WebView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val url = "file:///android_asset/index.html"
        val miVistaWeb: WebView = findViewById(R.id.VistaWeb)
        miVistaWeb.loadUrl(url)
        val ajustesVisorWeb = miVistaWeb.getSettings()
        ajustesVisorWeb.javaScriptEnabled = true

    }
}