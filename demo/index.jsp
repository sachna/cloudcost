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
                    <h3><li><a href="webpage.jsp">Web Application</a></li></h3>
                </ul> 
                <ul>
                    <h3><li><a href="webpage.jsp">Web Application</a></li></h3>
                </ul> 
                <ul>
                    <h3><li><a href="webpage.jsp">Web Application</a></li></h3>
                </ul> 
                <ul>
                    <h3><li><a href="webpage.jsp">Web Application</a></li></h3>
                </ul>                            
            </nav>
            <section id="section1">
                <h2>Welcome to our site</h2>
                <p>Here you will learn how to create websites...</p>
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