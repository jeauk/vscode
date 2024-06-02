const regionSelector = document.getElementById("regionSelector");
const cinemaSelector = document.getElementById("cinemaSelector");
const calendarDates = document.getElementById("calendarDates"); // 달력 날짜 영역을 가져옵니다.
const currentMonthElement = document.getElementById("currentMonth"); // 현재 월을 표시할 요소를 가져옵니다.
const prevBtn = document.getElementById("prevBtn"); // 이전 달 버튼을 가져옵니다.
const nextBtn = document.getElementById("nextBtn"); // 다음 달 버튼을 가져옵니다.
const timeSlotsContainer = document.getElementById("timeSlotsContainer"); // 시간 슬롯 컨테이너를 가져옵니다.

const today = new Date(); // 오늘 날짜를 가져옵니다.
let currentMonth = today.getMonth(); // 현재 월을 가져옵니다.
let currentYear = today.getFullYear(); // 현재 연도를 가져옵니다.
// 선택한 지역에 따라 영화관을 가져오는 함수
function fetchCinemas(region) { 
    // 미리 정의된 지역별 영화관 목록
    const cinemasByRegion = {
        "서울": ["강남점", "홍대점", "건대입구점"],
        "부산": ["센텀점", "서면점", "온천장점"],
        "창원": ["창원중앙점", "합성점", "진해점"],
        "대구": ["대구중앙점", "수성점", "북구점"]
        // 필요에 따라 영화관 추가
    };
    return cinemasByRegion[region] || [];
}

// cinemaSelector의 내용을 초기화합니다.
function populateCinemaOptions(region) {
    cinemaSelector.innerHTML = '<option value="" selected disabled>영화관 선택</option>';
    // 선택한 지역에 따라 영화관 목록을 가져옵니다.
    const cinemas = fetchCinemas(region);
    cinemas.forEach(cinema => { // 각 영화관을 옵션으로 추가합니다.
        const option = document.createElement("option");
        option.textContent = cinema;
        option.value = cinema;
        cinemaSelector.appendChild(option);
    });
    cinemaSelector.disabled = false; // 영화관 선택창을 활성화합니다
}

// 선택한 지역에 따라 영화관 선택란을 채우는 함수
regionSelector.addEventListener('change', () => {
    const selectedRegion = regionSelector.value;
    populateCinemaOptions(selectedRegion); // 선택한 지역에 따라 영화관 선택란 채우기
});

// 달력을 렌더링하는 함수
function renderCalendar() {
    const firstDayOfMonth = new Date(currentYear, currentMonth, 1); // 이번 달의 첫째 날을 가져옵니다.
    const daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate(); // 이번 달의 마지막 날을 가져옵니다.
    const startDayOfWeek = firstDayOfMonth.getDay(); // 이번 달의 첫째 날이 무슨 요일인지 가져옵니다.
    currentMonthElement.textContent = `${currentYear}년 ${currentMonth + 1}월`; // 현재 월을 표시합니다.
    calendarDates.innerHTML = ""; // 달력 날짜를 초기화합니다.

    // 빈 날짜를 채웁니다.
    for (let i = 0; i < startDayOfWeek; i++) {
        const emptyDate = document.createElement("div"); // 빈 날짜 요소를 만듭니다.
        emptyDate.classList.add("date", "empty"); // 빈 날짜 스타일을 추가합니다.
        calendarDates.appendChild(emptyDate); // 빈 날짜 요소를 달력에 추가합니다.
    }

    // 각 날짜를 렌더링합니다.
    for (let i = 1; i <= daysInMonth; i++) {
        const dateElement = document.createElement("div"); // 날짜 요소를 만듭니다.
        dateElement.classList.add("date"); // 날짜 스타일을 추가합니다.
        dateElement.textContent = i; // 날짜를 텍스트로 설정합니다.
        dateElement.addEventListener('click', () => {
            if(cinemaSelector.value){
                selectItem(dateElement); // 날짜를 클릭했을 때 선택 상태로 변경합니다.
                showTimeSlots(i); // 해당 날짜의 예약 가능한 시간을 표시합니다.
            } else {
                alert("영화관을 먼저 선택해주세요.");
            }
        });
        calendarDates.appendChild(dateElement); // 날짜 요소를 달력에 추가합니다.
    }
}

renderCalendar(); // 달력을 처음에 한 번 그립니다.

// 이전 달로 이동하는 버튼 이벤트
prevBtn.addEventListener('click', () => {
    currentMonth--; // 현재 월을 이전 달로 변경합니다.
    if (currentMonth < 0) { // 월이 0보다 작아지면 연도를 변경합니다.
        currentMonth = 11; // 12월로 설정합니다.
        currentYear--; // 연도를 하나 줄입니다.
    }
    renderCalendar(); // 달력을 다시 그립니다.
});

// 다음 달로 이동하는 버튼 이벤트
nextBtn.addEventListener('click', () => {
    currentMonth++; // 현재 월을 다음 달로 변경합니다.
    if (currentMonth > 11) { // 월이 11보다 커지면 연도를 변경합니다.
        currentMonth = 0; // 1월로 설정합니다.
        currentYear++; // 연도를 하나 늘립니다.
    }
    renderCalendar(); // 달력을 다시 그립니다.
});

// 선택된 항목을 처리하는 함수
function selectItem(element) {
    const selectedItems = document.querySelectorAll(".selected"); // 선택된 항목들을 모두 가져옵니다.
    selectedItems.forEach(item => {
        item.classList.remove("selected"); // 모든 선택된 항목에서 선택 상태를 제거합니다.
    });
    element.classList.add("selected"); // 클릭한 항목을 선택 상태로 만듭니다.
}

// 시간 슬롯을 표시하는 함수
function showTimeSlots(date) {
    timeSlotsContainer.innerHTML = ""; // 기존의 시간대를 초기화합니다.

    const halls = ['1관', '2관', '3관', '4관']; // 영화관 이름을 배열로 만듭니다.
    halls.forEach(hall => {
        const hallContainer = document.createElement("div"); // 각 영화관을 위한 컨테이너를 만듭니다.
        hallContainer.innerHTML = `<strong>${hall}</strong>`; // 영화관 이름을 설정합니다.
        timeSlotsContainer.appendChild(hallContainer); // 영화관 컨테이너를 시간 슬롯 컨테이너에 추가합니다.

        const existingHours = [ 11, 13, 17, 21]; // 기존 시간대를 배열로 설정합니다.
        existingHours.forEach(hour => {
            const timeSlot = document.createElement("div"); // 시간 슬롯 요소를 만듭니다.
            timeSlot.classList.add("time-slot"); // 시간 슬롯 스타일을 추가합니다.
            const displayHourStart = hour % 12 === 0 ? 12 : hour % 12; // 시작 시간을 12시간 형식으로 변환합니다.
            const displayHourEnd = (hour + 2) % 12 === 0 ? 12 : (hour + 2) % 12; // 종료 시간을 12시간 형식으로 변환합니다.
            const ampmStart = hour < 12 ? "AM" : "PM"; // 시작 시간의 오전과 오후를 표시합니다.
            const ampmEnd = (hour + 2) < 12 ? "AM" : "PM"; // 종료 시간의 오전과 오후를 표시합니다.
            timeSlot.textContent = `${displayHourStart}:00 ${ampmStart} - ${displayHourEnd}:00 ${ampmEnd}`; // 시간 슬롯을 텍스트로 설정합니다.
            timeSlot.addEventListener("click", () => {
                selectItem(timeSlot); // 시간 슬롯을 클릭했을 때 선택 상태로 변경합니다.
                reserveTime(date, hour,hall); // 선택한 시간대를 예약합니다.
            });
            hallContainer.appendChild(timeSlot); // 시간 슬롯을 영화관 컨테이너에 추가합니다.
        });
    });
}

function reserveTime(date, hour, hall) {
    const region = regionSelector.value;
    const cinema = cinemaSelector.value;
    const timeStart = hour.toString().padStart(2, '0') + ":00"; // 시작 시간을 형식에 맞게 설정합니다.
    const timeEnd = (hour + 2).toString().padStart(2, '0') + ":00"; // 끝 시간을 형식에 맞게 설정합니다.
    alert(`${region} 지역 ${cinema} ${hall}\n${date}일 ${timeStart}-${timeEnd}으로 예약 하였습니다.`); // 예약 완료 메시지를 표시합니다.
    location.href="/html/Ticketing.html"
}

// 애니메이션을 추가합니다.
window.onload = function() {
    const cat = document.getElementById('cat');
    cat.classList.add('animate');
}
