<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>HTML5 Web Page Layout</title>
<style>
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
        background: #f2f2f2;  
    }
    nav, section {
        float: left; 
        padding: 20px;
        min-height: 550px;
        box-sizing: border-box;
    }
    section {
        width: 80%;
    }
    nav {
        width: 13%;             
        background: #d4d7dc;
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
</style>
</head>
<body>
    <div class="container">
        <header>
		<div>
            <h1><font color = "blue">Cloud Cost Comparision </font> </h1>
			</div>
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
<p><h1>What is cloud computing?</h1><p>
Cloud computing is the on-demand delivery of IT resources over the Internet with pay-as-you-go pricing. Instead of buying, owning, and maintaining physical data centers and servers, you can access technology services, such as computing power, storage, and databases, on an as-needed basis from a cloud provider like Amazon Web Services (AWS).

<p><h1>Who are Cloud Providers?</h1><p>
There are a handful of well-known, major public cloud companies such as Alibaba Cloud, Amazon Web Services (AWS), Google Cloud Platform (GCP), IBM Cloud, Oracle Cloud, and Microsoft Azure but there are also hundreds of other cloud computing providers all over the world.

<p><h1>Ready to host your application on Cloud?</h1><p>

<h3><li><a href="webpagefree.jsp">Explore Free options</a></li></h3>


<p><h1>Advanced User?</h1><p>
<h3><li><a href="webpageown.jsp">Build your own</a></li></h3>
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