<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Transitive by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="jquery.progressbar.css">
<link href="css/multi.select.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="jquery.progressbar.js"></script>
<script src="js/multi.select.js"></script>	
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
<style>
#myProgress {
  width: 100%;
  background-color: #ddd;
}

#myBar {
  width: 0%;
  height: 30px;
  background-color: #4CAF50;
  text-align: center;
  line-height: 30px;
  color: white;
}
</style>
<script>

function move(element) {
	var motivational_messages = ["TODAY IS A NEW DAY. WHAT CAN WE DO WITH IT?","YOU AREN'T DEFINED BY YOUR FAILURES, YOU'RE EMPOWERED BY THEM.","THE HARDEST PERSON YOU'LL EVER FACE IS THE ONE STARING BACK AT YOU IN THE MIRROR.","SUCCESS MEANS CARING. YOU'VE GOT TO CARE MORE THAN ANYONE ELSE DOES.","I'M A LEARNER TOO. WE NEED TO SUPPORT EACH OTHER IN THAT.","THERE'S NOTHING YOU CAN'T DO IF YOU REALLY WANT TO.","GREAT THINGS BEGIN WITH SMALL ACTIONS.","I'M ALWAYS HERE TO HELP YOU, BUT YOU'VE GOT TO TAKE THE LEAD.","I BELIEVE IN YOU.","YOU'RE NOT ALONE."];
	var num = Math.floor((Math.random() * 10));
	  $(element).attr("disabled", true);
	  $(element).attr('value', 'Completed!');
	  $(element).addClass('marked');
	  var elem = document.getElementById("myBar");   
	  var total = $(".markascomplete").length;
	  var percentage = Math.floor(($(".marked").length/total)*100);
	  $("#mm").text(motivational_messages[num]);
	    if (percentage > 100) {
	      clearInterval(id);
	    } else {
	      elem.style.width = percentage + '%'; 
	      elem.innerHTML = percentage * 1  + '%';
	  }
	}
	
$(document).ready(function(){
	Plotly.d3.csv('plot.csv', function(err, rows){
		function unpack(rows, key) {
			return rows.map(function(row)
			{ return row[key]; });}

		var trace1 = {
			x:unpack(rows, 'x1'), y: unpack(rows, 'y1'), z: unpack(rows, 'z1'),
			mode: 'markers',
			marker: {
				size: 12,
				line: {
				color: 'rgba(217, 217, 217, 0.14)',
				width: 0.5},
				opacity: 0.8},
			type: 'scatter3d'
		};

		var trace2 = {
			x:unpack(rows, 'x2'), y: unpack(rows, 'y2'), z: unpack(rows, 'z2'),
			mode: 'markers',
			marker: {
				color: 'rgb(127, 127, 127)',
				size: 12,
				symbol: 'circle',
				line: {
				color: 'rgb(204, 204, 204)',
				width: 1},
				opacity: 0.8},
			type: 'scatter3d'};

		var data = [trace1, trace2];
		var layout = {margin: {
			l: 0,
			r: 0,
			b: 0,
			t: 0
		  }};
		Plotly.newPlot('vis', data, layout);
		});
	
	var temp = "";
	$("#submitCourse").click(function() {
		var form = $('#fileUploadForm')[0];
		var data = new FormData(form);
		$.ajax({ 
		method: "POST", 
		enctype: 'multipart/form-data',
        processData: false, 
        contentType: false,
        cache: false,
		url: "http://35.231.136.227:8000/FileUpload", 
		data: data,
		success:function(data) {
		var chapters = data.result;
		for (var i =0;i<chapters.length;i++)
			{
			temp+="<div><h2>"+chapters[i][1]+"</h2><h1>"+chapters[i][0]+"</h1><input type = \"submit\" class=\"markascomplete\" value=\"Mark as Complete\" onclick=\"move(this);\" /></div>";
			}
		$("#flexgrid").append(temp);
		},
		error:function(data) {
			alert("Oops. Something went wrong.");
			}
		});
	});
	$("#submitCourse2").click(function() {
		var form = $('#fileUploadForm2')[0];
		var data = new FormData(form);
		$.ajax({ 
		method: "POST", 
		enctype: 'multipart/form-data',
        processData: false, 
        contentType: false,
        cache: false,
		url: "http://35.231.136.227:8000/NotesUpload", 
		data: data,
		success:function(data) {
		alert("File uploaded.");
		},
		error:function(data) {
			alert("Oops. Something went wrong.");
			}
		});
	});
});
</script>
</head>
	<body>

		<!-- Header -->
			<header id="header" class="alt">
				<div class="logo"><a href="index.html" style="font-size:50px;">Byte by Byte <span>A Natural Language Approach.</span></a></div>
				<a href="#menu" class="toggle"><span>Menu</span></a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="index.html">Home</a></li>
				</ul>
			</nav>

		<!-- Banner -->
		<!--
			To use a video as your background, set data-video to the name of your video without
			its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
			formats to work correctly.
		-->
			<section id="banner" data-video="images/banner">
				<div class="inner">
					<h1>Byte by Byte</h1>
					<p>A Natural Language assistant for your homework!<br /></p>
					<a href="#one" class="button special scrolly">Get Started</a>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="wrapper style2">
				<div class="inner">
					<div>
						<div class="box">
							<div class="image fit">
								<img src="images/pic01.jpg" alt="" />
							</div>
							<div class="content">
								<p style="color:black;font-size:20px;">Start tracking your progress! Upload your assignment so that we can help you!</p>
					<form method="POST" action="javascript:myFunction(); return false;" enctype="multipart/form-data" id="fileUploadForm">			
					<input type = "file" name = "file" size = "50000000000" />
					<button id = "submitCourse" class="button big special">Upload assignment</button>
					</form>
					<br>
					<br>
					<p style="color:black;font-size:20px;">Professor gave you another reading material? No worries! We can help you with that as well. Go ahead and upload it!</p>
					<form method="POST" action="javascript:myFunction(); return false;" enctype="multipart/form-data" id="fileUploadForm2">			
					<input type = "file" name = "file" size = "50000000000" />
					<button id = "submitCourse2" class="button big special">Upload reading material</button>
					</form>
							</div>
						</div>
					</div>
				</div>
			</section>

		<!-- Two -->
			<section id="two" class="wrapper style3">
				<div class="inner">
					<div id="flexgrid">
						
					</div>
				</div>
			</section>

			<footer id="footer" class="wrapper">
			<section id="three" class="wrapper style2">
				<div class="inner">
					<div class="grid-style">
					 <p style="color:black;font-size:20px;">Track your progress-</p>
					<div id="myProgress">
  					<div id="myBar"></div>
					<div>	
					    <p align="center" style="color:black;font-size:20px;" id="mm">Get started!! You can do it!</p>
					</div>
				</div>
			</section>
				<div class="inner">
							<div class="inner">
<p style="color:black;font-size:20px;">Curious about what the other students are studying? The blue dots represent the 3 most studied chapters and the grey dots represent the 3 least studied chapters </p>
			</div>	
			<div class="inner">
				<div class="inner" id = "vis">
	
				</div>
			</div>
					<section>
						<div class="box">
							<div class="content">
								<h2 class="align-center">Get in Touch</h2>
								<hr />
								<form action="#" method="post">
									<div class="field half first">
										<label for="name">Name</label>
										<input name="name" id="name" type="text" placeholder="Name">
									</div>
									<div class="field half">
										<label for="email">Email</label>
										<input name="email" id="email" type="email" placeholder="Email">
									</div>
									<div class="field">
										<label for="dept">Department</label>
										<div class="select-wrapper">
											<select name="dept" id="dept">
												<option value="">- Category -</option>
												<option value="1">The student forum</option>
												<option value="1">Professor</option>
												<option value="1">Health Center</option>
												<option value="1">911</option>
											</select>
										</div>
									</div>
									<div class="field">
										<label for="message">Message</label>
										<textarea name="message" id="message" rows="6" placeholder="Message"></textarea>
									</div>
									<ul class="actions align-center">
										<li><input value="Send Message" class="button special" type="submit"></li>
									</ul>
								</form>
							</div>
						</div>
					</section>
					<div class="copyright">
						&copy; Design by Meet, Mandhara & Deep: <a href="https://linkedin.com/in/mandhara-jayaram/">Contact us</a>.
					</div>
				</div>
			</footer>

		<!-- Scripts -->
< 			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script> 
	</body>
</html>