function search(){
  const submit = document.getElementById("form")
  submit.addEventListener('submit', (e) =>{
    e.preventDefault()
    const formData = new FormData(submit)
    const url = submit.action
    const XHR = new XMLHttpRequest()
    XHR.open('GET', url + '?' + new URLSearchParams(formData), true);
    XHR.responseType = 'json';
    XHR.setRequestHeader('X-Requested-With', 'XMLHttpRequest'); // 非同期リクエストとして認識させるヘッダ

    XHR.onload = function() {
      if (this.status === 200) {
        const response = this.response;
        const itemsList = document.getElementById('items-list')
        itemsList.innerHTML = response.html;
      } else {
        console.error('Request failed')
      }
    };

    XHR.onerror = function() {
      console.error('Error occurred')
    };

    XHR.send()
  })
}

//window.addEventListener('turbo:load', search)