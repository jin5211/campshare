function plan() {
  const today = new Date();
  const oneWeekLater = new Date(today.getTime() + 7 * 24 * 60 * 60 * 1000);
  const startDateInput = document.getElementById('start-date');
  const endDateInput = document.getElementById('end-date');

  startDateInput.addEventListener('change', handleStartDateChange);
  endDateInput.addEventListener('change', handleEndDateChange);

  function handleStartDateChange(event) {
    const selectedDate = new Date(event.target.value);
    if (selectedDate < oneWeekLater) {
      alert('開始日は1週間後以降を選択してください。');
      startDateInput.value = ''; // 入力値をクリア
      startDateInput.focus(); // フォーカスを元に戻す
      return; // 処理を中断
    }
  }

  function handleEndDateChange(event) {
    const startDate = new Date(startDateInput.value);
    const endDate = new Date(endDateInput.value);

    if (endDate < startDate) {
      alert('終了日は開始日以降を選択してください。');
      endDateInput.value = ''; // 入力値をクリア
      endDateInput.focus(); // フォーカスを元に戻す
      return; // 処理を中断
    }

    const diffDays = Math.floor((endDate - startDate) / (1000 * 60 * 60 * 24));

    if (diffDays > 2) {
      alert('終了日は開始日から2日以内を選択してください。');
      endDateInput.value = ''; // 入力値をクリア
      endDateInput.focus(); // フォーカスを元に戻す
    } else {
      const plan1 = document.getElementById('plan-1');
      const plan2 = document.getElementById('plan-2');
      const plan3 = document.getElementById('plan-3');
      const price1 = document.getElementById('price-1');
      const price2 = document.getElementById('price-2');
      const price3 = document.getElementById('price-3');
      console.log(price2.innerHTML)
      if (diffDays === 0) { // 日帰りプランの場合
        document.getElementById("selected-plan").innerHTML = plan1.innerHTML;
        document.getElementById("selected-price").innerHTML = price1.innerHTML;
      } else if ( diffDays === 1 ) { // 1泊2日プランの場合
        document.getElementById("selected-plan").innerHTML = plan2.innerHTML;
        document.getElementById("selected-price").innerHTML = price2.innerHTML;
      } else { // 2泊3日プランの場合
        document.getElementById("selected-plan").innerHTML = plan3.innerHTML;
        document.getElementById("selected-price").innerHTML = price3.innerHTML;
      };
      }
  }
}

window.addEventListener("turbo:load", plan);
window.addEventListener("turbo:render", plan);
