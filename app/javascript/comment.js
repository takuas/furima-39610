function buildComment(nickName, text) {
  return `
    <p class="answer">
      <strong class="answer-left">${nickName}：</strong>
      <span class="answer-text">${text}</span>
    </p>
  `;
}

function buildCommentBox(nickName, text) {
  return `
    <div class="answer-box" id="answer">
      <h4 class="answer-list">＜コメント一覧＞</h4>
      <p class="answer">
        <strong class="answer-left">${nickName}：</strong>
        <span class="answer-text">${text}</span>
      </p>
    </div>
  `;
}

function comment(){
  const submit = document.getElementById("comment-form")
  
  if (submit) {
  submit.addEventListener('submit', (e) =>{
    e.preventDefault()
    const formData = new FormData(submit)
    const XHR = new XMLHttpRequest()
    const itemId = submit.getAttribute("data");
    XHR.open("POST", `/items/${itemId}/comments`, true)
    XHR.responseType = "json"
    XHR.send(formData)
    XHR.onload = () => {
      if (XHR.status != 200){
        alert(`Error ${XHR.status}: ${XHR.statusText}`)
        return null
      }
      const nickName = XHR.response.user.nickname
      const text = XHR.response.comment.text
      const answerList = document.getElementById("answer")
      const answerListBox = document.getElementById("comments-list-box")
      if (answerList) {
        answerList.insertAdjacentHTML("beforeend", buildComment(nickName, text))
      } else if (answerListBox) {
        answerListBox.insertAdjacentHTML("beforeend", buildCommentBox(nickName, text))
      }
      const formText = document.getElementById("comment-text")
      formText.value = ""
    }
  })
  }
}

window.addEventListener('turbo:load', comment)