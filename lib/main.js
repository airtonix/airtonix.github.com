/**
 * @author airtonix
 */
function slide(navigation_id, pad_out, pad_in, time, multiplier){
    // creates the target paths
    var list_elements = navigation_id + " li.sliding-element";
    var link_elements = list_elements + " a";
    
    // initiates the timer used for the sliding animation
    var timer = 0;
    
    // creates the slide animation for all list elements 
    $(list_elements).each(function(i){
        // margin left = - ([width of element] + [total vertical padding of element])
        $(this).css("margin-left", "-180px");
        // updates timer
        timer = (timer * multiplier + time);
        $(this).animate({
            marginLeft: "0"
        }, timer);
        $(this).animate({
            marginLeft: "15px"
        }, timer);
        $(this).animate({
            marginLeft: "0"
        }, timer);
    });
    
    // creates the hover-slide effect for all link elements 		
    $(link_elements).each(function(i){
		var self = $(this)
		var fromColour= $.Color(self.parent().css("backgroundColor")).toHSV()
		var toColour  = fromColour.modify( [null,null,(fromColour[1]*100)/25] ).fix()

        self.hover(function(){
            self.parent().css({ "background-color" : toColour.toHEX() }, 550);
        }, function(){
            self.parent().css({ "background-color" : fromColour.toHEX() }, 550);
        });
    });
}


$(function(){
    // code to execute when the DOM is ready
    
    var pageMenuInner = $(".page-menu .inner");
    var pageMenuUL = $("<ul>");
    pageMenuInner.append(pageMenuUL)
    $(".page-body").find("h2, h3, h4 ,h5").each(function(inex, elem){
		
        pageMenuUL.append(
			$("<li>")
				.append($("<a>").text($(elem).text()).attr("href", "#" + $(elem).attr("id")))
				.addClass("sliding-element "+$(elem).context.nodeName)
		)
    })

	slide(".page-menu .inner",  25, 15, 350, .9)    

	$(window).scroll(function(){			
		pageMenuInner.parent()
			.stop()
			.animate({"marginTop": ($(window).scrollTop() ) + "px"}, "slow" );			
	});

});
