using System;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Net;
using System.Xml;
using Newtonsoft.Json;


namespace BlackoutRugbyPOC.Controllers {
    public class BlackoutRugbyAPI {
        public static string Request(string requestParams, string devKey, string devIV, string devID) {
            // Create an unencrypted request as an array of bytes
            byte[] request = UTF8Encoding.UTF8.GetBytes(requestParams);
            byte[] key = UTF8Encoding.UTF8.GetBytes("GO8FzK17iPYKE2Kt");
            byte[] iv = UTF8Encoding.UTF8.GetBytes("E2I51NEwsC3RdSNl");

            AesCryptoServiceProvider aes = new AesCryptoServiceProvider();
            aes.Key = key;
            aes.IV = iv;
            aes.Mode = CipherMode.CBC;
            aes.Padding = PaddingMode.Zeros;

            // Get the transformer from the AES Encryptor
            ICryptoTransform cTransform = aes.CreateEncryptor();

            // Use the transformer to encrypt our request
            byte[] result = cTransform.TransformFinalBlock(request, 0, request.Length);
            aes.Clear();

            // Encode to base64
            string encryptedRequest = Convert.ToBase64String(result, 0, result.Length);

            // Send request to API
            string requestUri = "http://api.blackoutrugby.com/?d=" + devID + "&er=" + encryptedRequest;
            string xmlResponse = getWebResponse(requestUri);
            return XmlToJson(xmlResponse);
        }

        private static string getWebResponse(string url) {
            string html = "";

            WebRequest request = HttpWebRequest.Create(url);
            WebResponse response = request.GetResponse();

            using (StreamReader reader = new StreamReader(response.GetResponseStream())) {
                html = reader.ReadToEnd();
            }
            return html;
        }

        public static string XmlToJson(string xml) {
            if (string.IsNullOrEmpty(xml))
                throw new ArgumentNullException("XML Input");

            XmlDocument doc = new XmlDocument();
            try {
                doc.LoadXml(xml);
            } catch {
                throw new ArgumentNullException("Input could not be loaded into XML Document");
            }

            return JsonConvert.SerializeXmlNode(doc, Newtonsoft.Json.Formatting.Indented);
        }
    }
}
