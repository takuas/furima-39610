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
      })

      under.addEventListener('mouseout', () => {
        under.style.textDecoration = ""
      })
    }
  })

  if (itemUnder) {
    itemUnder.addEventListener('mouseover', () => {
      itemUnder.style.textDecoration = "underline";
    })
  
    itemUnder.addEventListener('mouseout', () => {
      itemUnder.style.textDecoration = "";
    })
  }

  logouts.forEach((logout) => {
    if (logout) {
      logout.addEventListener('mouseover', () => {
        logout.style.textDecoration = "underline"
      })
  
      logout.addEventListener('mouseout', () => {
        logout.style.textDecoration = ""
      })
    }
  })  

  logins.forEach((login) => {
    if (login) {
      login.addEventListener('mouseover', () => {
      login.style.textDecoration = "underline"
      })
  
      login.addEventListener('mouseout', () => {
      login.style.textDecoration = ""
      })
    }
  })  
}
window.addEventListener('turbo:load', underline )