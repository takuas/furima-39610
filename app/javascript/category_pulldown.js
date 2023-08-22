function pulldown (){
  const menuPulldown = document.getElementById("category-list")
  const pulldownLists = document.getElementById("category-pull-down")
  const category = document.getElementById("category-link-mouseleave")
  const categoryLinks = [
    document.getElementById("category-link1"),
    document.getElementById("category-link2"),
    document.getElementById("category-link3"),
    document.getElementById("category-link4"),
    document.getElementById("category-link5"),
    document.getElementById("category-link6"),
    document.getElementById("category-link7"),
    document.getElementById("category-link8"),
    document.getElementById("category-link9"),
    document.getElementById("category-link10")
  ]

  const categoryClassLinks = [
    document.querySelector(".category-link1"),
    document.querySelector(".category-link2"),
    document.querySelector(".category-link3"),
    document.querySelector(".category-link4"),
    document.querySelector(".category-link5"),
    document.querySelector(".category-link6"),
    document.querySelector(".category-link7"),
    document.querySelector(".category-link8"),
    document.querySelector(".category-link9"),
    document.querySelector(".category-link10"),
  ]

  menuPulldown.addEventListener('click',() => {
    if (pulldownLists.getAttribute("style") == "display:block;"){
      pulldownLists.removeAttribute("style")
    } else {
      pulldownLists.setAttribute("style", "display:block;")
    }
  })

  categoryLinks.forEach((link) => {
    link.addEventListener('mouseover', () => {
      link.style.background = "#3ccace"
    })

    link.addEventListener('mouseout', () => {
      link.style.background = ""; // 背景色を元に戻す
    })
  })

  categoryClassLinks.forEach((link) => {
    link.addEventListener('mouseover', () => {
      link.style.color = "#f5f5f5"
    })

    link.addEventListener('mouseout', () => {
      link.style.color = "" // 文字の色を元に戻す
    })

  })

  category.addEventListener('mouseleave', () => {
    pulldownLists.removeAttribute("style")
  })
}


window.addEventListener('turbo:load', pulldown )