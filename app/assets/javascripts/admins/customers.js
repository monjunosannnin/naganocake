$(function() {
  $("#customer_is_deleted").change(function() {
    var active = $("#customer_is_deleted").prop("checked");
    console.log('hoge');
    
    if (active) {
      $("#passive").prop("checked", false);
      $("#customer_is_deleted").prop("checked", true);
    } else {
      $("#passive").prop("checked", true);
      $("#customer_is_deleted").prop("checked", false);
    }
  });

  $("#passive").change(function() {
    var passive = $("#passive").prop("checked");
    console.log('foo');
    
    if (passive) {
      $("#passive").prop("checked", true);
      $("#customer_is_deleted").prop("checked", false);
    } else {
      $("#passive").prop("checked", false);
      $("#customer_is_deleted").prop("checked", true);
    }
  });
});
