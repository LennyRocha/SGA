package mx.edu.utez.integradora.Utils;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.googleapis.json.GoogleJsonError;
import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.client.util.Base64;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.gmail.Gmail;
import com.google.api.services.gmail.model.Message;
import jakarta.mail.Session;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.io.*;
import java.nio.file.Paths;
import java.util.Objects;
import java.util.Properties;
import java.util.Set;

import static com.google.api.services.gmail.GmailScopes.GMAIL_SEND;
import static jakarta.mail.Message.RecipientType.TO;
public class GmailSender {
    private static final String TOKENS_DIRECTORY_PATH = "src/main/resources/tokens";
    private static final String FROM = "sistemagestionalmacen.utez@gmail.com";
    private final Gmail service;

    public GmailSender() throws Exception {
        NetHttpTransport httpTransport = GoogleNetHttpTransport.newTrustedTransport();
        GsonFactory jsonFactory = GsonFactory.getDefaultInstance();
        service = new Gmail.Builder(httpTransport, jsonFactory, getCredentials(httpTransport, jsonFactory))
                .setApplicationName("AplicacionesWeb")
                .build();
    }

    public static String makeHeader(){
        // Leer el header
        StringBuilder headerBuilder = new StringBuilder();
        try (BufferedReader in = new BufferedReader(new FileReader("src/main/webapp/Templates/HeadCorreo.html"))) {
            String str;
            while ((str = in.readLine()) != null) {
                headerBuilder.append(str);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        String header = headerBuilder.toString();
        return header;
    }

    public static String makeFooter(){
        // Leer el footer
        StringBuilder footerBuilder = new StringBuilder();
        try (BufferedReader in = new BufferedReader(new FileReader("src/main/webapp/Templates/FootCorreo.html"))) {
            String str;
            while ((str = in.readLine()) != null) {
                footerBuilder.append(str);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        String footer = footerBuilder.toString();
        return footer;
    }

    private static Credential getCredentials(final NetHttpTransport httpTransport, GsonFactory jsonFactory)
            throws IOException {
        GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(jsonFactory,
                new InputStreamReader(Objects.requireNonNull(GmailSender.class.getResourceAsStream("/credentials.json"))));
        // /credentials.json
        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                httpTransport, jsonFactory, clientSecrets, Set.of(GMAIL_SEND))
                .setDataStoreFactory(new FileDataStoreFactory(Paths.get(TOKENS_DIRECTORY_PATH).toFile()))
                .setAccessType("offline")
                .build();
        LocalServerReceiver receiver = new LocalServerReceiver.Builder().setPort(8888).build();
        return new AuthorizationCodeInstalledApp(flow, receiver).authorize("user");
    }

    public void sendMail(String para, String asunto, String mensaje) throws Exception {
        Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);
        MimeMessage email = new MimeMessage(session);
        email.setFrom(new InternetAddress(FROM));
        email.addRecipient(TO, new InternetAddress(para));
        email.setSubject(asunto);
        email.setContent(mensaje,"text/html; charset=utf-8");
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        email.writeTo(buffer);
        byte[] rawMessageBytes = buffer.toByteArray();
        String encodedEmail = Base64.encodeBase64URLSafeString(rawMessageBytes);
        Message msg = new Message();
        msg.setRaw(encodedEmail);
        try {
            service.users().messages().send("me", msg).execute();
        } catch (GoogleJsonResponseException e) {
            GoogleJsonError error = e.getDetails();
            if (error.getCode() == 403) {
                System.err.println("No se pudo enviar el mensaje: " + e.getDetails());
            } else {
                throw e;
            }
        }
    }
    public static void main (String[]args) throws Exception
    {
        String header = makeHeader();
        String footer = makeFooter();
        StringBuilder htmlContent = new StringBuilder();
        htmlContent.append("<br>")
                .append("<H1 style='color:#1D3557;>HOLA ")
                .append("</H1>")
                .append("<H2>La recuperación de tu contraseña fue exitosa, el cambio debe verse reflejado la proxmia vez que inicies sesión</H2>")
                .append("<center><a href=http://localhost:8080/Integradora_war_exploded/index.jsp style=\"color:#E63946;text-decoration:underline;\">Volver</a></center>")
                .append("<br>");
        new GmailSender().sendMail("20233tn094@utez.edu.mx", "Los Cisco Paquitos Tracer",
                header+htmlContent+footer);
    }
}
