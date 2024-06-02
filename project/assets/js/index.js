document.addEventListener("DOMContentLoaded", function() {
  var videos = [
    "/video/001.mp4",
    "/video/002.mp4",
    "/video/003.mp4",
    "/video/004.mp4",
    "/video/005.mp4"
  ];

  // 페이지 로드 시 무작위 비디오 선택
  var randomIndex = Math.floor(Math.random() * videos.length);
  var randomVideo = videos[randomIndex];

  var videoElement = document.querySelector(".popular_movie video");
  videoElement.setAttribute("src", randomVideo);

  var currentVideoIndex = randomIndex;

  // 영상이 끝나면 다음 영상을 재생하는 함수
  function playNextVideo() {
    currentVideoIndex++; // 다음 영상의 인덱스로 이동
    if (currentVideoIndex >= videos.length) {
      currentVideoIndex = 0; // 다음 영상이 없으면 처음 영상으로 돌아감
    }
    videoElement.src = videos[currentVideoIndex]; // 다음 영상의 경로를 설정
    videoElement.play(); // 다음 영상 재생
  }

  // 영상이 끝나면 다음 영상을 재생하는 이벤트 핸들러 등록
  videoElement.addEventListener("ended", playNextVideo);
});
