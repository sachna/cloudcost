<%@ page import= "java.io.BufferedReader" %>
<%@ page import= "java.io.IOException"%>
<%@ page import= "java.util.*"%>
<%@ page import= "java.io.*"%>
<%@ page import= "java.io.InputStreamReader"%>
<%@ page import= "java.net.HttpURLConnection"%>
<%@ page import = "java.net.MalformedURLException"%>
<%@ page import= "java.net.URL"%>
<%@ page import= "org.json.simple.JSONArray"%>;
<%@ page import= "org.json.simple.JSONObject"%>;
<%@ page import= "org.json.simple.parser.ParseException"%>;
<%@ page import= "org.json.simple.parser.JSONParser"%>;

<%
//JSONService();

makeHttpRequest();
String jspPath = session.getServletContext().getRealPath("/");
List Azurelst = FileReadingDemo(jspPath + "/AzureRegion.txt");
List AWSlst = FileReadingDemo(jspPath + "/AWSRegion.txt");
List GCPlst = FileReadingDemo(jspPath + "/GoogleRegion.txt");
List Oraclelst = FileReadingDemo(jspPath + "/OracleRegion.txt");
String strRegion11 = request.getParameter("region1") ;
String strRegion12 = request.getParameter("region2") ;
String strRegion13 = request.getParameter("region3") ;
String strRegion14 = request.getParameter("region4") ;
System.out.println("Region1 = " + strRegion11);


if(strRegion11 == null) strRegion11 = "US East (N. Virginia)";
if(strRegion12 == null) strRegion12 = "East US";
if(strRegion13 == null) strRegion13 = "Ashburn, Virigina, USA(us-east)";
if(strRegion14 == null) strRegion14 = "US East (Ashburn)";
System.out.println("Region1 = " + strRegion11);

HashMap azureMap = getAzureDetails("US East", "E2d v4");
System.out.println(azureMap);

HashMap gcpMap = getGCPDetails("US East", "E2d v4");
System.out.println(gcpMap);

String strAWSVM = "";
String strAzureVM = (String) azureMap.get("product");
String strGCPVM = "";
String strOracleVM = "";

String  strAWSVMHCost = "";
String  strAzureVMHCost = (String) azureMap.get("hourCost");
String  strGCPVMHCost = "";
String  strOracleVMHCost = "";

String  strAWSVM1YCost = "";
String strAzureVM1YCost = (String) azureMap.get("1YearCost");
String strGCPVM1YCost = "";
String strOracleVM1YCost = "";

String strAWSVM3YCost = "";
String strAzureVM3YCost = (String) azureMap.get("3YearCost");
String strGCPVM3YCost = "";
String strOracleVM3YCost = "";

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>HTML5 Web Page Layout</title>
<style>
  img {
  border: 1px solid #ddd; /* Gray border */
  border-radius: 4px;  /* Rounded border */
  padding: 5px; /* Some padding */
  width: 75px; /* Set a small width */
}

/* Add a hover effect (blue shadow) */
img:hover {
  box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}
    body {
        font: 14px Arial,sans-serif; 
        margin: 0px;
    }
    header {
        padding: 5px 5px;
        background: #acb3b9; 
        text-align: center;
    }
    header h1 {
        font-size: 24px;
    }
    .container {
        width: 100%;
        background: white;  
    }
    nav, section {
        float: left; 
        padding: 10px;
        box-sizing: border-box;
    }
    section {
        width: 80%;
    }
    nav {
        width: 13%;             
        background: #d4d7dc;
        height: 38pc;
    }    
    nav ul {
        list-style: none; 
        line-height: 24px;
        padding: 0px; 
    }
    nav ul li a {
        color: #333;
    }
    .clearfix:after {
        content: ".";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }
    footer {
        background: #acb3b9;            
        text-align: center;
        padding: 5px;
    }
    table, th, td {
     border: 1px solid black;
    }
    td {
     border: 1px solid black;
     width: 350px;
     height: auto;
    }
</style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Cloud Cost Comparision</h1>
        </header>
        <div class="wrapper clearfix">
            <nav>
                <ul>
                    <h3><li><a href="index.jsp">Home</a></li></h3>
                </ul>   
                <ul>
                    <h3><li><a href="webpage.jsp">Web Application</a></li></h3>
                </ul>  
                <ul>
                  <h3><li><a href="webpage.jsp">Custom</a></li></h3>
                </ul>                         
            </nav>
            <section id="section1">
                Welcome to our site
                <br> <br> <br> <br> 
                <form id="form1" name="form1" action="webpage.jsp" method="POST">
                    <label for="currency"><b>Currency</b></label>
                    <select name="currency1" id="currency1">
                        <option value="USD">USD</option>
                        <option value="CAD">CAD</option>
                        <option value="EURO">EURO</option>
                      </select>
                    <br><br>
                    <table>
                        <tr>
                          <td>&nbsp;</td>
                          <td><a target="_blank" >
                            <img src="OIP.jpg" alt="AWS">
                          </a></td>
                          <td><a target="_blank" >
                            <img src="azure.jpg" alt="Azure">
                          </a></td>
                          <td><a target="_blank" >
                            <img src="gcp.jpg" alt="Google">
                          </a></td>
                          <td><a target="_blank" >
                            <img src="oracle.jpg" alt="Oracle">
                          </a></td>
                        </tr>
                        <tr>
                          <td><b>Region</b></td>
                          <td>                            
                            <select name="region1" id="region1" style="width: 200px;" onchange="myFunctiondemo()">
                           <%
                              for(int i = 0; i < AWSlst.size() ; i++) {   
                              if(strRegion11.equals((String) AWSlst.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) AWSlst.get(i)%>"><%=(String) AWSlst.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) AWSlst.get(i)%>"><%=(String) AWSlst.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>  
                          </select>                       
                          </td>
                          <td>
                            <select name="region2" id="region2" style="width: 200px;" onchange="myFunctiondemo()">
                              <%
                              for(int i = 0; i < Azurelst.size() ; i++) {   
                              if(strRegion12.equals((String) Azurelst.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) Azurelst.get(i)%>"><%=(String) Azurelst.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) Azurelst.get(i)%>"><%=(String) Azurelst.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>   
                             </select> 
                          </td>
                          <td>
                            <select name="region3" id="region3" style="width: 200px;" onchange="myFunctiondemo()"> 
                              <%
                              for(int i = 0; i < GCPlst.size() ; i++) {   
                              if(strRegion13.equals((String) GCPlst.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) GCPlst.get(i)%>"><%=(String) GCPlst.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) GCPlst.get(i)%>"><%=(String) GCPlst.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>   
                             </select> 
                          </td>
                          <td>
                            <select name="region4" id="region4" style="width: 200px;" onchange="myFunctiondemo()">
                              <%
                              for(int i = 0; i < Oraclelst.size() ; i++) {   
                              if(strRegion14.equals((String) Oraclelst.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) Oraclelst.get(i)%>"><%=(String) Oraclelst.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) Oraclelst.get(i)%>"><%=(String) Oraclelst.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>  
                             </select> 
                          </td>
                        </tr>                       
                        <tr>
                            <td><br><b>Product Details</b><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></td>
                            <td><%=strAWSVM%></td>
                            <td><%=strAzureVM%></td>
                            <td><%=strGCPVM%></td>
                            <td><%=strOracleVM%></td>
                          </tr>
                          <tr>
                            <td><b>Hourly Cost</b></td>
                            <td><%=strAWSVMHCost%></td>
                            <td><%=strAzureVMHCost%></td>
                            <td><%=strGCPVMHCost%></td>
                            <td><%=strOracleVMHCost%></td>
                          </tr>
                          <tr>
                            <td><b>Monthly Cost</b></td>
                            <td><%=strAWSVMHCost%></td>
                            <td><%=strAzureVMHCost%></td>
                            <td><%=strGCPVMHCost%></td>
                            <td><%=strOracleVMHCost%></td>
                          </tr>    
                          <tr>
                            <td><b>1 Year Cost</b></td>
                            <td><%=strAWSVM1YCost%></td>
                            <td><%=strAzureVM1YCost%></td>
                            <td><%=strGCPVM1YCost%></td>
                            <td><%=strOracleVM1YCost%></td>
                          </tr>  
                          <tr>
                            <td><b>3 Year Cost</b></td>
                            <td><%=strAWSVM3YCost%></td>
                            <td><%=strAzureVM3YCost%></td>
                            <td><%=strGCPVM3YCost%></td>
                            <td><%=strOracleVM3YCost%></td>
                          </tr>             
                      </table>
              </form>
            </section>
        </div>
        <footer>
            <p>copyright &copy; cloudcostcompare.com</p>
        </footer>
    </div>
</body>
</html>
<script>
    function loadhtml(id, filename) {
        let element = document.getElementById(id);      
        document.getElementById("myForm").submit();
       
    }

  function myFunctiondemo() {
    this.form1.submit();
  }
</script>


<%!
public void JSONService() throws Exception {
    System.out.println("hi");
    URL url = new URL("https://prices.azure.com/api/retail/prices");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");
    System.out.println("hi21");
    conn.connect();
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}
    System.out.println("hi2");
		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));

		String output;
		System.out.println("Output from Server .... \n");
		while ((output = br.readLine()) != null) {
			System.out.println(output);
		}

		conn.disconnect();
  }

  public List FileReadingDemo(String fileName) throws Exception {
    List<String> result = new ArrayList<>();
      BufferedReader br = null;
    
      try {
       
        //String txtFilePath = jspPath+ "/aFile.txt";
        System.out.println(System.getProperty("user.dir"));
        br = new BufferedReader(new FileReader(fileName));
    
        String line;
        while ((line = br.readLine()) != null) {
          result.add(line.trim());
          System.out.println("=="+line.trim());
        }
    
      } catch (IOException e) {
        e.printStackTrace();
      } finally {
        if (br != null) {
          br.close();
        }
      }
      return result;
    }

    public HashMap getAzureDetails(String strRegion, String strSKU) throws Exception {
      HashMap hMap = new HashMap();
      System.out.println("hi");
      String strURL = "https://prices.azure.com/api/retail/prices?$filter=location eq '" 
      + strRegion +"'  and skuName eq '" + strSKU + "'";
      strURL = strURL.replace(" ", "%20");
      URL url = new URL(strURL);
     
      System.out.println(url);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");
      conn.setRequestProperty("Accept", "application/json");
     
      conn.setRequestProperty("Connection", "keep-alive");
      conn.connect();
      System.out.println("hi21" + conn.getResponseCode() );
		  if (conn.getResponseCode() != 200) {
		  	throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		  }
      System.out.println("hi2");
		  BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));

		  String output = "";
      String strOut = "";
		  System.out.println("Output from Server .... \n");
		  while ((output = br.readLine()) != null) {			  
        strOut = output;
		  }
     
      JSONParser jsonParser = new JSONParser();
      JSONObject jsonObject = (JSONObject) jsonParser.parse(strOut);

      JSONArray items = (JSONArray) jsonObject.get("Items");
      System.out.println(items.size());
      String strProduct = "";
      String strHourCost = "";
      String str1YCost = "";
      String str3YCost = "";

      for (int i = 0; i < items.size(); i++) {
        //System.out.println("The " + i + " element of the array: " + items.get(i));
        JSONObject innerObj = (JSONObject)  items.get(i);
        System.out.println(innerObj);

               if(i == 0) strProduct = innerObj.get("productName") + "" ;
               
               if(i == 0) strHourCost = innerObj.get("retailPrice") + "";
               System.out.println("!" + innerObj.get("retailPrice"));

               if( innerObj.get("reservationTerm") != null)
               {
               if(((String) innerObj.get("reservationTerm")).equals("1 Year")) str1YCost =innerObj.get("retailPrice") + "" ;
               if(((String) innerObj.get("reservationTerm")).equals("3 Years")) str3YCost = innerObj.get("retailPrice") + "";
               }
      }
      hMap.put("product", strProduct.trim());
      hMap.put("hourCost", strHourCost.trim());
      hMap.put("1YearCost", str1YCost.trim());
      hMap.put("3YearCost", str3YCost.trim());
	  	conn.disconnect();
     // System.out.println(hMap);
      return hMap;
    }

    public HashMap getAWSDetails(String strRegion, String strSKU) throws Exception {
      HashMap hMap = new HashMap();
      System.out.println("hi");
      String strURL = "https://prices.azure.com/api/retail/prices?$filter=location eq '" 
      + strRegion +"'  and skuName eq '" + strSKU + "'";
      strURL = strURL.replace(" ", "%20");
      URL url = new URL(strURL);
     
      System.out.println(url);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");
      conn.setRequestProperty("Accept", "application/json");
     
      conn.setRequestProperty("Connection", "keep-alive");
      conn.connect();
      System.out.println("hi21" + conn.getResponseCode() );
		  if (conn.getResponseCode() != 200) {
		  	throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		  }
      System.out.println("hi2");
		  BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));

		  String output = "";
      String strOut = "";
		  System.out.println("Output from Server .... \n");
		  while ((output = br.readLine()) != null) {			  
        strOut = output;
		  }
     
      JSONParser jsonParser = new JSONParser();
      JSONObject jsonObject = (JSONObject) jsonParser.parse(strOut);

      JSONArray items = (JSONArray) jsonObject.get("Items");
      System.out.println(items.size());
      String strProduct = "";
      String strHourCost = "";
      String str1YCost = "";
      String str3YCost = "";

      for (int i = 0; i < items.size(); i++) {
        //System.out.println("The " + i + " element of the array: " + items.get(i));
        JSONObject innerObj = (JSONObject)  items.get(i);
        System.out.println(innerObj);

               if(i == 0) strProduct = innerObj.get("productName") + "" ;
               
               if(i == 0) strHourCost = innerObj.get("retailPrice") + "";
               System.out.println("!" + innerObj.get("retailPrice"));

               if( innerObj.get("reservationTerm") != null)
               {
               if(((String) innerObj.get("reservationTerm")).equals("1 Year")) str1YCost =innerObj.get("retailPrice") + "" ;
               if(((String) innerObj.get("reservationTerm")).equals("3 Years")) str3YCost = innerObj.get("retailPrice") + "";
               }
      }
      hMap.put("product", strProduct.trim());
      hMap.put("hourCost", strHourCost.trim());
      hMap.put("1YearCost", str1YCost.trim());
      hMap.put("3YearCost", str3YCost.trim());
	  	conn.disconnect();
     //System.out.println(hMap);
      return hMap;
    }


    public HashMap getGCPDetails(String strRegion, String strSKU) throws Exception {
      HashMap hMap = new HashMap();
      System.out.println("hi");
      String strURL = "https://cloudbilling.googleapis.com/v1/services?key=AIzaSyDZz7JPOsp6XzTQIjx9kDQ904T5xewtDqU" ;
      strURL = strURL.replace(" ", "%20");
      URL url = new URL(strURL);
     
      System.out.println(url);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");
      conn.setRequestProperty("Accept", "application/json");
     
      conn.setRequestProperty("Connection", "keep-alive");
      conn.connect();
      System.out.println("hi21" + conn.getResponseCode() );
		  if (conn.getResponseCode() != 200) {
		  	throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		  }
 
		  BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));

      String output = "";
      String strOut = "";

      while ((output = br.readLine()) != null) {			  
        strOut = strOut + output;
		  }

     // System.out.println(strOut);



      
      return hMap;
    }

    private static String makeHttpRequest() throws IOException {
      String jsonResponse = "";

      URL url = new URL("https://pricing.api.infracost.io/graphql");
  
     // If the URL is null, then return early.
      if (url == null) {
          return jsonResponse;
      }
  
      HttpURLConnection urlConnection = null;
      InputStream inputStream = null;
      try {
          urlConnection = (HttpURLConnection) url.openConnection();
          urlConnection.setReadTimeout(10000 /* milliseconds */);
          urlConnection.setConnectTimeout(15000 /* milliseconds */);
          urlConnection.setRequestMethod("POST");
          urlConnection.setDoOutput(true);
          urlConnection.setDoInput(true);
          urlConnection.setRequestProperty("X-Api-Key","qDOTgrU9syjskUBFhvRNktZiabGAk5ry");
          urlConnection.setRequestProperty("Content-Type", "application/json");
  
          DataOutputStream wr = new DataOutputStream(urlConnection.getOutputStream());
    
          wr.writeBytes("{\"query\": \"{ products(filter: {vendorName: \"aws\", service: \"AmazonEC2\", region: \"us-east-1\", attributeFilters: [{key: \"instanceType\", value: \"m3.large\"}, {key: \"operatingSystem\", value: \"Linux\"}, {key: \"tenancy\", value: \"Shared\"}, {key: \"capacitystatus\", value: \"Used\"}, {key: \"preInstalledSw\", value: \"NA\"}]}) { prices(filter: {purchaseOption: \"on_demand\"}) { USD } } } \"}"); 

          wr.flush();
          wr.close();
  
          int rc = urlConnection.getResponseCode();
          inputStream = urlConnection.getInputStream();
          //jsonResponse = readFromStream(inputStream);

          BufferedReader br = new BufferedReader(new InputStreamReader(
            (urlConnection.getInputStream())));
      
            String output = "";
            String strOut = "";
      
            while ((output = br.readLine()) != null) {			  
              strOut = strOut + output;
              System.out.println("----"+output);
            }
      
            
  
      } catch (IOException e) {
         
      } finally {
          if (urlConnection != null) {
              urlConnection.disconnect();
          }
          if (inputStream != null) {
              inputStream.close();
          }
      }
      return jsonResponse;
  }
  
%>
