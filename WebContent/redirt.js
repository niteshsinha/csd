// Author: Chris Straut 
// Courtesy of SimplytheBest.net - http://simplythebest.net/scripts/



	function makeArray() {
		this.length = makeArray.arguments.length;
		for (var i = 0; i < this.length; i++)
		this[i + 1] = makeArray.arguments[i];
	}



	function makeSlideShow (obj, wait, pre, url) {
		this.curText = '';
		this.posit = 1;
		this.word = obj;  
		this.length = obj.length;
		this.pre = pre;
		this.wait = wait;
		this.url = url;
		this.display = displaySlideShow;
	}



	function displaySlideShow() {
		if (this.posit <= this.length) {
			this.curText = this.word[this.posit]
			outStringWord = blankFrameTop + this.pre + this.curText + blankFrameBottom;
			parent.draw.location = 'javascript:parent.outStringWord';
			this.posit++;
		}
		else {
			doneLoop = true;
			top.location = this.url;
		}
	}


	function displayLoop() {
		if (!doneLoop) reDraw = setTimeout('displayLoop()', wordIntro.wait);	
			wordIntro.display();
	}


	var words = new makeArray ();
	var wordIntro = new makeSlideShow (words, 2500, '', '<%=session.getAttribute("link")%>');
	var blankFrameTop = '';	
	var blankFrameBottom = '';
	var blankFrame = blankFrameTop + blankFrameBottom;
	var doneLoop = false;