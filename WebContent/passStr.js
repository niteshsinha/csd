
function testPassword(passwd)
{
var description = new Array();
description[0] = "<table border=0 cellpadding=0 cellspacing=0><tr><td class=bold>Strength:</td><td><table cellpadding=0 cellspacing=2><tr><td height=15 width=20 bgcolor=#ff0000></td><td height=15 width=121 bgcolor=#dddddd></td></tr></table></td><td class=bold>Weakest</td></tr></table>";
description[1] = "<table border=0 cellpadding=0 cellspacing=0><tr><td class=bold>Strength:</td><td><table cellpadding=0 cellspacing=2><tr><td height=15 width=50 bgcolor=#bb0000></td><td height=15 width=91 bgcolor=#dddddd></td></tr></table></td><td class=bold>Weak</td></tr></table>";
description[2] = "<table border=0 cellpadding=0 cellspacing=0><tr><td class=bold>Strength:</td><td><table cellpadding=0 cellspacing=2><tr><td height=15 width=80 bgcolor=#ff9900></td><td height=15 width=61 bgcolor=#dddddd></td></tr></table></td><td class=bold>Medium</td></tr></table>";
description[3] = "<table border=0 cellpadding=0 cellspacing=0><tr><td class=bold>Strength:</td><td><table cellpadding=0 cellspacing=2><tr><td height=15 width=110 bgcolor=#00bb00></td><td height=15 width=31 bgcolor=#dddddd></td></tr></table></td><td class=bold>Strong</td></tr></table>";
description[4] = "<table border=0 cellpadding=0 cellspacing=0><tr><td class=bold>Strength:</td><td><table cellpadding=0 cellspacing=2><tr><td height=15 width=142 bgcolor=#00ee00></td></tr></table></td><td class=bold>Strongest</td></tr></table>";
description[5] = "<table border=0 cellpadding=0 cellspacing=0><tr><td class=bold>Strength:</td><td><table cellpadding=0 cellspacing=2><tr><td height=15 width=142 bgcolor=#dddddd></td></tr></table></td><td class=bold>Begin Typing</td></tr></table>";

		var intScore   = 0
		var strVerdict = 0
		
		// PASSWORD LENGTH
		if (passwd.length==0 || !passwd.length)                         // length 0
		{
			intScore = -1
		}
		else if (passwd.length>0 && passwd.length<5) // length between 1 and 4
		{
			intScore = (intScore+3)
		}
		else if (passwd.length>4 && passwd.length<8) // length between 5 and 7
		{
			intScore = (intScore+6)
		}
		else if (passwd.length>7 && passwd.length<12)// length between 8 and 15
		{
			intScore = (intScore+12)
		}
		else if (passwd.length>11)                    // length 16 or more
		{
			intScore = (intScore+18)
		}
		
		
		// LETTERS (Not exactly implemented as dictacted above because of my limited understanding of Regex)
		if (passwd.match(/[a-z]/))                              // [verified] at least one lower case letter
		{
			intScore = (intScore+1)
		}
		
		if (passwd.match(/[A-Z]/))                              // [verified] at least one upper case letter
		{
			intScore = (intScore+5)
		}
		
		// NUMBERS
		if (passwd.match(/\d+/))                                 // [verified] at least one number
		{
			intScore = (intScore+5)
		}
		
		if (passwd.match(/(.*[0-9].*[0-9].*[0-9])/))             // [verified] at least three numbers
		{
			intScore = (intScore+5)
		}
		
		
		// SPECIAL CHAR
		if (passwd.match(/.[!,@,#,$,%,^,&,*,?,_,~]/))            // [verified] at least one special character
		{
			intScore = (intScore+5)
		}
		
																 // [verified] at least two special characters
		if (passwd.match(/(.*[!,@,#,$,%,^,&,*,?,_,~].*[!,@,#,$,%,^,&,*,?,_,~])/))
		{
			intScore = (intScore+5)
		}
	
		
		// COMBOS
		if (passwd.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/))        // [verified] both upper and lower case
		{
			intScore = (intScore+2)
		}

		if (passwd.match(/(\d.*\D)|(\D.*\d)/))                    // [FAILED] both letters and numbers, almost works because an additional character is required
		{
			intScore = (intScore+2)
		}
 
																  // [verified] letters, numbers, and special characters
		if (passwd.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/))
		{
			intScore = (intScore+2)
		}
	
	
		if(intScore == -1)
		{
		   strVerdict = description[5];
		}
		else if(intScore > -1 && intScore < 16)
		{
		   strVerdict = description[0];
		}
		else if (intScore > 15 && intScore < 25)
		{
		   strVerdict = description[1];
		}
		else if (intScore > 24 && intScore < 35)
		{
		   strVerdict = description[2];
		}
		else if (intScore > 34 && intScore < 45)
		{
		   strVerdict = description[3];
		}
		else
		{
		   strVerdict = description[4];
		}
	
	document.getElementById("Words").innerHTML= (strVerdict);
	
}