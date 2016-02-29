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

  $('.remove_fields').click(function(){
    alert('Image have been removed. Click post to update')
  });

   

});

var ready;
ready = function() {
    var engine = new Bloodhound({
        datumTokenizer: function(d) {
            console.log(d);
            return Bloodhound.tokenizers.whitespace(d.title);
        },
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: '../search/autocomplete?query=%QUERY'
        }
    });

    var promise = engine.initialize();

    promise
        .done(function() { console.log('success })
        .fail(function() { console.log('err });

    $('.typeahead').typeahead(null, {
        name: 'engine',
        displayKey: 'title',
        source: engine.ttAdapter()
    });
}

$(document).ready(ready);
$(document).on('page:load', ready);
