function transition() {

  if (window.location.pathname !== '/') return;
  const elements = {
    firstTitle: document.getElementById('select-reason-title'),
    firstList1: document.getElementById('reason-list1'),
    firstList2: document.getElementById('reason-list2'),
    firstList3: document.getElementById('reason-list3'),
    secondTitle: document.getElementById('feature-title'),
    secondList1: document.getElementById('feature-list1'),
    secondList2: document.getElementById('feature-list2'),
    secondList3: document.getElementById('feature-list3')
  };

  
  if (elements !== null) {
    window.addEventListener('scroll', () => {
      const scrollPosition = window.scrollY;
      const thresholds = getThresholds(); // しきい値の取得

      // スクロール位置がしきい値を超えた場合の処理
      for (const elementName in elements) {
        if (scrollPosition > thresholds[elementName]) {
          elements[elementName].style.opacity = '1';
          elements[elementName].style.transform = 'translateX(0)';
        }
      }
    });
  }
}

function getThresholds() {
  if (window.innerWidth <= 849) {
    return {
      firstTitle: 125,
      firstList1: 300,
      firstList2: 400,
      firstList3: 500,
      secondTitle: 1200,
      secondList1: 1350,
      secondList2: 1450,
      secondList3: 1600
    }
  } else {
    return {
      firstTitle: 100,
      firstList1: 150,
      firstList2: 200,
      firstList3: 250,
      secondTitle: 800,
      secondList1: 1000,
      secondList2: 1050,
      secondList3: 1100
    }
  }
}

window.addEventListener(`turbo:load`, transition)