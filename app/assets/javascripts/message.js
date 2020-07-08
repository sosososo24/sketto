$(function(){ 
  function buildHTML(message){
    if ( message.user_id ) {

      if ( message.image ) {
        var html =
          `<div class="return-line">
            <div class="return-line__text">
              <img src="/assets/sketto-staff_icon-aa0c079c87e033c89c122f792d443b9d3a8e04b8898176e9f0f8af7de2030b86.png" class="return-line__text-icon">
              <div class="return-line__text-data">
                ${message.name}
              </div>
              <div class="return-line__text-data">
                ${message.created_at}
              </div>
            </div>
            <div class="return-line__message">
              <p class="return-line__message__content">
                ${message.content}
              </p>
            </div>
            <img src=${message.image} >
          </div>`
        return html;
      } else {
        var html =
        `<div class="return-line">
          <div class="return-line__text">
            <img src="/assets/sketto-staff_icon-aa0c079c87e033c89c122f792d443b9d3a8e04b8898176e9f0f8af7de2030b86.png" class="return-line__text-icon">
            <div class="return-line__text-data">
              ${message.name}
            </div>
            <div class="return-line__text-data">
              ${message.created_at}
            </div>
          </div>
          <div class="return-line__message">
            <p class="return-line__message__content">
              ${message.content}
            </p>
          </div>
        </div>`
        return html;
      };
    } else {

      if ( message.image ) {
        var html =
          `<div class="return-line">
            <div class="return-line__text">
              <img src="/assets/sketto-shop-icon-bbe784d2dbb98ea9d98b257f133be6c4386ba26e0aae30fd81fea1aec8b22334.png" class="return-line__text-icon">
              <div class="return-line__text-data">
                ${message.name}
              </div>
              <div class="return-line__text-data">
                ${message.created_at}
              </div>
            </div>
            <div class="return-line__message">
              <p class="return-line__message__content">
                ${message.content}
              </p>
            </div>
            <img src=${message.image} >
          </div>`
        return html;
      } else {
        var html =
        `<div class="return-line">
          <div class="return-line__text">
            <img src="/assets/sketto-shop-icon-bbe784d2dbb98ea9d98b257f133be6c4386ba26e0aae30fd81fea1aec8b22334.png" class="return-line__text-icon">
            <div class="return-line__text-data">
              ${message.name}
            </div>
            <div class="return-line__text-data">
              ${message.created_at}
            </div>
          </div>
          <div class="return-line__message">
            <p class="return-line__message__content">
              ${message.content}
            </p>
          </div>
        </div>`
        return html;
      };
    };
  }

  
$('#new_message').on('submit', function(e){
  e.preventDefault();
  var formData = new FormData(this);
  var url = $(this).attr('action')
  $.ajax({
    url: url,
    type: "POST",
    data: formData,
    dataType: 'json',
    processData: false,
    contentType: false
  })
  .done(function(data){
    var html = buildHTML(data);
    $('.chat-main__body').append(html);
    $('.chat-main__body').animate({ scrollTop: $('.chat-main__body')[0].scrollHeight});
    $('form')[0].reset();
    $(".chat-main__message__btn").prop('disabled', false);
  })
  .fail(function() {
      alert("メッセージ送信に失敗しました");
    });
})
});
