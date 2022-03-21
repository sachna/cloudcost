<%@ page import= "java.io.BufferedReader" %>
<%@ page import= "java.io.IOException"%>
<%@ page import= "java.util.*"%>
<%@ page import= "java.io.*"%>
<%@ page import= "java.io.InputStreamReader"%>
<%@ page import= "java.net.HttpURLConnection"%>
<%@ page import = "java.net.MalformedURLException"%>
<%@ page import= "java.net.URL"%>
<%
//JSONService();
String jspPath = session.getServletContext().getRealPath("/");
List Azurelst = FileReadingDemo(jspPath + "/AzureRegion.txt");
List AWSlst = FileReadingDemo(jspPath + "/AWSRegion.txt");
List GCPlst = FileReadingDemo(jspPath + "/GoogleRegion.txt");
List Oraclelst = FileReadingDemo(jspPath + "/OracleRegion.txt");
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
        padding: 10px 20px;
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
        padding: 20px;
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
     width: 200px;
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
                <h2>Welcome to our site</h2>
                <p>Here you will learn how to create websites...</p>
                <br> <br> <br> 
                <form action="#">
                    <label for="lang"><b>Currency</b></label>
                    <select name="languages1" id="lang1">
                        <option value="javascript">USD</option>
                        <option value="php">CAD</option>
                        <option value="java">EURO</option>
                      </select>
                    <br><br><br><br>
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
                          <td><br><b>Region</b><br><br></td>
                          <td>                            
                            <select name="languages1" id="lang1" style="width: 200px;">
                           <%
                              for(int i = 0; i < Azurelst.size() ; i++) {                              
                           %>
                              <option value="javascript"><%=(String) Azurelst.get(i)%></option>
                           
                            <%                             
                            } 
                            %>  
                          </select>                       
                          </td>
                          <td>
                            <select name="languages1" id="lang1" style="width: 200px;">
                              <option value="javascript">USD</option>
                              <option value="php">CAD</option>
                              <option value="java">EURO</option>
                            </select>
                          </td>
                          <td>
                            <select name="languages1" id="lang1" style="width: 200px;">
                              <option value="javascript">USD</option>
                              <option value="php">CAD</option>
                              <option value="java">EURO</option>
                            </select>
                          </td>
                          <td>
                            <select name="languages1" id="lang1" style="width: 200px;">
                              <option value="javascript">USD</option>
                              <option value="php">CAD</option>
                              <option value="java">EURO</option>
                            </select>
                          </td>
                        </tr>                       
                        <tr>
                            <td><br><b>Product Name</b><br><br></td>
                            <td>Eats everyone's leftovers</td>
                            <td>Nibbles at food</td>
                            <td>Hearty eater</td>
                            <td>Will eat till he explodes</td>
                          </tr>
                          <tr>
                            <td><br><b>Product Details</b><br><br></td>
                            <td>Eats everyone's leftovers</td>
                            <td>Nibbles at food</td>
                            <td>Hearty eater</td>
                            <td>Will eat till he explodes</td>
                          </tr>
                          <tr>
                            <td><br><b>Notes</b><br><br></td>
                            <td>Eats everyone's leftovers</td>
                            <td>Nibbles at food</td>
                            <td>Hearty eater</td>
                            <td>Will eat till he explodes</td>
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
        document.location = "";
       
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
  
%>
