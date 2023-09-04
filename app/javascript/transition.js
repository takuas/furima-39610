function transition() {
  const firstTitle = document.getElementById('select-reason-title')
  const firstList1 = document.getElementById('reason-list1')
  const firstList2 = document.getElementById('reason-list2')
  const firstList3 = document.getElementById('reason-list3')
  const secondTitle = document.getElementById('feature-title')
  const secondList1 = document.getElementById('feature-list1')
  const secondList2 = document.getElementById('feature-list2')
  const secondList3 = document.getElementById('feature-list3')


  window.addEventListener('scroll', () => {
    // スクロール位置を取得
    const scrollPosition = window.scrollY;
    if (window.innerWidth <= 849) {
    // しきい値を設定（例: 300pxスクロールしたら浮かび上がる）
    const threshold1 = 125
    const threshold2 = 300
    const threshold3 = 400
    const threshold4 = 500
    const threshold5 = 1200
    const threshold6 = 1350
    const threshold7 = 1450
    const threshold8 = 1600

    // スクロール位置がしきい値を超えた場合
    if (scrollPosition > threshold1) {
      // 要素のスタイルを変更して浮かび上がる
      firstTitle.style.opacity = '1'
      firstTitle.style.transform = 'translateX(0)'
    }

    if (scrollPosition > threshold2) {
      firstList1.style.opacity = '1'
      firstList1.style.transform = 'translateY(0)'
    }

    if (scrollPosition > threshold3) {
      firstList2.style.opacity = '1'
      firstList2.style.transform = 'translateY(0)'
    }

    if (scrollPosition > threshold4) {
      firstList3.style.opacity = '1'
      firstList3.style.transform = 'translateY(0)'
    }
    if (scrollPosition > threshold5) {
      secondTitle.style.opacity = '1'
      secondTitle.style.transform = 'translateX(0)'
    }
    if (scrollPosition > threshold6) {
      secondList1.style.opacity = '1'
      secondList1.style.transform = 'translateY(0)'
    }
    if (scrollPosition > threshold7) {
      secondList2.style.opacity = '1'
      secondList2.style.transform = 'translateY(0)'
    }
    if (scrollPosition > threshold8) {
      secondList3.style.opacity = '1'
      secondList3.style.transform = 'translateY(0)'
    }
   }
   if (window.innerWidth >= 850) {
    const threshold1 = 100
    const threshold2 = 150
    const threshold3 = 200
    const threshold4 = 250
    const threshold5 = 800
    const threshold6 = 1000
    const threshold7 = 1050
    const threshold8 = 1100

    // スクロール位置がしきい値を超えた場合
    if (scrollPosition > threshold1) {
      firstTitle.style.opacity = '1'
      firstTitle.style.transform = 'translateX(0)'
    }
    
    if (scrollPosition > threshold2) {
      firstList1.style.opacity = '1'
      firstList1.style.transform = 'translateY(0)'
    }
    
    if (scrollPosition > threshold3) {
      firstList2.style.opacity = '1'
      firstList2.style.transform = 'translateY(0)'
    }
    
    if (scrollPosition > threshold4) {
      firstList3.style.opacity = '1'
      firstList3.style.transform = 'translateY(0)'
    }
    if (scrollPosition > threshold5) {
      secondTitle.style.opacity = '1'
      secondTitle.style.transform = 'translateX(0)'
    }
    if (scrollPosition > threshold6) {
      secondList1.style.opacity = '1'
      secondList1.style.transform = 'translateY(0)'
    }
    if (scrollPosition > threshold7) {
      secondList2.style.opacity = '1'
      secondList2.style.transform = 'translateY(0)'
    }
    if (scrollPosition > threshold8) {
      secondList3.style.opacity = '1'
      secondList3.style.transform = 'translateY(0)'
    }
   }
  })
}

window.addEventListener(`turbo:load`, transition);