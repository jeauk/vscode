document.addEventListener("DOMContentLoaded", function() {
  var videos = [
    "/project/video/001.mp4",
    "/project/video/002.mp4",
    "/project/video/003.mp4",
    "/project/video/004.mp4",
    "/project/video/005.mp4"
  ];

  var randomIndex = Math.floor(Math.random() * videos.length);
  var randomVideo = videos[randomIndex];

  var videoElement = document.querySelector(".popular_movie video");
  videoElement.setAttribute("src", randomVideo);
});