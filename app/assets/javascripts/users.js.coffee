$ ->
  $('.actw-filters .filter-products').each ->
    filter = $(@)
    id = filter.data('filter-id')
    template = $.templates('#productTmpl')
    $.ajax "/api/v1/filters/#{id}",
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        filter.html("Request ERROR")
      success: (data, textStatus, jqXHR) ->
        productList = template.render(data["products"])
        filter.html(productList)
