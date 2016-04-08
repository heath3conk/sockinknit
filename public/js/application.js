$(document).ready(function() {
  $("a[href='/shops']").on("click", function(event) {
    event.preventDefault();
    $.ajax({
      url: '/shops',
      method: 'get'
    }).done(function(addressForm) {
      $(".main").prepend(addressForm)
    })
  });
  // $(".main").on("submit", "#address-form", function(event) {
  //   event.preventDefault();
  //   var addressInfo = $(this).serialize();
  //   $.ajax({
  //     url: '/shops',
  //     method: 'post',
  //     data: addressInfo
  //   })
  // })
});