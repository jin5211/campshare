// レンタル情報入力画面のJavaScript処理

// ページ読み込み時に実行する関数
function plan() {
  const today = new Date(); // 今日の日付を取得
  const oneWeekLater = new Date(today.getTime() + 7 * 24 * 60 * 60 * 1000); // 1週間後の日付を取得

  // レンタル開始日入力欄とレンタル終了日入力欄を取得
  const startDateInput = document.getElementById('start-date');
  const endDateInput = document.getElementById('end-date');

  // レンタル開始日変更時に実行するイベントハンドラを設定
  startDateInput.addEventListener('change', handleStartDateChange);

  // レンタル終了日変更時に実行するイベントハンドラを設定
  endDateInput.addEventListener('change', handleEndDateChange);

  // レンタル開始日変更時の処理
  function handleStartDateChange(event) {
    const selectedStartDate = new Date(event.target.value); // 入力された開始日を取得

    // レンタル開始日が1週間後以降かどうかチェック
    if (selectedStartDate < oneWeekLater) {
      alert('開始日は1週間後以降を選択してください。');
      startDateInput.value = ''; // 入力値をクリア
      startDateInput.focus(); // フォーカスを元に戻す
      return; // 処理を中断
    }

    // 入力された終了日を取得
    const selectedEndDate = new Date(endDateInput.value);

    // 終了日が開始日より前かどうかチェック
    if (selectedEndDate && selectedEndDate < selectedStartDate) {
      alert('終了日は開始日以降を選択してください。');
      endDateInput.value = ''; // 入力値をクリア
      endDateInput.focus(); // フォーカスを元に戻す
    }
  }

  // レンタル終了日変更時の処理
  function handleEndDateChange(event) {
    const startDate = new Date(startDateInput.value); // 入力された開始日を取得
    const endDate = new Date(endDateInput.value); // 入力された返却日を取得

    // レンタル開始日が未選択の場合は警告を表示して処理を中断
    if (!startDateInput.value) {
      alert('レンタル開始日を先に選択してください。');
      endDateInput.value = ''; // 入力値をクリア
      endDateInput.focus(); // フォーカスを元に戻す
      return;
    }

    // 終了日が開始日より前かどうかチェック
    if (endDate < startDate) {
      alert('終了日は開始日以降を選択してください。');
      endDateInput.value = ''; // 入力値をクリア
      endDateInput.focus(); // フォーカスを元に戻す
      return;
    }

    // レンタル日数を計算
    const diffDays = Math.floor((endDate - startDate) / (1000 * 60 * 60 * 24));

    // レンタル日数が2日以内かどうかチェック
    if (diffDays > 2) {
      alert('終了日は開始日から2日以内を選択してください。');
      endDateInput.value = ''; // 入力値をクリア
      endDateInput.focus(); // フォーカスを元に戻す
      return;
    }

    // プランと料金要素を取得
    const plan1 = document.getElementById('plan-1');
    const plan2 = document.getElementById('plan-2');
    const plan3 = document.getElementById('plan-3');
    const price1 = document.getElementById('price-1');
    const price2 = document.getElementById('price-2');
    const price3 = document.getElementById('price-3');
    const currency = document.getElementById('currency');

    // プラン料金要素を取得
    const price1Value = document.getElementById('price-1-value').textContent.trim();
    const price2Value = document.getElementById('price-2-value').textContent.trim();
    const price3Value = document.getElementById('price-3-value').textContent.trim();

    // 注意事項要素を取得
    const caution = document.getElementById('caution');

    // レンタル日数によって表示するプランと料金を設定
    if (diffDays === 0) {
      document.getElementById("selected-plan").textContent = plan1.textContent;
      document.getElementById("selected-price").textContent = price1Value;
      document.getElementById("price-parameter").value = price1Value;
      currency.textContent = '円';
      caution.textContent = '';
    } else if (diffDays === 1) {
      document.getElementById("selected-plan").textContent = plan2.textContent;
      document.getElementById("selected-price").textContent = price2Value;
      document.getElementById("price-parameter").value = price2Value;
      currency.textContent = '円';
      caution.textContent = '';
    } else {
      document.getElementById("selected-plan").textContent = plan3.textContent;
      document.getElementById("selected-price").textContent = price3Value;
      document.getElementById("price-parameter").value = price3Value;
      currency.textContent = '円';
      caution.textContent = '';
    }
  }
}

// Turboページ読み込み時と再描画時に実行するイベントリスナーを設定
window.addEventListener("turbo:load", plan);
window.addEventListener("turbo:render", plan);
