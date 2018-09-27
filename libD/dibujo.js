var ctx, color = "#000";	
var borrar = "#fffff";
$(document).ready(function () {
	
	// setup a new canvas for drawing wait for device init
    setTimeout(function(){
	   newCanvas();
    }, 100);
		
	// configuracion del borrador (white)	
	$(".borrador").click(function(){
		borrar = $(this).css("background-color");
		ctx.beginPath();
		ctx.strokeStyle = borrar;
		ctx.lineWidth = 12;	
	});
	// reset palette selection (css) and select the clicked color for canvas strokeStyle	
	$(".palette").click(function(){
		$(".palette").css("border-color", "#777");
		$(".palette").css("border-style", "solid");
		$(this).css("border-color", "#fff");
		$(this).css("border-style", "dashed");
		color = $(this).css("background-color");
		ctx.beginPath();
		ctx.strokeStyle = color;
		ctx.lineWidth = 3;
	});
    
	// link the new button with newCanvas() function
	$("#new").click(function() {
		newCanvas();
	});
});

// function to setup a new canvas for drawing
function newCanvas(){
	//define and resize canvas
    $("#content").height($(window).height()-90);
    var canvas = '<canvas id="canvas" width="'+$(window).width()+'" height="'+($(window).height()-90)+'"></canvas>';
	$("#content").html(canvas);
    
    //rellena de color blanco el canvas 
	var lienzo = document.getElementById("canvas");
	var ctt=lienzo.getContext("2d");
	ctt.fillStyle = "white";
	ctt.fillRect(0, 0,lienzo.width,lienzo.height);

    // setup canvas
	ctx=document.getElementById("canvas").getContext("2d");
	ctx.strokeStyle = color;
	ctx.lineWidth = 3;	
	
	// setup to trigger drawing on mouse or touch
	$("#canvas").drawTouch();
    $("#canvas").drawPointer();
	$("#canvas").drawMouse();

		/* codigo para el dibujo de iconos en canvas*/
		var $canvas = $("#canvas");
		var Offset = $canvas.offset();
		var offsetX = Offset.left;
		var offsetY = Offset.top;

		// select all .tool's
		var $tools = $(".tool");

		// make all .tool's draggable
		$tools.draggable({
			helper: 'clone',
		});

		// assign each .tool its index in $tools
		$tools.each(function (index, element) {
			$(this).data("toolsIndex", index);
		});

		// make the canvas a dropzone
		$canvas.droppable({
			drop: dragDrop,
		});

		function dragDrop(e, ui) {

			// get the drop point (be sure to adjust for border)
			var x = parseInt(ui.offset.left - offsetX) - 1;
			var y = parseInt(ui.offset.top - offsetY);

			// get the drop payload (here the payload is the $tools index)
			var theIndex = ui.draggable.data("toolsIndex");

			// drawImage at the drop point using the dropped image 
			ctx.drawImage($tools[theIndex], x, y, 32, 32);

		}
		/* codigo para el dibujo de iconos en canvas*/

}

// prototype to	start drawing on touch using canvas moveTo and lineTo
$.fn.drawTouch = function() {
	var start = function(e) {
        e = e.originalEvent;
		ctx.beginPath();
		x = e.changedTouches[0].pageX;
		y = e.changedTouches[0].pageY-44;
		ctx.moveTo(x,y);
	};
	var move = function(e) {
		e.preventDefault();
        e = e.originalEvent;
		x = e.changedTouches[0].pageX;
		y = e.changedTouches[0].pageY-44;
		ctx.lineTo(x,y);
		ctx.stroke();
	};
	$(this).on("touchstart", start);
	$(this).on("touchmove", move);	
}; 
    
// prototype to	start drawing on pointer(microsoft ie) using canvas moveTo and lineTo
$.fn.drawPointer = function() {
	var start = function(e) {
        e = e.originalEvent;
		ctx.beginPath();
		x = e.pageX;
		y = e.pageY-44;
		ctx.moveTo(x,y);
	};
	var move = function(e) {
		e.preventDefault();
        e = e.originalEvent;
		x = e.pageX;
		y = e.pageY-44;
		ctx.lineTo(x,y);
		ctx.stroke();
    };
	$(this).on("MSPointerDown", start);
	$(this).on("MSPointerMove", move);
};        

// prototype to	start drawing on mouse using canvas moveTo and lineTo
$.fn.drawMouse = function() {
	var clicked = 0;
	var start = function(e) {
		clicked = 1;
		ctx.beginPath();
		x = e.pageX;
		y = e.pageY-44;
		ctx.moveTo(x,y);
	};
	var move = function(e) {
		if(clicked){
			x = e.pageX;
			y = e.pageY-44;
			ctx.lineTo(x,y);
			ctx.stroke();
		}
	};
	var stop = function(e) {
		clicked = 0;
	};
	$(this).on("mousedown", start);
	$(this).on("mousemove", move);
	$(window).on("mouseup", stop);
};