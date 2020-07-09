$(function() {
  function addStore(store) {
    let html = `
      <div class="chat-group-user clearfix">
        <p class="chat-group-user__name">${store.name}</p>
        <div class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-store-id="${store.id}" data-store-name="${store.name}">追加</div>
      </div>
    `;
    $("#user-search-result").append(html);
  }

  function addNoStore() {
    let html = `
      <div class="chat-group-user clearfix">
        <p class="chat-group-user__name">ユーザーが見つかりません</p>
      </div>
    `;
    $("#user-search-result").append(html);
  }
  function addDeleteStore(name, id) {
    let html = `
    <div class="chat-group-user clearfix" id="${id}">
      <p class="chat-group-user__name">${name}</p>
      <div class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn" data-store-id="${id}" data-user-name="${name}">削除</div>
    </div>`;
    $(".js-add-user").append(html);
  }
  function addMember(storeId) {
    let html = `<input value="${storeId}" name="group[store_ids][]" type="hidden" id="group_user_ids_${storeId}" />`;
    $(`#${storeId}`).append(html);
  }
  $("#user-search-field").on("keyup", function() {
    let input = $("#user-search-field").val();
    $.ajax({
      type: "GET",
      url: "/users",
      data: { keyword: input },
      dataType: "json"
    })
      .done(function(stores) {
        $("#user-search-result").empty();

        if (stores.length !== 0) {
          stores.forEach(function(store) {
            addStore(store);
          });
        } else if (input.length == 0) {
          return false;
        } else {
          addNoStore();
        }
      })
      .fail(function() {
        alert("通信エラーです。ユーザーが表示できません。");
      });
  });
  $(document).on("click", ".chat-group-user__btn--add", function() {
    console.log
    const storeName = $(this).attr("data-store-name");
    const storeId = $(this).attr("data-store-id");
    $(this)
      .parent()
      .remove();
    addDeleteStore(storeName, storeId);
    addMember(storeId);
  });
  $(document).on("click", ".chat-group-user__btn--remove", function() {
    $(this)
      .parent()
      .remove();
  });
});