function Background(element) {
  if (element) {
    element.addEventListener('mouseover', () => {
      element.style.backgroundColor = '#4DBBD5';
    });

    element.addEventListener('mouseout', () => {
      element.style.backgroundColor = '';
    });
  }
}

function TextShadow(element) {
  if (element) {
    element.addEventListener('mouseover', () => {
      element.style.textShadow = '3px 5px 10px #FFD700';
    });

    element.addEventListener('mouseout', () => {
      element.style.textShadow = '';
    });
  }
}

function RedBackground(element) {
  if (element) {
    element.addEventListener('mouseover', () => {
      element.style.backgroundColor = '#ff5349';
    });

    element.addEventListener('mouseout', () => {
      element.style.backgroundColor = '';
    });
  }
}

function DestroyButton(element) {
  if (element) {
    element.addEventListener('mouseover', () => {
      element.style.backgroundColor = '#a9a9a9';
    });

    element.addEventListener('mouseout', () => {
      element.style.backgroundColor = '';
    });
  }
}

function select_button() {
  const selectButtons = [
    document.getElementById('comment-btn'),
    document.getElementById('search-btton'),
    document.getElementById('item-search-button'),
    document.getElementById('index-item-search-button'),
    document.getElementById('exhibit-btn'),
    document.getElementById('purchase-btn'),
  ];

  const selectItemButtons = [
    document.getElementById('category-link'),
    document.getElementById('before-btn'),
    document.getElementById('back-btn'),
  ];

  const selectRedButtons = [
    document.getElementById('item-red-btn'),
    document.getElementById('item-red-move-btn'),
  ];

  const selectDestroyButton = document.getElementById('item-destroy');

  DestroyButton(selectDestroyButton);
  selectRedButtons.forEach((select) => RedBackground(select));
  selectItemButtons.forEach((select) => TextShadow(select));
  selectButtons.forEach((select) => Background(select));
}

window.addEventListener(`turbo:load`, select_button);