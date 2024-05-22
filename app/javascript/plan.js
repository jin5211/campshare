function plan() {
  const today = new Date(); // 今日の日付を取得
  const oneWeekLater = new Date(today.getTime() + 7 * 24 * 60 * 60 * 1000); // 1週間後の日付を取得

  // レンタル開始日入力欄とレンタル終了日入力欄を取得
  const startDateInput = document.getElementById('start-date');
  const endDateInput = document.getElementById('end-date');

  // レンタル開始日入力欄に変更があったら handleStartDateChange 関数を呼び出す
  startDateInput.addEventListener('change', handleStartDateChange);

  // 返却日入力欄に変更があったら handleEndDateChange 関数を呼び出す
  endDateInput.addEventListener('change', handleEndDateChange);

  // レンタル開始日変更イベントハンドラ
  function handleStartDateChange(event) {
    // 入力された開始日を取得
    const selectedDate = new Date(event.target.value);

    // レンタル開始日が1週間後以降かどうかチェック
    if (selectedDate < oneWeekLater) {
      alert('開始日は1週間後以降を選択してください。');
      startDateInput.value = ''; // 入力値をクリア
      startDateInput.focus(); // フォーカスを元に戻す
      return; // 処理を中断
    }
  }

  // 返却日変更イベントハンドラ
  function handleEndDateChange(event) {
    // 入力された開始日を取得
    const startDate = new Date(startDateInput.value);
    // 入力された返却日を取得
    const endDate = new Date(endDateInput.value);

    // レンタル開始日が未選択の場合は警告を表示して処理を中断
    if (!startDateInput.value) {
      alert('レンタル開始日を先に選択してください。');
      endDateInput.value = ''; // 入力値をクリア
      endDateInput.focus(); // フォーカスを元に戻す
      return;
    }

    // 終了日が開始日より前かどうかチェック
    if (endDate < startDate) {
      alert('終了日は開始日以降を選択してください。'); // 終了日が開始日より前の場合は警告を表示
      endDateInput.value = ''; // 入力値をクリア
      endDateInput.focus(); // フォーカスを元に戻す
      return; // 処理を中断
    }

    // レンタル日数を計算
    const diffDays = Math.floor((endDate - startDate) / (1000 * 60 * 60 * 24));

    // レンタル日数が2日以内かどうかチェック
    if (diffDays > 2) {
      alert('終了日は開始日から2日以内を選択してください。'); // 滞在日数が2日を超える場合は警告を表示
      endDateInput.value = ''; // 入力値をクリア
      endDateInput.focus(); // フォーカスを元に戻す
    } else {
      // プランと料金要素を取得
      const plan1 = document.getElementById('plan-1');
      const plan2 = document.getElementById('plan-2');
      const plan3 = document.getElementById('plan-3');
      const price1 = document.getElementById('price-1');
      const price2 = document.getElementById('price-2');
      const price3 = document.getElementById('price-3');

      // プラン料金要素を取得
      const price1Value = document.getElementById('price-1-value');
      const price2Value = document.getElementById('price-2-value');
      const price3Value = document.getElementById('price-3-value');

      // 注意事項要素を取得
      const caution = document.getElementById('caution');

      // レンタル日数によってプランと料金を表示
      if (diffDays === 0) { // 日帰りプランの場合
        document.getElementById("selected-plan").innerHTML = plan1.innerHTML;
        document.getElementById("selected-price").innerHTML = price1.innerHTML;
        document.getElementById("price-parameter").value = price1Value.innerHTML;
        caution.innerHTML = '';
      } else if (diffDays === 1) { // 1泊2日プランの場合
        document.getElementById("selected-plan").innerHTML = plan2.innerHTML;
        document.getElementById("selected-price").innerHTML = price2.innerHTML;
        document.getElementById("price-parameter").value = price2Value.innerHTML;
        caution.innerHTML = '';
      } else { // 2泊3日プランの場合
        document.getElementById("selected-plan").innerHTML = plan3.innerHTML;
        document.getElementById("selected-price").innerHTML = price3.innerHTML;
        document.getElementById("price-parameter").value = price3Value.innerHTML;
        caution.innerHTML = '';
      }
    }
  }
}

window.addEventListener("turbo:load", plan);
window.addEventListener("turbo:render", plan);
