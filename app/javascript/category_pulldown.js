function styleChange(element, styleName, value) {
  if (value) {
    element.style[styleName] = value
  } else {
    element.style[styleName] = ""
  }
}

function changeBackground(link, color) {
  styleChange(link, "background", color)
}

function changeTextColor(link, color) {
  styleChange(link, "color", color)
}

function pulldown() {
  const menuPulldown = document.getElementById("category-list")
  const pulldownLists = document.getElementById("category-pull-down")
  const category = document.getElementById("category-link-mouseleave")
  
  const categoryLinks = []
  const categoryClassLinks = []

  for (let i = 1; i <= 10; i++) {
    categoryLinks.push(document.getElementById(`category-link${i}`))
    categoryClassLinks.push(document.querySelector(`.category-link${i}`))
  }

  if (menuPulldown) {
    menuPulldown.addEventListener('click', () => {
      styleChange(pulldownLists, "display", pulldownLists.style.display === "block" ? "" : "block")
    })
  }

  categoryLinks.forEach((link) => {
    if (link) {
      link.addEventListener('mouseover', () => changeBackground(link, "#3ccace"))
      link.addEventListener('mouseout', () => changeBackground(link, ""))
    }
  })

  categoryClassLinks.forEach((link) => {
    if (link) {
      link.addEventListener('mouseover', () => changeTextColor(link, "#f5f5f5"))
      link.addEventListener('mouseout', () => changeTextColor(link, ""))
    }
  })

  if (category) {
    category.addEventListener('mouseleave', () => {
      pulldownLists.removeAttribute("style")
    })
  }
}

window.addEventListener('turbo:load', pulldown)