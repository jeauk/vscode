document.addEventListener("DOMContentLoaded", function() {
  var videos = [
    "/video/001.mp4",
    "/video/002.mp4",
    "/video/003.mp4",
    "/video/004.mp4",
    "/video/005.mp4"
  ];

  var randomIndex = Math.floor(Math.random() * videos.length);
  var randomVideo = videos[randomIndex];

  var videoElement = document.querySelector(".popular_movie video");
  videoElement.setAttribute("src", randomVideo);
});

