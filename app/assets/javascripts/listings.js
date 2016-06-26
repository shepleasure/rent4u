$(document).ready(function(){
  var getSubcategories = function(category_id){
    var $subcategories = $('#listing_subcategory_id');
    $($subcategories).empty();
    
    $.post('/subcategories/find_by_category', { category_id: category_id }, function(data){
      $.each(data.subcategories, function(index, subcategory){
        var option = $('<option />');
        option.attr('value', subcategory.id);
        option.text(subcategory.name);
        option.appendTo($subcategories);
      });
    })
  };
  
  var getSelectedCategory = function(){
    return $('#listing_category_id').val();
  };
  
  $('#listing_category_id').change(function(){
    var category_id = getSelectedCategory();
    getSubcategories(category_id);
  });
  
  getSubcategories(getSelectedCategory());

});

$(document).ready(function() {
  $(".sort_paginate_ajaxnew").on("click", ".pagination a",  function(){
    $.getScript(this.href);
    return false;
  });
  $(".sort_paginate_ajaxhigh").on("click", ".pagination a",  function(){
    $.getScript(this.href);
    return false;
  });
  $(".sort_paginate_ajaxlow").on("click", ".pagination a",  function(){
    $.getScript(this.href);
    return false;
  });
  $(".sort_paginate_ajaxpopular").on("click", ".pagination a",  function(){
    $.getScript(this.href);
    return false;
  });
});

$(document).ready(function() {
  setTimeout(function(){
    $('.alert').fadeOut();
  }, 5000);
});
