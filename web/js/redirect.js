function detectmob_index() { 
 var isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);
		var element = document.getElementById('text');
		if (isMobile) {
  			window.location.replace("m_index.jsp");
		}                                  
}

