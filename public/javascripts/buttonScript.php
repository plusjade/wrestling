<?php
	function buttonScript($divider,$highlighterBegin,$highlighterEnd,$html) {
?>
<script type="text/javascript" language="JavaScript">
	var debug = false;

	var redVals = new Array();
	var greenVals = new Array();
	var greenString="";
	var redString="";

	var scoreVals = new Array();
	var scoreLabels = new Array();
	var scoreColors = new Array();

	var redScore=0;
	var greenScore=0;
	var round = 1;

	var even=false;
	var descendingScores=true;

	var mostRecentScore="Takedown";

	//var divider = "<br/>";
	//var divider = "\n";
	var divider = "<?php print($divider); ?>";

	var endMatchText = "Are you sure you want to end this match?";
	
	//var highlighterBegin = "<span class='lastScore'>";
	//var highlighterEnd = "</span>";
	var highlighterBegin = "<?php print($highlighterBegin); ?>";
	var highlighterEnd = "<?php print($highlighterEnd); ?>";
	
	function addText(redOrGreen) {
		if(debug===true) { alert("in add text"); }
		
		if(redOrGreen == "red") {
			txt = document.scoreForm.scoreTypeRed.value;
			first = "green";
		} else if (redOrGreen == "green"){
			txt = document.scoreForm.scoreTypeGreen.value;
			first = "red";
		}

		array = txt.split(",");

		//populate blank value in opposite side
		if(even) {
			scoreLabels.push("-");
			scoreColors.push(first);
			scoreVals.push(0);
		}

		scoreLabels.push(array[0]);
		scoreColors.push(array[1]);
		scoreVals.push(parseInt(array[2]));

		renderScore(descendingScores);
	}

	function addTextBlackberry(redOrGreen) {
		if(debug) { alert("in add text"); }
		
		if(redOrGreen == "red") {
			first = "green";
		} else if (redOrGreen == "green"){
			first = "red";
		}
		txt = document.scoreForm.scoreType.value;
		
		array = txt.split(",");
		
		nextScore=smartScore(array[0]);

		if(nextScore != "") {
			for ( i=0;i<document.getElementById("scoreType").length; i++ ) {
				if(document.getElementById("scoreType").options[i].text == nextScore) {
					document.getElementById("scoreType").options[i].selected=true;
				}
			}
		}
		mostRecentScore = nextScore;
		
		//populate blank value in opposite side
		if(even) {
			scoreLabels.push("-");
			scoreColors.push(first);
			scoreVals.push(0);
		}

		scoreLabels.push(array[0]);
		scoreColors.push(redOrGreen);
		scoreVals.push(parseInt(array[2]));

		renderScore(descendingScores);
	}

	function removeText() {				
		test=scoreLabels.pop();
		scoreColors.pop();
		scoreVals.pop();

		if(test.indexOf("RND") != -1 || even) {
			scoreLabels.pop();
			scoreColors.pop();
			scoreVals.pop();

			if(round > 1) {
				round = round-1;
			}
		}

		renderScore(descendingScores);
	}
	
	function endRound() {
			//enter value for both sides
			scoreLabels.push(divider +"RND"+round + divider + redScore + divider);
			scoreLabels.push(divider +"RND"+round + divider + greenScore + divider);
			scoreColors.push("red");
			scoreColors.push("green");
			scoreVals.push(0);
			scoreVals.push(0);

			for ( i=0;i<document.getElementById("scoreType").length; i++ ) {
				if(document.getElementById("scoreType").options[i].text == "Choose Bottom") {
					document.getElementById("scoreType").options[i].selected=true;
				}
			}
			
			round += 1;
			renderScore(descendingScores);
	}

	function renderScore(reverse) {
		if(debug) { alert("in render score"); }
		//draw scores into score areas
		redString="";
		greenString="";
		redScore=0;
		greenScore=0;

		//if reverse is set, reverse before and after drawing
		if(reverse) {
			scoreLabels.reverse();
			scoreColors.reverse();
			scoreVals.reverse();
		}
		
		for(i = 0; i < scoreLabels.length; i++) {
			//color most recent score
			if( (((i == scoreLabels.length-1 || (i == scoreLabels.length-2 & even)) && reverse == false) || 
					((i == 0 || (i == 1 && even)) && reverse == true)) &&
					scoreLabels[i].indexOf("RND") == -1) {
				tempString = highlighterBegin + scoreLabels[i] + highlighterEnd + divider;
			} else {
				tempString = scoreLabels[i]+divider;
			}
			
			if(scoreColors[i] == "red") {
				redString += tempString;
				redScore += scoreVals[i];
			} else {
				greenString += tempString;
				greenScore += scoreVals[i];
			}
		}
		//if reverse is set, reverse before and after drawing
		if(reverse) {
			scoreLabels.reverse();
			scoreColors.reverse();
			scoreVals.reverse();
		}
		//finally, set values on page
		<?php 
			if($html)  {
		?>
		
		document.getElementById('redBox').innerHTML = redString;
		document.getElementById('greenBox').innerHTML = greenString;
		
		<?php 
			} else {
		?>
		
		document.getElementById('redBox').value = redString;
		document.getElementById('greenBox').value = greenString;
		
		<?php 
			} 
		?>
		document.getElementById('redScore').value = redScore;
		document.getElementById('greenScore').value = greenScore;

		document.getElementById('roundBox').value = round;
	}

	function ridingTime(value) {
		//if(round >= 3) {
			scoreLabels.push("RIDE");
			scoreColors.push(value);
			scoreVals.push(1);

			renderScore(descendingScores);
		//}
	}

	function setDescending(value) {
		descendingScores = value;
	}
	function setEven(value) {
		even = value;
	}

	function endMatch() {
		if(confirm(endMatchText)) {
			saveScoresArrays();
			document.scoreForm.submit();
		}
	}

	function smartScore(lastScore) {
		switch (lastScore) {
		case "T2":
			return "Escape";
		case "E1":
			return "Takedown";
		case "R2":
			return "Escape";
		case "DOWN":
			return "Escape";
		case "NEUT":
			return "Takedown";
		case "TOP":
			return "Escape";
		case "W":
			return mostRecentScore;
		case "S1":
			return mostRecentScore;
		case "S2":
			return mostRecentScore;
		case "C":
			return mostRecentScore;
		case "P1":
			return mostRecentScore;
		case "P2":
			return mostRecentScore;
		default:
			return "";
		}
	}

	function saveScoresArrays() {
		string="";
		currRound=1;
		for(i = 0; i < scoreLabels.length; i++) {
			if(scoreLabels[i].indexOf("RND") != -1) {
				currRound += 1;
				i+=1;//skip next "RND"
			} else {
				string += currRound + ",";
				string += scoreLabels[i] + ",";
				string += scoreColors[i] + ",";
				string += scoreVals[i] + "|";
			}
		}
		document.scoreForm.savedArray.value=string;
	}
</script>
<?php 
	}
?>