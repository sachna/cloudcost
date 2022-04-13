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
//makeHttpRequest();
String jspPath = session.getServletContext().getRealPath("/");
List Azurelst = FileReadingDemo(jspPath + "/AzureRegion.txt");
List AWSlst = FileReadingDemo(jspPath + "/AWSRegion.txt");
List GCPlst = FileReadingDemo(jspPath + "/GoogleRegion.txt");
List Oraclelst = FileReadingDemo(jspPath + "/OracleRegion.txt");
System.out.println("==========================");
System.out.println("Azurelst == " + Azurelst.size());
System.out.println("AWSlst == " + AWSlst.size());
System.out.println("GCPlst == " + GCPlst.size());
System.out.println("Oraclelst == " + Oraclelst.size());

// VM 
List AzurelstVM = FileReadingDemo(jspPath + "/AzureVM.txt");
List AWSlstVM = FileReadingDemo(jspPath + "/AWSVM.txt");
List GCPlstVM = FileReadingDemo(jspPath + "/GoogleVM.txt");
List OraclelstVM = FileReadingDemo(jspPath + "/OracleVM.txt");


// Storage 
List AzurelstStorage = FileReadingDemo(jspPath + "/AzureStorage.txt");
List AWSlstStorage = FileReadingDemo(jspPath + "/AWSStorage.txt");
List GCPlstsStorage = FileReadingDemo(jspPath + "/GoogleStorage.txt");
List OraclelstStorage = FileReadingDemo(jspPath + "/OracleStorage.txt");

// Network 
List AzurelstNetwork = FileReadingDemo(jspPath + "/AzureNetwork.txt");
List AWSlstNetwork = FileReadingDemo(jspPath + "/AWSNetwork.txt");
List GCPlstNetwork = FileReadingDemo(jspPath + "/GoogleNetwork.txt");
List OraclelstNetwork = FileReadingDemo(jspPath + "/OracleNetwork.txt");

// Database 
List AzurelstDB = FileReadingDemo(jspPath + "/AzureDB.txt");
List AWSlstDB = FileReadingDemo(jspPath + "/AWSDB.txt");
List GCPlstDB = FileReadingDemo(jspPath + "/GoogleDB.txt");
List OraclelstDB = FileReadingDemo(jspPath + "/OracleDB.txt");

String strRegion11 = request.getParameter("region1") ;
String strRegion12 = request.getParameter("region2") ;
String strRegion13 = request.getParameter("region3") ;
String strRegion14 = request.getParameter("region4") ;

String strVM11 = request.getParameter("vm1") ;
String strVM12 = request.getParameter("vm2") ;
String strVM13 = request.getParameter("vm3") ;
String strVM14 = request.getParameter("vm4") ;

String strStorage11 = request.getParameter("storage1") ;
String strStorage12 = request.getParameter("storage2") ;
String strStorage13 = request.getParameter("storage3") ;
String strStorage14 = request.getParameter("storage4") ;

String strNetwork11 = request.getParameter("network1") ;
String strNetwork12 = request.getParameter("network2") ;
String strNetwork13 = request.getParameter("network3") ;
String strNetwork14 = request.getParameter("network4") ;

String strDB11 = request.getParameter("db1") ;
String strDB12 = request.getParameter("db2") ;
String strDB13 = request.getParameter("db3") ;
String strDB14 = request.getParameter("db4") ;
//System.out.println("Region1 = " + strRegion11);


if(strRegion11 == null) strRegion11 = "us-east-1";
if(strRegion12 == null) strRegion12 = "East US";
if(strRegion13 == null) strRegion13 = "us-east1-b";
if(strRegion14 == null) strRegion14 = "Global - same prices";

if(strVM11 == null) strVM11 = "m6g.xlarge";
if(strVM12 == null) strVM12 =  "B4ms";
if(strVM13 == null) strVM13 =  "n1-standard-4";
if(strVM14 == null) strVM14 =  "VM.Standard2.4 ";

if(strStorage11 == null) strStorage11 = "";
if(strStorage12 == null) strStorage12 =  "";
if(strStorage13 == null) strStorage13 =  "";
if(strStorage14 == null) strStorage14 =  "";

if(strNetwork11 == null) strNetwork11 = "";
if(strNetwork12 == null) strNetwork12 =  "";
if(strNetwork13 == null) strNetwork13 =  "";
if(strNetwork14 == null) strNetwork14 =  "";

if(strDB11 == null) strDB11 = "";
if(strDB12 == null) strDB12 =  "";
if(strDB13 == null) strDB13 =  "";
if(strDB14 == null) strDB14 =  "";

HashMap azureMap = getAzureDetails("US East", "E2d v4");
////System.out.println(azureMap);

HashMap gcpMap = getGCPDetails("US East", "E2d v4");
////System.out.println(gcpMap);

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

String strCostAWS = getCost(jspPath + "AWSVM.txt", strVM11, 1);
String strCostAzure = getCost(jspPath +  "AzureVM.txt", strVM12, 1);
String strCostGoogle = getCost(jspPath + "GoogleVM.txt", strVM13, 1);
String strCostOracle = getCost(jspPath + "OracleVM.txt", strVM14, 1);
System.out.println("strCostAWS == " + strCostAWS);
String strPDAWS = getProductDetails(jspPath + "AWSVM.txt", strVM11, 4);
String strPDAzure = getProductDetails(jspPath +  "AzureVM.txt", strVM12, 4);
String strPDGoogle = getProductDetails(jspPath + "GoogleVM.txt", strVM13, 4);
String strPDOracle = getProductDetails(jspPath + "OracleVM.txt", strVM14, 4);
System.out.println(strCostAzure);

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
                <h3><li><a href="webpagefree.jsp">Free Hosting</a></li></h3>
            </ul>  
           <ul>
                <h3><li><a href="webpageown.jsp">Build your own</a></li></h3>
            </ul>                        
            </nav>
            <section id="section1">

                <form id="form1" name="form1" action="webpageown.jsp" method="POST">
                    <label for="currency"><b>Currency</b></label>
                    <select name="currency1" id="currency1">
                        <option value="USD">USD</option>
                        <option value="CAD">CAD</option>
                        <option value="EURO">EURO</option>
                      </select>
					  &nbsp; &nbsp; &nbsp; 
					<label for="currency"><b>Profile</b></label>
                    <select name="currency1" id="currency1">
                        <option value="Standard">Standard</option>
                        <option value="Compute">Compute optimized</option>
                        <option value="Memory">Memory optimized</option>
						<option value="Accelerated">Accelerated computing</option>
                      </select>&nbsp; &nbsp; &nbsp; 
					<label for="currency"><b>Cost</b></label>
                    <select name="currency1" id="currency1">
                        <option value="Standard">Hourly</option>
                        <option value="Compute">1 Year</option>
                        <option value="Memory">3 Year</option>
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
                               // System.out.println((String) GCPlst.get(i));  
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
                          <td><b>Virtual Machine</b></td>
                          <td>                            
                            <select name="vm1" id="vm1" style="width: 200px;" onchange="myFunctiondemo()">
                           <%
                              for(int i = 0; i < AWSlstVM.size() ; i++) {   
                              if(strVM11.equals((String) AWSlstVM.get(i)))       
                              {    
                                                                            
                           %>
                              <option selected value="<%=(String) AWSlstVM.get(i)%>"><%=(String) AWSlstVM.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) AWSlstVM.get(i)%>"><%=(String) AWSlstVM.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>  
                          </select>                       
                          </td>
                          <td>
                            <select name="vm2" id="vm2" style="width: 200px;" onchange="myFunctiondemo()">
                              <%                           
                              for(int i = 0; i < AzurelstVM.size() ; i++) {   
                               
                              if(strVM12.equals((String) AzurelstVM.get(i)))       
                              {   
                                
                           %>
                              <option selected value="<%=(String) AzurelstVM.get(i)%>"><%=(String) AzurelstVM.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                             
                                                 
                           %>
                           <option value="<%=(String) AzurelstVM.get(i)%>"><%=(String) AzurelstVM.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>   
                             </select> 
                          </td>
                          <td>
                            <select name="vm3" id="vm3" style="width: 200px;" onchange="myFunctiondemo()"> 
                              <%
                              for(int i = 0; i < GCPlstVM.size() ; i++) {   
                              if(strVM13.equals((String) GCPlstVM.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) GCPlstVM.get(i)%>"><%=(String) GCPlstVM.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) GCPlstVM.get(i)%>"><%=(String) GCPlstVM.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>   
                             </select> 
                          </td>
                          <td>
                            <select name="vm4" id="vm4" style="width: 200px;" onchange="myFunctiondemo()">
                              <%
                              for(int i = 0; i < OraclelstVM.size() ; i++) {   
                              if(strVM14.equals((String) OraclelstVM.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) OraclelstVM.get(i)%>"><%=(String) OraclelstVM.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) OraclelstVM.get(i)%>"><%=(String) OraclelstVM.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>  
                             </select> 
                          </td>
                        </tr>       
                        <tr>
                          <td><b>Storage</b></td>
                          <td>                            
                            <select name="storage1" id="storage1" style="width: 200px;" onchange="myFunctiondemo()">
                           <%
                              for(int i = 0; i < AWSlstStorage.size() ; i++) {   
                              
                              if(strStorage11.equals((String) AWSlstStorage.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) AWSlstStorage.get(i)%>"><%=(String) AWSlstStorage.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) AWSlstStorage.get(i)%>"><%=(String) AWSlstStorage.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                           // System.out.println("1-");
                            %>  
                          </select>                       
                          </td>
                          <td>
                            <select name="storage2" id="storage2" style="width: 200px;" onchange="myFunctiondemo()">
                              <%
                              for(int i = 0; i < AzurelstStorage.size() ; i++) {   
                                
                              if(strStorage12.equals((String) AzurelstStorage.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) AzurelstStorage.get(i)%>"><%=(String) AzurelstStorage.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) AzurelstStorage.get(i)%>"><%=(String) AzurelstStorage.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>   
                             </select> 
                          </td>
                          <td>
                            <select name="storage3" id="storage3" style="width: 200px;" onchange="myFunctiondemo()"> 
                              <%
                              for(int i = 0; i < GCPlstsStorage.size() ; i++) {   
                              if(strStorage13.equals((String) GCPlstsStorage.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) GCPlstsStorage.get(i)%>"><%=(String) GCPlstsStorage.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) GCPlstsStorage.get(i)%>"><%=(String) GCPlstsStorage.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>   
                             </select> 
                          </td>
                          <td>
                            <select name="storage4" id="storage4" style="width: 200px;" onchange="myFunctiondemo()">
                              <%
                              for(int i = 0; i < OraclelstStorage.size() ; i++) {   
                              if(strStorage14.equals((String) OraclelstStorage.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) OraclelstStorage.get(i)%>"><%=(String) OraclelstStorage.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) OraclelstStorage.get(i)%>"><%=(String) OraclelstStorage.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>  
                             </select> 
                          </td>
                        </tr>     
						                        <tr>
                          <td><b>Network</b></td>
                          <td>                            
                            <select name="network1" id="network1" style="width: 200px;" onchange="myFunctiondemo()">
                           <%
                              for(int i = 0; i < AWSlstNetwork.size() ; i++) {   
                              if(strNetwork11.equals((String) AWSlstNetwork.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) AWSlstNetwork.get(i)%>"><%=(String) AWSlstNetwork.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) AWSlstNetwork.get(i)%>"><%=(String) AWSlstNetwork.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>  
                          </select>                       
                          </td>
                          <td>
                            <select name="network2" id="network2" style="width: 200px;" onchange="myFunctiondemo()">
                              <%
                              for(int i = 0; i < AzurelstNetwork.size() ; i++) {   
                              if(strNetwork12.equals((String) AzurelstNetwork.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) AzurelstNetwork.get(i)%>"><%=(String) AzurelstNetwork.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) AzurelstNetwork.get(i)%>"><%=(String) AzurelstNetwork.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>   
                             </select> 
                          </td>
                          <td>
                            <select name="network3" id="network3" style="width: 200px;" onchange="myFunctiondemo()"> 
                              <%
                              for(int i = 0; i < GCPlstNetwork.size() ; i++) {   
                              if(strNetwork13.equals((String) GCPlstNetwork.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) GCPlstNetwork.get(i)%>"><%=(String) GCPlstNetwork.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) GCPlstNetwork.get(i)%>"><%=(String) GCPlstNetwork.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>   
                             </select> 
                          </td>
                          <td>
                            <select name="network4" id="network4" style="width: 200px;" onchange="myFunctiondemo()">
                              <%
                              for(int i = 0; i < OraclelstNetwork.size() ; i++) {   
                              if(strNetwork14.equals((String) OraclelstNetwork.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) OraclelstNetwork.get(i)%>"><%=(String) OraclelstNetwork.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) OraclelstNetwork.get(i)%>"><%=(String) OraclelstNetwork.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>  
                             </select> 
                          </td>
                        </tr>     
						                        <tr>
                          <td><b>Database</b></td>
                          <td>                            
                            <select name="db1" id="db1" style="width: 200px;" onchange="myFunctiondemo()">
                           <%
                              for(int i = 0; i < AWSlstDB.size() ; i++) {   
                              if(strDB11.equals((String) AWSlstDB.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) AWSlstDB.get(i)%>"><%=(String) AWSlstDB.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) AWSlstDB.get(i)%>"><%=(String) AWSlstDB.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>  
                          </select>                       
                          </td>
                          <td>
                            <select name="db2" id="db2" style="width: 200px;" onchange="myFunctiondemo()">
                              <%
                              for(int i = 0; i < AzurelstDB.size() ; i++) {   
                              if(strDB12.equals((String) AzurelstDB.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) AzurelstDB.get(i)%>"><%=(String) AzurelstDB.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) AzurelstDB.get(i)%>"><%=(String) AzurelstDB.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>   
                             </select> 
                          </td>
                          <td>
                            <select name="db3" id="db3" style="width: 200px;" onchange="myFunctiondemo()"> 
                              <%
                              for(int i = 0; i < GCPlstDB.size() ; i++) {   
                              if(strDB13.equals((String) GCPlstDB.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) GCPlstDB.get(i)%>"><%=(String) GCPlstDB.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) GCPlstDB.get(i)%>"><%=(String) GCPlstDB.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>   
                             </select> 
                          </td>
                          <td>
                            <select name="db4" id="db4" style="width: 200px;" onchange="myFunctiondemo()">
                              <%
                              for(int i = 0; i < OraclelstDB.size() ; i++) {   
                              if(strDB14.equals((String) OraclelstDB.get(i)))       
                              {                                                
                           %>
                              <option selected value="<%=(String) OraclelstDB.get(i)%>"><%=(String) OraclelstDB.get(i)%></option>
                           
                            <%   
                             } 
                             else 
                             {                                                    
                           %>
                           <option value="<%=(String) OraclelstDB.get(i)%>"><%=(String) OraclelstDB.get(i)%></option>
                        
                           <% 
                             }                          
                            } 
                            %>  
                             </select> 
                          </td>
                        </tr>
						<tr>  						
                          <td><b>Product Details</b></td>
                          <td><%=strPDAWS%></td>
                          <td><%=strPDAzure%></td>
                          <td><%=strPDGoogle%></td>
                          <td><%=strPDOracle%></td>			
						</tr>
						<tr>  						
                          <td><b>Cost</b></td>
                          <td><%=strCostAWS%></td>
                          <td><%=strCostAzure%></td>
                          <td><%=strCostGoogle%></td>
                          <td><%=strCostOracle%></td>		
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
    //System.out.println("hi");
    URL url = new URL("https://prices.azure.com/api/retail/prices");
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Accept", "application/json");
    //System.out.println("hi21");
    conn.connect();
		if (conn.getResponseCode() != 200) {
			throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		}
    //System.out.println("hi2");
		BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));

		String output;
		//System.out.println("Output from Server .... \n");
		while ((output = br.readLine()) != null) {
			//System.out.println(output);
		}

		conn.disconnect();
  }

  public List FileReadingDemo(String fileName) throws Exception {
    return FileReadingDemo( fileName, null);
  }

  public List FileReadingDemo(String fileName, String strKey) throws Exception {
    List<String> result = new ArrayList<>();
    List<String> fResult = new ArrayList<>();
      BufferedReader br = null;

          
      try {
       
        //String txtFilePath = jspPath+ fileName;
        //System.out.println(System.getProperty("user.dir"));
        br = new BufferedReader(new FileReader(fileName));
    
        String line;
        while ((line = br.readLine()) != null) {

          String[] arrOfStr = line.trim().split("~");

          result.add(arrOfStr[0]);

         // if(strKey != null) System.out.println((line.trim()).indexOf(strKey) );

          if(strKey != null && ((line.trim()).indexOf(strKey) > -1))
          {
            fResult.add(line.trim());
          }
          ////System.out.println("=="+line.trim());
        }
    
      } catch (IOException e) {
        e.printStackTrace();
      } finally {
        if (br != null) {
          br.close();
        }
      }

      if(strKey != null)
      {
        return fResult;
      }
      else {
        return result;
      }     
    }

    public HashMap getAzureDetails(String strRegion, String strSKU) throws Exception {
      HashMap hMap = new HashMap();
      //System.out.println("hi");
      String strURL = "https://prices.azure.com/api/retail/prices?$filter=location eq '" 
      + strRegion +"'  and skuName eq '" + strSKU + "'";
      strURL = strURL.replace(" ", "%20");
      URL url = new URL(strURL);
     
      //System.out.println(url);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");
      conn.setRequestProperty("Accept", "application/json");
     
      conn.setRequestProperty("Connection", "keep-alive");
      conn.connect();
      //System.out.println("hi21" + conn.getResponseCode() );
		  if (conn.getResponseCode() != 200) {
		  	throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		  }
      //System.out.println("hi2");
		  BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));

		  String output = "";
      String strOut = "";
		 // //System.out.println("Output from Server .... \n");
		  while ((output = br.readLine()) != null) {			  
        strOut = output;
		  }
     
      JSONParser jsonParser = new JSONParser();
      JSONObject jsonObject = (JSONObject) jsonParser.parse(strOut);

      JSONArray items = (JSONArray) jsonObject.get("Items");
      //System.out.println(items.size());
      String strProduct = "";
      String strHourCost = "";
      String str1YCost = "";
      String str3YCost = "";

      for (int i = 0; i < items.size(); i++) {
        ////System.out.println("The " + i + " element of the array: " + items.get(i));
        JSONObject innerObj = (JSONObject)  items.get(i);
       // //System.out.println(innerObj);

               if(i == 0) strProduct = innerObj.get("productName") + "" ;
               
               if(i == 0) strHourCost = innerObj.get("retailPrice") + "";
               //System.out.println("!" + innerObj.get("retailPrice"));

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
     // //System.out.println(hMap);
      return hMap;
    }

    public HashMap getAWSDetails(String strRegion, String strSKU) throws Exception {
      HashMap hMap = new HashMap();
      //System.out.println("hi");
      String strURL = "https://prices.azure.com/api/retail/prices?$filter=location eq '" 
      + strRegion +"'  and skuName eq '" + strSKU + "'";
      strURL = strURL.replace(" ", "%20");
      URL url = new URL(strURL);
     
      //System.out.println(url);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");
      conn.setRequestProperty("Accept", "application/json");
     
      conn.setRequestProperty("Connection", "keep-alive");
      conn.connect();
      //System.out.println("hi21" + conn.getResponseCode() );
		  if (conn.getResponseCode() != 200) {
		  	throw new RuntimeException("Failed : HTTP error code : "
					+ conn.getResponseCode());
		  }
      //System.out.println("hi2");
		  BufferedReader br = new BufferedReader(new InputStreamReader(
			(conn.getInputStream())));

		  String output = "";
      String strOut = "";
		  //System.out.println("Output from Server .... \n");
		  while ((output = br.readLine()) != null) {			  
        strOut = output;
		  }
     
      JSONParser jsonParser = new JSONParser();
      JSONObject jsonObject = (JSONObject) jsonParser.parse(strOut);

      JSONArray items = (JSONArray) jsonObject.get("Items");
      //System.out.println(items.size());
      String strProduct = "";
      String strHourCost = "";
      String str1YCost = "";
      String str3YCost = "";

      for (int i = 0; i < items.size(); i++) {
        ////System.out.println("The " + i + " element of the array: " + items.get(i));
        JSONObject innerObj = (JSONObject)  items.get(i);
        //System.out.println(innerObj);

               if(i == 0) strProduct = innerObj.get("productName") + "" ;
               
               if(i == 0) strHourCost = innerObj.get("retailPrice") + "";
               //System.out.println("!" + innerObj.get("retailPrice"));

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
     ////System.out.println(hMap);
      return hMap;
    }


    public HashMap getGCPDetails(String strRegion, String strSKU) throws Exception {
      HashMap hMap = new HashMap();
      //System.out.println("hi");
      String strURL = "https://cloudbilling.googleapis.com/v1/services?key=AIzaSyDZz7JPOsp6XzTQIjx9kDQ904T5xewtDqU" ;
      strURL = strURL.replace(" ", "%20");
      URL url = new URL(strURL);
     
      //System.out.println(url);
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("GET");
      conn.setRequestProperty("Accept", "application/json");
     
      conn.setRequestProperty("Connection", "keep-alive");
      conn.connect();
      //System.out.println("hi21" + conn.getResponseCode() );
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

     // //System.out.println(strOut);



      
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
              //System.out.println("----"+output);
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

  public String getCost(String FileName, String strProductValue, int intCostModel) throws Exception {

   List lst = FileReadingDemo(FileName, strProductValue);
   System.out.println("FileName " + FileName);
   System.out.println("strProductValue " + strProductValue);
   System.out.println("lst " + lst);
  
   if(lst.size() > 0 ) {
   String str = (String) lst.get(0);
   
   String[] arrOfStr = str.split("~");

   String str1 = (String) arrOfStr[intCostModel];

   String[] arrOfStr1 = str1.split("-");

   String str2 = "<font color =\"green\"><b>"+ (String) arrOfStr1[0] 
     + "Hourly Cost <br> " + (String) arrOfStr1[1] + "Monthly Cost " + "</b></font> ";


   //System.out.println("arrOfStr " + arrOfStr[1]);
   return str2;
  }
  else {
    return "";
  }

  }

  public String getProductDetails(String FileName, String strProductValue, int intCostModel) throws Exception {

    List lst = FileReadingDemo(FileName, strProductValue);
    System.out.println("FileName " + FileName);
    System.out.println("strProductValue " + strProductValue);
    System.out.println("lst " + lst);
   
    if(lst.size() > 0 ) {
    String str = (String) lst.get(0);
    
    String[] arrOfStr = str.split("~");
    System.out.println("lst " + (String) arrOfStr[intCostModel]);
    String str1 = (String) arrOfStr[intCostModel];
 
    String[] arrOfStr1 = str1.split("-");
 
    String str2 = "<font color =\"blue\"><b>"+ (String) arrOfStr1[0] + "</b></font> ";
 
 
  
    return str2;
   }
   else {
     return "";
   }
 
   }
  
%>
