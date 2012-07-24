function ID(element)
{
	return document.getElementById(element);
}
var xmlHttp;
function ajax_request_response(req_file, action, parameters, response_handler_function)
{
	try{
	try  {	xmlHttp=new XMLHttpRequest();/* Firefox, Opera 8.0+, Safari*/  }
	catch (e){	try{  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");  }// Internet Explorer
				catch (e){	try{	xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");	}
								catch (e){	alert("Your browser does not support AJAX!");
								return false;	}
						}
			}
	xmlHttp.onreadystatechange=function()
	{	  	if(xmlHttp.readyState==4)
			{
				/*alert(xmlHttp.responseXML);*/ //return xmlHttp.responseXML;// alert(xmlHttp.responseText);
				setTimeout( response_handler_function + "();", 0 );
			}
	}
	xmlHttp.open("GET",req_file + action + parameters,true);
	xmlHttp.send(null);	} catch(e) { alert(e); }
}
// to update faq
function update_ques_ans(frm) {
	ajax_request_response("MiscSuccess?flag=UpFAQ", "", "&txtQuesUp="+frm.ques.value+"&txtAnsUp="+frm.ans.value+"&oldques="+frm.oldques.value, "handle_mod_ques_ans");
	frm.ques.className = "quesans";
	frm.ans.className = "quesans";
}
function handle_mod_ques_ans() {
	if(xmlHttp.responseText.indexOf("Record Successfully Updated...") > -1)
		showMsg("UPDATED");
	else
		showMsg("Error");
}
// to update services
function update_type_desc(frm) {
	ajax_request_response("MiscSuccess?flag=UpSER", "", "&txtPtype="+frm.type.value+"&txtPdesc="+frm.desc.value+"&txtOldCType="+frm.txttype.value, "handle_mod_type_desc");
	frm.type.className = "compdesc";
	frm.desc.className = "compdesc";
}
function handle_mod_type_desc() {
	if(xmlHttp.responseText.indexOf("Record Successfully Updated...") > -1)
		showMsg("UPDATED");
	else
		showMsg("Error");
}
function showMsg(msg) {
	if(msg == "") {
		document.getElementById('msg_div').innerHTML = msg;
		document.getElementById('msg_div').style.display = 'none';
	} else {
		document.getElementById('msg_div').innerHTML = msg;
		document.getElementById('msg_div').style.display = 'block';
	}
}