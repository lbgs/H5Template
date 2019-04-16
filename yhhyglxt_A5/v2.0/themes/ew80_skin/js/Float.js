$(function() {
	$("#CheckA a").click(function(e) {
		if ($("#SearchBox").css("display") == "none") {
			e.stopPropagation();
			var offset = $(e.target).offset();
			$("#SearchBox").css({
				top: "75px",
				left: "0px"
			});
			$("#SearchBox").show();
			$('#CheckA')[0].className = "hover";
			$('#CheckB')[0].className = "";
			$('#CheckC')[0].className = "";
			$('#CheckD')[0].className = "";
			$('#CheckE')[0].className = ""
			$('#CheckF')[0].className = ""
		} else {
			$("#SearchBox").hide();
			$('#CheckA')[0].className = "";
			$('#CheckB')[0].className = "hover";
			$('#CheckC')[0].className = "";
			$('#CheckD')[0].className = "";
			$('#CheckE')[0].className = ""
			$('#CheckF')[0].className = ""
		}
	});
	$("#CheckB a").click(function(e) {
		if ($("#SearchBox").css("display") == "none") {
			$('#CheckA')[0].className = "";
			$('#CheckB')[0].className = "hover";
			$('#CheckC')[0].className = "";
			$('#CheckD')[0].className = "";
			$('#CheckE')[0].className = ""
			$('#CheckF')[0].className = ""
		} else {
			$("#SearchBox").hide();
			$('#CheckA')[0].className = "";
			$('#CheckB')[0].className = "hover";
			$('#CheckC')[0].className = "";
			$('#CheckD')[0].className = "";
			$('#CheckE')[0].className = ""
			$('#CheckF')[0].className = ""
		}
	});
	$("#CheckC a").click(function(e) {
		if ($("#SearchBox").css("display") == "none") {
			$('#CheckA')[0].className = "";
			$('#CheckB')[0].className = "";
			$('#CheckC')[0].className = "hover";
			$('#CheckD')[0].className = "";
			$('#CheckE')[0].className = ""
			$('#CheckF')[0].className = ""
		} else {
			$("#SearchBox").hide();
			$('#CheckA')[0].className = "";
			$('#CheckB')[0].className = "";
			$('#CheckC')[0].className = "hover";
			$('#CheckD')[0].className = "";
			$('#CheckE')[0].className = ""
			$('#CheckF')[0].className = ""
		}
	});
	$("#CheckD a").click(function(e) {
		if ($("#SearchBox").css("display") == "none") {
			$('#CheckA')[0].className = "";
			$('#CheckB')[0].className = "";
			$('#CheckC')[0].className = "";
			$('#CheckD')[0].className = "hover";
			$('#CheckE')[0].className = ""
			$('#CheckF')[0].className = ""
		} else {
			$("#SearchBox").hide();
			$('#CheckA')[0].className = "";
			$('#CheckB')[0].className = "";
			$('#CheckC')[0].className = "";
			$('#CheckD')[0].className = "hover";
			$('#CheckE')[0].className = ""
			$('#CheckF')[0].className = ""
		}
	});
	$("#CheckE a").click(function(e) {
		if ($("#SearchBox").css("display") == "none") {
			$('#CheckA')[0].className = "";
			$('#CheckB')[0].className = "";
			$('#CheckC')[0].className = "";
			$('#CheckD')[0].className = "";
			$('#CheckE')[0].className = "hover"
			$('#CheckF')[0].className = "";
		} else {
			$("#SearchBox").hide();
			$('#CheckA')[0].className = "";
			$('#CheckB')[0].className = "";
			$('#CheckC')[0].className = "";
			$('#CheckD')[0].className = "";
			$('#CheckE')[0].className = "hover"
			$('#CheckF')[0].className = "";
		}
	});
	$("#CheckF a").click(function(e) {
		if ($("#SearchBox").css("display") == "none") {
			$('#CheckA')[0].className = "";
			$('#CheckB')[0].className = "";
			$('#CheckC')[0].className = "";
			$('#CheckD')[0].className = "";
			$('#CheckE')[0].className = ""
			$('#CheckF')[0].className = "hover";
		} else {
			$("#SearchBox").hide();
			$('#CheckA')[0].className = "";
			$('#CheckB')[0].className = "";
			$('#CheckC')[0].className = "";
			$('#CheckD')[0].className = "";
			$('#CheckE')[0].className = ""
			$('#CheckF')[0].className = "hover"
		}
	})
});