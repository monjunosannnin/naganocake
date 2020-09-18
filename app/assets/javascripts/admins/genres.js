$(function() {
  $("#genre_is_active").change(function() {
    var active = $("#genre_is_active").prop("checked");
    
    if (active) {
      $("#passive").prop("checked", false);
      $("#genre_is_active").prop("checked", true);
    } else {
      $("#passive").prop("checked", true);
      $("#genre_is_active").prop("checked", false);
    }
  });

  $("#passive").change(function() {
    var passive = $("#passive").prop("checked");
    
    if (passive) {
      $("#passive").prop("checked", true);
      $("#genre_is_active").prop("checked", false);
    } else {
      $("#passive").prop("checked", false);
      $("#genre_is_active").prop("checked", true);
    }
  });
});

