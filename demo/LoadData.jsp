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
try{

    Runtime r = Runtime.getRuntime();
    String mycurl = "curl https://pricing.api.infracost.io/graphql  -X POST  -H X-Api-Key:qDOTgrU9syjskUBFhvRNktZiabGAk5ry   -H \'Content-Type: application/json\' --data \'{\"query\": \"{ products(filter: {vendorName: \\\"aws\\\", service: \\\"AmazonEC2\\\", region: \\\"us-east-1\\\", attributeFilters: [{key: \\\"instanceType\\\", value: \\\"m3.large\\\"}, {key: \\\"operatingSystem\\\", value: \\\"Linux\\\"}, {key: \\\"tenancy\\\", value: \\\"Shared\\\"}, {key: \\\"capacitystatus\\\", value: \\\"Used\\\"}, {key: \\\"preInstalledSw\\\", value: \\\"NA\\\"}]}) { prices(filter: {purchaseOption: \\\"on_demand\\\"}) { USD } } } \"}\'";    
    System.out.println(mycurl);
    Process p = r.exec(mycurl);
    
    InputStream is = p.getInputStream();
    StringBuffer buf=new StringBuffer();
    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
    int readByte = -1;
    while ((readByte = is.read()) > -1) {
    buf.append((char)readByte);
    }
    
    String mybuf = buf.toString();
    
    out.println("1=="+mybuf);
    out.flush();
        
    }catch(Exception e){
    e.printStackTrace();
    }
%>