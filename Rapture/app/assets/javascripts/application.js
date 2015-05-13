// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
WinJS.Namespace.define("App", {
    splitView: null,
    togglePane: WinJS.UI.eventHandler(function (ev) {
        if (App.splitView) {
            App.splitView.paneHidden = !App.splitView.paneHidden;
        }
    }),
    
    animation: {
    	addPointerDown: function addPointerDownHandlers(target) {
    		function onPointerDown(evt) {
		    	WinJS.UI.Animation.pointerDown(evt.target);
			    evt.preventDefault();
			}

		    target.addEventListener("pointerdown", onPointerDown, false);
		    target.addEventListener("touchstart", onPointerDown, false);
		    target.addEventListener("mousedown", onPointerDown, false);
		},
		addPointerUp: function addPointerUpHandlers(target) {
			function onPointerUp(evt) {
			    WinJS.UI.Animation.pointerUp(evt.target);
			    evt.preventDefault();
			}

		    target.addEventListener("pointerup", onPointerUp, false);
		    target.addEventListener("touchend", onPointerUp, false);
		    target.addEventListener("mouseup", onPointerUp, false);
		}
    }
});

WinJS.Binding.processAll(null, App).then(function () {
    WinJS.UI.processAll().done(function () {
        App.splitView = document.querySelector(".splitView").winControl;
        new WinJS.UI._WinKeyboard(App.splitView.paneElement); // Temporary workaround: Draw keyboard focus visuals on NavBarCommands

        var target1 = document.getElementById("MenuButton");
		
		App.animation.addPointerDown(target1);
		App.animation.addPointerUp(target1);
    });
})