function underline(){
  const underLineList = [
    document.querySelector('.category-list'),
    document.getElementById("brand-list"),
  ]

  const logouts = [
    document.getElementById("user-nickname"),
    document.getElementById("logout")
  ]

  const logins = [
    document.getElementById("login"),
    document.getElementById("sign-up")
  ]

  const itemUnder = document.getElementById("item-under")

  underLineList.forEach((under) => {
    if (under) {
      under.addEventListener('mouseover', () => {
        under.style.textDecoration = "underline"
        under.style.textDecorationColor = "#3ccace"
      })

      under.addEventListener('mouseout', () => {
        under.style.textDecoration = ""
        under.style.textDecorationColor = ""
      })
    }
  })

  if (itemUnder) {
    itemUnder.addEventListener('mouseover', () => {
      itemUnder.style.textDecoration = "underline"
      itemUnder.style.textDecorationColor = "#3ccace"
    })
  
    itemUnder.addEventListener('mouseout', () => {
      itemUnder.style.textDecoration = ""
      itemUnder.style.textDecorationColor = ""

    })
  }

  logouts.forEach((logout) => {
    if (logout) {
      logout.addEventListener('mouseover', () => {
        logout.style.textDecoration = "underline"
        logout.style.textDecorationColor = "#3ccace"
      })
  
      logout.addEventListener('mouseout', () => {
        logout.style.textDecoration = ""
        logout.style.textDecorationColor = ""

      })
    }
  })  

  logins.forEach((login) => {
    if (login) {
      login.addEventListener('mouseover', () => {
      login.style.textDecoration = "underline"
      login.style.textDecorationColor = "#3ccace"
      })
  
      login.addEventListener('mouseout', () => {
      login.style.textDecoration = ""
      login.style.textDecorationColor = ""
      })
    }
  })  
}
window.addEventListener('turbo:load', underline )