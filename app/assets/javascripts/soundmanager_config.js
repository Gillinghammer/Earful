soundManager.setup({
  url: '/assets/soundmanagerfiles/swf/',
  flashVersion: 9, // optional: shiny features (default = 8)
  // optional: ignore Flash where possible, use 100% HTML5 mode
  // preferFlash: false,
  onready: function() {
    console.log('Sound Manager ready')
    // Ready to use; soundManager.createSound() etc. can now be called.
    
  }
});