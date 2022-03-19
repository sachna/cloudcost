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
        min-height: 500px;
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
            </nav>
            <section id="section1">
                <h2>Welcome to our site</h2>
                <p>Here you will learn how to create websites...</p>
                <form action="#">
                    <label for="lang">Language</label>
                    <select name="languages" id="lang">
                      <option value="javascript">JavaScript</option>
                      <option value="php">PHP</option>
                      <option value="java">Java</option>
                      <option value="golang">Golang</option>
                      <option value="python">Python</option>
                      <option value="c#">C#</option>
                      <option value="C++">C++</option>
                      <option value="erlang">Erlang</option>
                    </select>
                    &nbsp;	&nbsp;
                    <label for="lang">Language</label>
                    <select name="languages1" id="lang1">
                        <option value="javascript">JavaScript</option>
                        <option value="php">PHP</option>
                        <option value="java">Java</option>
                        <option value="golang">Golang</option>
                        <option value="python">Python</option>
                        <option value="c#">C#</option>
                        <option value="C++">C++</option>
                        <option value="erlang">Erlang</option>
                      </select>
                      &nbsp;	&nbsp;
                      <label for="lang">Language</label>
                      <select name="languages2" id="lang2">
                        <option value="javascript">JavaScript</option>
                        <option value="php">PHP</option>
                        <option value="java">Java</option>
                        <option value="golang">Golang</option>
                        <option value="python">Python</option>
                        <option value="c#">C#</option>
                        <option value="C++">C++</option>
                        <option value="erlang">Erlang</option>
                      </select>
                      &nbsp;	&nbsp;
                      <label for="lang">Language</label>
                      <select name="languages3" id="lang3">
                        <option value="javascript">JavaScript</option>
                        <option value="php">PHP</option>
                        <option value="java">Java</option>
                        <option value="golang">Golang</option>
                        <option value="python">Python</option>
                        <option value="c#">C#</option>
                        <option value="C++">C++</option>
                        <option value="erlang">Erlang</option>
                      </select>
                      &nbsp;	&nbsp;
                      <label for="lang">Language</label>
                      <select name="languages4" id="lang4">
                        <option value="javascript">JavaScript</option>
                        <option value="php">PHP</option>
                        <option value="java">Java</option>
                        <option value="golang">Golang</option>
                        <option value="python">Python</option>
                        <option value="c#">C#</option>
                        <option value="C++">C++</option>
                        <option value="erlang">Erlang</option>
                      </select>
                      &nbsp;	&nbsp;
                    <input type="submit" value="Submit" />
                    <br><br><br><br>
                    <table>
                        <tr>
                          <td>&nbsp;</td>
                          <td>Knocky</td>
                          <td>Flor</td>
                          <td>Ella</td>
                          <td>Juan</td>
                        </tr>
                        <tr>
                          <td>Breed</td>
                          <td>Jack Russell</td>
                          <td>Poodle</td>
                          <td>Streetdog</td>
                          <td>Cocker Spaniel</td>
                        </tr>
                        <tr>
                          <td>Age</td>
                          <td>16</td>
                          <td>9</td>
                          <td>10</td>
                          <td>5</td>
                        </tr>
                        <tr>
                          <td>Owner</td>
                          <td>Mother-in-law</td>
                          <td>Me</td>
                          <td>Me</td>
                          <td>Sister-in-law</td>
                        </tr>
                        <tr>
                          <td>Eating Habits</td>
                          <td>Eats everyone's leftovers</td>
                          <td>Nibbles at food</td>
                          <td>Hearty eater</td>
                          <td>Will eat till he explodes</td>
                        </tr>
                        <tr>
                            <td>Eating Habits</td>
                            <td>Eats everyone's leftovers</td>
                            <td>Nibbles at food</td>
                            <td>Hearty eater</td>
                            <td>Will eat till he explodes</td>
                          </tr>
                          <tr>
                            <td>Eating Habits</td>
                            <td>Eats everyone's leftovers</td>
                            <td>Nibbles at food</td>
                            <td>Hearty eater</td>
                            <td>Will eat till he explodes</td>
                          </tr>
                          <tr>
                            <td>Eating Habits</td>
                            <td>Eats everyone's leftovers</td>
                            <td>Nibbles at food</td>
                            <td>Hearty eater</td>
                            <td>Will eat till he explodes</td>
                          </tr>
                          <tr>
                            <td>Eating Habits</td>
                            <td>Eats everyone's leftovers</td>
                            <td>Nibbles at food</td>
                            <td>Hearty eater</td>
                            <td>Will eat till he explodes</td>
                          </tr>
                          <tr>
                            <td>Eating Habits</td>
                            <td>Eats everyone's leftovers</td>
                            <td>Nibbles at food</td>
                            <td>Hearty eater</td>
                            <td>Will eat till he explodes</td>
                          </tr>
                          <tr>
                            <td>Eating Habits</td>
                            <td>Eats everyone's leftovers</td>
                            <td>Nibbles at food</td>
                            <td>Hearty eater</td>
                            <td>Will eat till he explodes</td>
                          </tr>
                          <tr>
                            <td>Eating Habits</td>
                            <td>Eats everyone's leftovers</td>
                            <td>Nibbles at food</td>
                            <td>Hearty eater</td>
                            <td>Will eat till he explodes</td>
                          </tr>
                          <tr>
                            <td>Eating Habits</td>
                            <td>Eats everyone's leftovers</td>
                            <td>Nibbles at food</td>
                            <td>Hearty eater</td>
                            <td>Will eat till he explodes</td>
                          </tr>
                          <tr>
                            <td>Eating Habits</td>
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