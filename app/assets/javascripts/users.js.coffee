$ ->
  $('.actw-filters .filter-products').each ->
    filter = $(@)
    id = filter.data('filter-id')
    display_edit_link = filter.data('display-edit-link') == true
    template = $.templates('#productTmpl')
    $.ajax "/api/v1/filters/#{id}",
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        filter.html("Request ERROR")
      success: (data, textStatus, jqXHR) ->
        productList = template.render(data["products"])
        filter.html(productList)
        filter.find('.product-edit-link').removeClass("hidden")
