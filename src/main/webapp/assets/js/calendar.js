const calendarDates = document.getElementById("calendarDates");
const currentMonthElement = document.getElementById("currentMonth");
const prevBtn = document.getElementById("prevBtn");
const nextBtn = document.getElementById("nextBtn");

const today = new Date(); // 현재 날짜를 나타내는 Date 객체를 저장한다.
let currentMonth = today.getMonth();
/* 현재 월을 나타내는 값을 저장한다. getMonth() 메서드는 0부터 시작하는 월을 반환하므로
1월이면 0, 2월이면 1을 반환한다. */
let currentYear = today.getFullYear(); // 변수에 현재 연도를 나타내는 값을 저장한다.

function renderCalendar() {
  /* renderCalendar 함수는 월별 캘랜더를 생성하고 표시하는 함수이다. */
  const firstDayOfMonth = new Date(currentYear, currentMonth, 1);
  /* firstDayOfMonth 변수에 현재 월의 첫 번째 날짜를 나타내는 Date 객체를 저장한다.
해당 월의 첫 번째 날짜에 대한 정보를 얻는다. */
  const daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();
  /* daysInMonth 변수에 현재 월의 총 일 수를 나타내는 값을 저장한다. 
  해당 월이 몇 일까지 있는지 알 수 있다. */
  const startDayOfWeek = firstDayOfMonth.getDay();
  /* 변수에 현재 월의 첫 번째 날짜의 요일을 나타내는 값을 저장한다.
  해당 월의 첫 번째 날짜가 무슨 요일인지 알 수 있다. */
  currentMonthElement.textContent = `${currentYear}.${String(currentMonth + 1).padStart(2, '0')}`;
  // 월을 나타내는 요소에 현재 월과 연도를 설정하여 표시한다.

  calendarDates.innerHTML = ""; // 일자를 표시하는 그리드 컨테이너를 비운다.

  // 빈 날짜(이전 달)
  for (let i = 0; i < startDayOfWeek; i++) {
    const emptyDate = document.createElement("div");
    //  빈 날짜를 나타내는 div 요소를 생성한다.
    emptyDate.classList.add("date", "empty");
    // 생성한 div 요소에 "date"와 "empty" 클래스를 추가한다.
    calendarDates.appendChild(emptyDate);
    // 생성한 빈 날짜 요소를 캘린더 그리드에 추가한다.
  }

  // 현재 달의 날짜
  for (let i = 1; i <= daysInMonth; i++) {
    const dateElement = document.createElement("div");
    dateElement.classList.add("date");
    dateElement.textContent = i;
    calendarDates.appendChild(dateElement);
  }
}

renderCalendar();
// 페이지가 로드되면 renderCalendar 함수를 실행하여 초기 캘린더를 표시한다.

prevBtn.addEventListener("click", () => {
  currentMonth--;
  if (currentMonth < 0) {
    currentMonth = 11;
    currentYear--;
  }
  renderCalendar();
});
/* 
1. 이전 버튼(prevBtn)을 클릭하면 현재 월을 이전 월로 변경하고, 연도가 바뀌어야 한다면 연도를 변경한다.
2. 변경된 월과 연도를 바탕으로 renderCalendar 함수를 호출하여 이전 월의 캘린더를 표시한다.
*/

nextBtn.addEventListener("click", () => {
  currentMonth++;
  if (currentMonth > 11) {
    currentMonth = 0;
    currentYear++;
  }
  renderCalendar();
});


const todayBtn = document.getElementById("todayBtn");

todayBtn.addEventListener("click", () => {
  const now = new Date();
  currentYear = now.getFullYear();
  currentMonth = now.getMonth(); // 0~11
  renderCalendar();
});