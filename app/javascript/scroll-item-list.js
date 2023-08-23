function scroll (){
  const scrollLink = document.querySelector('.scroll-item-list')
  if (scrollLink) {
    scrollLink.addEventListener('click', (e) => {
      e.preventDefault(); // リンクのデフォルト動作を無効化
      const targetId = scrollLink.getAttribute("href")
      const targetElement = document.querySelector(targetId);

      if (targetElement) {
        // スクロール処理
        window.scrollTo({
          behavior: "smooth", // スムーズスクロールを有効化
          top: targetElement.offsetTop,
        })
      }
    })
  }
}

window.addEventListener(`turbo:load`, scroll )