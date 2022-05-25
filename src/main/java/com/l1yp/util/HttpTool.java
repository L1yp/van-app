package com.l1yp.util;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * 2021/2/1 Created by 𝑳𝒚𝒑(l1yp@qq.com),
 */
public class HttpTool {

    public static Response GET(String link) {
        try {
            URL url = new URL(link);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36");
            connection.setRequestProperty("Accept", "*/*");
            connection.setRequestProperty("Connection", "keep-alive");

            connection.setUseCaches(false);
            connection.connect();

            Response response = new Response();
            response.statusCode = connection.getResponseCode();
            response.headers = connection.getHeaderFields();
            response.body = connection.getInputStream().readAllBytes();

            connection.getInputStream().close();

            return response;
        } catch (IOException e) {
            return null;
        }


    }

    public static Response HEAD(String link) {
        try {
            URL url = new URL(link);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("HEAD");
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36");
            connection.setRequestProperty("Accept", "*/*");
            connection.setRequestProperty("Connection", "keep-alive");

            connection.setUseCaches(false);
            connection.connect();

            Response response = new Response();
            response.statusCode = connection.getResponseCode();
            response.headers = connection.getHeaderFields();
            response.body = connection.getInputStream().readAllBytes();

            connection.getInputStream().close();

            return response;
        } catch (IOException e) {
            return null;
        }


    }

    public static Response GET(String link, String cookies) {
        try {
            URL url = new URL(link);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36");
            connection.setRequestProperty("Accept", "*/*");
            connection.setRequestProperty("Connection", "keep-alive");
            connection.setRequestProperty("Cookie", cookies);

            connection.setUseCaches(false);
            connection.connect();

            Response response = new Response();
            response.statusCode = connection.getResponseCode();
            response.headers = connection.getHeaderFields();
            response.body = connection.getInputStream().readAllBytes();

            connection.getInputStream().close();

            return response;
        } catch (IOException e) {
            return null;
        }


    }


    public static Response POST(String link, Map<String, String> headers, String body) throws IOException {
        URL url = new URL(link);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");

        for (Entry<String, String> entry : headers.entrySet()) {
            connection.setRequestProperty(entry.getKey(), entry.getValue());
        }

        connection.setUseCaches(false);

        connection.setDoOutput(true);

        connection.connect();
        OutputStream os = connection.getOutputStream();
        os.write(body.getBytes(StandardCharsets.UTF_8));
        os.flush();
        os.close();

        Response response = new Response();
        response.statusCode = connection.getResponseCode();
        response.headers = connection.getHeaderFields();
        response.body = connection.getInputStream().readAllBytes();

        connection.getInputStream().close();

        return response;
    }


    public static Response POST(String link, Map<String, String> headers, byte[] buffer, int pos, int size) throws IOException {
        HttpURLConnection connection = null;
        URL url = new URL(link);
        connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");

        for (Entry<String, String> entry : headers.entrySet()) {
            connection.setRequestProperty(entry.getKey(), entry.getValue());
        }

        connection.setUseCaches(false);

        connection.setDoOutput(true);

        connection.connect();
        OutputStream os = connection.getOutputStream();
        os.write(buffer, pos, size);
        os.flush();
        os.close();

        Response response = new Response();
        response.statusCode = connection.getResponseCode();
        response.headers = connection.getHeaderFields();
        response.body = connection.getInputStream().readAllBytes();

        connection.getInputStream().close();

        return response;
    }

    public static class Response {
        public int statusCode;

        public Map<String, List<String>> headers;

        public byte[] body;

    }


}
