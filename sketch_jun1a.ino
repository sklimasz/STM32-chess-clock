#include <SoftwareSerial.h>
#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>

// USART
#define RX_PIN 13 // ESP8266 RX pin
#define TX_PIN 15 // ESP8266 TX pin

SoftwareSerial uart2(RX_PIN, TX_PIN); // Create a SoftwareSerial object for UART2

// WIFI
// const char* ssid = "iPhone(Kajetan)";
// const char* password = "12345678";

const char *ssid = "iPhone(Kajetan)";
const char *password = "12345678";

ESP8266WebServer server(80);
String message = "Initial";
String liveTiming = "";
void handleRoot() {
  String html = "<html>"
  "<head>"
  "<meta charset=\"UTF-8\" http-equiv=\"refresh\" content=\"1\">"
  "<title>Chess Clock by sklichans</title>"
  "<style>body {font-family: Arial, sans-serif;text-align: center;margin: 0;padding: 20px;background-color: #f2f2f2;}p {font-size: 24px;color: #333;margin-bottom: 10px;}</style>"
  "</head>"
  "<body>"
  "<h1>PMIK Chess Clock</h1>"
  "<h2>Live Timing:</h2>"
  "<h3>"+liveTiming+"</h3>"
  "<p>"+message+"</p>"
  "</body>"
  "</html>";
  server.send(200, "text/html", html);
}


void setup() {
  Serial.begin(115200); // Start the Serial communication
  delay(10);
  uart2.begin(9600);  // Start UART2 communication

  Serial.println("ESP8266 UART2 Receiver");

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());

  server.on("/", handleRoot);

  server.begin();
  Serial.println("Web server started");
}

void loop() {
  static String receivedSentence; // String to accumulate the received sentence

  if (uart2.available()) { // Check if there is data available on UART2
    char receivedChar = uart2.read(); // Read the received character

    if (receivedChar == '\n') { // Check if the termination character is received
      if (receivedSentence.indexOf("Start")>=0){
        message = "<br>";
      }
      if (receivedSentence.indexOf("Live")>=0){
        liveTiming = receivedSentence.substring(6);
      }
      else
      {
        // The entire sentence has been received, process it here
        Serial.print("Received: ");
        Serial.println(receivedSentence);
        if (receivedSentence.indexOf("White")>=0){
          message = message + receivedSentence;
        }
        else{
        message = message + receivedSentence + "<br><br>";
        }
      }
      // Reset the receivedSentence variable for the next sentence
      receivedSentence = "";
    } else {
      // Accumulate the characters to form the sentence
      receivedSentence += receivedChar;
    }
  }
  server.handleClient();
}